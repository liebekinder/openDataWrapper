package opendatawrapper;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

public class ConvertTtl {

	public String source;
	public String target;

	public ConvertTtl(String source, String target) {
		super();
		this.source = source;
		this.target = target;
	}

	/*
	 * This function takes a ttl file, import it into Jena and produce a RDF/XML
	 * All parameters are given by the dataSources.xml
	 */
	@SuppressWarnings("deprecation")
	public void convert() {
		Model model = FileManager.get().loadModel(source);
		try {
			OutputStream out = new FileOutputStream(target);
			model.write(out, "RDF/XML");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
