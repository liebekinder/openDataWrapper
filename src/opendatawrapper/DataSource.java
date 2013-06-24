package opendatawrapper;

public class DataSource {

	public String nom;
	public String apiUrl;
	public String specificMapping;
	public String xsltFile;
	public boolean specificXSLT;
	public String outputTtl;
	public String outputRdf;

	public DataSource(String nom, String apiUrl, String specificMapping,
			String xsltFile, boolean specificXSLT, String outputTtl,
			String outputRdf) {
		super();
		this.nom = nom;
		this.apiUrl = apiUrl;
		this.specificMapping = specificMapping;
		this.xsltFile = xsltFile;
		this.specificXSLT = specificXSLT;
		this.outputTtl = outputTtl;
		this.outputRdf = outputRdf;
	}

	public String getNom() {
		return nom;
	}

	public String getApiUrl() {
		return apiUrl;
	}

	public String getSpecificMapping() {
		return specificMapping;
	}

	public String getXsltFile() {
		return xsltFile;
	}

	public boolean isSpecificXSLT() {
		return specificXSLT;
	}

	public String getOutputTtl() {
		return outputTtl;
	}

	public String getOutputRdf() {
		return outputRdf;
	}

}
