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
              <xsl:element name="title">Tabla</xsl:element>
              <xsl:element name="style">
                  h2{color:red}
                  table{border: solid;border-collapse:collapse;width:300px;background-color:red;
                  font-size:16px;}
              </xsl:element>
          </xsl:element>
          <!--Etiqueta body-->
          <xsl:element name="body">
              <xsl:element name="h2">Tabla Ejemplo</xsl:element>
              <xsl:element name="table">
                  <xsl:attribute name="border">1</xsl:attribute>
                  
                  <xsl:element name="thead">
                      <xsl:element name="tr">
                          <xsl:element name="th">Encabezado 1</xsl:element>
                          <xsl:element name="th">Encabezado 2</xsl:element>
                          <xsl:element name="th">Encabezado 3</xsl:element>
                      </xsl:element>
                  </xsl:element>

                   <xsl:element name="tbody">
                      <xsl:apply-templates select="//cd"/>
                  </xsl:element>
                  
              </xsl:element>
          </xsl:element>
      </xsl:element>
  </xsl:template>
  
<xsl:template match="cd">
    <xsl:element name="tr">
         <xsl:element name="td">
            <xsl:value-of select="title"/>
         </xsl:element>
         <xsl:element name="td">
            <xsl:value-of select="artist"/>
         </xsl:element>
         <xsl:element name="td">
            <xsl:value-of select="year"/>
         </xsl:element>
    </xsl:element>
</xsl:template>  
  
</xsl:stylesheet>
