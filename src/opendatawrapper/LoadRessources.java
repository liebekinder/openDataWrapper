package opendatawrapper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * @author seb
 * 
 */
public class LoadRessources {
	static Logger logger = Logger.getLogger(LoadRessources.class);

	public Document document;
	public String DocumentPath = "ressources/dataSources.xml";
	public Map<Integer, DataSource> listeDataSource;
	public Properties mapping;
	public String mappingFile;
	public String queryFolder;
	public Map<Integer, String> queryList;
	public String specificMappingFolder;
	public String datasetFolder;

	public String fusekiFolder;
	public String fusekiConfigFile;
	public String fusekiRunScript;

	public String getDatasetFolder() {
		return datasetFolder;
	}

	public Map<Integer, String> getQueries() {
		return queryList;
	}

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
		queryFolder = document.getRootElement().getChild("configuration")
				.getChild("queryFolder").getValue();
		queryList = findQueries(queryFolder);
		specificMappingFolder = document.getRootElement()
				.getChild("configuration").getChild("specificMappingFolder")
				.getValue();
		datasetFolder = document.getRootElement().getChild("configuration")
				.getChild("datasetFolder").getValue();
		fusekiFolder = document.getRootElement().getChild("configuration")
				.getChild("fusekiFolder").getValue();
		fusekiConfigFile = document.getRootElement().getChild("configuration")
				.getChild("fusekiConfigFile").getValue();
		fusekiRunScript = document.getRootElement().getChild("configuration")
				.getChild("fusekiRunScript").getValue();

		// generate the fusekiconfigfile
		generateFuseki();

		// Dans un premier temps on liste tous les étudiants
		List<Element> listsources = racine.getChildren("source");
		Iterator<Element> it = listsources.iterator();
		// On parcours la liste grâce à un iterator
		int i = 1;
		while (it.hasNext()) {

			Element courant = (Element) it.next();

			String nom = courant.getChild("nom").getValue().trim();
			String apiUrl = courant.getChild("apiurl").getValue().trim();
			String xsltFile = courant.getChild("xsltFile").getValue().trim();
			boolean specificXSLT = Boolean.parseBoolean(courant.getChild(
					"specificXSLT").getValue());
			String outputTtl = courant.getChild("outputTtlFile").getValue()
					.trim();
			String outputRdf = courant.getChild("outputXmlFile").getValue()
					.trim();

			// chaque source est ajouté à la hashMap
			listeDataSource.put(i, new DataSource(nom, apiUrl, xsltFile,
					specificXSLT, outputTtl, outputRdf));
			i++;
		}

		return getListeDataSource();

	}

	private void generateFuseki() {
		// we need to construct the file
		try {
			FileWriter configFile = new FileWriter(new File(fusekiConfigFile),
					false);
			String content = "@prefix :        <#> .\n"
					+ "@prefix fuseki:  <http://jena.apache.org/fuseki#> .\n"
					+ "@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .\n"
					+ "@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .\n"
					+ "@prefix tdb:     <http://jena.hpl.hp.com/2008/tdb#> .\n"
					+ "@prefix ja:      <http://jena.hpl.hp.com/2005/11/Assembler#> .\n\n";

			content += "[] ja:loadClass \"com.hp.hpl.jena.tdb.TDB\" .\n"
					+ "tdb:DatasetTDB  rdfs:subClassOf  ja:RDFDataset .\n"
					+ "tdb:GraphTDB    rdfs:subClassOf  ja:Model .\n\n";

			content += "[] rdf:type fuseki:Server ;\n" + "fuseki:services (\n"
					+ "<#service_tdb_read_only>\n" + ") .\n\n";

			content += "# TDB\n"
					+ "[] ja:loadClass \"com.hp.hpl.jena.tdb.TDB\" .\n"
					+ "tdb:DatasetTDB  rdfs:subClassOf  ja:RDFDataset .\n"
					+ "tdb:GraphTDB    rdfs:subClassOf  ja:Model .\n\n";

			content += "<#service_tdb_read_only> rdf:type fuseki:Service ;\n"
					+ "rdfs:label                      \"TDB Service (R)\" ;\n"
					+ "fuseki:name                     \"openData\" ;\n"
					+ "fuseki:serviceQuery             \"query\" ;\n"
					+ "fuseki:serviceQuery             \"sparql\" ;\n"
					+ "fuseki:serviceUpdate            \"update\" ;\n"
					+ "fuseki:serviceReadGraphStore    \"data\" ;\n"
					+ "fuseki:serviceReadGraphStore    \"get\" ;\n"
					+ "fuseki:dataset           <#tdb_dataset_read> ;\n"
					+ ".\n\n";

			content += "<#tdb_dataset_read> rdf:type      tdb:DatasetTDB ;\n"
					+ "tdb:location \"" + System.getProperty("user.home")+"/.openDataWrapper/"+datasetFolder + "\" ;\n"
					+ "tdb:unionDefaultGraph true ;\n" + ".";

			configFile.write(content);
			configFile.close();
		} catch (IOException e) {
			System.err.println("Unable to locate " + fusekiConfigFile
					+ ". Check that the file exist and is readable.");
		}

	}

	public String getFusekiFolder() {
		return fusekiFolder;
	}

	public String getFusekiConfigFile() {
		return fusekiConfigFile;
	}

	public String getFusekiRunScript() {
		return fusekiRunScript;
	}

	public String getSpecificMappingFolder() {
		return specificMappingFolder;
	}

	/**
	 * @param queryFolder2
	 *            , the folder that contains all .sparql query files
	 * @return a TreeMap with the file name and the absolute path
	 */
	private Map<Integer, String> findQueries(String queryFolder2) {
		Map<Integer, String> m = new TreeMap<Integer, String>();
		String files;
		File folder = new File(queryFolder2);
		File[] listOfFiles = folder.listFiles();
		int cpt = 1;
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				files = listOfFiles[i].getName();
				if (files.endsWith(".sparql") || files.endsWith(".SPARQL")) {
					m.put(cpt, files + ":" + listOfFiles[i].getAbsolutePath());
					cpt++;
				}
			}
		}
		return m;
	}

	public String getQueryFolder() {
		return queryFolder;
	}

	public void addDatasources() {
		// le document a déjà été chargé
		Properties p = new Properties();
		try {
			p.load(new FileReader(System.getProperty("user.home")
					+ "/.openDataWrapper/import.odw"));
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
					Element apiurl = new Element("apiurl");
					apiurl.setText((String) p.getProperty((String) valeur)
							+ "?format=xml");
					Element xsltFile = new Element("xsltFile");
					xsltFile.setText("ressources/xsl/" + (String) valeur
							+ ".xsl");
					Element specificXSLT = new Element("specificXSLT");
					specificXSLT.setText("false");
					Element outputTtlFile = new Element("outputTtlFile");
					outputTtlFile.setText("ressources/output/ttl/"
							+ (String) valeur + ".n3");
					Element outputXmlFile = new Element("outputXmlFile");
					outputXmlFile.setText("ressources/output/rdf-xml/"
							+ (String) valeur + ".rdf");

					temp.addContent(name);
					temp.addContent(apiurl);
					temp.addContent(xsltFile);
					temp.addContent(specificXSLT);
					temp.addContent(outputTtlFile);
					temp.addContent(outputXmlFile);

					racine.addContent(temp);
				}
			}
			if (modified) {
				writeDocument();
				eraseDocument();
				System.out.print(" modification ");
			} else {
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
					System.getProperty("user.home")
							+ "/.openDataWrapper/import.odw");
			fos.close();
		} catch (IOException e) {
			System.err
					.println("import.owd can't be opened! Please check that the file exists and is writable!");
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
