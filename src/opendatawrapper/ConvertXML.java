package opendatawrapper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.log4j.Logger;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

public class ConvertXML {

	static Logger logger = Logger.getLogger(ConvertXML.class);

	public String source;
	public String target;

	public ConvertXML(String source, String target) {
		super();
		this.source = source;
		this.target = target;
	}

	/*
	 * This function takes a ttl file, import it into Jena and produce a RDF/XML
	 * All parameters are given by the dataSources.xml
	 * Issues: if the rdf-xml folder doesn't exist, the function create it.
	 */
	public void convert() {
		try {
			Model model = FileManager.get().loadModel(source);
			OutputStream out = new FileOutputStream(target);
			model.write(out, "RDF/XML");
		} catch (FileNotFoundException e) {
			File f = new File(target).getParentFile();
			if (!f.exists() || !f.isDirectory()) {
				// faire la création
				if (!f.mkdirs()) {
					System.err.println("Unable to create output folder! Stop");
				} else {
					convert();
				}
			}
		}

	}

}
