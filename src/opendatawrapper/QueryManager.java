package opendatawrapper;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QueryParseException;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

public class QueryManager {

	Map<Integer, String> queries;
	Map<Integer, DataSource> dataSources;
	Model masterModel;

	public QueryManager(Map<Integer, String> queries,
			Map<Integer, DataSource> dataSources) {
		super();
		this.queries = queries;
		this.dataSources = dataSources;
	}

	public void run() {
		Scanner in = new Scanner(System.in);
		int result = 0;
		while (result >= 0) {

			try {
				System.out.println("-----------------------");
				System.out.println(" What do you want to do?\n"
						+ "[1] Load one dataset\n" + "[2] Load all dataset\n"
						+ "[3] Run one query\n" + "[4] Run all query\n"
						+ "[5] Display queries\n" + "[6] Display model\n"
						+ "[7] Empty model\n" + "[0] Quit\n");
				result = in.nextInt();

				switch (result) {
				case 1:
					loadOneDataset();
					break;
				case 2:
					loadAllDataset();
					break;
				case 3:
					runOneQuery();
					break;
				case 4:
					runAllQuery();
					break;
				case 5:
					displayQueries();
					break;
				case 6:
					displayModel();
					break;
				case 7:
					emptyModel();
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
		System.out.println("Query manager exiting...");
	}

	/**
	 * This method is supposed to clear the current model from memory. Haven't
	 * seen any lowering in memory after execution though... garbage collector?
	 */
	private void emptyModel() {
		if (masterModel != null) {
			masterModel.removeAll();
			System.out.println("The model has been successfully emptied");
		} else {
			System.out.println("No existing model. Please load data first!");
		}
	}

	private void displayModel() {
		if (masterModel != null) {
			// masterModel.write(System.out, "N3");
			System.out.println("\nTotal number of Triple loaded: "
					+ masterModel.size());
		} else {
			System.out.println("No existing model. Please load data first!");
		}
	}

	private void runQuery(String query) {
		try {
			String queryString = readQuery(query);
			Query jenaQuery = QueryFactory.create(queryString);
			QueryExecution qe = QueryExecutionFactory.create(jenaQuery, masterModel);
			ResultSet results = qe.execSelect();
			ResultSetFormatter.out(System.out, results);
//			ResultSetFormatter.outputAsCSV(new FileOutputStream(new File(query+".result.csv"), false), results) ;
			System.out.println("Result ok! See the "+query+".result.csv file !");
		} catch (IOException e) {
			System.err.println("The query cannot be opened. Check that the file exists and that it readable.");
		}catch(QueryParseException e){
			System.err.println("Query error: "+e.getLocalizedMessage());
		}
	}

	private String readQuery(String file) throws IOException {
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = null;
		StringBuilder stringBuilder = new StringBuilder();
		String ls = System.getProperty("line.separator");
		while ((line = reader.readLine()) != null) {
			stringBuilder.append(line);
			stringBuilder.append(ls);
		}
		reader.close();
		return stringBuilder.toString();
	}

	private void runAllQuery() {
		Set<Integer> listeData = queries.keySet();

		Iterator<Integer> it = listeData.iterator();
		int courant;
		String query = null;
		while (it.hasNext()) {
			courant = it.next();
			query = queries.get(courant).split(":")[1];
			runQuery(query);
		}
	}

	private void runOneQuery() {
		System.out.println("which query do you want to run?");
		displayQueries();
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			if (result > 0 && result <= queries.size()) {
				String query = queries.get(result).split(":")[1];
				runQuery(query);
				System.out.println("execution ok!");
			} else {
				System.err.println("there is no such query!");
			}
		} catch (InputMismatchException e) {
			System.err.println("The input isn't a number!");
		}
	}

	private void loadDataset(DataSource dts) {
		String n3path = dts.getOutputTtl();
		if (masterModel == null) {
			masterModel = FileManager.get().loadModel("file:" + n3path, "N3");
		} else {
			try{
			FileManager.get().readModel(masterModel, "file:" + n3path, "N3");
			}
			catch(Exception e){
				System.err.println("The n3 file doesn't exist "+ n3path +"  "+ e.getMessage());
			}
		}
	}

	private void loadAllDataset() {
		Set<Integer> listeData = dataSources.keySet();

		Iterator<Integer> it = listeData.iterator();
		int courant;
		DataSource dts = null;
		while (it.hasNext()) {
			courant = it.next();
			dts = dataSources.get(courant);
			loadDataset(dts);
		}
	}

	private void loadOneDataset() {
		System.out.println("which dataset do you want to load?");
		listDatasources();
		Scanner in = new Scanner(System.in);
		try {
			int result = in.nextInt();
			if (result > 0 && result <= dataSources.size()) {
				DataSource dts = dataSources.get(result);
				loadDataset(dts);
				System.out.println("loading ok!");
			} else {
				System.err.println("there is no such dataset!");
			}
		} catch (InputMismatchException e) {
			System.err.println("The input isn't a number!");
		}

	}

	private void displayQueries() {
		Set<Integer> nomqueries = queries.keySet();
		Iterator<Integer> it = nomqueries.iterator();
		while (it.hasNext()) {
			Integer courant = it.next();
			System.out.println("[" + courant + "] "
					+ queries.get(courant).split(":")[0]);
		}

	}

	private void listDatasources() {
		Set<Integer> nomData = dataSources.keySet();
		Iterator<Integer> it = nomData.iterator();
		System.out.println("Liste des dataset:");
		while (it.hasNext()) {
			Integer courant = it.next();
			System.out.println("[" + courant + "] "
					+ dataSources.get(courant).getNom());
		}
	}

}
