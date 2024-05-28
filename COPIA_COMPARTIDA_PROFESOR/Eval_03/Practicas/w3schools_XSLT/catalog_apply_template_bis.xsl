<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>My CD Collection</h2>  
  <table border="1">
  <tr bgcolor="#9acd32">
  <th>Title</th>
  <th>Artist</th>
  </tr>
  <xsl:apply-templates/> 
  </table> 
  </body>
  </html>
</xsl:template>

<xsl:template match="cd">
<tr>
    <xsl:apply-templates select="title"/>  
    <xsl:apply-templates select="artist"/>
</tr>
</xsl:template>

<xsl:template match="title">
  <td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="artist">
  <td><xsl:value-of select="."/></td>
</xsl:template>

</xsl:stylesheet>

