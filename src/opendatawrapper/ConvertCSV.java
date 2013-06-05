package opendatawrapper;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ConvertCSV {

	public String fileCSV;
	public String fileMapping;
	public Map<String,String> mapping;
	
	public ConvertCSV(String pathCSV, String pathMapping){
		fileCSV = pathCSV;
		fileMapping = pathMapping;
		mapping = new HashMap<String,String>();
	}
	
	public boolean convert() throws Exception{
		//Load mapping properties file
		loadMapping();
		
		return false;
	}
	
	private void loadMapping() throws FileNotFoundException, IOException {
		Properties prop = new Properties();
		prop.load(new FileReader(fileMapping));
		for (Object key : prop.keySet()) {
			this.mapping.put(key.toString(), prop.getProperty(key.toString()));
		}		
	}
}
