<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" >
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="document">
     <xsl:apply-templates select="data"/>
</xsl:template>

<xsl:template match="data">
 <xsl:text>@prefix ex: &lt;http://example.org/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .

</xsl:text> 
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
    <xsl:apply-templates select="ID"/>  
    <xsl:apply-templates select="CP"/>
    <xsl:apply-templates select="VIL"/>
    <xsl:apply-templates select="geo/name"/>

</xsl:template>

<xsl:template match="ID">ex:<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="CP">&#009;&#009;&#009;ex:postalCode&#009;"<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:integer ;
</xsl:template>

<xsl:template match="VIL">&#009;&#009;&#009;ex:ville&#009;"<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:template>

<xsl:template match="geo/name">&#009;&#009;&#009;ex:label&#009;"<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .
</xsl:template>


</xsl:stylesheet>