package opendatawrapper;


public class ConvertCSV {

	public String fileOutout;
	public String fileXSLT;

	public ConvertCSV(String pathXslt, String output) {
		fileOutout = output;
		fileXSLT = pathXslt;
	}

	public void convertfromFile(String XMLFile_){

		// TransformerFactory transformerFactory = new TransformerFactoryImpl();
		// StreamSource xsltSource = new StreamSource(new File(fileXSLT));
		// Transformer transformer =
		// transformerFactory.newTransformer(xsltSource);
		// ((net.sf.saxon.Controller)transformer).setInitialTemplate("/");
		// StringWriter stringWriter = new StringWriter();
		// transformer.transform(null, new StreamResult(stringWriter));
		// String transformedDocument = stringWriter.toString().trim();

//		Processor proc = new Processor(false);
//		XsltCompiler comp = proc.newXsltCompiler();
//		
//		BufferedReader reader = new BufferedReader(new FileReader(fileXSLT));
//		String line = new String();
//		String qString = new String();
//		while ((line = reader.readLine()) != null) {
//			qString += line;
//		}
//		
//		String stylesheet = qString;
//		XsltExecutable exp = comp.compile(new StreamSource(new StringReader(
//				stylesheet)));
//
//		Serializer out = new Serializer();
//		out.setOutputProperty(Serializer.Property.METHOD, "text");
//		XsltTransformer t = exp.load();
//		t.setInitialTemplate(new QName("document"));
//		
//		StringWriter sw = new StringWriter();
//        out.setOutputWriter(sw);
//        t.setDestination(out);
//        t.transform();

	}
}
