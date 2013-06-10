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
    
    <xsl:variable name="incr" select="0"></xsl:variable>
    
    <xsl:template match="data">
        <xsl:text> 
@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix proj: &lt;http://projet.com/5/&gt; . &#010; 
        </xsl:text> 
        <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="element">     
        <xsl:apply-templates select="COMMUNE_LIBELLE"/>
        <xsl:apply-templates select="COMMUNE_CODE_INSEE"/> 
        <xsl:apply-templates select="LONGITUDE"/>
        <xsl:apply-templates select="LATITUDE"/>
        <xsl:apply-templates select="NB_HABITANTS"/>
    </xsl:template>
    
    <xsl:template match="COMMUNE_LIBELLE"> <xsl:text>&#010;</xsl:text> 
        <xsl:value-of select="concat(concat('&lt;http://projet.com/5/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string; 
    </xsl:template>
    
    <xsl:template match="COMMUNE_CODE_INSEE">&#009;ex:codeInsee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
    </xsl:template>
    
    <xsl:template match="LONGITUDE">&#009;ex:longitude&#009; "<xsl:value-of select="."/>"^^xsd:decimal ;
    </xsl:template>
    
    <xsl:template match="LATITUDE">&#009;ex:latitude&#009;"<xsl:value-of select="."/>"^^xsd:decimal ;
    </xsl:template>
    
    <xsl:template match="NB_HABITANTS">&#009;ex:nbHabitants&#009;"<xsl:value-of select="."/>"^^xsd:decimal .
    </xsl:template>    
    
</xsl:stylesheet>