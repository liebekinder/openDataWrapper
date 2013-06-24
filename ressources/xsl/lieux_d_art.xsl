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
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://data.paysdelaloire.fr/&gt; .
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
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="NOM"/>
	<xsl:apply-templates select="SOUTIEN"/>
	<xsl:apply-templates select="DESCRIPTION"/>
	<xsl:apply-templates select="HORAIRES"/>
	<xsl:apply-templates select="ACCES"/>
	<xsl:apply-templates select="MAIL"/>
	<xsl:apply-templates select="TARIFS"/>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="TEL"/>
	<xsl:apply-templates select="VILLE"/>
	<xsl:apply-templates select="SITE_WEB"/>
	<xsl:apply-templates select="CP"/>
	<xsl:apply-templates select="ADRESSE2"/>
	<xsl:apply-templates select="ADRESSE1"/>

</xsl:template>

<xsl:template match="SOUTIEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:soutien&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:soutien&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="HORAIRES">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:openingHours&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:openingHours&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="NOM"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.com/lieux_d_art/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ACCES">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:transportAccess&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:transportAccess&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MAIL">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:email&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:email&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIFS">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "NaN"^^xsd:integer ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TEL">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:telephone&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:telephone&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VILLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SITE_WEB">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:website&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:website&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CP"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:postalCode&#009; "NaN"^^xsd:integer ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:postalCode&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE2">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>