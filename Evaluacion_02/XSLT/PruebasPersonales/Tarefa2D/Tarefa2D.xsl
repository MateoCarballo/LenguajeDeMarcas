<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:template match="produto">
        <xsl:text>Produto da familia </xsl:text>
        <xsl:value-of select="substring(@cod,1,4)"/>
        <xsl:text> con codigo </xsl:text>
        <xsl:value-of select="substring(@cod,4,7)"/>
        <xsl:text> para o cliente de codigo </xsl:text>
        <xsl:value-of select="../../cliente/@cod"/>
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

Produto da familia LACT con código 093 para o cliente de código CL09384
Produto da familia LACT con código 012 para o cliente de código CL09384
Produto da familia ACEI con código 015 para o cliente de código CL09384
Produto da familia AUGA con código 005 para o cliente de código CL09384
Produto da familia CONS con código 121 para o cliente de código CL09384

-->