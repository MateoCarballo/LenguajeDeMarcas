<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/ciclo/modulo">
  <html>
  <head>
  <title>Ciclo</title>
  </head>
  <body>
  <h1><xsl:value-of select="."></xsl:value-of></h1>
  <p>Sesiones=<xsl:value-of select="@sesion"></xsl:value-of> </p>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
