# EXPRESIONES PARA USAR EN XSL

- ```<xsl:template match="">``` Ejecuta la transformacion de dentro de la etiqueta cuando el nodo concida con el contenido de 'match'

- ```<xsl:value-of select="">``` extrae el contenido del nodo.

     1 **Elementos** ```<xsl:value-of select="elemento">```

     2 **Atributos** ```<xsl:value-of select="@atributo"> ```
     


    > [!WARNING]
    Los saltos de linea se añaden por cada match y no por cada value-of


    ```
    EXTRAE EL VALOR DE ELEMENTOS DENTRO DEL ELEMENTO QUE BUSCAMOS

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
        <xsl:template match="libro">
            <xsl:value-of select="autor"/>
            <xsl:value-of select="titulo"/>
        </xsl:template>
    </xsl:stylesheet>
    ```

    ```
    EXTRAE EL VALOR DEL PROPIO ELEMENTO

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
        <xsl:template match="libro">
            <xsl:value-of select="."/>
        </xsl:template>
    </xsl:stylesheet>
    ```

    ```
    EXTRAE EL VALOR DEL ATRIBUTO DEL ELEMENTO

    <xsl:template match="fechaPublicacion">
    <xsl:value-of select="@año"/>
    </xsl:template>
    ```
    > [!WARNING]
    El procesador XSLT sólo aplica una transformación, de tener dos match para el mismo nodo solo se le aplicará uno de ellos.

    ```
    EJEMPLO DE COMO TRANSFORMAR EN TEXTO

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="libro">
        <p><xsl:value-of select="autor"/> escribió "<xsl:value-of select="titulo"/>"</p>
    </xsl:template>
    </xsl:stylesheet>

    RESULTADO

    <?xml version="1.0" encoding="UTF-8"?>
    
    <p>Milan Kundera escribió "La vida está en otra parte"</p>
    
    <p>Mario Vargas Llosa escribió "Pantaleón y las visitadoras"</p>
    
    <p>Mario Vargas Llosa escribió "Conversación en la catedral"</p>`´

    ```


-```<xsl:apply-templates />``` hace que se apliquen a los subelementos las reglas que le sean aplicables.

```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0">
 <xsl:template match="/">
 <html>
 <h1>Autores</h1>
 <xsl:apply-templates />
 </html>
 </xsl:template>
 <xsl:template match="libro">
 <p><xsl:value-of select="autor"/></p>
 </xsl:template>
</xsl:stylesheet>
```
-```<xsl:strip-space elements="*"/> ``` Si añadimos esta instrucción las lineas aparecerán sangradas y un elemento por cada linea.
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0">
 <xsl:strip-space elements="*" />
 <xsl:template match="/">
 <html>
 <h1>Autores</h1>
 <xsl:apply-templates />
 </html>
 </xsl:template>
 <xsl:template match="libro">
 <p><xsl:value-of select="autor"/></p>
 </xsl:template>
</xsl:stylesheet>

RESULTADO

<?xml version="1.0" encoding="UTF-8"?>
<html>
 <h1>Autores</h1>
 <p>Milan Kundera</p>
 <p>Mario Vargas Llosa</p>
 <p>Mario Vargas Llosa</p>
</html>
```

-```<xsl:text/> ``` Si añadimos esta instrucción las lineas aparecerán sangradas y un elemento por cada linea.(```&#10;``` es un salto de linea)

```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0">
 <xsl:template match="/">
 <html>
 <xsl:text>&#10; </xsl:text>
 <h1>Autores</h1>
 <xsl:apply-templates />
 </html>
 </xsl:template>
 <xsl:template match="libro">
 <p><xsl:value-of select="autor"/></p>
 </xsl:template>
</xsl:stylesheet>

RESULTADO

<?xml version="1.0" encoding="UTF-8"?>
<html>
 <h1>Autores</h1>
 <p>Milan Kundera</p>
 <p>Mario Vargas Llosa</p>
 <p>Mario Vargas Llosa</p>
</html>

```