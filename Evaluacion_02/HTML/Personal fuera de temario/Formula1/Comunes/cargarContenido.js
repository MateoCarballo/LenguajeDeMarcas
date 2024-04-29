document.addEventListener("DOMContentLoaded", function () {
    // Cargar el contenido del header
    fetch("../../Comunes/header.html")
        .then(response => response.text())
        .then(data => {
            document.getElementById("header-container").innerHTML = data;
        });

    // Cargar el contenido del footer
    fetch("../../Comunes/footer.html")
        .then(response => response.text())
        .then(data => {
            document.getElementById("footer-container").innerHTML = data;
        });
});
