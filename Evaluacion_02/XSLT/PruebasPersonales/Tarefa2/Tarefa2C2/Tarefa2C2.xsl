<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" omit-xml-declaration="no"/>
  <xsl:template match="/">
          <xsl:element name="HTML">
          
                  <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:text>Cliente </xsl:text>
                            <xsl:value-of select="//cliente/@cod"/>
                        </xsl:element>
                  </xsl:element>
                  
                  <xsl:element name="body">
                          <xsl:element name="p">
                                  <xsl:text>Cliente: </xsl:text>
                                  <xsl:value-of select="//cliente/@cod"/> 
                          </xsl:element>
                          <xsl:element name="p">
                                  <xsl:text>Numero de productos: </xsl:text>
                                  <xsl:value-of select="count(venda/produtos/produto)"/> 
                          </xsl:element>
                  </xsl:element>
                  
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

Transformalor a HTML metiendo todas las etiquetas en la transformacion y usando 'element' 'attribute' y 'text' 

Version 1 matando moscas a cañonazos

<xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:template match="venda">
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

<td valign="top">
            <br/><br/>
            <h2>Dogs</h2>
            <dir>
            <p><a class="LeftLink" href="DogsMale.xml">Male</a></p>
            <p><a class="LeftLink" href="DogsFemale.xml">Female</a></p>
            </dir>
            <h2>Cats</h2>
            <dir>
            <p><a class="LeftLink" href="CatsMale.xml">Male</a></p>
            <p><a class="LeftLink" href="CatsFemale.xml">Female</a></p>
            </dir>
</td>
         <td align="center">
            <table border="0" cellspacing="5" cellpadding="3">
               <tr>
                  <td colspan="{$cellsPerRow}" align="center">
                     <h2><xsl:value-of select="PetList/Title"/></h2></td>
               </tr>
               <xsl:apply-templates select="PetList"/>
            </table>
</td>


-->