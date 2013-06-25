package opendatawrapper;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

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
 * This class manage the sparql Enpoint.
 * 
 * @author seb
 * 
 */
public class SparqlManagement {

	public String datasetDirectory;

	public SparqlManagement(String dataset) {
		super();
		this.datasetDirectory = dataset;
	}

	public void load(Map<Integer, DataSource> listeDataSource) {
		deleteFolder(new File(datasetDirectory));
		Dataset dataset = TDBFactory.createDataset(datasetDirectory);
		Set<Integer> cleData = listeDataSource.keySet();
		System.out.print("loading data ...");
		for (Integer cle : cleData) {
			DataSource courant = listeDataSource.get(cle);
			Model temporaryModel = FileManager.get().loadModel(
					"file:" + courant.getOutputTtl(), "N3");
			dataset.addNamedModel(courant.getNom(), temporaryModel);
		}
		dataset.close();
		System.out.println("done!");
	}

	public void deleteFolder(File folder) {
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

	public void runFuseki() {

	}

	public void query() {

		Dataset dataset = TDBFactory.createDataset(datasetDirectory);
		Iterator<String> listnom = dataset.listNames();
		while (listnom.hasNext()) {
			System.out.println(listnom.next());
		}
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
}
