
<!-- COSAS APLICABLES DURANTE EL EXÁMEN-->

<!-- Ejemplos de transformacion conocida -->
<xsl:template match="/">
	<html>
	<body>
	<h2>Titulo</h2>
	<!-- Al no especificar usará en primer lugar la primera que encuentre-->
	<xsl:apply-templates/>
	</body>
	</html>
</xsl:template>

	<xsl:template match="cd">
		<p>
			<!-- Especifica cual quiere usar en cada parte-->
			<xsl:apply-templates select="title"/>
			<xsl:apply-templates select="artist"/>
		</p>
	</xsl:template>

	<xsl:template match="title">
		<xsl:text>Title:</xsl:text>
		<span style=color:#f00>
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>

	<xsl:template match="artist">
		<xsl:text>Artist:</xsl:text>
		<span style=color:#0f0>
			<xsl:value-of select="."/>
		</span>
		<br/>
	</xsl:template>
		
</xsl:template>



<!-- 1) BUCLE For-Each-->

<xsl:for-each select="NodoSobreElQueIterar">
	<!--Contenido a cambiar en cada iteración-->
</xsl:for-each>

<!-- 2) ORDENACIÓN CON Sort-->

<xsl:sort select="//NodoParaOrdenar"/>


<!-- 2.1) Ordenación combinada con iteración -->

<xsl:for-each select="NodoSobreElQueIterar">
	<xsl:sort select="//NodoParaOrdenar"/>
	<!--TRANSFORMACIONES PERTINENTES-->
</xsl:for-each>

<!-- 3) Condicionales -->


<!-- 3.1) Condicional IF -->
<xsl:if test="price &gt; 10">
	<!-- Transformacion condicionada -->
</xsl:if>

<!--3.1.A.) Condicional IF para saber si existe o no un elemento con el atributo 'select=nodo'-->
<xsl:if select="//nodo">
  <!-- Transformación condicionada -->
  <mensaje>Al menos existe un nodo como el del select.</mensaje>
</xsl:if>


<!--3.1.B) Condicional IF con dos condiciones 'test' y 'test2'-->

<xsl:if test="price &gt; 10" test2="price &lt; 20">
  <!-- Transformación condicionada -->
</xsl:if>

<!--3.1.C) Condicional IF expresandolos de una forma absoluta-->

<xsl:if test="catalog/cd/year &lt; 1990">
  <!-- Transformación condicionada -->
</xsl:if>

<!-- 3.1.1) Condicionales combinada con iteración -->
<xsl:for-each select="NodoSobreElQueIterar">
<xsl:if test="price &gt; 10">
	<!-- Transformacion condicionada -->
</xsl:if>
</xsl:for-each>

<!-- 3.1.2) Condicionales combinada con iteración -->
<xsl:for-each select="NodoSobreElQueIterar">
<xsl:if test="price &gt; 10">
	<!-- Transformacion condicionada -->
</xsl:if>
</xsl:for-each>


<!-- 3.2.1) Condicional CHOOSE-OTHERWISE -->

<xsl:choose>
	<xsl:when test="nodo > valor">
		<!-- Transformaciones que cumplen la/s condicion/es-->
	</xsl:when>
	<xsl:otherwise>
		<!-- Transformaciones que NO cumplen la/s condicion/es-->
	</xsl:otherwise>
</xsl:choose>	

<!-- 3.2.2) Condicional CHOOSE-OTHERWISE con iteración -->

<xsl:for-each select="NodoSobreElQueIterar">
	<xsl:choose>
		<xsl:when test="nodo > valor">
			<!-- Transformaciones que cumplen la/s condicion/es-->
		</xsl:when>
		<xsl:otherwise>
			<!-- Transformaciones que NO cumplen la/s condicion/es-->
		</xsl:otherwise>
	</xsl:choose>
</xsl:for-each>


<!--4.) Ordenación-->

<xsl:sort select="nodo"/>

<!-- Introducirlo dentro de un nodo for each hace que el nuevo documento se ordene en funcion del valor 
del nodo introducido en el atributo select-->

<!--5.) TABLAS DE EJEMPLO -->

<!-- 5.1) Ejemplo de transformacion USANDO TEMPLATES Y APPLYTEMPLATES para crear tabla en HTML con encabezado -->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
      <xsl:element name="HTML">
      <xsl:attribute name="lang">es</xsl:attribute>
          <!--Etiqueta head-->
          <xsl:element name="head" >
              <xsl:element name="meta">
                  <xsl:attribute name="charset">UTF-8</xsl:attribute>
              </xsl:element>
              <xsl:element name="meta">
                  <xsl:attribute name="name">viewport</xsl:attribute>
                  <xsl:attribute name="content">width=device-width, initial-scale=1.0</xsl:attribute>
              </xsl:element>
              <xsl:element name="title">Tabla</xsl:element>
              <xsl:element name="style">
                  h2{color:red}
                  table{border: solid;border-collapse:collapse;width:300px;background-color:red;
                  font-size:1px;}
              </xsl:element>
          </xsl:element>
          <!--Etiqueta body-->
          <xsl:element name="body">
              <xsl:element name="h2">Tabla Ejemplo</xsl:element>
              <xsl:element name="table">
                  <xsl:attribute name="border">1</xsl:attribute>
                  
                  <xsl:element name="thead">
                      <xsl:element name="tr">
                          <xsl:element name="th">Encabezado 1</xsl:element>
                          <xsl:element name="th">Encabezado 2</xsl:element>
                          <xsl:element name="th">Encabezado 3</xsl:element>
                      </xsl:element>
                  </xsl:element>

                   <xsl:element name="tbody">
                      <xsl:apply-templates select="//cd"/>
                  </xsl:element>
                  
              </xsl:element>
          </xsl:element>
      </xsl:element>
  </xsl:template>
  
<xsl:template match="cd">
    <xsl:element name="tr">
         <xsl:element name="td">
            <xsl:value-of select="title"/>
         </xsl:element>
         <xsl:element name="td">
            <xsl:value-of select="artist"/>
         </xsl:element>
    </xsl:element>
</xsl:template>  
  
</xsl:stylesheet>

<!-- 5.2) Ejemplo de transformacion USANDO ITERACION(Bucle) for-each para crear tabla en HTML con encabezado-->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
      <xsl:element name="HTML">
      <xsl:attribute name="lang">es</xsl:attribute>
          <!--Etiqueta head-->
          <xsl:element name="head" >
              <xsl:element name="meta">
                  <xsl:attribute name="charset">UTF-8</xsl:attribute>
              </xsl:element>
              <xsl:element name="meta">
                  <xsl:attribute name="name">viewport</xsl:attribute>
                  <xsl:attribute name="content">width=device-width, initial-scale=1.0</xsl:attribute>
              </xsl:element>
              <xsl:element name="title">Tabla</xsl:element>
              <xsl:element name="style">
                  h2{color:red}
                  table{border: solid;border-collapse:collapse;width:300px;background-color:red;
                  font-size:16px;}
              </xsl:element>
          </xsl:element>
          <!--Etiqueta body-->
          <xsl:element name="body">
              <xsl:element name="h2">Tabla Ejemplo</xsl:element>
              <xsl:element name="table">
                  <xsl:attribute name="border">1</xsl:attribute>
                  <xsl:element name="thead">
                      <xsl:element name="tr">
                          <xsl:element name="th">Encabezado 1</xsl:element>
                          <xsl:element name="th">Encabezado 2</xsl:element>
                      </xsl:element>
                  </xsl:element>
                   <xsl:element name="tbody">
                   <!--BUCLE FOR-EACH-->
                     <xsl:for-each select="//cd">
                          <xsl:element name="tr">
                              <xsl:element name="td">
                              <xsl:value-of select="title"/>
                              </xsl:element>
                              <xsl:element name="td">
                              <xsl:value-of select="artist"/>
                              </xsl:element>
                          </xsl:element>
                     </xsl:for-each>
                  </xsl:element>
                  
              </xsl:element>
          </xsl:element>
      </xsl:element>
  </xsl:template>
    
</xsl:stylesheet>
