package opendatawrapper;

public class DataSource {

	public String nom;
	public String apiUrl;
	public String url;
	public String titre;
	public String publisher;

	public String xsltFile;
	public boolean specificXSLT;
	public String outputTtl;
	public String outputRdf;

	public DataSource(String nom, String apiUrl,String url, String titre, String publisher, String xsltFile,
			boolean specificXSLT, String outputTtl, String outputRdf) {
		super();
		this.nom = nom;
		this.apiUrl = apiUrl;
		this.url = url;
		this.titre = titre;
		this.publisher = publisher;
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
	public String getUrl() {
		return url;
	}

	public String getTitre() {
		return titre;
	}

	public String getPublisher() {
		return publisher;
	}

}
