
General XPath Xsl
https://www.mclibre.org/consultar/xml/lecciones/xml-xsl.html

Qué es XPath
https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html


## Tipos de nodos
Un documento XML puede representarse como un árbol dirigido, considerando por ejemplo los elementos como nodos y que un elemento es padre de los elementos que contiene. Pero en XPath no sólo los elementos son nodos, en realidad hay siete tipos de nodos:

Raíz -> Representado con una barra. De él cuelgan todos os demas del esquema.
Elemento
Atributo
Texto
Comentario
Instrucción de procesamiento
Espacio de nombres
Nota: La declaración DOCTYPE no se considera como nodo.


´´´   
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

´´´

<!-- Anotar la imagen de los enlaces -->

## Sintaxis de la expresiones XPath


Una expresión XPath es una cadena de texto que representa un recorrido en el árbol del documento. Las expresiones más simples se parecen a las rutas de los archivos en el explorador de Windows o en la shell de GNU/Linux.

Evaluar una expresión XPath es buscar si hay nodos en el documento que se ajustan al recorrido definido en la expresión. El resultado de la evaluación son todos los nodos que se ajustan a la expresión. Para poder evaluar una expresión XPath, el documento debe estar bien formado.

Las expresiones XPath se pueden escribir de dos formas distintas:

sintaxis abreviada: más compacta y fácil de leer, que se explica en esta lección
sintaxis completa: más larga pero con más opciones disponibles
Las expresiones XPath se pueden dividir en pasos de búsqueda. Cada paso de búsqueda se puede a su vez dividir en tres partes:

eje: selecciona nodos elemento o atributo basándose en sus nombres.
predicado: restringe la selección del eje a que los nodos cumplan ciertas condiciones.
selección de nodos: de los nodos seleccionados por el eje y predicado, selecciona los elementos, el texto que contienen o ambos.


Sintaxis abreviada
Veamos unos ejemplos de expresiones XPath de sintaxis abreviada y el resultado de su evaluación en el documento de ejemplo anterior:

´´´
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

´´´


Partes a estudiar 


Ejes

	

Predicados

" Limita mas la busqueda, podemos elegir solo elementos (dados por nosotros)
y asi filtrar mas todavía nuestras búsqueda"

```
//autor[@fechaNacimiento] 
*************************
*************************
<autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
<autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
```

```
//@fechaNacimiento/..
*************************
Cogería todos los padres sean o no autores
*************************
<autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
<autor fechaNacimiento="28/03/1936">Mario Vargas Llosa</autor>
```


```
//fechaPublicacion[@año>1970]/..


Esta formula lo que hace es buscar las fechas de publicacion que sean mayores a 1970
y una vez filtramos los datos obtenemos los elementos padres de estos elementos encontrados
en la busqueda.
```

```
//fechaPublicacion[@año>1970]/../titulo

Con esta otra formula pivotariamos sobre el elemento fechaPublicacion para, filtrando por los 
valores que indicamos entre corchetes, escoger los elementos titutlo que cumplen con la expresion.

```

```
Esta expresion //libro[autor="Mario Vargas Llosa" and fechaPublicacion/@año="1973"] y esta otra 
 son identicas //libro[autor="Mario Vargas Llosa"][fechaPublicacion/@año="1973"]
```



Seleccion de nodos

A la hora de seleccionar nodos 
```(...)/node()``` engloba a ```.../text()``` y a ```.../*```
para obtener todos los atributos deberemos usar ```//@* ```
si queremos buscar atributos dentro de elementos usaremos 
``` /elemento0/elemento1/elemento2/@*``` -> este muestra todos los atributos que cuelgan
de elemento 2



Martes, 09.01.2024 (3pl)
Contenidos: XML Path language.
Actividades didácticas:
    • Contexto de XSL: consultamos Lenguaje de Hojas de Estilo Extensible, en https://www.mclibre.org/consultar/xml/lecciones/xml-xsl.html .
    • XPath: XML Path language. Lectura de https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html . Realizamos ejemplo, biblioteca, disponible en el enlace anterior (guardamos en XPath_practicas_SintesMarco_2017). 

Recursos:

XPath Tutorial (w3schols), en https://www.w3schools.com/xml/xpath_intro.asp . Dispone de ejemplos (Try it yourself).

Tutorial de Xpath para principiantes, en https://www.ionos.es/digitalguide/paginas-web/desarrollo-web/tutorial-de-xpath/ 

XPath 1.0 Tutorial (de ZVON.org), en http://www.zvon.org/comp/r/tut-XPath_1.html

Tutorial de XPath, en https://spa.myservername.com/comprehensive-xpath-tutorial-xml-path-language 

Microsoft: Referencia de XPath, en https://learn.microsoft.com/es-es/previous-versions/dotnet/netframework-2.0/ms256115(v=vs.80) 

Online XPATH Tester, en https://www.online-toolz.com/tools/xpath-tester-online.php . Probamos copiando y pegando el ejemplo de biblioteca y experimentamos expresiones xpath.