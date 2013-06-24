package opendatawrapper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
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
	public String dataset;
	public String speMappingPath;

	public final String URIBase = "http://lodpaddle.com/";

	private final String intVide = "NaN";
	private final String decVide = "NaN";
	private final String stringVide = "undefined";
	private Properties speProp;

	public XSLConstructor(String xSLFile_, Document document, Properties p,
			String Dataset, String spePath) {
		XSLFile = xSLFile_;
		XMLFile = document;
		properties = p;
		dataset = Dataset;
		speMappingPath = spePath;
	}

	public boolean construct(String mappingPath) {
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
			File f = new File(speMappingPath);
			if (f.exists()) {
				System.out
						.println("Personnal property file detected");
				speProp = new Properties();
				speProp.load(new FileReader(f));
			}
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
				if (speProp != null && speProp.containsKey(name)) {
					map.put(name,
							new MappingUnit((String) speProp.get(name)));
				} else {
					if (properties.containsKey(name)) {
						map.put(name,
								new MappingUnit((String) properties.get(name)));
					} else {
						// la propriété n'existe pas, il faut la créer
						properties.setProperty(name, "TEMPORAIRE:" + name
								+ ",string");
						System.err.println("WARNING: new property added: "
								+ name);
						modification = true;
						map.put(name,
								new MappingUnit((String) properties.get(name)));
					}
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
			return generateXSL(map);

		} catch (IOException e) {
			System.err.println("Unable to open/write into the mapping file "
					+ mappingPath + " " + e.getMessage());
			return false;
		}
	}

	private boolean generateXSL(Map<String, MappingUnit> map) {
		try {
			// Create file
			System.out.print("XSL construction processing...");
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

			out.write("\n" + "</xsl:text>\n" + "	<xsl:apply-templates/>\n"
					+ "</xsl:template>\n" + "\n"
					+ "<xsl:template match=\"element\">\n");

			if (templateDef(map, out)) {

				out.write("\n</xsl:template>\n\n");

				templateWrite(map, out);

				out.write("</xsl:stylesheet>");
			} else {
				return false;
			}

			// Close the output stream
			System.out.println("done!");
			out.close();
			return true;
		} catch (Exception e) {// Catch exception if any
			System.err.println("Error: " + e.getMessage());
			return false;
		}

	}

	private String templateName(String courant, Iterator<String> it,
			Map<String, MappingUnit> map) {
		String s = new String(
				"<xsl:template match=\""
						+ courant
						+ "\">"
						+ "<xsl:choose>"
						+ "<xsl:when test=\". = 'null'\"></xsl:when>\n"
						+ "<xsl:otherwise>"
						+ "<xsl:value-of select=\"concat(concat('&lt;"
						+ URIBase
						+ dataset
						+ "/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')\"/>&#009; "
						+ map.get(courant).vocabulaire
						+ " &#009; \"<xsl:value-of select=\"translate(., '&quot;','')\"/>\"^^xsd:string ;"
						+ lastRetour(it)
						+ "</xsl:otherwise></xsl:choose></xsl:template>\n\n");
		return s;
	}

	private String templateInt(String courant, Iterator<String> it,
			Map<String, MappingUnit> map) {
		String s = new String("<xsl:template match=\"" + courant + "\">"
				+ "<xsl:choose>" + "<xsl:when test=\". = 'null'\">" + "&#009;"
				+ map.get(courant).vocabulaire + "&#009; \"" + intVide
				+ "\"^^xsd:integer " + last(it) + lastRetour(it)
				+ "</xsl:when>\n" + "<xsl:otherwise>" + "&#009;"
				+ map.get(courant).vocabulaire
				+ "&#009; \"<xsl:value-of select=\".\"/>\"^^xsd:integer "
				+ last(it) + lastRetour(it)
				+ "</xsl:otherwise></xsl:choose></xsl:template>\n\n");
		return s;
	}

	private String templateFloat(String courant, Iterator<String> it,
			Map<String, MappingUnit> map) {
		String s = new String("<xsl:template match=\"" + courant + "\">"
				+ "<xsl:choose>" + "<xsl:when test=\". = 'null'\">" + "&#009;"
				+ map.get(courant).vocabulaire + "&#009; \"" + decVide
				+ "\"^^xsd:decimal " + last(it) + lastRetour(it)
				+ "</xsl:when>\n" + "<xsl:otherwise>" + "&#009;"
				+ map.get(courant).vocabulaire
				+ "&#009; \"<xsl:value-of select=\".\"/>\"^^xsd:decimal "
				+ last(it) + lastRetour(it)
				+ "</xsl:otherwise></xsl:choose></xsl:template>\n\n");
		return s;
	}

	private String templateString(String courant, Iterator<String> it,
			Map<String, MappingUnit> map) {
		String s = new String(
				"<xsl:template match=\""
						+ courant
						+ "\">\n"
						+ "<xsl:choose>"
						+ "<xsl:when test=\". = 'null'\">"
						+ "&#009;"
						+ map.get(courant).vocabulaire
						+ "&#009; \""
						+ stringVide
						+ "\"^^xsd:string "
						+ last(it)
						+ lastRetour(it)
						+ "</xsl:when>\n"
						+ "<xsl:otherwise>"
						+ "&#009;"
						+ map.get(courant).vocabulaire
						+ "&#009; \""
						+ "<xsl:value-of select=\"translate(., '&quot;','')\"/>\"^^xsd:string "
						+ last(it) + lastRetour(it)
						+ "</xsl:otherwise></xsl:choose></xsl:template>\n\n");
		return s;
	}

	private String templateCoord(String courant, Iterator<String> it,
			Map<String, MappingUnit> map) {
		String s = new String(
				"<xsl:template match=\""
						+ courant
						+ "\">"
						+ "&#009;"
						+ "geo:lat"
						+ "&#009;\""
						+ "<xsl:value-of select=\"substring-after(substring-before(.,' ,'),'[ ')\"/>\"^^xsd:decimal ;\n"
						+ "&#009;"
						+ "geo:long"
						+ "&#009;\""
						+ "<xsl:value-of select=\"substring-before(substring-after(.,', '),']')\"/>\"^^xsd:decimal  "
						+ last(it) + lastRetour(it) + "</xsl:template>\n\n");
		return s;
	}

	private void templateWrite(Map<String, MappingUnit> map, BufferedWriter out)
			throws IOException {
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		it = keys.iterator();
		while (it.hasNext()) {
			String courant = it.next();
			if (map.get(courant).vocabulaire.equals("foaf:name")) {
				out.write(templateName(courant, it, map));
			} else {
				if (courant == "_l") {
					out.write(templateCoord(courant, it, map));
				} else {
					if (map.get(courant).type.equals("decimal")) {
						out.write(templateFloat(courant, it, map));
					} else {
						if (map.get(courant).type.equals("integer")) {
							out.write(templateInt(courant, it, map));
						} else {
							// on suppose que le cas général est string
							out.write(templateString(courant, it, map));
						}
					}
				}
			}
		}
	}

	private String lastRetour(Iterator<String> it) {
		if (it.hasNext())
			return "\n";
		else
			return "\n\n";
	}

	private String last(Iterator<String> it) {
		if (it.hasNext())
			return ";";
		else
			return ".";
	}

	private boolean templateDef(Map<String, MappingUnit> map, BufferedWriter out)
			throws IOException {
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
			return false;
		}
		it = keys.iterator();
		while (it.hasNext()) {
			String courant = it.next();
			if (!courant.equals(principal)) {
				out.write("\t<xsl:apply-templates select=\"" + courant
						+ "\"/>\n");
			}
		}
		return true;
	}

	private void prefixes(BufferedWriter out) throws IOException {
		String prefixChaine = (String) properties.get("$$prefixes$$");
		String[] prefixes = prefixChaine.split(",");
		for (String value : prefixes) {
			out.write("@prefix "
					+ value.replace("<", "&lt;").replace(">", "&gt;") + " .\n");
		}
	}
}
