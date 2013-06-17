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
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_OUVERTURES"/>
	<xsl:apply-templates select="SPA"/>
	<xsl:apply-templates select="ANIMX"/>
	<xsl:apply-templates select="VELODYSSEE"/>
	<xsl:apply-templates select="CEDEX"/>
	<xsl:apply-templates select="PARK"/>
	<xsl:apply-templates select="ID"/>
	<xsl:apply-templates select="ECO_LABEL1"/>
	<xsl:apply-templates select="WEB_1"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_CAPACITE"/>
	<xsl:apply-templates select="ECO_LABEL2"/>
	<xsl:apply-templates select="MEL_1"/>
	<xsl:apply-templates select="CHAINE_1"/>
	<xsl:apply-templates select="CLAS_LABEL_1"/>
	<xsl:apply-templates select="CLAS_LABEL_2"/>
	<xsl:apply-templates select="FAX_1"/>
	<xsl:apply-templates select="PISCINE"/>
	<xsl:apply-templates select="CAPACITE_CHAM"/>
	<xsl:apply-templates select="GEO"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_TARIF"/>
	<xsl:apply-templates select="LABEL_2"/>
	<xsl:apply-templates select="LABEL_1"/>
	<xsl:apply-templates select="VIL"/>
	<xsl:apply-templates select="LANGUE_4"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="LANGUE_3"/>
	<xsl:apply-templates select="LANGUE_2"/>
	<xsl:apply-templates select="LANGUE_1"/>
	<xsl:apply-templates select="TEL_1"/>
	<xsl:apply-templates select="TEL_2"/>
	<xsl:apply-templates select="T-H_2"/>
	<xsl:apply-templates select="TARIF1_2"/>
	<xsl:apply-templates select="T-H_3"/>
	<xsl:apply-templates select="RESTAU"/>
	<xsl:apply-templates select="T-H_1"/>
	<xsl:apply-templates select="TARIF1_1"/>
	<xsl:apply-templates select="LOIRE_VELO"/>
	<xsl:apply-templates select="T-H_4"/>
	<xsl:apply-templates select="CLAS_LOGIS"/>
	<xsl:apply-templates select="SALLE_REUNION"/>
	<xsl:apply-templates select="ADR_1"/>
	<xsl:apply-templates select="ACC_VELO"/>
	<xsl:apply-templates select="CHEQUE_VAVANCES"/>
	<xsl:apply-templates select="ADR_2"/>
	<xsl:apply-templates select="TYPE_1"/>
	<xsl:apply-templates select="TYPE_2"/>
	<xsl:apply-templates select="CAPACITE_PERS"/>
	<xsl:apply-templates select="CP"/>

</xsl:template>

<xsl:template match="V-D">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:vd&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:vd&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_OUVERTURES">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:ouverture&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:ouverture&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SPA">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:SPA&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:SPA&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ANIMX">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:ANIMX&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:ANIMX&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VELODYSSEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:VELODYSSEE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:VELODYSSEE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CEDEX">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:cedex&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:cedex&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PARK">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:PARK&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:PARK&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ID">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ECO_LABEL1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:ECO_LABEL1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:ECO_LABEL1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
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

<xsl:template match="ECO_LABEL2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:ECO_LABEL2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:ECO_LABEL2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:mail&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:mail&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CHAINE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CHAINE_1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CHAINE_1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CLAS_LABEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CLAS_LABEL_1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CLAS_LABEL_1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CLAS_LABEL_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CLAS_LABEL_2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CLAS_LABEL_2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="FAX_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:fax1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:fax1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PISCINE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:PISCINE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:PISCINE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CAPACITE_CHAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CAPACITE_CHAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CAPACITE_CHAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GEO">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:zoneGeo&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:zoneGeo&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://projet.com/10/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_TARIF">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:descriptionTarif&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:descriptionTarif&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
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

<xsl:template match="LANGUE_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LANGUE_4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LANGUE_4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l"><xsl:choose><xsl:when test=". = 'null'">&#009;ex:coordinate&#009; "NaN"^^xsd:decimal ;
</xsl:when>
<xsl:otherwise>&#009;ex:coordinate&#009; "<xsl:value-of select="."/>"^^xsd:decimal ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LANGUE_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LANGUE_3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LANGUE_3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LANGUE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LANGUE_2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LANGUE_2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LANGUE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LANGUE_1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LANGUE_1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
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

<xsl:template match="T-H_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIF1_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tarif2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tarif2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="RESTAU">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:RESTAU&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:RESTAU&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIF1_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:tarif1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:tarif1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LOIRE_VELO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LOIRE_VELO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LOIRE_VELO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:th4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:th4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CLAS_LOGIS">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CLAS_LOGIS&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CLAS_LOGIS&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SALLE_REUNION">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:SALLE_REUNION&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:SALLE_REUNION&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:adresse&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:adresse&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ACC_VELO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:ACC_VELO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:ACC_VELO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CHEQUE_VAVANCES">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CHEQUE_VAVANCES&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CHEQUE_VAVANCES&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:adresse2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:adresse2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:type1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:type1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;ex:type2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;ex:type2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CAPACITE_PERS">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CAPACITE_PERS&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CAPACITE_PERS&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CP"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:postalCode&#009; "NaN"^^xsd:integer .

</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:postalCode&#009; "<xsl:value-of select="."/>"^^xsd:integer .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>