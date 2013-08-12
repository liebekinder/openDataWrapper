<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ex="http://www.example.org/" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	> 
<xsl:output method='text' encoding='UTF-8'/>

<xsl:template match="document">
	<xsl:apply-templates select="data"/>
</xsl:template>

<xsl:variable name="incr" select="0"></xsl:variable>

<xsl:template match="data">
	<xsl:text>
@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
@prefix : &lt;#&gt; .
@prefix void: &lt;http://rdfs.org/ns/void#&gt; .
@prefix TEMPORAIRE: &lt;http://temporaire.org/&gt; .
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://lodpaddle.univ-nantes.fr/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/resource/&gt; .
@prefix prop-fr: &lt;http://fr.dbpedia.org/property/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix ex: &lt;http://example.org/&gt; .
@prefix owl: &lt;http://www.w3.org/2002/07/owl#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix dbpprop: &lt;http://dbpedia.org/property/&gt; .
@prefix dbpedia-owl: &lt;http://dbpedia.org/ontology/&gt; .
@prefix sc: &lt;http://schema.org/&gt; .
@prefix geo: &lt;http://www.w3.org/2003/01/geo/wgs84_pos#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/Petites_cites_de_caractere&gt; rdf:type void:Dataset ;
	foaf:homepage &lt;http://data.nantes.fr/donnees/detail/petites-cites-de-caractere-en-pays-de-la-loire/?tx_icsoddatastore_pi1[page]=1&gt;;
	dcterms:title "Petites cités de caractère en Pays de la Loire"^^xsd:string ;
	dcterms:description "Petites cités de caractère en Pays de la Loire"^^xsd:string ;
	dcterms:created "2013-08-12"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Région des Pays de la Loire".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="COMMUNE_LIBELLE"/>
<xsl:text>&#009;rdf:type&#009; pdll:Petites_cites_de_caractere;
</xsl:text>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="LABELLISEE"/>
	<xsl:apply-templates select="LABELLISABLE"/>
	<xsl:apply-templates select="COMMENTAIRE"/>
	<xsl:apply-templates select="LONGITUDE"/>
	<xsl:apply-templates select="LATITUDE"/>

</xsl:template>

<xsl:template match="COMMUNE_LIBELLE"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/Petites_cites_de_caractere/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "-120404040"^^xsd:int ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:int ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABELLISEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasLabel&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasLabel&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABELLISABLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isLabellable&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isLabellable&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMENTAIRE">
<xsl:choose><xsl:when test=". = 'null'">&#009;rdfs:comment&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;rdfs:comment&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LONGITUDE"><xsl:choose><xsl:when test=". = 'null'">&#009;geo:long&#009; "-120404040.00"^^xsd:decimal ;
</xsl:when>
<xsl:otherwise>&#009;geo:long&#009; "<xsl:value-of select="."/>"^^xsd:decimal ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LATITUDE"><xsl:choose><xsl:when test=". = 'null'">&#009;geo:lat&#009; "-120404040.00"^^xsd:decimal .

</xsl:when>
<xsl:otherwise>&#009;geo:lat&#009; "<xsl:value-of select="."/>"^^xsd:decimal .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>