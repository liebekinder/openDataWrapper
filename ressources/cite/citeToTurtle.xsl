<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://www.example.org/" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    > 
    <xsl:output method='text' encoding='UTF-8'/>
    <xsl:variable name="Increment" select="0" ></xsl:variable>
    
    <xsl:template match="document">
        <xsl:apply-templates select="data"/>
    </xsl:template>
    
    <xsl:template match="data">
        <xsl:text> 
@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix proj: &lt;http://projet.com/2/&gt; .
        </xsl:text> 
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="element"> 
&lt;http://projet.com/2/<xsl:value-of select="concat(translate(translate(translate(./COMMUNE_LIBELLE/text(),'  ',' '),' ','_'),'.','_'),'&gt;')"/>&#009;ex:codeInsee &#009; "<xsl:value-of select="./COMMUNE_CODE_INSEE/text()"/>"^^xsd:integer;
        <xsl:apply-templates select="COMMUNE_LIBELLE"/>
        <xsl:apply-templates select="LATITUDE"/>
        <xsl:apply-templates select="LONGITUDE"/>
        <xsl:apply-templates select="LABELLISEE"/>
        <xsl:apply-templates select="LABELLISABLE"/>
        <xsl:apply-templates select="COMMENTAIRE"/>
    </xsl:template>   
    
    <xsl:template match="COMMUNE_LIBELLE">&#009;ex:nomCommune&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="LATITUDE">&#009;&#009;ex:latitude&#009;"<xsl:value-of select="."/>"^^xsd:decimal ;
    </xsl:template>
    
    <xsl:template match="LONGITUDE">&#009;&#009;ex:longitude&#009;"<xsl:value-of select="."/>"^^xsd:decimal ;
    </xsl:template>   
    
    <xsl:template match="LABELLISEE">&#009;&#009;ex:labellisee&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>    
    
    <xsl:template match="LABELLISABLE">&#009;&#009;ex:labellisable&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>    
    
    <xsl:template match="COMMENTAIRE"> &#009;&#009;ex:commentaire&#009; "<xsl:value-of select="."/>"^^xsd:string .
    </xsl:template>
    
</xsl:stylesheet>
