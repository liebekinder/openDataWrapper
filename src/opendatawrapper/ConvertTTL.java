package opendatawrapper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.Authenticator;
import java.net.MalformedURLException;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
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
 * Les parametres de proxy sont à spécifier dans un fichier proxy.pwd à la racine de votre $HOME
 */
public class ConvertTTL {

	public String XMLFile_;
	public String XSLFile_;
	public String outputFile;
	public String mappingPath;
	public String datasetName;
	public String speMappingPath;

	String proxyHost;
	String proxyPort;
	String authUser;
	String authPassword;
	final String PWD_File = System.getProperty("user.home")
			+ "/.openDataWrapper/proxy.pwd";

	/*
	 * Constructeur
	 * 
	 * @param XMLin le fichier à convertir
	 * 
	 * @param XSL le fichier de convertion
	 * 
	 * @param XMLout le dossier qui contiendra le fichier converti
	 */
	public ConvertTTL(String XSLin, String XMLout, String mappingPath,
			String dataset, String speMap) {
		XSLFile_ = XSLin;
		outputFile = XMLout;
		this.mappingPath = mappingPath;
		datasetName = dataset;
		speMappingPath = speMap;

		try {
			Properties prop = new Properties();
			prop.load(new FileReader(PWD_File));
			proxyHost = prop.getProperty("proxyHost");
			proxyPort = prop.getProperty("proxyPort");
			authUser = prop.getProperty("authUser");
			authPassword = prop.getProperty("authPassword");
		} catch (Exception e) {
		}

	}

	/*
	 * convert an XML file from a remote call into turtle. It uses the global
	 * paramters XSLFile_ and outputFile of the class ConvertXML
	 * 
	 * @param url, the URL of the remote API *
	 */
	public void convertFromApi(String url, Properties p, boolean construct) {
		Document document = getRemoteXML(url);
		if (document != null) {
			boolean constructOk = true;
			if (!construct) {
				constructOk = constructXSL(p, document);
			}
			if (constructOk) {

				DOMOutputter domOutputter = new DOMOutputter();
				org.w3c.dom.Document w3cDoc;

				try {
					// on convertit le doc de jdom en doc de dom
					w3cDoc = domOutputter.output(document);

					// on prepare le transformer
					TransformerFactory tFactory = TransformerFactory
							.newInstance();
					Transformer transformer = tFactory
							.newTransformer(new StreamSource(new File(XSLFile_)));

					// on convertit la source et la sortie
					Source source = new DOMSource(w3cDoc);
					Result output = new StreamResult(outputFile);

					transformer.transform(source, output);

					verifyFile();

				} catch (JDOMException e1) {
					System.err
							.println("Unable to parse the incoming XML file. It could be a network issue, or the file isn't an XML file. "
									+ e1.getMessage());
					return;
				} catch (TransformerException e) {
					System.err
							.println("Erreur lors de la transformation du XML"
									+ e.getMessageAndLocation());
					return;
				} catch (FileNotFoundException e) {
					System.err.println("The turtle file wasn't found. "
							+ e.getMessage());
				} catch (IOException e) {
					System.err.println("The turtle file cannot be opened. "
							+ e.getMessage());
				}
			} else {
				return;
			}
		} else {
			System.err
					.println("erreur lors de la récupération des données distantes. Le fichier est nul");
			return;
		}

	}

	/**
	 * This method is supposed to check if the URI within this graph are unique.
	 * If not, it change the URI to add a number, and make it unique.
	 * 
	 * @throws IOException
	 */
	private void verifyFile() throws IOException {
		List<String> listeURI = new ArrayList<String>();
		BufferedReader reader = new BufferedReader(new FileReader(outputFile));
		String line = null;
		StringBuilder stringBuilder = new StringBuilder();
		String ls = System.getProperty("line.separator");
		String temp;
		int cpt = 1;
		while ((line = reader.readLine()) != null) {
			if (line.length() > 1) {
				if (line.trim().charAt(0) == '<') {
					// nous sommes dans la déclaration d'un URI
					temp = line.split("\t")[0];
					if (!listeURI.contains(temp)) {
						// si l'URI n'existe pas encore
						listeURI.add(temp);
						stringBuilder.append(line);
						stringBuilder.append(ls);
					} else {
						// probleme d'unicité
						String lineTemp = line.split("\t")[0];
						// System.out.println(lineTemp);
						lineTemp = lineTemp.trim()
								.substring(0, lineTemp.length() - 1)
								.concat(cpt + ">");
						line = lineTemp.concat(line.split("\t")[1]).concat(
								line.split("\t")[2]);
						// System.out.println(line);
						cpt++;
						stringBuilder.append(line);
						stringBuilder.append(ls);
					}
				} else {
					stringBuilder.append(line);
					stringBuilder.append(ls);
				}
			} else {
				stringBuilder.append(ls);
			}
		}
		reader.close();
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(outputFile));
			out.write(stringBuilder.toString());
			out.close();
		} catch (IOException e) {
			System.out.println("Exception ");
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
			if (proxyHost != null) {
				// on ne charge le proxy que si besoin est => si un proxyhost a
				// été défini
				System.setProperty("proxySet", "true");
				System.setProperty("http.proxyHost", proxyHost);
				System.setProperty("http.proxyPort", proxyPort);
				if (authUser != null) {
					// le proxy est détecté comme sécurisé par identification si
					// le authuser est défini
					System.setProperty("http.auth.preference", "Basic");
					Authenticator.setDefault(new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {

							return new PasswordAuthentication(authUser,
									authPassword.toCharArray());
						}
					});
				}
			}
			System.out.println("connecting to " + url + "...");
			url_ = new URL(url);
			URLConnection connection = url_.openConnection();
			stream = connection.getInputStream();
			System.out.println("data received!");
			return new SAXBuilder().build(stream);
		} catch (MalformedURLException e) {
			System.err.println("l'URL demandée n'est pas correcte! "
					+ e.getMessage());
			return null;
		} catch (IOException e) {
			System.err
					.println("probleme de gestion du stream de donnée! Etes-vous connecté à internet? ("
							+ e.getMessage() + ")");
			System.err
					.println("Vérifiez que vous n'etes pas derriere un proxy. Dans le cas positif, vérifez vos paramètres proxy! ");
			return null;
		} catch (JDOMException e) {
			System.err
					.println("erreur lors de l'intéprétation de l'XML reçu! ("
							+ e.getMessage() + ")");
			return null;
		}
	}

	/**
	 * This function create an XSL file from an XML sheet and a mapping file
	 * 
	 * @param p
	 *            , the mapping between XML tag and the RDF vocabulary
	 * @param document
	 *            ,the parsed XML
	 * @return true if the construction got well, false else
	 */
	public boolean constructXSL(Properties p, Document document) {
		XSLConstructor xslc = new XSLConstructor(XSLFile_, document, p,
				datasetName, speMappingPath);
		return xslc.construct(mappingPath);

	}
}
