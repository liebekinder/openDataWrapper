package opendatawrapper;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.jdom2.Document;
import org.jdom2.Element;

public class XSLConstructor {

	public String XSLFile;
	public Document XMLFile;
	public Properties properties;

	public final String URIBase = "http://projet.com/";

	public XSLConstructor(String xSLFile_, Document document, Properties p) {
		XSLFile = xSLFile_;
		XMLFile = document;
		properties = p;
	}

	public void construct(String mappingPath) {
		Document document;
		// chargement du XML
		try {
			document = XMLFile;
			Map<String, MappingUnit> map = new HashMap<String, MappingUnit>();
			Element element = document.getRootElement().getChild("data")
					.getChild("element");
			// on possède ainsi un élément du fichier
			List<Element> listeTag = element.getChildren();
			Iterator<Element> it = listeTag.iterator();
			System.out.print("XSL construction preprocessing");
			boolean modification = false;
			while (it.hasNext()) {
				System.out.print(".");
				Element courant = it.next();

				// patch pour geo/name => a corriger
				String name = courant.getName();
				if (courant.getChildren().size() == 1) {
					name += "/name";
				}
				if (properties.containsKey(name)) {
					map.put(name,
							new MappingUnit((String) properties.get(name)));
				} else {
					// la propriété n'existe pas, il faut la créer
					properties.setProperty(name, "TEMPORAIRE:" + name
							+ ",string");
					System.err.println("WARNING: new property added");
					modification = true;
					map.put(name,
							new MappingUnit((String) properties.get(name)));
				}
			}
			if (modification) {
				properties
						.store(new FileOutputStream(mappingPath, false),
								"mapping file! If 'TEMPORAIRE:XXX' appears somewhere, "
										+ "that means that open data wrapper have generated it because "
										+ "it hasn't found the right mapping. please check it out!");

			}
			// here, everything is identified in map
			System.out.println("done!");
			generateXSL(map);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void generateXSL(Map<String, MappingUnit> map) {
		try {
			// Create file
			System.out.println("XSL construction processing...");
			FileWriter fstream = new FileWriter(XSLFile);
			BufferedWriter out = new BufferedWriter(fstream);

			// ready to write

			out.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
					+ "<xsl:stylesheet version=\"2.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"\n"
					+ "	xmlns:ex=\"http://www.example.org/\" \n"
					+ "	xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n"
					+ "	xmlns:foaf=\"http://xmlns.com/foaf/0.1/\"\n"
					+ "	> \n"
					+ "<xsl:output method='text' encoding='UTF-8'/>\n"
					+ "\n"
					+ "<xsl:template match=\"document\">\n"
					+ "	<xsl:apply-templates select=\"data\"/>\n"
					+ "</xsl:template>\n"
					+ "\n"
					+ "<xsl:variable name=\"incr\" select=\"0\"></xsl:variable>\n"
					+ "\n" + "<xsl:template match=\"data\">\n"
					+ "	<xsl:text>\n");

			prefixes(out);

			out.write("\n" + "</xsl:text>\n" + "	<xsl:apply-templates />\n"
					+ "</xsl:template>\n" + "\n"
					+ "<xsl:template match=\"element\">\n");

			templateDef(map, out);

			out.write("\n</xsl:template>\n\n");

			templateWrite(map, out);

			out.write("</xsl:stylesheet>");

			// Close the output stream
			System.out.println("done!");
			out.close();
		} catch (Exception e) {// Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}

	}

	private void templateWrite(Map<String, MappingUnit> map, BufferedWriter out)
			throws IOException {
		System.out.print("template write...");
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();

		// on trouve d'abord le foaf:name à afficher
		// boolean trouve = false;
		// String principal = "";
		// while (it.hasNext() && !trouve) {
		// String courant = it.next();
		// // System.err.println(map.get(courant).vocabulaire);
		// if (map.get(courant).vocabulaire.equals("foaf:name")) {
		// out.write("<xsl:template match=\""
		// + courant
		// + "\"> <xsl:text>&#010;</xsl:text>\n"
		// + "<xsl:value-of select=\"concat(concat('&lt;"
		// + URIBase
		// +
		// "10/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')\"/>&#009; "
		// + map.get(courant).vocabulaire
		// + " &#009; \"<xsl:value-of select=\".\"/>\"^^xsd:string ;\n"
		// + "</xsl:template>");
		// trouve = true;
		// principal = courant;
		// }
		// }

		// traitement normal
		it = keys.iterator();
		while (it.hasNext()) {
			String courant = it.next();
			// System.err.println(map.get(courant).vocabulaire);
			if (map.get(courant).vocabulaire.equals("foaf:name")) {
				out.write("<xsl:template match=\""
						+ courant
						+ "\"> <xsl:text>&#010;</xsl:text>\n"
						+ "<xsl:value-of select=\"concat(concat('&lt;"
						+ URIBase
						+ "10/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')\"/>&#009; "
						+ map.get(courant).vocabulaire
						+ " &#009; \"<xsl:value-of select=\".\"/>\"^^xsd:string ");
			} else {
				if (map.get(courant).type.equals("integer")) {
					out.write("<xsl:template match=\""
							+ courant
							+ "\">&#009;"
							+ map.get(courant).vocabulaire
							+ "&#009; \"<xsl:value-of select=\".\"/>\"^^xsd:integer ");
				} else {
					if (map.get(courant).type.equals("decimal")) {
						out.write("<xsl:template match=\""
								+ courant
								+ "\">&#009;"
								+ map.get(courant).vocabulaire
								+ "&#009; \"<xsl:value-of select=\".\"/>\"^^xsd:decimal ");
					} else {
						// on suppose que le cas général est string
						out.write("<xsl:template match=\""
								+ courant
								+ "\">&#009;"
								+ map.get(courant).vocabulaire
								+ "&#009; \"<xsl:value-of select=\"translate(., '&quot;','')\"/>\"^^xsd:string ");
					}
				}
			}
			if (it.hasNext()) {
				out.write(";\n" + "</xsl:template>");
			} else {
				out.write(".\n\n" + "</xsl:template>");
			}
		}
		System.out.println("done!");
	}

	private void templateDef(Map<String, MappingUnit> map, BufferedWriter out)
			throws IOException {
		System.out.print("template definition...");
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		boolean trouve = false;
		String principal = "";
		while (it.hasNext() && !trouve) {
			String courant = it.next();
			if (map.get(courant).vocabulaire.equals("foaf:name")) {
				out.write("\t<xsl:apply-templates select=\"" + courant
						+ "\"/>\n");
				trouve = true;
				principal = courant;
			}
		}
		if (!trouve) {
			System.err.println("id non trouvé!");
			return;
		}
		it = keys.iterator();
		while (it.hasNext()) {
			String courant = it.next();
			if (!courant.equals(principal)) {
				out.write("\t<xsl:apply-templates select=\"" + courant
						+ "\"/>\n");
			}
		}
		System.out.println("done!");
	}

	private void prefixes(BufferedWriter out) throws IOException {
		System.out.print("adding prefixes...");
		String prefixChaine = (String) properties.get("$$prefixes$$");
		String[] prefixes = prefixChaine.split(",");
		for (String value : prefixes) {
			out.write("@prefix "
					+ value.replace("<", "&lt;").replace(">", "&gt;") + " .\n");
		}
		System.out.println("done!");
	}
}
