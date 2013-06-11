package opendatawrapper;

import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class Principale {

	public static Map<Integer, DataSource> listeDataSource;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// TODO
		/*
		 * This will be the front door of the application The wrapper will know
		 * what data it is supposed to transform what method it will use if he
		 * can contact the API or must use a file
		 */

		LoadRessources lr = new LoadRessources();
		listeDataSource = lr.extractData();
		System.out.println("loading...");

		Scanner in = new Scanner(System.in);
		try {
			int result = 0;
			while (result >= 0) {

				System.out.println("################################\n"
						+ "welcome in the openData Wrapper!\n"
						+ " What do you want to do?\n"
						+ "[1] List datasources\n" + "[2] Convert one data\n"
						+ "[3] Convert all data\n" + "[4] Quit\n");
				result = in.nextInt();

				switch (result) {
				case 1:
					listDatasources();
					break;
				case 2:
					conversionOne();
					break;
				case 3:
					conversionAll();
					break;
				default:
					// on quitte
					result = -1;
					break;
				}
			}
			System.out.println("Exiting...");
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
		}
	}

	private static void listDatasources() {
		// TODO Auto-generated method stub
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
	private static void conversion(DataSource dts) {
		if (dts.getFormat().equals("XML")) {
			ConvertXML cxml = new ConvertXML(dts.getXsltFile(), dts.getOutput());
			if (dts.isApi()) {
				cxml.convertFromApi(dts.getApiUrl());
			} else {
				cxml.convertfromFile(dts.getFilePath());
			}
		} else {
			if (dts.getFormat().equals("CSV")) {
				ConvertCSV ccsv = new ConvertCSV(dts.getXsltFile(),
						dts.getOutput());
				ccsv.convertfromFile(dts.getFilePath());
			} else {
				System.err.println("the format " + dts.getFormat()
						+ " is not supported yet!");
			}
		}
	}

	/*
	 * Select the dataset to convert by asking the user
	 */
	private static void conversionOne() {
		System.out.println("Which dataset?");
		listDatasources();
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			DataSource dts = listeDataSource.get(result);
			conversion(dts);
			System.out.println("conversion ok!");
		} catch (InputMismatchException e) {
			System.err.println("la saisie effectué n'est pas un nombre!");
		}
	}

	/*
	 * Convert all dataset listed in listeDataSource accordingly to
	 * dataSources.xml
	 */
	private static void conversionAll() {
		Set<Integer> listeData = listeDataSource.keySet();

		Iterator<Integer> it = listeData.iterator();
		int courant;
		DataSource dts = null;
		while (it.hasNext()) {
			courant = it.next();
			dts = listeDataSource.get(courant);
			conversion(dts);
		}
	}

}
