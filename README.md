openDataWrapper
===============

Generic wrapper converting data sources from data.paysdelaloire.fr into RDF (N3). It uses API call. Data sources are XML files.

Quick Start
-----------

1) Requirement

	You will need JAVA 7 and a Unix Operating System
	The Java environment variable user.home must be set (should be /home/*computersname* in most cases)
	You have to create a directory in your home folder, named .openDataWrapper
	If you are behind proxy, read the documentation

2) Start

	Run Principal.java as a java application
	Follow the instruction
	
3) Data
	
	You can add data from data.paysdelaloire.fr API. 
	Write into the import.odw file the name of your new data, =, and the APi URL:
		mydata = http://data.paysdelaloire.fr/url/de/l/api
	Select add new sources in the main menu.
	
4) Convert data

	Select the convert data menu and check the result. The converted files should be in output/ folder.
	
5) Exporting your data

	Select the Sparql management menu and select the import option. Your dataset will be stored in .openDataWrapper folder.
	Run fuseki from the menu if you want to expose your data