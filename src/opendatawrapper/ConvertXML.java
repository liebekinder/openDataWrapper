package opendatawrapper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.Authenticator;
import java.net.MalformedURLException;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.DOMOutputter;

/*
 * Cette classe gère la conversion d'un XML à l'aide d'une feuille de style XSL (XSLT)
 */
public class ConvertXML {

	public String XMLFile_;
	public String XSLFile_;
	public String outputFile;

	final String proxyHost = "iproxy1.cg44.fr";
	final String proxyPort = "3128";
	final String authUser = "021806B";
	final String authPassword = "HSi1eBSW44";

	/*
	 * Constructeur
	 * 
	 * @param XMLin le fichier à convertir
	 * 
	 * @param XSL le fichier de convertion
	 * 
	 * @param XMLout le dossier qui contiendra le fichier converti
	 */
	public ConvertXML(String XSLin, String XMLout) {
		XSLFile_ = XSLin;
		outputFile = XMLout;
	}

	/*
	 * Convert the local XML file into Turtle
	 */
	public void convertfromFile(String XMLFile_) {
		TransformerFactory tFactory = TransformerFactory.newInstance();
		try {
			Transformer transformer = tFactory.newTransformer(new StreamSource(
					new File(XSLFile_)));
			transformer.transform(new StreamSource(new File(XMLFile_)),
					new StreamResult(new File(outputFile)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * convert an XML file from a remote call into turtle. It uses the global
	 * paramters XSLFile_ and outputFile of the class ConvertXML
	 * 
	 * @param url, the URL of the remote API *
	 */
	public void convertFromApi(String url) {
		Document document = getRemoteXML(url);
		if (document != null) {
			DOMOutputter domOutputter = new DOMOutputter();
			org.w3c.dom.Document w3cDoc;

			try {
				// on convertit le doc de jdom en doc de dom
				w3cDoc = domOutputter.output(document);

				// on prepare le transformer
				TransformerFactory tFactory = TransformerFactory.newInstance();
				Transformer transformer = tFactory
						.newTransformer(new StreamSource(new File(XSLFile_)));

				// on convertit la source et la sortie
				Source source = new DOMSource(w3cDoc);
				Result output = new StreamResult(outputFile);

				transformer.transform(source, output);

			} catch (JDOMException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.err
					.println("erreur lors de la récupération des données distantes.");
		}
	}

	/*
	 * This method contact the remote API, download and parse the XML received
	 * First, it needs to be configured to use proxy (if needed).
	 * 
	 * @param url, the url of the remote API.
	 */
	public Document getRemoteXML(String url) {
		InputStream stream = null;
		URL url_;

		try {
			System.setProperty("proxySet", "true");
			System.setProperty("http.proxyHost", proxyHost);
			System.setProperty("http.proxyPort", proxyPort);
			System.setProperty("http.auth.preference", "Basic");
			Authenticator.setDefault(new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {

					return new PasswordAuthentication(authUser, authPassword
							.toCharArray());
				}
			});

			System.out.println("connecting to " + url + "...");
			url_ = new URL(url);
			URLConnection connection = url_.openConnection();
			stream = connection.getInputStream();
			System.out.println("data received!");
			return new SAXBuilder().build(stream);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.err.println("l'URL demandée n'est pas correcte! " + url);
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.err
					.println("probleme de gestion du stream de donnée! Etes-vous connecté à internet? ("
							+ e.getMessage() + ")");
			System.err
					.println("Vérifiez que vous n'etes pas derriere un proxy. Dans le cas positif, ");
			return null;
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			System.err
					.println("erreur lors de l'intéprétation de l'XML reçu! ("
							+ e.getMessage() + ")");
			return null;
		}
	}

}
