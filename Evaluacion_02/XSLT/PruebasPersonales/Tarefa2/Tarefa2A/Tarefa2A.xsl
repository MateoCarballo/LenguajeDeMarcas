<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="venda">
        <xsl:element name="{cliente/@cod}">
              <xsl:attribute name="num_produtos">
                    <xsl:value-of select="count(produtos/produto)"/>
              </xsl:attribute>
        </xsl:element>
  </xsl:template>
</xsl:stylesheet>


<!-- 
DOCUMENTO XML

<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="Transformacion_Tarefa2.xsl" ?> 
<venda>
  <cliente cod="CL09384" />
    <produtos>
      <produto cod="LACT093" />
      <produto cod="LACT012" />
      <produto cod="ACEI015" />
      <produto cod="AUGA005" />
      <produto cod="CONS121" />
    </produtos>
</venda>

OBJETIVO
<?xml version="1.0" encoding="utf-8"?>
<CL09384 num_produtos="5"/>
-->