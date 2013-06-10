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
    <xsl:text>@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix proj: &lt;http://projet.com/3/&gt; . &#010; 
        </xsl:text> 
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="element"> 
        <xsl:apply-templates select="NOM"/> 
        <xsl:apply-templates select="ADRESSE1"/>
        <xsl:apply-templates select="ADRESSE2"/>
        <xsl:apply-templates select="VILLE"/>
        <xsl:apply-templates select="CP"/>
        <xsl:apply-templates select="TEL"/>
        <xsl:apply-templates select="MAIL"/>
        <xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
        <xsl:apply-templates select="SITE_WEB"/> 
        <xsl:apply-templates select="HORAIRES"/> 
        <xsl:apply-templates select="TARIFS"/> 
        <xsl:apply-templates select="DESCRIPTION"/> 
        <xsl:apply-templates select="SOUTIEN"/> 
        <xsl:apply-templates select="ACCES"/> 
    </xsl:template>
    
    <!-- essayer d'enlever tous les caractères spéciaux dans l'uri et faire des vérifications supplémentaires avec les "null" pour éviter les warning-->
    
    <xsl:template match="NOM"> <xsl:text>&#010;</xsl:text> 
        <xsl:value-of select="concat(concat('&lt;http://projet.com/3/',translate(translate(translate(translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_'),'&lt;',''),'&gt;',''),'_','')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string; 
    </xsl:template>
    
    <xsl:template match="ADRESSE1">&#009;ex:adresse1&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="ADRESSE2">&#009;ex:adresse2&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="VILLE">&#009;ex:ville&#009;"<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="CP">&#009;ex:postalCode&#009;"<xsl:value-of select="."/>"^^xsd:integer ;
    </xsl:template>    
    
    <xsl:template match="TEL"> &#009;ex:tel&#009; "<xsl:value-of select="translate(.,' ','')"/>"^^xsd:integer;
    </xsl:template>
    
    <xsl:template match="MAIL"> &#009;ex:mail&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="COMMUNE_CODE_INSEE"> &#009;ex:codeInsee&#009; "<xsl:value-of select="."/>"^^xsd:integer;
    </xsl:template>
    
    <xsl:template match="SITE_WEB"> &#009;ex:siteWeb&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="HORAIRES"> &#009;ex:horaires&#009; "<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="TARIFS"> &#009;ex:tarifs&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    
    <xsl:template match="DESCRIPTION"> &#009;ex:description&#009; "<xsl:value-of select="."/>"^^xsd:string;
    </xsl:template>
    
    <xsl:template match="SOUTIEN"> &#009;ex:soutien&#009; "<xsl:value-of select="."/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="ACCES"> &#009;ex:acces&#009; "<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string.
    </xsl:template>
    
</xsl:stylesheet>
