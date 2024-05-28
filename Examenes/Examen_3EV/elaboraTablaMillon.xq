<html>
<head>
</head>
<body>
<h2>Tabla 1.000.000 habitantes</h2>
<table border="1">
    <thead>
        <tr>
            <th>Codigo</th>
            <th>Nombre</th>
            <th>Habitantes</th>
        </tr>
    </thead>
    <tbody>
        
        {
for $i in doc("provincias.xml")//provincia
order by $i/number(numHAB) descending
return 
<tr>
<td>{data($i/@codPRO)}</td>
<td>{data($i/nomPRO)}</td>
<td>{data($i/numHAB)}</td>
</tr>
}
    </tbody>
</table>

</body>
</html>
