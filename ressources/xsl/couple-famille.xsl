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

</xsl:template>

<xsl:template match="P99_POPMEN80P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN80P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN80P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_NE24RF4P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_NE24RF4P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_NE24RF4P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LIBGEO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:LIBGEO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:LIBGEO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN2539">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN2539&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN2539&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS6">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS6&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS6&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS5">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS5&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS5&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS8">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS8&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS8&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS7">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS7&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS7&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D90_NPER_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D90_NPER_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D90_NPER_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP15P_CELIB">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP15P_CELIB&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP15P_CELIB&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP4054_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP4054_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP4054_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN80P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN80P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN80P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENSFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENSFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENSFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP5564">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP5564&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP5564&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP4054_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP4054_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP4054_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENCOUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENCOUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENCOUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D90_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D90_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D90_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS7">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS7&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS7&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_COUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_COUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_COUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP5564_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP5564_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP5564_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS6">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS6&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS6&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS5">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS5&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS5&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENFSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENFSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENFSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS4">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS4">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENHSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENHSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENHSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP1519_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP1519_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP1519_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MEN_CS8">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MEN_CS8&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MEN_CS8&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MEN_CS2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MEN_CS2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MEN_CS2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENFSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENFSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENFSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_NE24RF3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_NE24RF3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_NE24RF3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENPSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENPSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENPSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP15P_VEUF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP15P_VEUF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP15P_VEUF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_NE24RF1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_NE24RF1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_NE24RF1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CODGEO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:CODGEO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:CODGEO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_NE24RF2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_NE24RF2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_NE24RF2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_NE24RF0">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_NE24RF0&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_NE24RF0&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP6579">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP6579&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP6579&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP1519">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP1519&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP1519&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_COUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_COUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_COUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENHSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENHSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENHSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENCOUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENCOUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENCOUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENCOUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENCOUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENCOUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_HMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_HMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_HMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP4054">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP4054&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP4054&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP80P_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP80P_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP80P_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENFAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENFAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENFAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENHSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENHSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENHSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENFAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENFAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENFAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP2539_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP2539_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP2539_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN6579">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN6579&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN6579&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP6579_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP6579_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP6579_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_COUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_COUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_COUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENFAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENFAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENFAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2024_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2024_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2024_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D68_NPER_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D68_NPER_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D68_NPER_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_FAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_FAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_FAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENCOUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENCOUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENCOUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP15P_DIVOR">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP15P_DIVOR&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP15P_DIVOR&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENFAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENFAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENFAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP6579_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP6579_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP6579_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP15P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP15P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP15P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP80P_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP80P_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP80P_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP5564_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP5564_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP5564_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN1519">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN1519&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN1519&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_FMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_FMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_FMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP80P_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP80P_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP80P_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP4054_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP4054_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP4054_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_FAMMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_FAMMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_FAMMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2539">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2539&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2539&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENCOUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENCOUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENCOUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2539_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2539_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2539_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_NE24F4P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_NE24F4P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_NE24F4P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS4">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS4&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS4&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP1519_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP1519_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP1519_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS5">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS5&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS5&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENFSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENFSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENFSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENPSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENPSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENPSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENPSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENPSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENPSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN2024">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN2024&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN2024&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_FAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_FAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_FAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_FAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_FAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_FAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_MENSFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_MENSFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_MENSFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2024_COUPLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2024_COUPLE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2024_COUPLE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENCOUPSENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENCOUPSENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENCOUPSENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP2024_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP2024_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP2024_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_COUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_COUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_COUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN2024">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN2024&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN2024&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D75_NPER_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D75_NPER_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D75_NPER_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN1519">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN1519&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN1519&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D82_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D82_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D82_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP1519_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP1519_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP1519_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D68_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D68_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D68_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP15P_MARIE">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP15P_MARIE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP15P_MARIE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_MEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_MEN&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_MEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN6579">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN6579&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN6579&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENCOUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENCOUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENCOUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_HMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_HMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_HMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENCOUPAENF">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENCOUPAENF&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENCOUPAENF&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D82_NPER_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D82_NPER_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D82_NPER_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_PMEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_PMEN&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_PMEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP80P">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP80P&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP80P&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN4054">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN4054&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN4054&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN4054">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN4054&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN4054&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN5564">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN5564&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN5564&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POPMEN2539">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POPMEN2539&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POPMEN2539&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENFSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENFSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENFSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2539_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2539_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2539_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_FMONO">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_FMONO&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_FMONO&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_MEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_MEN&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_MEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_NE24F3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_NE24F3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_NE24F3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_NE24F2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_NE24F2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_NE24F2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP2024">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP2024&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP2024&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS7">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS7&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS7&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS6">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS6&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS6&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENHSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENHSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENHSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_CS8">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_CS8&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_CS8&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_NE24F1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_NE24F1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_NE24F1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_NE24F0">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_NE24F0&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_NE24F0&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_MENSFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_MENSFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_MENSFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C09_PMEN_MENPSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C09_PMEN_MENPSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C09_PMEN_MENPSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="C99_PMEN_MENSFAM">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:C99_PMEN_MENSFAM&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:C99_PMEN_MENSFAM&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="D75_RP">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:D75_RP&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:D75_RP&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P09_POP6579_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P09_POP6579_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P09_POP6579_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POPMEN5564">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POPMEN5564&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POPMEN5564&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_POP5564_PSEUL">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_POP5564_PSEUL&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_POP5564_PSEUL&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="P99_PMEN">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:P99_PMEN&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:P99_PMEN&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>