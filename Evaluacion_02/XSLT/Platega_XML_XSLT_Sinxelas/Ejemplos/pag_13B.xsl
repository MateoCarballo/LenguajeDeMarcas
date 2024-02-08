<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/módulo/profesor">
<xsl:element name="{name()}">
<xsl:attribute name="nome">
<xsl:value-of select="text()"/>
</xsl:attribute>
</xsl:element>
</xsl:template>
</xsl:stylesheet>
