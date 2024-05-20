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

