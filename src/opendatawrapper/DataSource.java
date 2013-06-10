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
	
	public DataSource(String nom, boolean api, String apiUrl, boolean file,
			String filePath, String mappingFile, String xsltFile,String format) {
		super();
		this.nom = nom;
		this.api = api;
		this.apiUrl = apiUrl;
		this.file = file;
		this.filePath = filePath;
		this.mappingFile = mappingFile;
		this.xsltFile = xsltFile;
		this.format = format;
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
	
	
}
