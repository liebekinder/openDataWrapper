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
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://data.paysdelaloire.fr/&gt; .
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
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
<xsl:text>&#009;rdf:type&#009; pdll:patrimoine;
</xsl:text>
	<xsl:apply-templates select="SCLE"/>
	<xsl:apply-templates select="STAT"/>
	<xsl:apply-templates select="MURS"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="HIST"/>
	<xsl:apply-templates select="TYPO"/>
	<xsl:apply-templates select="EDIF"/>
	<xsl:apply-templates select="COPYRIGHT"/>
	<xsl:apply-templates select="COM"/>
	<xsl:apply-templates select="DENO"/>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="AUTR"/>
	<xsl:apply-templates select="CATE"/>
	<xsl:apply-templates select="DESC"/>
	<xsl:apply-templates select="CHERCHEUR"/>
	<xsl:apply-templates select="AIRE"/>
	<xsl:apply-templates select="NOMFIC"/>
	<xsl:apply-templates select="PROT"/>
	<xsl:apply-templates select="TOIT"/>

</xsl:template>

<xsl:template match="SCLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:datation&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:datation&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="STAT">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:statut&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:statut&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MURS">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:murs&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:murs&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l">&#009;geo:lat&#009;"<xsl:value-of select="substring-after(substring-before(.,' ,'),'[ ')"/>"^^xsd:decimal ;
&#009;geo:long&#009;"<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal  ;
</xsl:template>

<xsl:template match="HIST">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPO">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:typePatrimoine&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:typePatrimoine&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="EDIF">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:edifice&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:edifice&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COPYRIGHT">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia:Copyright&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia:Copyright&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COM">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DENO">
<xsl:choose><xsl:when test=". = 'null'">&#009;rdfs:label&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;rdfs:label&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "NaN"^^xsd:integer ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="AUTR">
<xsl:choose><xsl:when test=". = 'null'">&#009;prop-fr:author&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;prop-fr:author&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.com/patrimoine/',translate(translate(translate(translate(translate(translate(./text(),'&quot;',' '),'&gt;',' '),'&lt;',' '),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CATE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:classOfWork&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:classOfWork&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DESC">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CHERCHEUR">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:chercheur&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:chercheur&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="AIRE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="NOMFIC">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PROT">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:protection&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:protection&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TOIT">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:toit&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;pdll:toit&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>