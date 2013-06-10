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
@prefix proj: &lt;http://projet.com/4/&gt; . &#010; 
        </xsl:text> 
        <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="element">     
        <xsl:apply-templates select="MANIFESTATION"/>
        <xsl:apply-templates select="COMMUNE_CODE_INSEE"/> 
        <xsl:apply-templates select="COMMUNE"/> 
        <xsl:apply-templates select="DEPARTEMENT"/> 
        <xsl:apply-templates select="DISCIPLINE"/>
        <xsl:apply-templates select="TYPE"/>
        <xsl:apply-templates select="DATE_DEBUT"/>
        <xsl:apply-templates select="DATE_FIN"/>
    </xsl:template>
    
    <xsl:template match="MANIFESTATION"> <xsl:text>&#010;</xsl:text> 
        <xsl:value-of select="concat(concat('&lt;http://projet.com/4/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string; 
    </xsl:template>
    
    <xsl:template match="COMMUNE_CODE_INSEE">&#009;ex:codeInsee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
    </xsl:template>
    
    <xsl:template match="COMMUNE">&#009;ex:commune&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="DEPARTEMENT">&#009;ex:departement&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="DISCIPLINE">&#009;ex:discipline&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="TYPE">&#009;ex:type&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="DATE_DEBUT">&#009;ex:debut&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>    
    
    <xsl:template match="DATE_FIN"> &#009;ex:fin&#009; "<xsl:value-of select="translate(.,' ','')"/>"^^xsd:string .
    </xsl:template>
    

</xsl:stylesheet>
