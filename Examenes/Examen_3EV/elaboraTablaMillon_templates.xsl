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
                  table{border: solid;border-collapse:collapse;width:300px;background-color:grey;
                  font-size:16px;}
              </xsl:element>
          </xsl:element>
          <!--Etiqueta body-->
          <xsl:element name="body">
              <xsl:element name="h2">Provincias 1.000.000 habitantes</xsl:element>
              <xsl:element name="table">
                  <xsl:attribute name="border">1</xsl:attribute>
                  <xsl:attribute name="title">titulo de la tabla</xsl:attribute>
                  <xsl:element name="thead">
                      <xsl:element name="tr">
                          <xsl:element name="th">Codigo</xsl:element>
                          <xsl:element name="th">Nombre</xsl:element>
                          <xsl:element name="th">Habitantes</xsl:element>
                      </xsl:element>
                  </xsl:element>
                   <xsl:element name="tbody">
                      <xsl:apply-templates select="//provincia"/>
                  </xsl:element>
              </xsl:element>
          </xsl:element>
      </xsl:element>
  </xsl:template>
  
<xsl:template match="provincia">
    <xsl:if test="./numHAB > 1000000">
      <xsl:element name="tr">
         <xsl:element name="td">
            <xsl:value-of select="./@codPRO"/>
         </xsl:element>
         <xsl:element name="td">
            <xsl:value-of select="nomPRO"/>
         </xsl:element>
         <xsl:element name="td">
            <xsl:value-of select="numHAB"/>
         </xsl:element>
    </xsl:element>
    </xsl:if>
</xsl:template> 

</xsl:stylesheet>