package opendatawrapper;
import grizzled.sys;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;


import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

import de.fuberlin.wiwiss.silk.Silk;


public class LoadLinks {

	/**
	 * Execute all the files using silk
	 */
	public void executeAllFiles(){
		 
		File file = new File("ressources/output/linksConfig");
	    File[] files = file.listFiles();
	        
	    if (files != null) {
	    	for (File fi : files) {
	        	if (fi.isFile() == true && fi.getName().endsWith(".xml")) {
	        		Silk.executeFile(fi, null, 4, true);
	        	}
	    	}
	    }
	}
	
	/**
	 * Execute the given file using silk
	 * @param fi
	 */
	public void executeOneFile(File fi){
		Silk.executeFile(fi, null, 4, true);
	}
	
	/**
	 * Load data informations from the mapping file and construct the silk's config file
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public void Load() throws FileNotFoundException, IOException{
		Properties p= new Properties();
		p.load(new FileReader("configuration/linkmapping.properties"));
		
		for(Object t: p.keySet()){
			
			//Kitems[0]=srce1, items[1]=comparedProp1,items[2]=src2,items[3]=comparedProp2,items[4]=tranfoType,items[5]=linkURI,items[6]=graph1,items[7]=graphe2
			String map= p.getProperty((String)t);
			if (!map.isEmpty()){
				
				String[] items=map.split(",");				
				XMLLinkConstructor constrArtCommunes= new XMLLinkConstructor(items[0],items[2],items[5],items[1],items[3],items[4]);
				constrArtCommunes.generateXMLConfig();
			}
		}
		
	}
	
	public void run(){
		try{			
			Load();
			System.out.println("\n");
			executeAllFiles();
			deleteAllDuplicate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	/**
	 *  Transformation of "source file" in the Turtle form
	 * @param source
	 * @param target
	 */
	public void convertInTurtle(String source, String target) {
		Model model = FileManager.get().loadModel(source);
		try {
			OutputStream out = new FileOutputStream(target);
			model.write(out, "TURTLE");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/**
	 * convert all the files in output/links/nt directory in Turtle
	 */
	public void convertAllInTurtle(){
		File file = new File("output/links");
	    File[] files = file.listFiles();
	    int i=1;    
	    
	    if (files != null) {
	    	for (File fi : files) {
	        	if (fi.isFile() == true && fi.getName().endsWith(".nt")) {

	        		convertInTurtle(fi.getPath(),fi.getParent()+"/ttl/"+fi.getName().split(".nt")[0]+".ttl");
	        		i=i+1;
	        		//System.out.println(fi.getParent()+"/ttl"+fi.getName().split(".nt")[0]+".ttl");
	        	}
	    	}
	    }
	}
	 

	/**
	 * Copy the link file in the dataset source
	 * @param SourceFile fichier source
	 * @param NewDestFile fichier destination
	 * @throws IOException
	 */
	public static void copy (String SourceFile, String NewDestFile) throws IOException{
		
		File nomFichier = new File(SourceFile);
		Scanner inputFile = new Scanner(nomFichier);
		BufferedWriter sortie;
		sortie = new BufferedWriter(new FileWriter(NewDestFile, true));

		while (inputFile.hasNext()){
			
			sortie.write(inputFile.nextLine()+"\n");
		}
		
		sortie.close(); 
		inputFile.close();
	} 
	
	
	/**
	 *  Delete the duplicates property dbpprop:town within the srcFile and add 
	 *  the corresponding town Uri if it exist
	 * @param srcFile The path to the source File
	 * @param linkFile The path to the link file
	 * @param output The output file
	 * @throws Exception
	 */
	public void deleteDuplicates(String srcFile, String linkFile, String output) throws Exception{ // a modifier

		BufferedReader reader = new BufferedReader(new FileReader(srcFile));
		BufferedReader linkReader = new BufferedReader(new FileReader(linkFile));
		HashMap<String,String> linkMap = new HashMap<String,String>();
		StringBuilder stringBuilder = new StringBuilder();
		String ls = System.getProperty("line.separator");
		String tempuri, temptown;
		int cpt = 1;
		String line = null;
		String[] items;
		String town;
		Boolean isTownFound=false;
		
		/** lecture du fichier de liens et le contenu est mis dans une map**/
		while((line = linkReader.readLine()) != null){
			
			if (line.length() > 1) {
				
				items=line.split("<");
				town=items[3].split("http://dbpedia.org/resource/")[1];	/*******/		
				linkMap.put("<"+items[1].trim(),"<"+items[3].substring(0,items[3].indexOf(" .")));
			}
		}		

		/** Construction du nouveau fichier en remplaçant ce qu'il faut**/
		while ((line = reader.readLine()) != null) {
			if (line.length() > 1) {
				if (line.trim().charAt(0)=='<') {
					
					stringBuilder.append(line);
					stringBuilder.append(ls);

					isTownFound=false;
					
					tempuri = line.split("\t")[0];
					if (linkMap.containsKey(tempuri)) {

						String ligne2="";
						String tmp2;
						cpt++;
						
						while ((ligne2 = reader.readLine()) != null && !(ligne2.isEmpty()) && (ligne2.trim().charAt(0)!='<')){

							if(ligne2.trim().startsWith("dbpprop:town")){
								tmp2=ligne2.split("\t")[2];
								line="\tdbpprop:town\t"+linkMap.get(tempuri)+" ;";
								stringBuilder.append(line);
								stringBuilder.append(ls);
								isTownFound=true;
								
							}else{
								stringBuilder.append(ligne2);
								stringBuilder.append(ls);
							}
						}	
						
						/** Si la propriete dbpprop:town n'existe pas, la rajouter**/
						if (isTownFound==false){
							if(linkMap.get(tempuri)!=null){
								line="\tdbpprop:town\t"+linkMap.get(tempuri)+".";
								stringBuilder.replace(stringBuilder.lastIndexOf("."),stringBuilder.lastIndexOf(".")+1," ;");
								stringBuilder.append(line);
								stringBuilder.append(ls);
							}else{
								line="\tdbpprop:town\t\"undefined\"^^xsd:string ;";
								stringBuilder.append(line);
								stringBuilder.append(ls);
							}
						}
						
						if (ligne2.isEmpty()){
							stringBuilder.append(ls);
						}
					}else{ /** Si aucun liens n'a pu etre trouvé **/
						
							String ligne3="";
							String tmp3;
							cpt++;
							
							while ((ligne3 = reader.readLine()) != null && !(ligne3.isEmpty()) && (ligne3.trim().charAt(0)!='<')){
	
								if(ligne3.trim().startsWith("dbpprop:town")){
									tmp3=ligne3.split("\t")[2];
									stringBuilder.append(ligne3);
									stringBuilder.append(ls);
									isTownFound=true;
									
								}else{
									stringBuilder.append(ligne3);
									stringBuilder.append(ls);
								}
							}						

							/** Si la propriete dbpprop:town n'existe pas, la rajouter**/
						   if (isTownFound==false){
									line="\tdbpprop:town\t\"undefined\"^^xsd:string .";
									stringBuilder.replace(stringBuilder.lastIndexOf("."),stringBuilder.lastIndexOf(".")+1," ;");
									stringBuilder.append(line);
									stringBuilder.append(ls);
							}
							
							if (ligne3.isEmpty()){
								stringBuilder.append(ls);
							}
								
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
		//System.out.println("Compteur "+cpt);
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			out.write(stringBuilder.toString());
			out.close();
		} catch (IOException e) {
			System.out.println("Exception ");
		} 
		
	}
	
	
	
	/**
	 * Add links in the source file and suppress all the duplicates dbpprop:town for all 
	 * the source files with links (cf linkmapping.properties)
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public void deleteAllDuplicate() throws FileNotFoundException, IOException{
		File file = new File("ressources/output/ttl");
	    File[] files = file.listFiles();
	    Properties prop= new Properties();
	    prop.load(new FileReader("configuration/linkmapping.properties"));
	    String name="",name1="",filename;
	        
	    if (files != null) {
	    	for (File fi : files) {
	        	if (fi.isFile() == true && fi.getName().endsWith(".n3") && fi!=null ) {

	        		try {
	        				if((filename=fi.getName().substring(0, fi.getName().indexOf(".n3")))!=null) {
			        			if(prop.getProperty("map"+filename)!=null){
					        		name=prop.getProperty("map"+filename).split(",")[2];
					        		name1=prop.getProperty("map"+filename).split(",")[0];
					        		System.out.println(name1+" , "+name);
									deleteDuplicates(fi.getPath(), "ressources/output/links/nt/"+name1+"-"+name+".nt","ressources/output/links/resultFiles/"+name1+"-"+name+".ttl");
			        			}
	        				}
		        		//System.out.println("map"+fi.getName().substring(0, fi.getName().indexOf(".n3")));		        		
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        	}
	    	}
	    }
	}
}
