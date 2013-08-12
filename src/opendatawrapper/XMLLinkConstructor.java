package opendatawrapper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

//import org.jdom2.Document;
//import org.jdom2.Element;

public class XMLLinkConstructor {

	public String source1;
	/** First data set source name **/
	public String source2;
	/** Second data set source name **/
	public String property;
	/** Uri of the property that will be use to link them **/
	public String linkType;
	/** Uri of the property that will be use to link them **/
	public String source1Rule;
	/** The Uri of the first property that should be compared **/
	public String source2Rule;
	/** The Uri of the second property1 that should be compared **/
	public String graphe1;
	/** First graph Uri **/
	public String graphe2;
	/** Second graph Uri **/
	public String transformationType;

	/**
	 * The type of the comparison that should be done : numericTransformation or
	 * stringTransformation
	 **/

	public XMLLinkConstructor(String srce1, String srce2, String linkuri,
			String src1Rule, String src2Rule, String transformation) {

		source1 = srce1;
		source2 = srce2;
		linkType = linkuri;
		source1Rule = src1Rule;
		source2Rule = src2Rule;
		graphe1 = "http://localhost:3030/openData/" + source1;
		graphe2 = "http://localhost:3030/openData/" + source2;
		transformationType = transformation;
	}

	/**
	 * Generate silk's xml configuration file
	 * 
	 * @return true if the config file is generated
	 */
	public boolean generateXMLConfig() {

		try {
			// Create file
			System.out.print("Link configuration construction processing for "
					+ source1 + "-" + source2 + ".............");
			FileWriter fstream;

			File f = new File("ressources/output/linksConfig");
			if (!f.exists() || !f.isDirectory()) {
				// faire la création
				if (!f.mkdirs()) {
					System.err.println("Unable to create output folder! Stop");
					return false;
				}
			}

			fstream = new FileWriter("ressources/output/linksConfig/" + source1
					+ "-" + source2 + "linkConfig.xml");
			BufferedWriter out = new BufferedWriter(fstream);
			// ready to write
			out.write("<Silk>\n");
			String prefixes = new String(
					"  <Prefixes>\n"
							+ "  		<Prefix namespace=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" id=\"rdf\"></Prefix>\n"
							+ "  		<Prefix namespace=\"http://projet.com/2/\" id=\"proj\"></Prefix>\n"
							+ "  		<Prefix namespace=\"http://fr.dbpedia.org/resource/\" id=\"dbfr\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://dbpedia.org/ontology/\" id=\"dbpedia-owl\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://www.w3.org/2002/07/owl#\" id=\"owl\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://fr.dbpedia.org/property/\" id=\"prop-fr\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://example.org/\" id=\"ex\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://www.w3.org/2000/01/rdf-schema#\" id=\"rdfs\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://www.w3.org/2001/XMLSchema#\" id=\"xsd\"></Prefix>\n"

							+ "		<Prefix namespace=\"http://temporaire.org\" id=\"TEMPORAIRE\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://purl.org/goodrelations\" id=\"gr\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://lodpaddle.univ-nantes.fr\" id=\"pdll\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://http://xmlns.com/foaf/0.1\" id=\"foaf\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://http://www.w3.org/2002/07/owl#\" id=\"owl\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://dbpedia.org/property\" id=\"dbpprop\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://schema.org\" id=\"sc\"></Prefix>\n"
							+ "		<Prefix namespace=\"http://www.w3.org/2003/01/geo/wgs84_pos#\" id=\"geo\"></Prefix>\n"
							+ "	</Prefixes>\n\n");

			out.write(prefixes);
			out.write("<DataSources>\n");
			out.write(writeDatasource(source1, graphe1));
			out.write(writeDatasource(source2, graphe2));
			out.write("</DataSources>\n\n");
			out.write("<Interlinks>\n");
			if (transformationType.equals("numericTransformation")) {
				out.write(writeIntInterLink());
			} else {
				out.write(writeStringInterLink());
			}
			out.write("</Interlinks>\n");
			out.write("</Silk>");
			out.close();

			System.out.println("done!");
			return true;

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * Write the information about the concerned data set
	 * 
	 * @param source
	 * @param graph
	 * @return
	 */
	public String writeDatasource(String source, String graph) {
		if (source.equals("liste_villes_dbpedia")) {
			graph = graph + ".ttl";
		}
		String src = new String(
				"	<DataSource type=\"sparqlEndpoint\" id=\""
						+ source
						+ "\">\n"
						+ "		<Param name=\"pageSize\" value=\"1000\"></Param>\n"
						+ "		<Param name=\"pauseTime\" value=\"0\"></Param>\n"
						+ "		<Param name=\"retryCount\" value=\"3\"></Param>\n"
						+ "		<Param name=\"endpointURI\" value=\"http://localhost:3030/openData/query\"></Param>\n"
						+ "		<Param name=\"retryPause\" value=\"1000\"></Param>\n"
						+ "		<Param name=\"graph\" value=\""
						+ graph
						+ "\"></Param> \n"
						+ "		<Param name=\"login\" value=\"\"></Param>\n"
						+ "		<Param name=\"entityList\" value=\"\"></Param>\n"
						+ "		<Param name=\"password\" value=\"\"></Param>\n"
						+ "		<Param name=\"additionalParameters\" value=\"\"></Param>\n"
						+ "	</DataSource>\n");

		return src;
	}

	/**
	 * Return the interlink rule for the numericTransformation
	 * 
	 * @return
	 */
	public String writeIntInterLink() {

		String link = new String(
				"	<Interlink id=\"lier"
						+ source1
						+ "_"
						+ source2
						+ "\">\n"
						+ "		<LinkType>&lt;"
						+ linkType
						+ "&gt;</LinkType>\n"
						+ "		<SourceDataset dataSource=\""
						+ source1
						+ "\" var=\"a\">\n"
						+ "			<RestrictTo> </RestrictTo>\n"
						+ "		</SourceDataset>\n"
						+ "		<TargetDataset dataSource=\""
						+ source2
						+ "\" var=\"b\">\n"
						+ "			<RestrictTo> </RestrictTo>\n"
						+ "		</TargetDataset>\n\n"
						+ "	  	<LinkageRule>\n"
						+ "		  <Aggregate weight=\"1\" type=\"max\" required=\"false\" id=\"unnamed_4\">\n"
						+ "		  	<Compare weight=\"1\" threshold=\"0.0\" required=\"false\" metric=\"num\" id=\"unnamed_3\">\n"
						+ "				<Input path=\"?a/&lt;"
						+ source1Rule
						+ "&gt;\" id=\"unnamed_1\"></Input>\n"
						+ "				<Input path=\"?b/&lt;"
						+ source2Rule
						+ "&gt;\" id=\"unnamed_2\"></Input>\n"
						+ "		    	<Param name=\"minValue\" value=\"-Infinity\"></Param>\n"
						+ "				<Param name=\"maxValue\" value=\"Infinity\"></Param>\n"
						+ "		  	</Compare>\n"
						+ "		  </Aggregate>\n"
						+ "	   </LinkageRule>\n\n"
						+ "      <Filter></Filter>\n\n"
						+ "	    <Outputs>\n"
						+ "			<Output type=\"file\" name=\""
						+ source1
						+ "-"
						+ source2
						+ "\">\n"
						+ "				<Param name=\"file\" value=\""
						+ System.getProperty("user.dir")
						+ "/ressources/output/links/nt/"
						+ source1
						+ "-"
						+ source2
						+ ".nt\"></Param>\n"
						+ "				<Param name=\"format\" value=\"ntriples\"></Param>\n"
						+ "			</Output>\n" + "	    </Outputs>\n"
						+ "	  </Interlink>\n");

		return link;
	}

	/**
	 * Return the interlink rule for the stringTransformation
	 * 
	 * @return
	 */
	public String writeStringInterLink() {

		String link = new String(
				"	<Interlink id=\"lier"
						+ source1
						+ "_"
						+ source2
						+ "\">\n"
						+ "		<LinkType>&lt;"
						+ linkType
						+ "&gt;</LinkType>\n"
						+ "		<SourceDataset dataSource=\""
						+ source1
						+ "\" var=\"a\">\n"
						+ "			<RestrictTo> </RestrictTo>\n"
						+ "		</SourceDataset>\n"
						+ "		<TargetDataset dataSource=\""
						+ source2
						+ "\" var=\"b\">\n"
						+ "			<RestrictTo> </RestrictTo>\n"
						+ "		</TargetDataset>\n\n"
						+ "	  	<LinkageRule>\n"
						+ "		  <Aggregate weight=\"1\" type=\"max\" required=\"false\" id=\"unnamed_10\">\n"
						+ " 		  	<Compare weight=\"1\" threshold=\"0.0\" required=\"false\" metric=\"levenshteinDistance\" id=\"unnamed_9\">\n"
						+ "				<TransformInput function=\"replace\" id=\"unnamed_11\">"
						+ "   				<TransformInput function=\"removeSpecialChars\" id=\"unnamed_7\">\n"
						+ "     					<TransformInput function=\"removeBlanks\" id=\"unnamed_5\">\n"
						+ "      					<TransformInput function=\"lowerCase\" id=\"unnamed_3\">\n"
						+ "         						<Input path=\"?a/&lt;"
						+ source1Rule
						+ "&gt;\" id=\"unnamed_1\"></Input>\n"
						+ "       					</TransformInput>\n"
						+ "     					</TransformInput>\n"
						+ "   				</TransformInput>\n"
						+ "			    	<Param name=\"search\" value=\"st\"></Param>"
						+ "					<Param name=\"replace\" value=\"saint\"></Param>"
						+ "				</TransformInput>"
						+ "				<TransformInput function=\"replace\" id=\"unnamed_12\">"
						+ "   				<TransformInput function=\"removeSpecialChars\" id=\"unnamed_8\">\n"
						+ "     					<TransformInput function=\"removeBlanks\" id=\"unnamed_6\">\n"
						+ "       					<TransformInput function=\"lowerCase\" id=\"unnamed_4\">\n"
						+ "         						<Input path=\"?b/&lt;"
						+ source2Rule
						+ "&gt;\" id=\"unnamed_2\"></Input>\n"
						+ "       					</TransformInput>\n"
						+ "     					</TransformInput>\n"
						+ "   				</TransformInput>\n"
						+ "				    <Param name=\"search\" value=\"st\"></Param>"
						+ "					<Param name=\"replace\" value=\"saint\"></Param>"
						+ "				</TransformInput>"
						+ "   			<Param name=\"minChar\" value=\"0\"></Param>\n"
						+ "   			<Param name=\"maxChar\" value=\"z\"></Param>\n"
						+ "			</Compare> \n"
						+ "		  </Aggregate> \n"
						+ "	   </LinkageRule>\n\n"
						+ "      <Filter></Filter>\n\n"
						+ "	    <Outputs>\n"
						+ "			<Output type=\"file\" name=\""
						+ source1
						+ "-"
						+ source2
						+ "\">\n"
						+ "				<Param name=\"file\" value=\""
						+ System.getProperty("user.dir")
						+ "/ressources/output/links/nt/"
						+ source1
						+ "-"
						+ source2
						+ ".nt\"></Param>\n"
						+ "				<Param name=\"format\" value=\"ntriples\"></Param>\n"
						+ "			</Output>\n" + "	    </Outputs>\n"
						+ "	  </Interlink>\n");

		return link;
	}

}
