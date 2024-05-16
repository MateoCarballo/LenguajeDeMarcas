<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
      <xsl:element name="HTML">
      <xsl:attribute name="lang">es</xsl:attribute>
          <!--Etiqueta head-->
          <xsl:element name="head" >
              <xsl:element name="meta">
                  <xsl:attribute name="charset">UTF-8</xsl:attribute>
              </xsl:element>
              <xsl:element name="meta">
                  <xsl:attribute name="name">viewport</xsl:attribute>
                  <xsl:attribute name="content">width=device-width, initial-scale=1.0</xsl:attribute>
              </xsl:element>
              <xsl:element name="title">
              Tabla
              </xsl:element>
              <xsl:element name="style">
                  h2{color:red}
                  table{border: solid;border-collapse:collapse;width:300px;background-color:red;
                  font-size:16px;}
              </xsl:element>
          </xsl:element>
          <!--Etiqueta body-->
          <xsl:element name="body">
              <xsl:element name="h2">My collection CD</xsl:element>
              <xsl:for-each select="//cd">
                  <xsl:sort select="./artist"/>
                  <xsl:element name="p">
                  <xsl:text>Title:</xsl:text>
                  <xsl:value-of select="./title"/>
                  <xsl:element name="br">
                  </xsl:element>
                  <xsl:text>Artist:</xsl:text>
                  <xsl:value-of select="./artist"/>
                  <xsl:text>(</xsl:text>
                  <xsl:value-of select="./year"/>
                  <xsl:text>)</xsl:text>
                  </xsl:element>
              </xsl:for-each>
          </xsl:element>
      </xsl:element>
  </xsl:template>
</xsl:stylesheet>
