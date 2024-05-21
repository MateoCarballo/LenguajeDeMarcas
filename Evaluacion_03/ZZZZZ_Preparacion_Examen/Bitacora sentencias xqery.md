# GutierrezEtAl2005.pdf: bitácora

**Previo:** En eXist-db, creada la colección “gutierrez2005” (/db/gutierrez2005). Dentro de esta, se añade el archivo “libros.xml”.

**Procedimiento:** Clic en eXist-bd Launcher, luego “Open Java Admin Client”, entramos en recurso “gutierrez2005”, clic en prismáticos (Consultar la base de datos usando XPath), editamos las consultas y clic en Ejecutar.

## EJEMPLOS xQery (sobre documento libros.xml y comentarios.xml)


### Pág. 12

Completamos la consulta como:

```xquery
for $b in doc("libros.xml") //bib/libro
return $b

es equivalente a:

for $b in doc("/db/gutierrez2005/libros.xml") //bib/libro
return $b

ensayamos con:
for $b in doc("/db/gutierrez2005/libros.xml") //bib/libro
return count($b)
resultado:
1
1
1
1

si ponemos let,
let $b := doc("/db/gutierrez2005/libros.xml") //bib/libro
return count($b)
resultado:
4
```
** IMPORTANTE

```xquery
Al usar *for* cada libro esta encerrado dentro de otro elemento '<libros>' sin embargo al usar 
*let* solo hay un elemento '<libros>' que engloba a todos los libros.

Ensayamos: for versus let:
for $b in doc("/db/gutierrez2005/libros.xml") //bib/libro
return <libros>{$b}</libros>
Resultado:
<libros><libro>…</libro></libros><libros><libro>…</libro></libros>….


let $b := doc("/db/gutierrez2005/libros.xml") //bib/libro
return <libros>{$b}</libros>

resultado:
<libros><libro>….</libro><libro>….</libro>….</libros>

``` 


```xquery
(:consulta Pagina 13, Ejercicio 1:)
for $b in doc("libros.xml") //libro
let $c := $b/autor
where count($c) > 2
return $b/titulo|<titulo>Data on the Web</titulo>|
```
```xquery
(:Pagina 13, Ejercicio 2:)
for $b in doc("libros.xml") //libro
where $b/@año = "2000"
return $b/titulo|<titulo>Data on the Web</titulo>
```







## AGRUPACION DE EJEMPLOS xQery (sobre documento canciones.xml)
```xquery
(: ejemplo 1 :)
doc("canciones.xml")/MiBibliotecaMP3/archivo/canción
```
```xquery
(: ejemplo 2 :)
doc("canciones.xml")/MiBibliotecaMP3/archivo[puntuacion=10]
```
```xquery
(: ejemplo 3 :)
doc("canciones.xml")/MiBibliotecaMP3/archivo[puntuacion>8]/canción
```
```xquery
(: ejemplo 4 :)
for $archivo in doc("canciones.xml")/MiBibliotecaMP3/archivo
where $archivo/puntuacion>8
return $archivo/canción
```

```xquery
(: ejemplo 5:)
<html>

	<head>
	
	<title>Ejemplo 5</title>

	</head>
	
	<body>
		<ol>
			{
			for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
			where $i/puntuacion>8
			order by $i/puntuacion
			return <li> {$i/canción}({$i/puntuacion}) </li>
			}
		</ol>
	</body>
</html>

```
```xquery
(: ejemplo 6:)
<html>
	<head>
		<title>Ejemplo 6</title>
	</head>

	<body>
		<ol>
		{
		for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
		where $i/puntuacion>8
		order by $i/puntuacion
		return <li> {data($i/canción)}({data($i/puntuacion)}) </li>
		}
		</ol>
	</body>
</html>
```

```xquery
(: ejemplo 7:)
<html>
	<head>
		<title>Ejemplo 7</title>
	</head>
	<body>
		<ol>
		{
		for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
		where $i/puntuacion>8
		order by $i/puntuacion
		return <li class="{data($i/@almacenado)}"> {data($i/canción)}({data($i/puntuacion)}) </li>
		}
		</ol>
	</body>
</html>
```

```xquery
(: ejemplo 8:)
<html>
	<head>
		<title>Ejemplo 8</title>
	</head>

	<body>
		<table>
			<caption>DISCO 1 </caption>
			<tr><td>Artista</td><td>Disco</td></tr>
			{
			for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
			order by $i/puntuacion
			return if ($i/@almacenado="DISCO1")
			then <tr><td>{data($i/artista)}</td><td>{data($i/disco)}</td></tr>
			else ()
			}
		</table>

		<table>
			<caption>DISCO 2 </caption>
			<tr><td>Artista</td><td>Disco</td></tr>
			{
			for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
			order by $i/puntuacion
			return if ($i/@almacenado="DISCO2")
			then <tr><td>{data($i/artista)}</td><td>{data($i/disco)}</td></tr>
			else ()
			}
		</table>
	</body>
</html>

```

```xquery
(: ejemplo 9:)
<html>
	<head>
		<title>Ejemplo 9</title>
	</head>
	
	<body>
		<table>
		<caption>CANCIONES POR DISCO </caption>
		<tr>
			<td>Artista</td>
			<td>Nombre disco</td>
			<td>Grabada en</td>
		</tr>
		{
		for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
		order by $i/puntuacion
		return if ($i/@almacenado="DISCO1")
		(:Aqui podemos omitir el usar then else para cada disco, cogiendo el valor del elemento
		en lugar de evaluarlo para dar un resultado. Ver ejemplo 10:)
		then <tr><td>{data($i/artista)}</td><td>{data($i/disco)}</td>
		     <td>DISCO1</td></tr>
		else <tr><td>{data($i/artista)}</td><td>{data($i/disco)}</td>
		     <td>DISCO2</td></tr>
		}
		</table>
	</body>
</html>
```

```xquery
(: ejemplo 10:)
<html>
     <head>
          <title>Ejemplo 10</title>
     </head>

     <body>
          <table>
          <caption>CANCIONES DE METALLICA </caption>
          <tr>
               <td>Canción</td>
               <td>Disco</td>
               <td>Grabada en</td>
          </tr>
          {
          for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
          where $i/artista="Metallica"
          order by $i/puntuacion
          return 
          <tr>
               <td>{data($i/artista)}</td>
               <td>{data($i/disco)}</td>
               <td>{data($i/@almacenado)}</td>
          </tr>
          }
          </table>
     </body>
</html>
```

```xquery
(: ejemplo 11 :)

for $i in (1 to 10)
return $i
```

```xquery
(: ejemplo 12:)
<html>
	<head>
		<title>Ejemplo 12</title>
	</head>

	<body>
		<ul>
		{
			(:$numeroDeIteracion nos devuelve el numero de elemento que es dentro del documento xml original:)
		for $archivo at $numeroDeIteracion in doc("canciones.xml")/MiBibliotecaMP3/archivo
		where $archivo/puntuacion>8
		order by $archivo/puntuacion
		return <li>{$numeroDeIteracion}. {data($archivo/canción)}({data($archivo/puntuacion)}) </li>
		}
		</ul>
	</body>
</html>
```

```xquery
(: ejemplo 13:)
for $i in (1 to 5), $j in (1,2,3)
return <resultado>i es {$i} j es {$j}</resultado>
```

```
(: ejemplo 14:)
let $i := (1 to 10)
let $j := (1,2,3)
let $k := 1 
return <resultado>i es {$i} j es {$j} k es {$k}</resultado>
```

```xquery
(: ejemplo 15:)
<html>
	<head>
		<title>Ejemplo 15</title>
	</head>
	<body>
		<ol>
		{
		for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
		where $i/puntuacion=8 or $i/puntuacion=10
		order by $i/puntuacion
		return <li class="{data($i/@almacenado)}"> {data($i/canción)}({data($i/puntuacion)}) </li>
		}
		</ol>
	</body>
</html>
```

```xquery
(: ejemplo 16:)
<html>
   <head>
      <title>Ejemplo 16</title>
   </head>
   <body>
      <ol>
      {
      (: canciones de grupos cuyo nombre empieza por "M" y 
         tienen puntuación de 9	:)
      for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
      where $i[substring(artista,1,1)="M"] and $i/puntuacion=9
      order by $i/puntuacion
      return <li> {data($i/canción)}({data($i/artista)}) </li>
      }
      </ol>
   </body>
</html>
```

```xquery
(:ejemplo 17:)
<html>
   <head>
      <title>Ejemplo 17</title>
   </head>
   <body>
   <ol>
   {
   (: canciones de grupos cuyo nombre empieza por "M" y 
      NO tienen puntuación de 9	:)
   for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
   where $i[substring(artista,1,1)="M"] and not($i/puntuacion=9)
   order by $i/puntuacion
   return <li> {data($i/canción)}({data($i/artista)}) </li>
   }
   </ol>
   </body>
</html>
```

```xquery
(: ejercicio 18:)
<html>
     <head>
     <title>Ejemplo 18</title>
     </head>

     <body>
          <table>
               <caption>CANCIONES POR DISCO </caption>
               <tr>
                    <td>Artista</td>
                    <td>Nombre</td>
                    <td>Grabada en</td>
               </tr>
               {
               for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
               order by $i/artista ascending, $i/canción descending
               return <tr>
                    <td>{data($i/artista)}</td>
                    <td>{data($i/canción)}</td>
                    <td>{data($i/@almacenado)}</td>
               </tr>
               }
          </table>
     </body>
</html>
```

```xquery
(: ejemplo 19:)
<html>
     <head>
          <title>Ejemplo 19</title>
     </head>

     <body>
          <table>
               <caption>CANCIONES POR DISCO </caption>
               <tr>
                    <td>Artista</td>
                    <td>Nombre</td>
                    <td>Grabada en</td>
               </tr>
               {
               for $i in doc("canciones.xml")/MiBibliotecaMP3/archivo
               let $numero := (substring($i/@almacenado,6,1))
               order by $i/artista ascending, $i/canción descending
               return <tr><td>{upper-case(data($i/artista))}</td><td>{data($i/canción)}</td>
                    <td>{$numero}</td></tr>
               }
          </table>
     </body>
</html>
```

```xquery
(: declaración de la función :)
declare function local:MinutosASegundos($tiempo as xs:decimal?) as xs:decimal?
{
($tiempo*60) 
};

(: llamada a la función :)
local:MinutosASegundos(14)
```
```xquery
(: Hola mundo en XQuery :)
let $var := "¡Hola Mundo!"
return $var
```