# Lista de circuitos de Fórmula 1 en 2024
$circuitos = @(
    "Bahrein"
    "Arabia Saudita"
    "Australia"
    "Azerbaiyan"
    "Miami"
    "Emilia Romagna"
    "Monaco"
    "Espanha"
    "Canada"
    "Austria"
    "Gran Bretaña"
    "Hungria"
    "Belgica"
    "Paises Bajos"
    "Italia"
    "Singapur"
    "Japon"
    "Qatar"
    "Austin"
    "Ciudad de Mexico"
    "Sao Paulo"
    "Abu Dhabi"
)

# Crear carpeta para cada circuito
foreach ($circuito in $circuitos) {
	$rutaCarpeta = "C:\Users\Mateo\Desktop\LenguajeDeMarcas\Evaluacion_02\HTML\Personal fuera de temario\Formula1\Circuitos\$circuito"

    	New-Item -Path $rutaCarpeta -ItemType Directory
	New-Item -Path "C:\Users\Mateo\Desktop\LenguajeDeMarcas\Evaluacion_02\HTML\Personal fuera de temario\Formula1\Circuitos\$circuito\img" -ItemType Directory
	New-Item -Path "C:\Users\Mateo\Desktop\LenguajeDeMarcas\Evaluacion_02\HTML\Personal fuera de temario\Formula1\Circuitos\$circuito\$circuito.html" -ItemType File

# Agregar contenido HTML
    $contenidoHTML = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>$circuito</title>
</head>
<body>
    <h1>$circuito</h1>
    <p>Información del circuito...</p>
</body>
</html>
"@

Set-Content -Path "$rutaCarpeta\$circuito.html" -Value $contenidoHTML
}

# Mostrar mensaje de éxito
Write-Host "Carpetas creadas correctamente!"
