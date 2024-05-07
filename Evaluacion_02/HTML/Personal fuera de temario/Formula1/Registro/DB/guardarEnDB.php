<?php
// Configuración de la conexión a la base de datos
$servername = "localhost"; // Cambia esto por la dirección de tu servidor MySQL
$username = "root"; // Cambia esto por tu nombre de usuario de MySQL
$password = "1234ñ!"; // Cambia esto por tu contraseña de MySQL
$dbname = "usuarios"; // Cambia esto por el nombre de tu base de datos

// Crear la conexión 
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Recuperar los datos del formulario
$genero = $_POST['Género'];
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$fechaNacimiento = $_POST['fechaNacimiento'];
$paisDeNacimiento = $_POST['paisDeNacimiento'];
$correo = $_POST['correo'];
$clave = $_POST['clave'];

// Crear y ejecutar la consulta SQL para insertar los datos en la tabla
$sql = "INSERT INTO registros (genero, nombre, apellido, fecha_nacimiento, pais_nacimiento, correo, clave)
        VALUES ('$genero', '$nombre', '$apellido', '$fechaNacimiento', '$paisDeNacimiento', '$correo', '$clave')";

if ($conn->query($sql) === TRUE) {
    echo "Registro guardado correctamente";
} else {
    echo "Error al guardar el registro: " . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>
