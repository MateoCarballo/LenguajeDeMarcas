<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:template match="/">
        <html>
        <head>
            <title><xsl:text>Cliente </xsl:text><xsl:value-of select="cliente/@cod"/></title>
        </head>
        <body>
          <p>
          <xsl:text>Cliente:</xsl:text>
          <xsl:value-of select="cliente/@cod"></xsl:value-of>
          </p>
          <p>
          <xsl:text>Numero de produtos:</xsl:text>
          <xsl:value-of select="count(produtos/produto)"/>
          </p>
        </body>
        </html>
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

Transformalor a HTML metiendo todas las etiquetas en la transformacion y usando 'element' 'attribute' y 'text' 

-->