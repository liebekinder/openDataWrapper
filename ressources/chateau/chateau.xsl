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
	<xsl:apply-templates select="ID"/>
	<xsl:apply-templates select="ADR_1"/>
	<xsl:apply-templates select="ADR_2"/>
	<xsl:apply-templates select="CP"/>
    <xsl:apply-templates select="VIL"/>
    <xsl:apply-templates select="CEDEX"/>
    <xsl:apply-templates select="TEL_1"/>
    <xsl:apply-templates select="TEL_2"/>
    <xsl:apply-templates select="FAX_1"/>
    <xsl:apply-templates select="MEL_1"/>
    <xsl:apply-templates select="WEB_1"/>
    <xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_CAPACITE"/>
    <xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_TARIF"/>
    <xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_OUVERTURES"/>
    <xsl:apply-templates select="TYPE_1"/>
    <xsl:apply-templates select="TYPE_2"/>
    <xsl:apply-templates select="LABEL_1"/>
    <xsl:apply-templates select="OHLALAQA"/>
    <xsl:apply-templates select="V-D"/>
    <xsl:apply-templates select="T-H_1"/>
    <xsl:apply-templates select="T-H_2"/>
    <xsl:apply-templates select="T-H_3"/>
    <xsl:apply-templates select="T-H_4"/>
    <xsl:apply-templates select="HANDIPLAGE"/>
    <xsl:apply-templates select="GEO"/>
    <xsl:apply-templates select="VISIT_IND_LIB"/>
    <xsl:apply-templates select="VISIT_IND_GUI"/>
    <xsl:apply-templates select="VISIT_GRO_LIB"/>
    <xsl:apply-templates select="VISIT_GRO_GUI"/>
    <xsl:apply-templates select="PRESTA_1"/>
    <xsl:apply-templates select="PRESTA_2"/>
    <xsl:apply-templates select="PRESTA_3"/>
    <xsl:apply-templates select="PRESTA_4"/>
    <xsl:apply-templates select="PRESTA_5"/>
    <xsl:apply-templates select="TARIF1_1"/>
    <xsl:apply-templates select="TARIF1_2"/>
    <xsl:apply-templates select="_l"/>
    
</xsl:template>

<xsl:template match="geo/name"> <xsl:text>&#010;</xsl:text>
    <xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(./text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:nom &#009; "<xsl:value-of select="."/>"^^xsd:string;
</xsl:template>

<xsl:template match="ID">&#009;ex:id&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:template>

<xsl:template match="ADR_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:adresse1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="ADR_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:adresse2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="CP">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:codePostal&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="VIL">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:ville &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="CEDEX">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:cedex&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TEL_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:telephone1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TEL_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:telephone2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="FAX_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:fax1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="MEL_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:mail1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="WEB_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:website &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_CAPACITE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:capacite &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_TARIF">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:tarif &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_OUVERTURES">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:horaire &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TYPE_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:type1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TYPE_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:type2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="LABEL_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:label1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OHLALAQA">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:ohlalaqa &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="V-D">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:VD &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="T-H_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:TH1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="T-H_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:TH2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="T-H_3">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:tTH3 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="T-H_4">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:TH4 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="HANDIPLAGE">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:handiplage &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="GEO">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:geo &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="VISIT_IND_LIB">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:visite1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="VISIT_IND_GUI">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:visite2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="VISIT_GRO_LIB">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:visite3 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="VISIT_GRO_GUI">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:visite4 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="PRESTA_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:prest1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="PRESTA_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:prest2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="PRESTA_3">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:prest3 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="PRESTA_4">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:prest4 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="PRESTA_5">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:prest5 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TARIF1_1">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:tarif1 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="TARIF1_2">
<xsl:choose>
<xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise>&#009;ex:tarif2 &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string;
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