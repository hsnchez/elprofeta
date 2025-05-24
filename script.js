// Función para cambiar el tema
document.addEventListener('DOMContentLoaded', function() {
    // Código inicial
    console.log('El Profeta está cargando...');

    // Ejemplo de interacción
    const links = document.querySelectorAll('nav a');
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            console.log(`Navegando a ${this.getAttribute('href')}`);
        });
    });
});
