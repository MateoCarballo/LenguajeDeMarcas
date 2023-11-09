
<!--TODO cambiar todo a gallego o castellano-->
# REGLAS CREACION DTD
1. [Construcción de una DTD](#1construccion-de-una-dtd)
2. [Declaración DTD](#2-declaracion-dtd)
   1. [Declaraciones DTD dentro de un documento XML (DTD internas)](#21-declaraciones-dtd-dentro-de-un-documento-xml-dtd-internas)
   2. [Declaraciones DTD en un archivo .dtd (DTD externas)](#22-declaraciones-dtd-en-un-archivo-dtd-dtd-externas)
   3. [Declaraciones DTD en un documento con una referencia pública](#23-declaraciones-dtd-en-un-documento-con-una-referencia-pública)
3. [Definir elementos](#3-definir-elementos)
   1. [Especificaciones](#31-especificaciones)
   2. [Reglas](#32-reglas)
   3. [Modelos de contenidos](#33-modelos-de-contenidos)
   4. [Frecuencia](#34-Frecuencia)
4. [Definir atributos](#4-definir-atributos)
   1. [Atributos IMPLIED, REQUIRED e FIXED](#41-atributos-implied-required-e-fixed)
   2. [Entidades](#42-entidades)
      1. [Definición de las entidades](#421-definicion-de-las-entidades)
      2. [Uso de las entidades](#422-uso-de-las-entidades)
      3. [Tipos de entidades](#423-tipos-de-entidades)
         1. [Internas](#4231-internas)
         2. [Externas](#4232-externas)
         3. [De parámetro](#4233-de-parametro)


## 1.Construccion de una DTD.
A gramática dun documento XML defínese nun documento DTD. 
A etiqueta  ```<!DOCTYPE>``` contén a definición da gramática. A súa sintaxe é a seguinte:

	<!DOCTYPE nomeElementoRaiz [ declaracions ]>

Ou ben

	<!DOCTYPE nomeElementoRaiz SYSTEM "nomeArquivo.dtd">
		
Onde, nomeElementoRaiz é o nome do elemento raiz; declaracions define unha lista 
do conxunto de declaracións dos elementos e atributos do documento; e nomeArquivo.dtd
é o nome do arquivo da DTD.
A continuación vemos a gramática DTD correspondente ao documento XML anterior:

	<!DOCTYPE tema [
	<!ELEMENT tema (autor, apartado+)>
	<!ATTLIST tema
	titulo CDATA #REQUIRED
	unidade CDATA #REQUIRED>
	<!ELEMENT autor (#PCDATA)>
	<!ELEMENT apartado (#PCDATA)>
	<!ATTLIST apartado
	numero CDATA #REQUIRED>
	]>

## 2. Declaracion DTD.
			
### 2.1 Declaraciones DTD dentro de un documento XML (DTD internas).	
			
Declaracións DTD dentro dun documento XML (DTD internas) <!DOCTYPE> xusto despois do prólogo:
```
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!-- Declaracións DTD-->
<!DOCTYPE tema [
<!ELEMENT tema (autor, apartado+)>
<!ATTLIST tema
titulo CDATA #REQUIRED
unidade CDATA #REQUIRED>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT apartado (#PCDATA)>
<!ATTLIST apartado
numero CDATA #REQUIRED>
]>
<!-- Datos XML-->
<tema unidade="5" titulo="A linguaxe XML">
<autor>Sabela Varela</autor>
<apartado numero="1">Contido do apartado 1</apartado>
<apartado numero="2">Contido do capitulo 2</apartado>
</tema>
```
### 2.2 Declaraciones DTD en un archivo .dtd (DTD externas).

Declaracións DTD nun arquivo .dtd (DTD externas) xusto despois do prólogo e antes
 dos datos XML para indicar o arquivo que contén a definición da gramática DTD:
```
<!DOCTYPE nomeElementoRaiz SYSTEM "nomeArquivo.dtd">
```			
En primeiro lugar, imos ver o contido do arquivo tema.dtd:
```
<!ELEMENT tema (autor, apartado+)>
<!ATTLIST tema
titulo CDATA #REQUIRED
unidade CDATA #REQUIRED>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT apartado (#PCDATA)>
<!ATTLIST apartado
	numero CDATA #REQUIRED>
```
E a continuación vemos o contido do arquivo tema.xml que contén o vínculo co arquivo .dtd asociado:
```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE tema SYSTEM "tema.dtd">
<!-- Datos XML-->
<tema unidade="5" titulo="A linguaxe XML">
<autor>Sabela Varela</autor>
<apartado numero="1">Contido do apartado 1</apartado>
<apartado numero="2">Contido do capitulo 2</apartado>
</tema>
```
Con esta solución, o documento XML non é es autosuficiente e, polo tanto, o valor do atributo standalone é no.

### 2.3 Declaraciones DTD en un documento con una referencia pública.

Cando o documento é un estándar usaremos o identificador PUBLIC, a cadea de texto que o 
identifica e a súa URL. Por exemplo:
```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
```			 
## 3 Definir elementos.

A sintaxe para definir elementos é a seguinte:
```
<!ELEMENT nomeElemento contido>
```
ou ben
```
<!ELEMENT nomeElemento (tipoDeContido)>	 
```
### 3.1 Especificaciones.

-EMPTY 
```
<!ELEMENT br EMPTY> -> <br />
``` 
-ANY

-PCDATA
```
<!ELEMENT titulo (#PCDATA)>  ->  <titulo>A linguaxe XML</titulo>
```
-MIXED
```
<!ELEMENT obxecto (#PCDATA|imaxe)*>
```

Obxecto podería conter cero ou máis ocurrencias de datos de carácter (#PCDATA) e/ou
subelementos de tipo imaxe.
### 3.2 Reglas.

Esta declaración debe respectar as seguintes condicións:

– **Os datos textuais #PCDATA deben aparecer sempre en primeira posición.**

– **O grupo debe ser unha elección (separado co carácter | ).**

-**O grupo debe aparecer cero, unha ou varias veces (operador <strong>*</strong>).**


			
### 3.3 Modelos de contenidos.
	
Un modelo de contido é un patrón que establece os subelementos aceptados, e a orde na que 
estes deben estar. A continuación imos ver as distintas posibilidades:
			
- **Fillo unico**
```
	<!ELEMENT titor (nome)>
```			
```			
	<titor>
	<nome>Sara Vila Ferreiro</nome>
	</titor>
```
- **Fillos nunha orde determinada**
```
	<!ELEMENT ciclo (codigo,nome,grao)>
					
```
```					
	<ciclo>
	<codigo>CSIFC03</codigo>
	<nome>Desenvolvemento de aplicacións Web </nome>
	<grao>Superior</grao>
	</ciclo>
```					
- **Opción a que aparezan uns fillos ou outros**
```			
	<!ELEMENT ciclo ((codigo|nome),grao)>
```					
### 3.4 Frecuencia.

- **Opcional->(?)**
<!--TODO El elemento puede aparecer o no pero siempre aparecera una sola vez?-->
```
	<!ELEMENT telefono (mobil, fixo?)>
```
```		
	<telefono>
	<mobil>632323232</mobil>
	</telefono>
```		
- **1 ou máis veces ->(+)**
```
	<!ELEMENT provincia (nome, 
	(cp,poboacion)+)>
```	 
```
	<provincia>
	<nome>Lugo</nome>
	<cp>27003</cp>
	<poboacion>Lugo</poboacion>
	<cp>27850</cp>
	<poboacion>Viveiro</poboacion>
	</provincia>
```	

>[!WARNING]
>*IMPORTANTE DONDE COLOCAR LA CARDINALIDAD. NO ES LO MISMO
>```A(B*,C*)``` QUE ```A(B,C)*``` EL SEGUNDO SON CONJUNTOS DE AB Y EL PRIMERO >REPETICIONES DE ELLOS INDISTINTAMENTE*
	
- **0 ou mais veces ->(*)**
```
<!ELEMENT maquinas (ip, maquina)*)>	
```

 
- **si no aparece nada indica que el elemento debe aparecer una y solo una vez**


## 4. Definir atributos
>[!WARNING]
LOS ATRIBUTOS NO PUEDEN TENER SUBATRIBUTOS(LOS ELEMENTOS PUEDEN TENER SUBELEMENTOS)

Los atributos se usan para:

  - Definir un valor por defecto.
  
  - Definir un conjunto de valores validos.
  
  - Definir constantes.
  
  - Crear referencia entre elementos.
 
 Los atributos se definen empleando la etiqueta
 ```
<!ATTLIST nomeElemento 
	nomeAtributo1 tipo valor
	nomeAtributo1 tipo valor
	...
	>
```
	
Por ejemplo:
```
<!ELEMENT actor (#PCDATA)>
<!ATTLIST actor sexo CDATA #IMPLIED>
```

```<!ELEMENT auto (#PCDATA)
<!ATTLIST auto
codigo CDATA #REQUIRED
grao CDATA #REQUIRED>
```

### 4.1 Atributos IMPLIED, REQUIRED e FIXED

**#IMPLIED**-> Atributo opcional(Puede incluirse o no, si se especifica entre comillas se le da un valor por defecto).


```
<!ATTLIST alumno nacionalidade CDATA #IMPLIED>
 <!ATTLIST alumno nacionalidade CDATA "española">
```

**#REQUIRED** -> Atributo de caracter obligatorio.

```
<!ATTLIST alumno sexo CDATA #REQUIRED>
```

**#FIXED** -> Atributo equivalente a una constante

```
<!ATTLIST documento tipo CDATA #FIXED "pdf">
```


### 4.2 Entidades.

Las entidades pueden ser usadas como constatntes dentro del documento XML, o hacer referencia a objetos externos(Imagenes, ficheros, paginas web,etc.).

Existen entidades definibles y entidades predefinidas. Propias del lenguaje XML.

#### 4.2.1 Definicion de las entidades.
```
<!ENTITY nomeEntidad definicionEntidad>

<!ENTITY cidade "Santiago de Compostela">
```
Entidades predefinidas en XML



#### 4.2.2 Uso de las entidades.
```
<códigoFonte>
&lt;H1&gt;O operador de concatenación: &amp;&lt;/H1&gt;
</códigoFonte>
```
| Columna 1 | Columna 2 |
|-----------|-----------|
| \&lt;  | Valor 1   |
| \&gt;    | Valor 2   |
| \&amp;   | Valor 3   |
| \&apos;     | Valor 4   |
| \&quot;    | Valor 5   |
| \&#codChar;|El numero de su codigo ascii para el simbolo.  Ejemplo: \&#169; &#8594; &#169;|

#### 4.2.3 tipos de entidades.

##### 4.2.3.1 Internas.
Se declaran en el propio documento XML y se referencia exclusivamente en este.

Ejemplo:

	```
	<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
	<!DOCTYPE tarxetaVisita [
 	<!ENTITY cidade "Santiago de Compostela">]>
	<tarxetaVisita>
	<apelidos>Graña Arias</apelidos>
	<nome>Rodrigo</nome>
	<profesion>Doctor</profesion>
	<enderezo>
	<rua>Ponzano</rua>
	<numero>66</numero>
	<poboacion>&cidade;</poboacion>
	<cp>15891</cp>
	</enderezo>
	</tarxetaVisita>
	```
##### 4.2.3.2 Externas.

Permiten vincular un documento a otro mediante su URL. 
Permiten incluir contenido que no es XML, como imagenes.
Usando la palabra clave  ```SYSTEM``` permite identificar un archivo de forma local o en red.


```
<!ENTITY doc SYSTEM "http:/localhost/docsxml/outrodoc.xml”>

<!ENTITY imaxe SYSTEM "imaxe.gif" NDATA gif>
```

Ejemplo:

En la parte izquieda tenemos un documento XML que hace referencia a otro(el de su derecha) y esto es equivalente al XML de abajo.

```
<?xml version="1.0" encoding="UTF-8" ?>            		<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE entidadelibro [                               <capitulo>
 <!ENTITY capitulo1 SYSTEM "capitulo1.xml">             <para>Este é o primeiro capitulo</para>
]>                                                      </capitulo>
<entidadelibro>
 <tema>Exemplo de entidade externa</tema>
 &capitulo1;
</entidadelibro>
```

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE entidadelibro [
 <!ENTITY capitulo1 SYSTEM "capitulo1.xml">
]>
<entidadelibro>
 <tema>Exemplo de entidade externa</tema>
 <capitulo>
<para>Este é o primeiro capitulo</para>
 </capitulo>
</entidadelibro>
```


##### 4.2.3.3 De parametro.
>[!WARNING]
>LAS MAS IMPORTANTES, CREAN UN CONJUNTO DE ATRIBUTOS REPETIBLES. ENCAPSULA. SI TENEMOS QUE MODIFICICAR LO HACEMOS SOLO EN UN PUNTO.

Estan diseñadas para contener listas de atributos y modelos de contenido. Permiten modularizar las DTD.

Para definirlo lo que haremos sera entrecomillar el contenido y anadir un simbolo % antes de definir que atributos contendra.

```
<!ELEMENT envios (orixen,destino)>					
<!ELEMENT orixen EMPTY>									
<!ELEMENT destino EMPTY>								
<!ATTLIST orixen 									
		rua CDATA #REQUIRED 							
		numero CDATA #IMPLIED 							
		poboacion CDATA #REQUIRED >						
<!ATTLIST destino 									
		rua CDATA #REQUIRED 							
		numero CDATA #IMPLIED 
		poboacion CDATA #REQUIRED >
```

```
<!ELEMENT envios (orixen,destino)>
<!ENTITY % enderezo
 "rua CDATA #REQUIRED
 numero CDATA #IMPLIED
 poboacion CDATA #REQUIRED">
<!ELEMENT orixen EMPTY>
<!ELEMENT destino EMPTY>
<!ATTLIST orixen %enderezo;>
<!ATTLIST destino %enderezo;>
```
