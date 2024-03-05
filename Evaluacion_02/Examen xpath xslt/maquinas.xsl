<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="equipos">
      <xsl:element name="maquinas">
          <xsl:apply-templates select="máquina"/>
      </xsl:element>
  </xsl:template>
  
  <xsl:template match="máquina">
          <xsl:element name="maquina">
              <xsl:element name="nombre">
                  <xsl:value-of select="./@nome"/>
              </xsl:element>
              <xsl:element name="procesador">
                  <xsl:attribute name="marca">
                      <xsl:value-of select="./hardware/procesador/@marca"/>
                  </xsl:attribute>
                  <xsl:attribute name="modelo">
                  <xsl:value-of select="./hardware/procesador"/>
                  </xsl:attribute>
              </xsl:element>
              <xsl:element name="memoria">
                  <xsl:attribute name="medida">
                      <xsl:text>GB</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="tecnologia">
                  <xsl:value-of select="./hardware/memoria/@tecnoloxía"/>
                  </xsl:attribute>
                  <xsl:value-of select="./hardware/memoria"/>
              </xsl:element>
              <xsl:element name="discos">
                  <xsl:attribute name="cantidad">
                      <xsl:value-of select="count(./hardware/disco)"/>
                  </xsl:attribute>
                  <xsl:attribute name="capacidad">
                      <xsl:value-of select="sum(./hardware/disco/@capacidade)"/>
                  </xsl:attribute>
              </xsl:element>
          </xsl:element>
  </xsl:template>
 
</xsl:stylesheet>
