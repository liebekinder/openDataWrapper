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
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="COMMUNE_LIBELLE"/>
	<xsl:apply-templates select="DENOMINATION_LONGUE"/>
	<xsl:apply-templates select="DENOMINATION"/>
	<xsl:apply-templates select="PUBLIC_PRIVE"/>
	<xsl:apply-templates select="ANNEE"/>
	<xsl:apply-templates select="MINISTERE_CODE"/>
	<xsl:apply-templates select="ADRESSE_4"/>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="MINISTERE_LIBELLE"/>
	<xsl:apply-templates select="CATEGORIE_RECTORAT_CODE_LIBELLE"/>
	<xsl:apply-templates select="ADRESSE_1"/>
	<xsl:apply-templates select="CATEGORIE_RECTORAT_CODE"/>
	<xsl:apply-templates select="ADRESSE_2"/>
	<xsl:apply-templates select="ADRESSE_3"/>
	<xsl:apply-templates select="MONTANT_VOTE"/>
	<xsl:apply-templates select="RNE"/>
	<xsl:apply-templates select="VILLE"/>
	<xsl:apply-templates select="BP"/>

</xsl:template>

<xsl:template match="COMMUNE_LIBELLE"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DENOMINATION_LONGUE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DENOMINATION"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PUBLIC_PRIVE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:kindOfSchool&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:kindOfSchool&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ANNEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:schoolYear&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:schoolYear&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MINISTERE_CODE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:ministryCode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:ministryCode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "NaN"^^xsd:integer ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MINISTERE_LIBELLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:ministryLabel&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:ministryLabel&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CATEGORIE_RECTORAT_CODE_LIBELLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:codeRectoratLabel&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:codeRectoratLabel&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CATEGORIE_RECTORAT_CODE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:codeRectorat&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:codeRectorat&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MONTANT_VOTE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:givenMoney&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:givenMoney&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="RNE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:rne&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:rne&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VILLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="BP">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:postOfficeBoxNumber&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;sc:postOfficeBoxNumber&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>