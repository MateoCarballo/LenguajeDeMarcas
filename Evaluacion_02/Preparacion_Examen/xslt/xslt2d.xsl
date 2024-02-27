<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="produto">
    <xsl:text>Produto da familia </xsl:text>
    <xsl:value-of select="substring(./@cod,1,4)"/>
    <xsl:text> con codigo </xsl:text>
    <xsl:value-of select="substring(./@cod,5,7)"/>
    <xsl:text> para o cliente de código </xsl:text>
    <xsl:value-of select="../../cliente/@cod"/>
  </xsl:template>
</xsl:stylesheet>
