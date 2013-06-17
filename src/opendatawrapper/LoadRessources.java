package opendatawrapper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class LoadRessources {

	public Document document;
	public String DocumentPath = "ressources/dataSources.xml";
	Map<Integer, DataSource> listeDataSource;
	Properties mapping;
	String mappingFile;

	public LoadRessources() throws JDOMException, IOException {
		SAXBuilder sxb = new SAXBuilder();
		// On crée un nouveau document JDOM avec en argument le fichier XML
		// Le parsing est terminé ;)
		document = sxb.build(new File(DocumentPath));

		listeDataSource = new TreeMap<Integer, DataSource>();
	}

	public void affiche() {
		try {
			// On utilise ici un affichage classique avec getPrettyFormat()
			XMLOutputter sortie = new XMLOutputter(Format.getPrettyFormat());
			sortie.output(document, System.out);
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
	}

	public Map<Integer, DataSource> extractData() {
		Element racine = document.getRootElement();

		mappingFile = document.getRootElement().getChild("configuration")
				.getChild("mappingFile").getValue();

		// Dans un premier temps on liste tous les étudiants
		List<Element> listsources = racine.getChildren("source");
		Iterator<Element> it = listsources.iterator();
		// On parcours la liste grâce à un iterator
		int i = 1;
		while (it.hasNext()) {

			Element courant = (Element) it.next();

			String nom = courant.getChild("nom").getValue();
			boolean api = Boolean.parseBoolean(courant.getChild("api")
					.getValue());
			String apiUrl = courant.getChild("apiurl").getValue();
			boolean file = Boolean.parseBoolean(courant.getChild("file")
					.getValue());
			String filePath = courant.getChild("filepath").getValue();
			String mappingFile = courant.getChild("mappingFile").getValue();
			String xsltFile = courant.getChild("xsltFile").getValue();
			String format = courant.getChild("format").getValue();
			String outputTtl = courant.getChild("outputTtlFile").getValue();
			String outputRdf = courant.getChild("outputXmlFile").getValue();

			// chaque source est ajouté à la hashMap
			listeDataSource.put(i, new DataSource(nom, api, apiUrl, file,
					filePath, mappingFile, xsltFile, format, outputTtl,
					outputRdf));
			i++;
		}

		return getListeDataSource();

	}

	public void addDatasources() {
		// le document a déjà été chargé
		Properties p = new Properties();
		try {
			p.load(new FileReader(System.getProperty("user.home")
					+ "/import.odw"));
			Set<Object> cles = p.keySet();
			Element racine = document.getRootElement();
			boolean modified = false;
			for (Object valeur : cles) {

				boolean existing = false;
				for (Element e : racine.getChildren("source")) {
					if (e.getChild("nom").getText().equals((String) valeur)) {
						existing = true;
						System.err.println("the datasource " + (String) valeur
								+ " already exist!");
						break;
					}
				}
				if (!existing) {
					modified = true;
					Element temp = new Element("source");

					Element name = new Element("nom");
					name.setText((String) valeur);
					Element api = new Element("api");
					api.setText("true");
					Element apiurl = new Element("apiurl");
					apiurl.setText((String) p.getProperty((String) valeur)
							+ "?format=xml");
					Element file = new Element("file");
					file.setText("false");
					Element filepath = new Element("filepath");
					filepath.setText("null");
					Element mappingFile = new Element("mappingFile");
					mappingFile.setText("null");
					Element xsltFile = new Element("xsltFile");
					xsltFile.setText("ressources/xsl/" + (String) valeur
							+ ".xsl");
					Element format = new Element("format");
					format.setText("XML");
					Element outputTtlFile = new Element("outputTtlFile");
					outputTtlFile.setText("ressources/output/ttl/" + (String) valeur
							+ ".n3");
					Element outputXmlFile = new Element("outputXmlFile");
					outputXmlFile.setText("ressources/output/rdf-xml/"
							+ (String) valeur + ".rdf");

					temp.addContent(name);
					temp.addContent(api);
					temp.addContent(apiurl);
					temp.addContent(file);
					temp.addContent(filepath);
					temp.addContent(mappingFile);
					temp.addContent(xsltFile);
					temp.addContent(format);
					temp.addContent(outputTtlFile);
					temp.addContent(outputXmlFile);

					racine.addContent(temp);
				}
			}
			if (modified) {
				writeDocument();
				eraseDocument();
				System.out.print(" modification ");
			}
			else{
				System.out.println(" no modification ");
			}

		} catch (FileNotFoundException e) {
			System.err.println("import.odw doesn't exist! " + e.getMessage());
		} catch (IOException e) {
			System.err
					.println("import.odw cannot be opened. Chack that you hav the right to open this file. "
							+ e.getMessage());
		}

	}

	private void eraseDocument() {
		try {
			OutputStream fos = new FileOutputStream(
					System.getProperty("user.home") + "/import.odw");
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void writeDocument() {
		XMLOutputter xmlop = new XMLOutputter(Format.getPrettyFormat());
		try {
			xmlop.output(document, new FileOutputStream(
					"ressources/dataSources.xml"));
		} catch (FileNotFoundException e) {
			System.err.println("ressources/dataSources.xml doesn't exist! "
					+ e.getMessage());
		} catch (IOException e) {
			System.err
					.println("ressources/dataSources.xml cannot be opened. Chack that you hav the right to open this file. "
							+ e.getMessage());
		}
	}

	public Map<Integer, DataSource> getListeDataSource() {
		return listeDataSource;
	}
}
