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
@prefix proj: &lt;http://projet.com/7/&gt; . &#010; 
        </xsl:text> 
        <xsl:apply-templates />
    </xsl:template>
    
    
    <xsl:template match="element">     
        <xsl:apply-templates select="NOMFIC"/>
        <xsl:apply-templates select="geo/name"/>
        <xsl:apply-templates select="TYPO"/>
        <xsl:apply-templates select="DENO"/>
        <xsl:apply-templates select="SCLE"/>
        <xsl:apply-templates select="HIST"/>
        <xsl:apply-templates select="COMMUNE_CODE_INSEE"/> 
        <xsl:apply-templates select="_l"/>
        <xsl:apply-templates select="COM"/>
        <xsl:apply-templates select="AIRE"/>
        <xsl:apply-templates select="CHERCHEUR"/>
        <xsl:apply-templates select="COPYRIGHT"/>
    </xsl:template>
    
    <xsl:template match="NOMFIC"> <xsl:text>&#010;</xsl:text> 
        <xsl:value-of select="concat(concat('&lt;http://projet.com/7/',translate(translate(translate(../geo/name/text(),'  ',' '),' ','_'),'.','_')),'&gt;')"/>&#009; ex:id &#009; "<xsl:value-of select="."/>"^^xsd:string; 
    </xsl:template>
    
    <xsl:template match="geo/name">&#009;ex:nom&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template> 
    
    <xsl:template match="TYPO">&#009;ex:type&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    <xsl:choose>
     <xsl:when test="../TYPO[text()='Architecture']">  ex:toit&#009;"<xsl:value-of select="translate(../TOIT,'&quot;','')"/>"^^xsd:string ;
      ex:description&#009;"<xsl:value-of select="translate(../DESC,'&quot;','')"/>"^^xsd:string ;
      ex:murs&#009;"<xsl:value-of select="translate(../MURS,'&quot;','')"/>"^^xsd:string ;
      ex:statut&#009;"<xsl:value-of select="translate(../STAT,'&quot;','')"/>"^^xsd:string ;
      ex:protection&#009;"<xsl:value-of select="translate(../PROT,'&quot;','')"/>"^^xsd:string ;
    </xsl:when>
        
    <xsl:when test="../TYPO[text()='Mobilier']">  ex:edifice&#009;"<xsl:value-of select="translate(../EDIF,'&quot;','')"/>"^^xsd:string ;
      ex:categorie&#009;"<xsl:value-of select="translate(../CATE,'&quot;','')"/>"^^xsd:string ;
      ex:auteur&#009;"<xsl:value-of select="translate(../AUTR,'&quot;','')"/>"^^xsd:string ;         
    </xsl:when>
    </xsl:choose>
        
    </xsl:template> 
    
    <xsl:template match="COPYRIGHT">&#009;ex:copyright&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string .
    </xsl:template>
    
    <xsl:template match="COM">&#009;ex:commune&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="CHERCHEUR">&#009;ex:chercheur&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="AIRE">&#009;ex:aireEtude&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template>
    
    <xsl:template match="DENO">&#009;ex:appellation&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template> 
    
    <xsl:template match="SCLE">&#009;ex:datation&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template> 
    
    <xsl:template match="HIST">&#009;ex:historique&#009;"<xsl:value-of select="translate(.,'&quot;','')"/>"^^xsd:string ;
    </xsl:template> 
    
    <xsl:template match="COMMUNE_CODE_INSEE">&#009;ex:codeInsee&#009; "<xsl:value-of select="."/>"^^xsd:integer ;
    </xsl:template>
    
    <xsl:template match="_l">&#009;ex:latitude&#009; "<xsl:value-of select="substring-after(substring-before(.,','),'[ ')"/>"^^xsd:decimal ;
     &#009;ex:longitude&#009; "<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal ;
    </xsl:template>
    
</xsl:stylesheet>
