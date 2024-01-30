# XPath

## Qué es XPath
XPath es un lenguaje que permite seleccionar nodos de un documento XML y calcular valores a partir de su contenido. Existen varias versiones de XPath aprobadas por el W3C.

noviembre de 1999: XML Path Language (XPath) 1.0
enero de 2007: XML Path Language (XPath) 2.0
diciembre de 2010: XML Path Language (XPath) 2.0 (2ª edición)
abril de 2014: XML Path Language (XPath) 3.0
marzo de 2017: XML Path Language (XPath) 3.1

## Tipos de nodos
Un documento XML puede representarse como un árbol dirigido, considerando por ejemplo los elementos como nodos y que un elemento es padre de los elementos que contiene. Pero en XPath no sólo los elementos son nodos, en realidad hay siete tipos de nodos:

- Raíz
- Elemento
- Atributo
- Texto
- Comentario
- Instrucción de procesamiento
- Espacio de nombres

> [!NOTE]
> La declaración DOCTYPE no se considera como nodo.

**Los nodos atributos y de texto no son como los nodos elemento.**  
Por ejemplo, los nodos atributo y de texto no pueden tener descendientes.
En realidad el nodo atributo ni siquiera se considera como hijo, sino como una etiqueta adosada al elemento. El texto contenido por una etiqueta sí que se considera hijo del elemento, aunque las expresiones XPath suelen trabajar con nodos elemento y para referirse a los atributos o al texto se utilizan notaciones especiales.

## Sintaxis de la expresiones XPath
Una expresión XPath es una cadena de texto que representa un recorrido en el árbol del documento. Las expresiones más simples se parecen a las rutas de los archivos en el explorador de Windows o en la shell de GNU/Linux.

Evaluar una expresión XPath es buscar si hay nodos en el documento que se ajustan al recorrido definido en la expresión. El resultado de la evaluación son todos los nodos que se ajustan a la expresión. Para poder evaluar una expresión XPath, el documento debe estar bien formado.

Las expresiones XPath se pueden escribir de dos formas distintas:

- sintaxis abreviada: más compacta y fácil de leer, que se explica en esta lección
- sintaxis completa: más larga pero con más opciones disponibles
Las expresiones XPath se pueden dividir en pasos de búsqueda. Cada paso de búsqueda se puede a su vez dividir en tres partes:

- eje: selecciona nodos elemento o atributo basándose en sus nombres.
- predicado: restringe la selección del eje a que los nodos cumplan ciertas condiciones.
- selección de nodos: de los nodos seleccionados por el eje y predicado, selecciona los elementos, el texto que contienen o ambos.

![Alt text](/Evaluacion_02/img/image.png)

### Sintaxis abreviada

#### Eje (en inglés, axis)
El eje nos permite seleccionar un subconjunto de nodos del documento y **corresponde a recorridos en el árbol del documento**. Los nodos elemento se indican mediante el nombre del elemento. Los nodos atributo se indican mediante @ y el nombre del atributo.

- /: si está al principio de la expresión, indica el nodo raíz, si no, indica "hijo". Debe ir seguida del nombre de un elemento.

- //: indica "descendiente" (hijos, hijos de hijos, etc.).

- /..: indica el elemento padre.

- |: permite indicar varios recorridos

> [!NOTE]
> En XPath 1.0 no se puede seleccionar únicamente el valor del atributo, sino que se obtienen 
> respuestas del tipo nombreDelAtributo=ValorDelAtributo

#### Predicado (en inglés, predicate)
El predicado se escribe entre corchetes, a continuación del eje. Si el eje ha seleccionado unos nodos, el predicado permite restringir esa selección a los que cumplan determinadas condiciones.

- [@atributo]: selecciona los elementos que tienen el atributo.

```
//autor[@fechaNacimiento]
```

- [número]: si hay varios resultados selecciona uno de ellos por número de orden; last() selecciona el último de ellos.

```
//libro[1]
//libro[last()]
//libro[last()-1]
```

- [condicion]: selecciona los nodos que cumplen la condición.

Los predicados permiten definir condiciones sobre los valores de los atributos. En las condiciones se pueden utilizar los operadores siguientes:

operadores lógicos: and, or, not()
operadores aritméticos: +, -, *, div, mod
operadores de comparación: =, !=, <, >, <=, >=
		
Las comparaciones se pueden hacer entre valores de nodos y atributos o con 
cadenas de texto o numéricas. Las cadenas de texto deben escribirse entre 
comillas simples o dobles. En el caso de las cadenas numéricas, las comillas son optativas.

La condición puede utilizar el valor de un atributo (utilizando @) o el texto que contiene el elemento.
En los ejemplos siguientes se obtienen respectivamente los elementos <fechaPublicacion> cuyo atributo año es posterior/mayor a 
1970 y los elementos <libro> cuyo subelemento <autor> tiene como contenido "Mario Vargas Llosa":
<!--TODO revisar estas expresiones completas-->
```
Expresion XPath simplificada
//fechaPublicacion[@año>1970]

Expresion XPath completa
/descendant::fechaPublicacion[attribute::año>1970]

```
```
Resultado
<fechaPublicacion año="1973"/>
<fechaPublicacion año="1973"/>
```
Para hacer referencia al propio valor del elemento seleccionado se utiliza el punto (.)

<!-- TODO Revisar esta version completa, duda en como escribir un descendiente que es un atributo -->

```
Expresion Simple
//@año[.>1970]
//autor[.="Mario Vargas Llosa"]

Expresion XPath completa
/descendant::fechaPublicacion/attribute:: año[self::=1970]
/descendant::autor[self::node()="Mario Vargas Llosa"]

```
Un predicado puede contener condiciones compuestas.
<!-- TODO como definir los atributos en la forma completa cuando los estamos usando en un predicado. Son los predicados iguales para ambas formas(Simplificada y completa ?)-->

```
//libro[autor="Mario Vargas Llosa" and fechaPublicacion/@año="1973"]

/descendant::libro[child::autor="Mario Vargas Llosa" and descendant::fechaPublicacion/atttribute::año=1973]

```

```
//libro[autor="Mario Vargas Llosa" or fechaPublicacion/@año="1973"]
```

Se pueden escribir varios predicados seguidos.
```
//libro[autor="Mario Vargas Llosa"][fechaPublicacion/@año="1973"]
```
		
#### 	Selección de nodos (en inglés, node test)
La selección de nodos se escribe a continuación del eje y el predicado. Si el eje y el predicado han seleccionado unos nodos, la selección de nodos indica con qué parte de esos nodos nos quedamos.

- /node(): selecciona todos los hijos (elementos o texto) del nodo.
- //node(): selecciona todos los descendientes (elementos o texto) del nodo.

- /text(): selecciona únicamente el texto contenido en el nodo.
- //text(): selecciona únicamente el texto contenido en el nodo y todos sus descendientes.	
	
- /*: selecciona todos los hijos (sólo elementos) del nodo.
- //*: selecciona todos los descendientes (sólo elementos) del nodo.	
	
- /@*: selecciona todos los atributos del nodo.
- //@*: selecciona todos los atributos de los descendientes del nodo.	

> [!NOTE]
> En XPath 1.0 no se puede seleccionar únicamente el valor del atributo, sino que se obtienen respuestas del tipo nombreDelAtributo=ValorDelAtributo	

#### Pasos de búsqueda consecutivos
Una expresión XPath puede contener varios pasos de búsqueda consecutivos. 
Cada uno incluirá su eje (y en su caso, su predicado) y el último paso de búsqueda incluirá en su caso una selección de nodos. Cada paso de búsqueda trabaja a partir de los nodos seleccionados por el paso de búsqueda anterior.

En el ejemplo siguiente se obtienen los títulos de los libros publicados después de 1970, mediante dos pasos de búsqueda:

en el primer paso (//fechaPublicacion[@año>1970]) se seleccionan los elementos <fechaPublicacion> cuyo atributo año es superior a 1970.
en el segundo paso (/../titulo), se seleccionan primero los elementos padre (/..) de los <fechaPublicacion> seleccionados en el primer paso de búsqueda (es decir, elementos <libro>) y a continuación sus subelementos <titulo>.

```
//fechaPublicacion[@año>1970]/../titulo
```
Un determinado resultado se puede obtener mediante un sólo paso de búsqueda o mediante varios pasos.

En los ejemplos siguientes se obtienen los libros escritos por Mario Vargas Llosa de dos formas distintas:
mediante un sólo paso de búsqueda. Se seleccionan los elementos <libro> cuyo subelemento <autor> tiene como contenido la cadena "Mario Vargas Llosa".

```
//libro[autor="Mario Vargas Llosa"]
```

mediante dos pasos de búsqueda. En el primer paso se seleccionan los elementos <autor> cuyo contenido es la cadena "Mario Vargas Llosa". En el segundo paso de búsqueda se seleccionan los elementos padre (es decir, los elementos <libro>).

```
//autor[.="Mario Vargas Llosa"]/..
```
En los ejemplos siguientes se obtiene el autor que ha publicado libros en 1969 de varias formas distintas:

```
1. //@año[.=1969]/../../autor
2. //libro[fechaPublicacion/@año=1969]/autor
3. //fechaPublicacion[@año=1969]/../autor
4. //fechaPublicacion[@año=1969]/../autor
```

#### Expresiones anidadas
Las expresiones XPath pueden anidarse, lo que permite definir expresiones más complicadas. Por ejemplo, en el documento utilizado anteriormente:

```
<?xml version="1.0" encoding="UTF-8"?>
<biblioteca>
  <libro>
    <titulo>La vida está en otra parte</titulo>
    <autor>Milan Kundera</autor>
    <fechaPublicacion año="1973"/>
  </libro>
  <libro>
    <titulo>Pantaleón y las visitadoras</titulo>
    <autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
    <fechaPublicacion año="1973"/>
  </libro>
  <libro>
    <titulo>Conversación en la catedral</titulo>
    <autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
    <fechaPublicacion año="1969"/>
  </libro>
</biblioteca>
```
Un ejemplo de expresión anidada sería, por ejemplo, obtener los títulos de los libros publicados el mismo año que la novela "La vida está en otra parte". Esta información no está directamente almacenada en el documento, pero se puede obtener la respuesta en dos pasos:
- Ejemplo A:
	1. Obtener primero el año en que se publicó la novela "La vida está en otra parte":

		Expresion XPath
		```
		//libro[titulo="La vida está en otra parte"]/fechaPublicacion/@año
		```
		Resultado
		```
		año="1973"
		```
	2. Obtener después los títulos de los libros publicados en 1973:
		Expresion XPath
		```
		//libro[fechaPublicacion/@año=1973]/titulo
		```
		Resultado
		```
		<titulo>La vida está en otra parte</titulo>
		<titulo>Pantaleón y las visitadoras</titulo>
		```

	3. Estas dos expresiones se pueden unir en una única expresión, sustituyendo en la segunda 		expresión el valor 1973 por la primera expresión:
		Expresión XPath
		```
		//libro[fechaPublicacion/@año=//libro[titulo="La vida está en otra parte"]/fechaPublicacion/@año]/titulo
		```
		Resultado
		```
		<titulo>La vida está en otra parte</titulo>
		<titulo>Pantaleón y las visitadoras</titulo>
		```

- Ejemplo B.

Como cada una de las expresiones puede escribirse de varias maneras, en realidad hay muchas formas de encontrar la respuesta. Por ejemplo, en la solución siguiente los predicados se encuentran al final del eje en cada subexpresión:

Expresion XPath
```
//titulo[../fechaPublicacion/@año=//@año[../../titulo="La vida está en otra parte"]]
```

Resultado
```
<titulo>La vida está en otra parte</titulo>
<titulo>Pantaleón y las visitadoras</titulo>
```



- Ejemplo C.

	1. Obtener primero el autor de la novela "Pantaleón y las visitadoras":

	Expresión XPath
	```
	//libro[titulo="Pantaleón y las visitadoras"]/autor/text()
	```
	Resultado
	```
	Mario Vargas Llosa
	```
	2. Obtener después los títulos de los libros escritos por Mario Vargas Llosa:
	```
	//libro[autor="Mario Vargas Llosa"]/titulo
	```
	```
	<titulo>Pantaleón y las visitadoras</titulo>
	<titulo>Conversación en la catedral</titulo>
	```

	3. Unir en una única expresión, sustituyendo en la segunda expresión el valor "Mario Vargas Llosa" por la primera expresión:

	Expresión XPath
	```
	//libro[autor=//libro[titulo="Pantaleón y las visitadoras"]/autor/text()]/titulo
	```
	Resultado
	```
	<titulo>Pantaleón y las visitadoras</titulo>
	<titulo>Conversación en la catedral</titulo>
	```

- Ejemplo C (Segunda versión).

	Expresion XPath
	```
	//libro[autor=//libro[titulo="Pantaleón y las visitadoras"]/autor]/titulo
	```
	Resultado
	```

	<titulo>Pantaleón y las visitadoras</titulo>
	<titulo>Conversación en la catedral</titulo>
	```


> [!NOTE]
> Este es un resumen basado en el que econtramos en [mclibre](https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html).