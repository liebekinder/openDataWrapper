<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://www.example.org/" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    > 
    <xsl:output method='text' encoding='UTF-8'/>
    <xsl:template match="document">
        <xsl:apply-templates select="data"/>
    </xsl:template>
    
    <xsl:template match="data">
        <xsl:text> 
@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix proj: &lt;http://projet.com/8/&gt; . &#010; 
        </xsl:text> 
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="element"> 
        <xsl:apply-templates select="NOM"/> 
        <xsl:apply-templates select="DESCRIPTION"/>
        <xsl:apply-templates select="DATES"/>
        <xsl:apply-templates select="TEL"/>    
        <xsl:apply-templates select="VILLE"/>
        <xsl:apply-templates select="DEPARTEMENT"/>
        <xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
        <xsl:apply-templates select="SITE_WEB"/>
        <xsl:apply-templates select="ORGANISATEUR"/> 
    </xsl:template>
    
    <xsl:template match="NOM"> <xsl:text>&#010;</xsl:text> 
        <xsl:value-of select="concat(concat('&lt;http://projet.com/8/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string; 
    </xsl:template>
    
    <xsl:template match="DESCRIPTION">&#009;ex:description&#009; "<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="DATES">&#009;ex:dates&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="VILLE">&#009;ex:ville&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>   
    
    <xsl:template match="DEPARTEMENT">&#009;ex:departement&#009;"<xsl:value-of select="."/>"^^xsd:integer ;
    </xsl:template> 
    
    <xsl:template match="TEL"> &#009;ex:tel&#009; "<xsl:value-of select="translate(.,' ','')"/>"^^xsd:integer;
    </xsl:template>
    
    <xsl:template match="COMMUNE_CODE_INSEE"> &#009;ex:codeInsee&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="SITE_WEB"> &#009;ex:siteWeb&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="ORGANISATEUR"> &#009;ex:organisateur&#009; "<xsl:value-of select="."/>"^^xsd:string.
    </xsl:template>
    
</xsl:stylesheet>
