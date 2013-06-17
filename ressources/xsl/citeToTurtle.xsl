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
@prefix TEMPORAIRE: &lt;http://temporaire.org/&gt; .
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

</xsl:text>
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="COMMUNE_LIBELLE"/>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="LABELLISEE"/>
	<xsl:apply-templates select="LABELLISABLE"/>
	<xsl:apply-templates select="COMMENTAIRE"/>
	<xsl:apply-templates select="LONGITUDE"/>
	<xsl:apply-templates select="LATITUDE"/>

</xsl:template>

<xsl:template match="COMMUNE_LIBELLE"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:insee&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:insee&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABELLISEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:labelisee&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:labelisee&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABELLISABLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:labelisable&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:labelisable&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMENTAIRE">
<xsl:choose><xsl:when test=". = 'null'">&#009;rdfs:comment&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;rdfs:comment&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LONGITUDE"><xsl:choose><xsl:when test=". = 'null'">&#009;geo:long&#009; "NaN"^^xsd:decimal ;
</xsl:when>
<xsl:otherwise>&#009;geo:long&#009; "<xsl:value-of select="."/>"^^xsd:decimal ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LATITUDE"><xsl:choose><xsl:when test=". = 'null'">&#009;geo:lat&#009; "NaN"^^xsd:decimal .

</xsl:when>
<xsl:otherwise>&#009;geo:lat&#009; "<xsl:value-of select="."/>"^^xsd:decimal .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>