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
@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
@prefix : &lt;#&gt; .
@prefix void: &lt;http://rdfs.org/ns/void#&gt; .
@prefix TEMPORAIRE: &lt;http://temporaire.org/&gt; .
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://lodpaddle.univ-nantes.fr/&gt; .
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

&lt;http://lodpaddle.univ-nantes.fr/parc_animalier_theme&gt; rdf:type void:Dataset ;
	foaf:homepage &lt;http://data.nantes.fr/donnees/detail/parcs-animaliers-et-parcs-a-themes-en-loire-atlantique/?tx_icsoddatastore_pi1[page]=2&gt;;
	dcterms:title "Parcs animaliers et parcs à thèmes en Loire-Atlantique"^^xsd:string ;
	dcterms:description "Parcs animaliers et parcs à thèmes en Loire-Atlantique"^^xsd:string ;
	dcterms:created "2013-08-12"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Département de Loire-Atlantique".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
<xsl:text>&#009;rdf:type&#009; pdll:parc_animalier_theme;
</xsl:text>
	<xsl:apply-templates select="V-D"/>
	<xsl:apply-templates select="VISIT_GRO_GUI"/>
	<xsl:apply-templates select="LABEL_1"/>
	<xsl:apply-templates select="VIL"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_OUVERTURES"/>
	<xsl:apply-templates select="TEL_1"/>
	<xsl:apply-templates select="TEL_2"/>
	<xsl:apply-templates select="HANDIPLAGE"/>
	<xsl:apply-templates select="CEDEX"/>
	<xsl:apply-templates select="ID"/>
	<xsl:apply-templates select="WEB_1"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_CAPACITE"/>
	<xsl:apply-templates select="MEL_1"/>
	<xsl:apply-templates select="TARIF1_2"/>
	<xsl:apply-templates select="T-H_2"/>
	<xsl:apply-templates select="T-H_3"/>
	<xsl:apply-templates select="TARIF1_1"/>
	<xsl:apply-templates select="T-H_1"/>
	<xsl:apply-templates select="T-H_4"/>
	<xsl:apply-templates select="FAX_1"/>
	<xsl:apply-templates select="OHLALAQA"/>
	<xsl:apply-templates select="PRESTA_1"/>
	<xsl:apply-templates select="ADR_1"/>
	<xsl:apply-templates select="PRESTA_3"/>
	<xsl:apply-templates select="VISIT_GRO_LIB"/>
	<xsl:apply-templates select="PRESTA_2"/>
	<xsl:apply-templates select="VISIT_IND_LIB"/>
	<xsl:apply-templates select="PRESTA_5"/>
	<xsl:apply-templates select="ADR_2"/>
	<xsl:apply-templates select="PRESTA_4"/>
	<xsl:apply-templates select="GEO"/>
	<xsl:apply-templates select="TYPE_1"/>
	<xsl:apply-templates select="VISIT_IND_GUI"/>
	<xsl:apply-templates select="TYPE_2"/>
	<xsl:apply-templates select="CP"/>
	<xsl:apply-templates select="DESCRIPTION_DESCRIPTIF_TARIF"/>

</xsl:template>

<xsl:template match="V-D">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:VignoleEtDecouverteLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:VignoleEtDecouverteLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VISIT_GRO_GUI">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:visitGroupGuide&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:visitGroupGuide&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="LABEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isCuisineriesGourmandesLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isCuisineriesGourmandesLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VIL">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l">&#009;geo:lat&#009;"<xsl:value-of select="substring-after(substring-before(.,' ,'),'[ ')"/>"^^xsd:decimal ;
&#009;geo:long&#009;"<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal  ;
</xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_OUVERTURES">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:openingHours&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:openingHours&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:telephone&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:telephone&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TEL_2"></xsl:template>

<xsl:template match="HANDIPLAGE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isHandiplageLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isHandiplageLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CEDEX">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:cedex&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:cedex&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ID">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="WEB_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:website&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:website&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_CAPACITE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:seatingCapacity&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:seatingCapacity&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MEL_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:email&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:email&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIF1_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isMentalDisabilityLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isMentalDisabilityLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isHearingImpairmentLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isHearingImpairmentLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TARIF1_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isMotorDisabilityLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isMotorDisabilityLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="T-H_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:isVisualImpairmentLabelled&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:isVisualImpairmentLabelled&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="FAX_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:faxNumber&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:faxNumber&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="OHLALAQA">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:islabeledOhlala&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:islabeledOhlala&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRESTA_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasRVArea&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasRVArea&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRESTA_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasTasting&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasTasting&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VISIT_GRO_LIB">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:visitGroupWithoutGuide&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:visitGroupWithoutGuide&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRESTA_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasFamilyWelcome&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasFamilyWelcome&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VISIT_IND_LIB">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:visitAloneWithoutGuide&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:visitAloneWithoutGuide&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRESTA_5">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasOnlineSelling&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasOnlineSelling&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADR_2"></xsl:template>

<xsl:template match="PRESTA_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasBioproduct&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasBioproduct&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="GEO">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/parc_animalier_theme/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VISIT_IND_GUI">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:visitAloneGuide&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:visitAloneGuide&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CP"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:postalCode&#009; "-120404040"^^xsd:int ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:postalCode&#009; "<xsl:value-of select="."/>"^^xsd:int ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESCRIPTION_DESCRIPTIF_TARIF">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>