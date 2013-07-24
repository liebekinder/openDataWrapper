package opendatawrapper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.jdom2.JDOMException;

import com.hp.hpl.jena.query.Dataset;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QueryParseException;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.tdb.TDBFactory;
import com.hp.hpl.jena.util.FileManager;

public class OpenDataWrapper implements IOpenDataWrapper {

	static Logger logger = Logger.getLogger(Principale.class);

	private Map<Integer, DataSource> listeDataSource;
	private Properties properties;
	private LoadRessources lr;
	private Model masterModel;

	private final String UriBase = "http://localhost:3030/openData/";

	public OpenDataWrapper() {
		BasicConfigurator.configure();
		logger.info("loading...");
		try {
			lr = new LoadRessources();
		} catch (JDOMException e1) {
			logger.error("The configuration file dataSource.xml is corrupted. Please check that this file is a valid XML file!");
			return;
		} catch (IOException e1) {
			logger.error("Unable to open the configuration file dataSources.xml");
			return;
		}
		listeDataSource = lr.extractData();
	}

	@Override
	public void convert() {
		properties = getMapping(lr.mappingFile);
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

	/*
	 * conversion processing
	 * 
	 * @param DataSource dts, the DataSource ressource you want to convert
	 */
	private void conversionTtl(DataSource dts) {
		ConvertTTL cttl = new ConvertTTL(dts.getXsltFile(), dts.getOutputTtl(),
				lr.mappingFile, dts.getNom(), lr.getSpecificMappingFolder()
						+ "/" + dts.getNom() + ".properties", dts.getUrl(),
				dts.getTitre(), dts.getPublisher());
		cttl.convertFromApi(dts.getApiUrl(), properties, dts.isSpecificXSLT());
	}

	private static void conversionXmlRdf(DataSource dts) {
		ConvertXML cxml = new ConvertXML(dts.getOutputTtl(), dts.getOutputRdf());
		cxml.convert();
	}

	/**
	 * This function open the property file stored at path.
	 * 
	 * @param path
	 *            the path of the property file
	 * @return a Property document, empty if the path is wrong.
	 */
	public Properties getMapping(String path) {
		Properties p = new Properties();
		try {
			p.load(new FileReader(path));
			return p;
		} catch (FileNotFoundException e) {
			System.err.println("Mapping file does not exist! "
					+ e.getMessage());
		} catch (IOException e) {
			System.err
					.println("Error with mapping file. Check that you have the right permission! "
							+ e.getMessage());
		}
		return p;
	}

	@Override
	public void runQuery(String queryString) {
		try {
			loadAllDataset();
			Query jenaQuery = QueryFactory.create(queryString);
			QueryExecution qe = QueryExecutionFactory.create(jenaQuery,
					masterModel);
			ResultSet results = qe.execSelect();
			ResultSetFormatter.out(System.out, results);
		} catch (QueryParseException e) {
			logger.error("Query error: " + e.getLocalizedMessage());
		}

	}

	@Override
	public void export(String TDBPath) {
		deleteFolder(new File(TDBPath));
		Dataset dataset = TDBFactory.createDataset(TDBPath);
		Set<Integer> cleData = listeDataSource.keySet();
		System.out.println("loading data ...");
		for (Integer cle : cleData) {
			DataSource courant = listeDataSource.get(cle);
			Model temporaryModel = FileManager.get().loadModel(
					"file:" + courant.getOutputTtl(), "N3");
			logger.info(UriBase + courant.getNom());
			dataset.addNamedModel(UriBase + courant.getNom(), temporaryModel);
		}
		System.out.println("Loading done!");

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

	private void loadDataset(DataSource dts) {
		String n3path = dts.getOutputTtl();
		if (masterModel == null) {
			masterModel = FileManager.get().loadModel("file:" + n3path, "N3");
		} else {
			try {
				FileManager.get()
						.readModel(masterModel, "file:" + n3path, "N3");
			} catch (Exception e) {
				logger.error("The n3 file doesn't exist " + n3path + "  "
						+ e.getMessage());
			}
		}
	}

	/**
	 * This function load all dataset stored in the data sources list. Uses the
	 * loadDataset function
	 */
	private void loadAllDataset() {
		Set<Integer> listeData = listeDataSource.keySet();
		Iterator<Integer> it = listeData.iterator();
		int courant;
		DataSource dts = null;
		logger.info("loading dataset...");
		while (it.hasNext()) {
			courant = it.next();
			dts = listeDataSource.get(courant);
			loadDataset(dts);
		}
	}

}
