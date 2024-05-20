# GutierrezEtAl2005.pdf: bitácora

**Previo:** En eXist-db, creada la colección “gutierrez2005” (/db/gutierrez2005). Dentro de esta, se añade el archivo “libros.xml”.

**Procedimiento:** Clic en eXist-bd Launcher, luego “Open Java Admin Client”, entramos en recurso “gutierrez2005”, clic en prismáticos (Consultar la base de datos usando XPath), editamos las consultas y clic en Ejecutar.

## Pág. 12

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

** IMPORTANTE

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

Pagina 13, Ejercicio 1:

|Consulta|Resultado|
|--------|---------|
|for $b in doc("libros.xml") //libro
let $c := $b/autor
where count($c) > 2
return $b/titulo|<titulo>Data on the Web</titulo>|


Pagina 13, Ejercicio 2:

|Consulta|Resultado|
|--------|---------|
|for $b in doc("libros.xml") //libro
where $b/@año = "2000"
return $b/titulo|<titulo>Data on the Web</titulo>|

 
