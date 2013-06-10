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
		// System.setProperty("http.proxyHost", "iproxy1.cg44.fr");
		// System.setProperty("http.proxyPort", "3128");
		// System.getProperties().put("http.proxyUser", "021806B");
		// System.getProperties().put("http.proxyPassword", "HSi1eBSW44");

		// TODO
		/*
		 * This will be the front door of the application The wrapper will know
		 * what data it is supposed to transform what method it will use if he
		 * can contact the API or must use a file
		 */

		LoadRessources lr = new LoadRessources();
		listeDataSource = lr.extractData();
		System.out.println("loading...");

		System.out.println("welcome in the openData Wrapper!\n"
				+ " What do you want to do?\n" + "[1] convert data\n"
				+ "[2] list datasources\n" + "[3] quit");
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();

			switch (result) {
			case 1:
				conversion();
				break;
			case 2:
				listDatasources();
				break;
			default:
				// nothing
				break;
			}
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

	public static void conversion() {
		System.out.println("Which dataset?");
		listDatasources();
		Scanner in = new Scanner(System.in);
		int result = in.nextInt();

		DataSource dts = listeDataSource.get(result);

		System.out.println(dts.getFormat());
		if (dts.getFormat().equals("XML")) {

			ConvertXML cxml = new ConvertXML(dts.getXsltFile(),
					"ressources/output/" + dts.getNom() + ".n3");
			if (dts.isApi()) {
				cxml.convertFromApi(dts.getApiUrl());
			} else {
				cxml.convertfromFile(dts.getFilePath());
			}
		} else {
			if(dts.getFormat().equals("CSV")){
			ConvertCSV ccsv = new ConvertCSV(dts.getXsltFile(), "ressources/output/" + dts.getNom() + ".n3");
			ccsv.convertfromFile(dts.getFilePath());
			}
			else{
				System.err.println("the format "+dts.getFormat()+" is not supported yet!");
			}
		}

		System.out.println("conversion ok!");
	}

}
