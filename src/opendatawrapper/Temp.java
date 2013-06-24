package opendatawrapper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class Temp {

	public Temp() {

	}
	
	public static void convert(){
		SAXBuilder sxb = new SAXBuilder();
		try {
			Document document = sxb.build(new File("ressources/dataSources.xml"));
			Element sources = document.getRootElement();
			List<Element> fils = sources.getChildren("source");
			Properties p = new Properties();
			p.load(new FileReader(System.getProperty("user.home")
					+ "/.openDataWrapper/import.odw"));
			for(Element e:fils){
				p.setProperty(e.getChild("nom").getValue(), e.getChild("apiurl").getValue().substring(0, e.getChild("apiurl").getValue().length()-11));
			}
			String chemin = System.getProperty("user.home")+"/.openDataWrapper/import.odw";
			System.out.println(chemin);
			p.store(new FileOutputStream(chemin, false),"");
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
