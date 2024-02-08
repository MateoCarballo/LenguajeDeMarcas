<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<xsl:text> Documento HTML</xsl:text> 
</xsl:template>
</xsl:stylesheet>
<!-- Si usamos la etiqueta 'xsl:text' no podemos incorporar etiquetas dentro de ella
porque ya se entiende que rompería la lógica de usar la etiqueta
'<xsl:text>...</xsl:text> '

ESTO NO ES VALIDO

nononononon '<xsl:text> <HTML></HTML></xsl:text> '-->
