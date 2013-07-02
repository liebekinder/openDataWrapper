package opendatawrapper;

/**
 * Interface to use opendatawrapper at its best The main action are: - convert
 * and link data - query over those data - export data
 * 
 * @author seb
 * 
 */
public interface IOpenDataWrapper {

	/**
	 * This method download and convert the data from dataSource.xml in TTL and
	 * RDF/XML. The data is stored accordingly to the information given in
	 * dataSource.xml.
	 */
	public void convert();

	/**
	 * This function allows you to execute a query over your newly converted
	 * data. If no data have been converted, the answer will be empty.
	 * 
	 * @param query
	 *            the query you want to run
	 */
	public void runQuery(String query);

	/**
	 * This method export the newly converted data into an RDF store. This store
	 * can be used by Fuseki
	 * 
	 * @param TDBPath
	 *            the path to the TDBStore. If this store already exist, the
	 *            whole folder will be erased! Please double check that the path
	 *            is right
	 */
	public void export(String TDBPath);
}
