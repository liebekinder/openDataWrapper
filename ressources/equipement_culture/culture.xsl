<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://www.example.org/" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    > 
    <xsl:output method='text' encoding='UTF-8'/>
    <xsl:template match="document">
        <xsl:apply-templates select="data"/>
    </xsl:template>
    
    <xsl:variable name="incr" select="0"></xsl:variable>
    
    <xsl:template match="data">
        <xsl:text>
@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix proj: &lt;http://projet.com/10/&gt; . &#010;
        </xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    
<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
	<xsl:apply-templates select="_IDOBJ"/>
	<xsl:apply-templates select="THEME"/>
	<xsl:apply-templates select="LIBTHEME"/>
	<xsl:apply-templates select="CATEGORIE"/>
    <xsl:apply-templates select="LIBCATEGORIE"/>
    <xsl:apply-templates select="TYPE"/>
    <xsl:apply-templates select="LIBTYPE"/>
    <xsl:apply-templates select="STATUT"/>
    <xsl:apply-templates select="COMMUNE"/>
    <xsl:apply-templates select="ADRESSE"/>
    <xsl:apply-templates select="TELEPHONE"/>
    <xsl:apply-templates select="WEB"/>
    <xsl:apply-templates select="CODE_POSTAL"/>
    <xsl:apply-templates select="_l"/>
    
</xsl:template>

<xsl:template match="geo/name"> <xsl:text>&#010;</xsl:text>
    <xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string;
</xsl:template>

<xsl:template match="_IDOBJ">&#009;ex:id&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:template>

<xsl:template match="THEME">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:theme&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="LIBTHEME">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:libtheme&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="CATEGORIE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:category&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="LIBCATEGORIE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:libcategory &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TYPE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:type&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="LIBTYPE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:libtype &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="STATUT">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:status &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="COMMUNE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:ville &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="CODE_POSTAL">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:codePostal&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="ADRESSE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:adresse &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TELEPHONE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:telephone &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="WEB">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:website &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="_l">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:coordinate &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string.
</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>