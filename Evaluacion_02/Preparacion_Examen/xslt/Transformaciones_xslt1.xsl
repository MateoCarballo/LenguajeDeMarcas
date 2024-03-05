<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <xsl:template match="libro">
        <xsl:text>He entrado en el match de libro</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="titulo"/>
        <xsl:apply-templates select="autor"/>
      </xsl:template>

      <xsl:template match="titulo">
        <xsl:text>He entrado en el match titulo</xsl:text>
        <xsl:text>&#10;</xsl:text>
        
      </xsl:template>

      <xsl:template match="autor">
       <xsl:text>He entrado en el match autor</xsl:text>
      </xsl:template>

</xsl:stylesheet>