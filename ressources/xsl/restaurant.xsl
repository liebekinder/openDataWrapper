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
	<xsl:apply-templates select="geo/name"/>
	<xsl:apply-templates select="V-D"/>
	<xsl:apply-templates select="LABEL_2"/>
	<xsl:apply-templates select="LABEL_1"/>
	<xsl:apply-templates select="VIL"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_OUVERTURES"/>
	<xsl:apply-templates select="TEL_1"/>
	<xsl:apply-templates select="TEL_2"/>
	<xsl:apply-templates select="GUIDE_1_CLAS"/>
	<xsl:apply-templates select="LABEL_4"/>
	<xsl:apply-templates select="LABEL_3"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_TARIFS"/>
	<xsl:apply-templates select="CEDEX"/>
	<xsl:apply-templates select="GUIDE_2_CLAS"/>
	<xsl:apply-templates select="ID"/>
	<xsl:apply-templates select="WEB_1"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_CAPACITE"/>
	<xsl:apply-templates select="MEL_1"/>
	<xsl:apply-templates select="T-H_2"/>
	<xsl:apply-templates select="T-H_3"/>
	<xsl:apply-templates select="TARIF1_1"/>
	<xsl:apply-templates select="T-H_1"/>
	<xsl:apply-templates select="PRIX_1"/>
	<xsl:apply-templates select="MODE_PAIEMENT"/>
	<xsl:apply-templates select="T-H_4"/>
	<xsl:apply-templates select="FAX_1"/>
	<xsl:apply-templates select="ADR_1"/>
	<xsl:apply-templates select="ADR_2"/>
	<xsl:apply-templates select="GEO"/>
	<xsl:apply-templates select="GUIDE_1"/>
	<xsl:apply-templates select="CP"/>
	<xsl:apply-templates select="GUIDE_2"/>

</xsl:template>

<xsl:template match="V-D">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:vd&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:vd&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABEL_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:label2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:label2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:label1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:label1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VIL">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:ville&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:ville&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l"><xsl:choose><xsl:when test=". = 'null'">&#009;ex:coordinate&#009; "NaN"^^xsd:decimal ;
</xsl:when>
<xsl:otherwise>&#009;ex:coordinate&#009; "<xsl:value-of select="."/>"^^xsd:decimal ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_OUVERTURES">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:ouverture&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:ouverture&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tel1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tel1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TEL_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tel2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tel2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GUIDE_1_CLAS">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:Guide1Clas&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:Guide1Clas&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABEL_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:label4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:label4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABEL_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:label3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:label3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_TARIFS">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tarifDescription&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tarifDescription&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CEDEX">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:cedex&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:cedex&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GUIDE_2_CLAS">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:Guide2Clas&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:Guide2Clas&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ID">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="WEB_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:web&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:web&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_CAPACITE">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:capacite&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:capacite&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:mail&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:mail&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIF1_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tarif1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tarif1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRIX_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:prix1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:prix1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MODE_PAIEMENT">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:modePaiement&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:modePaiement&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="FAX_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:fax1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:fax1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:adresse&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:adresse&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:adresse2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:adresse2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GEO">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:zoneGeo&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:zoneGeo&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GUIDE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:guide1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:guide1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CP"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:postalCode&#009; "NaN"^^xsd:integer ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:postalCode&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GUIDE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:guide2&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;ex:guide2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>