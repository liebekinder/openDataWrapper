package opendatawrapper;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class LoadRessources {

	public Document document;
	public String DocumentPath = "ressources/dataSources.xml";
	Map<Integer, DataSource> listeDataSource;

	public LoadRessources() {
		SAXBuilder sxb = new SAXBuilder();
		try {
			// On crée un nouveau document JDOM avec en argument le fichier XML
			// Le parsing est terminé ;)
			document = sxb.build(new File(DocumentPath));
		} catch (Exception e) {
			e.printStackTrace();
		}

		listeDataSource = new HashMap<Integer, DataSource>();
	}

	public void affiche() {
		try {
			// On utilise ici un affichage classique avec getPrettyFormat()
			XMLOutputter sortie = new XMLOutputter(Format.getPrettyFormat());
			sortie.output(document, System.out);
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
	}

	public Map<Integer, DataSource> extractData() {
		Element racine = document.getRootElement();

		// Dans un premier temps on liste tous les étudiants
		List<Element> listsources = racine.getChildren("source");
		Iterator<Element> it = listsources.iterator();
		// On parcours la liste grâce à un iterator
		int i = 1;
		while (it.hasNext()) {

			Element courant = (Element) it.next();

			String nom = courant.getChild("nom").getValue();
			boolean api = Boolean.parseBoolean(courant.getChild("api")
					.getValue());
			String apiUrl = courant.getChild("apiurl").getValue();
			boolean file = Boolean.parseBoolean(courant.getChild("file")
					.getValue());
			String filePath = courant.getChild("filepath").getValue();
			String mappingFile = courant.getChild("mappingFile").getValue();
			String xsltFile = courant.getChild("xsltFile").getValue();
			String format = courant.getChild("format").getValue();
			String output = courant.getChild("outputFile").getValue();

			// chaque source est ajouté à la hashMap
			listeDataSource.put(i, new DataSource(nom, api, apiUrl, file,
					filePath, mappingFile, xsltFile, format, output));
			i++;
		}

		return getListeDataSource();

	}

	public Map<Integer, DataSource> getListeDataSource() {
		return listeDataSource;
	}
}
