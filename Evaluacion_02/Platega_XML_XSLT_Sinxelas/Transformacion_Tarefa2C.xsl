<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encodign="UTF-8" method="html"/>
  <xsl:template match="/venda">
    <HTML>
      <HEAD>
        <TITLE>
          Cliente <xsl:value-of select="/cliente/@cod" />
          <!-- concat(cliente/name(),'cliente/@cod')-->
        </TITLE>
      </HEAD>
      <BODY>
        <h1>
          <p>
          Cliente <xsl:value-of select="/cliente/@cod"/>
          <!-- concat(cliente/name(),'cliente/@cod')-->
          </p>
          <p>
          <!-- <xsl:value-of select="count(//produto)" />-->
          </p>
        </h1>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

<!-- 
  <xsl:template match="/venda">
    <xsl:element name="{name()}">
  <xsl:attribute name="nome">
  <xsl:value-of select="text()"/>
  </xsl:template>
 
 
 -->