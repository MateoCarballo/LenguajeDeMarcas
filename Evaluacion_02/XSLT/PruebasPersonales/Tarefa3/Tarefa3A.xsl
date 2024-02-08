<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <xsl:template match="equipos">
            <xsl:element name="discos">
                 <xsl:apply-templates select="//disco"/> 
            </xsl:element>
      </xsl:template> 
      <xsl:template match="disco">
            <xsl:element name="disco">
                        <xsl:attribute name="capacidade">
                              <xsl:value-of select="//disco/@capacidade"/>
                        </xsl:attribute>
                        <xsl:attribute name="tecnoloxía">
                              <xsl:value-of select="//disco/@tecnoloxía"/>
                        </xsl:attribute>
                        <xsl:attribute name="máquina">
                              <xsl:value-of select="../../@nome"/>
                        </xsl:attribute>
                  </xsl:element>
      </xsl:template>
</xsl:stylesheet>


<!-- 
ENUNCIADO 
<?xml version="1.0" encoding="UTF-8"?>
<discos>
<disco tecnoloxía="SATA" capacidade="2000" máquina="PC017"/>
<disco tecnoloxía="SCSI" capacidade="200" máquina="GALILEO"/>
<disco tecnoloxía="SCSI" capacidade="200" máquina="GALILEO"/>
<disco tecnoloxía="SCSI" capacidade="200" máquina="GALILEO"/>
</discos>
-->