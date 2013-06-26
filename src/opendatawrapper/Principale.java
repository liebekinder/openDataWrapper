package opendatawrapper;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;
import java.util.Set;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.jdom2.JDOMException;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;

public class Principale {

	static Logger logger = Logger.getLogger(Principale.class);

	public static Map<Integer, DataSource> listeDataSource;
	public static Properties properties;
	public static LoadRessources lr;
	public static Map<Integer, String> queries;
	public static String queryFolder;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		/*
		 * This will be the front door of the application The wrapper will know
		 * what data it is supposed to transform what method it will use if he
		 * can contact the API or must use a file
		 */
		// Set up a simple configuration that logs on the console.
		BasicConfigurator.configure();

		try {
			lr = new LoadRessources();
		} catch (JDOMException e1) {
			System.err
					.println("The configuration file dataSource.xml is corrupted. Please check that this file is a valid XML file!");
			return;
		} catch (IOException e1) {
			System.err
					.println("Unable to open the configuration file dataSources.xml");
			return;
		}
		listeDataSource = lr.extractData();
		properties = getMapping(lr.mappingFile);
		queryFolder = lr.getQueryFolder();
		queries = lr.getQueries();
		System.out.println("loading...");

		Scanner in = new Scanner(System.in);
		int result = 0;
		while (result >= 0) {

			try {
				System.out.println("################################\n"
						+ "welcome in the openData Wrapper!\n"
						+ " What do you want to do?\n"
						+ "[1] List datasources\n"
						+ "[2] Add new datasources\n"
						+ "[3] Convert one data into turtle\n"
						+ "[4] Convert all data into turtle\n"
						+ "[5] Convert one data into RDF/XML\n"
						+ "[6] Convert all data into RDF/XML\n"
						+ "[7] Query over converted data\n"
						+ "[8] Reload data\n" + "[9] SPARQL Endpoint\n"
						+ "[9] Test requete\n" + "[0] Quit\n");
				result = in.nextInt();

				switch (result) {
				case 1:
					listDatasources();
					break;
				case 2:
					addDataSources();
					break;
				case 3:
					conversionTtlOne();
					break;
				case 4:
					conversionTtlAll();
					break;
				case 5:
					conversionXmlOne();
					break;
				case 6:
					conversionXmlAll();
					break;
				case 7:
					queryOverData();
					break;
				case 8:
					reloadData();
					break;
				case 9:
					sparql();
					break;
				case 10:
					fetchFile();
					break;
				default:
					// on quitte
					result = -1;
					break;
				}
			} catch (InputMismatchException e) {
				System.out.println("la saisie effectué n'est pas un nombre!");
				in.nextLine();
				result = 0;
			}
		}
		System.out.println("Exiting...");
		in.close();
	}

	private static void sparql() {
		SparqlManagement spm = new SparqlManagement(lr.getDatasetFolder(),
				listeDataSource);
		spm.run(lr.getFusekiRunScript(), lr.getFusekiFolder(),
				lr.getFusekiConfigFile());
	}

	private static void queryOverData() {
		System.out.println("Query management system");
		QueryManager qm = new QueryManager(queries, listeDataSource);
		qm.run();
	}

	private static void reloadData() {
		listeDataSource = lr.extractData();
		System.out.println("reload complete!");
	}

	private static void addDataSources() {
		System.out.print("adding new sources...");
		lr.addDatasources();
		listeDataSource = lr.extractData();
		System.out.println("done!");
	}

	private static void listDatasources() {
		Set<Integer> nomData = listeDataSource.keySet();
		Iterator<Integer> it = nomData.iterator();
		System.out.println("Liste des dataset:");
		while (it.hasNext()) {
			Integer courant = it.next();
			System.out.println("[" + courant + "] "
					+ listeDataSource.get(courant).getNom());
		}
	}

	/*
	 * conversion processing
	 * 
	 * @param DataSource dts, the DataSource ressource you want to convert
	 */
	private static void conversionTtl(DataSource dts) {
		ConvertTTL cttl = new ConvertTTL(dts.getXsltFile(), dts.getOutputTtl(),
				lr.mappingFile, dts.getNom(), lr.getSpecificMappingFolder()
						+ "/" + dts.getNom() + ".properties");
		cttl.convertFromApi(dts.getApiUrl(), properties, dts.isSpecificXSLT());
	}

	/*
	 * Select the dataset to convert by asking the user
	 */
	private static void conversionTtlOne() {
		System.out.println("Which dataset?");
		listDatasources();
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			if (result > 0 && result <= listeDataSource.keySet().size()) {
				DataSource dts = listeDataSource.get(result);
				conversionTtl(dts);
				System.out.println("conversion ok!");
			} else {
				System.err.println("unknown data source");
			}
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
		} finally {
			// in.close();
		}
	}

	/*
	 * Convert all dataset listed in listeDataSource accordingly to
	 * dataSources.xml
	 */
	private static void conversionTtlAll() {
		Set<Integer> listeData = listeDataSource.keySet();

		Iterator<Integer> it = listeData.iterator();
		int courant;
		DataSource dts = null;
		while (it.hasNext()) {
			courant = it.next();
			dts = listeDataSource.get(courant);
			conversionTtl(dts);
		}
	}

	private static void conversionXmlOne() {
		System.out.println("Which dataset?");
		listDatasources();
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			if (result > 0 && result <= listeDataSource.keySet().size()) {
				DataSource dts = listeDataSource.get(result);
				conversionTtl(dts);
				conversionXmlRdf(dts);
				System.out.println("conversion ok!");
			} else {
				System.err.println("la saisie effectué n'est pas un nombre!");
			}
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
		} finally {
			// in.close();
		}
	}

	private static void conversionXmlAll() {
		Set<Integer> listeData = listeDataSource.keySet();

		Iterator<Integer> it = listeData.iterator();
		int courant;
		DataSource dts = null;
		while (it.hasNext()) {
			courant = it.next();
			dts = listeDataSource.get(courant);
			conversionTtl(dts);
			conversionXmlRdf(dts);
		}
	}

	private static void conversionXmlRdf(DataSource dts) {
		ConvertXML cxml = new ConvertXML(dts.getOutputTtl(), dts.getOutputRdf());
		cxml.convert();
	}

	public static Properties getMapping(String path) {
		Properties p = new Properties();
		try {
			p.load(new FileReader(path));
			return p;
		} catch (FileNotFoundException e) {
			System.err.println("Le fichier de mapping n'existe pas! "
					+ e.getMessage());
		} catch (IOException e) {
			System.err
					.println("Erreur de lecture du fichier de mapping. Vérifiez que vous avez les droits en lecture! "
							+ e.getMessage());
		}
		return p;
	}

	private static void fetchFile() {
		// just fetch the xml file to rdf/xml format
		String queryString = "select * where {?a ?b ?c} limit 100";
		// now creating query object
		Query query = QueryFactory.create(queryString);
		// initializing queryExecution factory with remote service.
		// **this actually was the main problem I couldn't figure out.**
		QueryExecution qexec = QueryExecutionFactory.sparqlService(
				"http://localhost:3030/openData/query", query);
		// after it goes standard query execution and result processing which
		// can
		// be found in almost any Jena/SPARQL tutorial.
		try {
			ResultSet results = qexec.execSelect();
			// File fp = new File("output.csv");
			ResultSetFormatter.out(System.out, results);
		} finally {
			qexec.close();
		}
	}
}
