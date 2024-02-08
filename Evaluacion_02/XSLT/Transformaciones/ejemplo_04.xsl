<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Asi hacemos que al encontrar un libro salte hacia el autor sin escribir el contenido de libro-->
  <xsl:template match="libro">
    <xsl:value-of select="autor"/>
  </xsl:template>
</xsl:stylesheet>


