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

import org.jdom2.JDOMException;

public class Principale {

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
						+ "[8] Reload data\n" + "[0] Quit\n");
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
				lr.mappingFile, dts.getNom());
		cttl.convertFromApi(dts.getApiUrl(), properties);
	}

	/*
	 * Select the dataset to convert by asking the user
	 */
	private static void conversionTtlOne() {
		System.out.println("Which dataset?");
		listDatasources();
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			DataSource dts = listeDataSource.get(result);
			conversionTtl(dts);
			System.out.println("conversion ok!");
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
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
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			DataSource dts = listeDataSource.get(result);
			conversionTtl(dts);
			conversionXmlRdf(dts);
			System.out.println("conversion ok!");
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
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
}
