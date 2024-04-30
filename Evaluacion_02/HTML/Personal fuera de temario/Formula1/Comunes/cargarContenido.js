document.addEventListener("DOMContentLoaded", function () {
    // Función para cargar el contenido HTML desde una ruta específica
    function cargarContenido(ruta, contenedorId) {
        fetch(ruta)
            .then(response => response.text())
            .then(data => {
                document.getElementById(contenedorId).innerHTML = data;
            })
            .catch(error => {
                console.error('Error al cargar el contenido:', error);
            });
    }

    // Obtener la ruta del header desde el atributo de datos
    const rutaHeader = document.getElementById("header-container").getAttribute("data-ruta-header");
    // Cargar el contenido del header
    cargarContenido(rutaHeader, "header-container");

    // Obtener la ruta del footer desde el atributo de datos
    const rutaFooter = document.getElementById("footer-container").getAttribute("data-ruta-footer");
    // Cargar el contenido del footer
    cargarContenido(rutaFooter, "footer-container");
});
