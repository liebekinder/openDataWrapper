package opendatawrapper;

public class DataSource {

	public String nom;
	public boolean api;
	public String apiUrl;
	public boolean file;
	public String filePath;
	public String mappingFile;
	public String xsltFile;
	public String format;
	public String outputTtl;
	public String outputRdf;
	
	public DataSource(String nom, boolean api, String apiUrl, boolean file,
			String filePath, String mappingFile, String xsltFile,String format,String outputTtl,String outputRdf) {
		super();
		this.nom = nom;
		this.api = api;
		this.apiUrl = apiUrl;
		this.file = file;
		this.filePath = filePath;
		this.mappingFile = mappingFile;
		this.xsltFile = xsltFile;
		this.format = format;
		this.outputTtl = outputTtl;
		this.outputRdf = outputRdf;
	}

	public String getNom() {
		return nom;
	}

	public boolean isApi() {
		return api;
	}

	public String getApiUrl() {
		return apiUrl;
	}

	public boolean isFile() {
		return file;
	}

	public String getFilePath() {
		return filePath;
	}

	public String getMappingFile() {
		return mappingFile;
	}

	public String getXsltFile() {
		return xsltFile;
	}
	
	public String getFormat() {
		return format;
	}
	
	public String getOutputTtl() {
		return outputTtl;
	}
	
	public String getOutputRdf() {
		return outputRdf;
	}
}
