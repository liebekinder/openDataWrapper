package opendatawrapper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import org.apache.log4j.Logger;

import com.hp.hpl.jena.query.Dataset;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.ReadWrite;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.tdb.TDB;
import com.hp.hpl.jena.tdb.TDBFactory;
import com.hp.hpl.jena.util.FileManager;

/**
 * This class manage the sparql Enpoint. On loading, a connection is made with
 * the TDB triple store, stored at datasetDirectory. If this triple doesn't
 * exist, it is created, but remains empty until the function load() is called.
 * Known issues: unable to close and start the connection with the triple store.
 * Once open, the connection won't be cut before the end a the main program.
 * 
 * @ * @author seb
 * 
 */
public class SparqlManagement {
	static Logger logger = Logger.getLogger(SparqlManagement.class);

	public String datasetDirectory;
	public Map<Integer, DataSource> listDTS;
	public int pid;

	public final String UriBase = "http://localhost:3030/openData/";

	/**
	 * SparqlManagement constructor. Connect openDataWrapper to the TDB triple
	 * store.
	 * 
	 * @param datasetFolder
	 * @param listeDataSource
	 */
	public SparqlManagement(String datasetFolder,
			Map<Integer, DataSource> listeDataSource) {
		super();
		this.pid = 0;
		this.datasetDirectory = System.getProperty("user.home")
				+ "/.openDataWrapper/" + datasetFolder;
		listDTS = listeDataSource;
		// System.out.println("Connecting to the TDB triple store...");
		// Dataset dataset = TDBFactory.createDataset(datasetDirectory);
		// System.out.println("Connection Ok!");
		// logger.warn("Dataset memory address= " + dataset);
	}

	public void datasetConnection() {
	}

	/**
	 * SparqlManagement main program. Nothing is done unless you choose an
	 * option.
	 * 
	 * @param fusekiRunScript
	 *            path to the bash script that will launch Fuseki. You don't
	 *            need to modify this file
	 * @param fusekiFolder
	 *            path to the folder containing Fuseki-server. Useful for a new
	 *            version of Fuseki
	 * @param fusekiConfigFile
	 *            path to the configuration file for Fuseki. Useful if you want
	 *            to set up a specific server
	 */
	public void run(String fusekiRunScript, String fusekiFolder,
			String fusekiConfigFile) {
		Scanner in = new Scanner(System.in);
		int result = 0;
		while (result >= 0) {

			try {
				System.out.println("################################\n"
						+ "SPARQL Management!\n" + " What do you want to do?\n"
						+ "[1] Export local datasources into TDB folder\n"
						+ "[2] Run Fuseki\n" + "[3] Get Graph URIs\n"
						+ "[4] query?\n"+ "[5] close Fuseki\n" + "[0] Quit\n");
				result = in.nextInt();

				switch (result) {
				case 1:
					load();
					break;
				case 2:
					runFuseki(fusekiRunScript, fusekiFolder, fusekiConfigFile);
					break;
				case 3:
					listGraphs();
					break;
				case 4:
					query();
					break;
				case 5:
					closeFuseki();
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
		// dataset.close();
		// in.close();
	}

	/**
	 * This function reads all data source stored in the data sources list and
	 * load them into TDB. Each dataset has its own graph with the URI defined
	 * as following : BaseUri + dataset name. BaseUri is defined upper. E.g.
	 * http://localhost:3030/openData/restaurant
	 */
	public void load() {
		System.out.println("WARNING! The current directory: "
				+ datasetDirectory + " will be erase! Continue? [y/N]");

		Scanner in = new Scanner(System.in);
		try {
			String answer = in.next().trim();
			if (answer.equals("y") || answer.equals("yes")
					|| answer.equals("Y") || answer.equals("Yes")
					|| answer.equals("YES")) {
				deleteFolder(new File(datasetDirectory));
				Dataset dataset = TDBFactory.createDataset(datasetDirectory);
				Set<Integer> cleData = listDTS.keySet();
				System.out.println("loading data ...");
				for (Integer cle : cleData) {
					DataSource courant = listDTS.get(cle);
					Model temporaryModel = FileManager.get().loadModel(
							"file:" + courant.getOutputTtl(), "N3");
					logger.info(UriBase + courant.getNom());
					dataset.addNamedModel(UriBase + courant.getNom(),
							temporaryModel);
				}
				System.out.println("Loading done!");
			} else {
				System.out.println("Loading Abortion..");
			}

		} catch (InputMismatchException e) {
			System.out
					.println("Wrong answer, considered as negative. Abortion.");
		}
	}

	/**
	 * This function reads recursively the content of File folder and delete
	 * everything; No warning here, make sure you really want to do this!
	 * 
	 * @param folder
	 */
	private void deleteFolder(File folder) {
		File[] files = folder.listFiles();
		if (files != null) { // some JVMs return null for empty dirs
			for (File f : files) {
				if (f.isDirectory()) {
					deleteFolder(f);
				} else {
					f.delete();
				}
			}
		}
		folder.delete();
	}

	/**
	 * This function runs the Fuseki server. It uses a ProcessBuilder.
	 * fusekiRunScript is launch with fusekiFolder and fusekiConfigFile as
	 * parameters.The fuseki output is logged in the openDataWrapper home
	 * directory. Error with the ProcessBuilder are handled here, the function
	 * just interrupt.
	 * 
	 * @param fusekiRunScript
	 *            path to the bash script that will launch Fuseki. You don't
	 *            need to modify this file
	 * @param fusekiFolder
	 *            path to the folder containing Fuseki-server. Useful for a new
	 *            version of Fuseki
	 * @param fusekiConfigFile
	 *            path to the configuration file for Fuseki. Useful if you want
	 *            to set up a specific server
	 */
	public void runFuseki(String fusekiRunScript, String fusekiFolder,
			String fusekiConfigFile) {
		if (pid == 0) {
			ProcessBuilder pb = new ProcessBuilder(fusekiRunScript,
					fusekiFolder, fusekiConfigFile);
			pb.directory(new File(System.getProperty("user.dir")));
			pb.redirectErrorStream(true);

			// Code pour recupération du PID
			pb.redirectOutput(new File("jena-fuseki-0.2.7/stdout.log"));

			try {

				Process p = pb.start();

				if (p.waitFor() != 0) {
					return;
				}
				Thread.sleep(2000);
				System.out.println("Fuseki Launched!");
				extractPID();
			} catch (IOException ex) {
				ex.printStackTrace(System.out);
				return;
			} catch (InterruptedException iex) {
				iex.printStackTrace(System.out);
				return;
			}
		} else {
			System.out
					.println("Fuseki is already running, please close Fuseki and launch it again if you want to reload the data");
		}
	}

	private void extractPID() {
		try {
			BufferedReader fp = new BufferedReader(new FileReader(new File("jena-fuseki-0.2.7/stdout.log")));
			String line="";
			while((line = fp.readLine()) != null){
				if(line.contains("&&-&&")){
					//atta good line!
					pid = (int) Integer.valueOf(line.trim().substring(6));
					logger.debug(pid);
				}
				else{
					System.out.println(line);
				}
			}
			fp.close();
		} catch (FileNotFoundException e) {
			System.err.println("the file doesn't exist or cannot be opened");
		} catch (IOException e) {
			System.err.println("Unable to get fuseki's PID, you'll have to close it manually!");
		}
		
	}

	public void closeFuseki() {
		if (pid != 0) {
			ShellExecutor excutor = new ShellExecutor("/bin/bash", "");
			try {
			  System.out.println(excutor.execute("kill "+pid));
			  System.out.println("Fuseki closed!");
			  pid = 0;
			} catch (IOException e) {
			  e.printStackTrace();
			}
		} else {
			System.out.println("Fuseki is already closed!");
		}	
	}

	/**
	 * This function query the TDB triple store, asking the 10 first triple from
	 * the union graph of all graph. For testing only.
	 */
	public void query() {
		Dataset dataset = TDBFactory.createDataset(datasetDirectory);
		dataset.begin(ReadWrite.READ);

		try {
			QueryExecution qExec = QueryExecutionFactory.create(
					"SELECT * {?s ?p ?o} LIMIT 10", dataset);
			//
			qExec.getContext().set(TDB.symUnionDefaultGraph, true);

			ResultSet rs = qExec.execSelect();
			try {
				ResultSetFormatter.out(rs);
			} finally {
				qExec.close();
			}
		} finally {
			dataset.end();
		}
	}

	/**
	 * This function lists all named graph stored into the TDB triple store. If
	 * the connection with the triple store have been closed, it crashes.
	 */
	private void listGraphs() {
		Dataset dataset = TDBFactory.createDataset(datasetDirectory);
		logger.warn("Dataset memory address= " + dataset);
		Iterator<String> listeUris = dataset.listNames();
		while (listeUris.hasNext()) {
			String courant = listeUris.next();
			System.out.println(courant);
		}

	}
}
