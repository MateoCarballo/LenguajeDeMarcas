<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <xsl:element name="CD'S">
    <xsl:apply-templates/>
  </xsl:element>
  </xsl:template>
  
  <xsl:template match="//cd">
  <xsl:element name="CD">
    <xsl:value-of select="./title"/>
  </xsl:element>
  </xsl:template> 
  
</xsl:stylesheet>
