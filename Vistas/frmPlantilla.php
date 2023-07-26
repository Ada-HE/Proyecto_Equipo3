<!DOCTYPE html>
<html>
<head>
  <title>Mix Sandwich Mix - Inicio</title>
  <link rel="stylesheet" type="text/css" href="Estilos/e2.css">
</head>
<body>
  <header>
    <nav>
      <div class="logo">
        <a href="#">Mix Sandwich</a>
      </div>
      <ul class="menu">
      <li><a href="/Mix-Sand?C=MostrarMenu&M=IniciarMenuAdmin">Inicio</a></li> 
        <li><a href="/Mix-Sand?C=ConsultaClientes&M=ConsultaClientes">Clientes</a></li>
        <li><a href="/Mix-Sand?C=Seleccion&M=insertarproductos">Ingredientes</a></li>
        <li><a href="/Mix-Sand?C=login&M=RegistraEmpleados">Registra Empleados</a></li>
        <li><a href="/Mix-Sand?C=ControladorReportes&M=reportesDireccion">Reportes</a></li>
        <li><a href="/Mix-Sand?C=login&M=cerrarsesion">Cerrar Sesion</a></li> 
      </ul>
    </nav>
  </header>
  <section class="menu-section">
   
      
  <section class="container">
       
        <?php include_once($vista); ?>
    </section>
    </div>
  
  </section>
  <section class="descripcion">
    <p></p>
  </section>
  

  <footer>
        <div class="footer-section">
            <h3>HORARIOS</h3>
            <p>Lunes a Viernes: 9:00 AM - 6:00 PM</p>
            <p>Sábados y Domingos: Cerrado</p>
        </div>
        <div class="footer-section">
            <h3>ACERCA DE:</h3>
            <p>Esta sistema sera dedicada a mix Sandwich 
      con el objetivo de crear un sitio web en donde se implementara los diferentes apartados y pestañas
       para que nuestros clientes puedan hacer uso del sistema</p>
        </div>
        <div class="footer-section">
            <h3>SIGUENOS</h3>
            <ul>
                <li><a href="https://www.facebook.com/" target="_blank">
                  <img src="img/iconos/icons8-facebook-480.png" alt="" width="40px" class="icono">
                  </a></li>
                <li><a href="https://www.instagram.com/" target="_blank">
                  <img src="img/iconos/icons8-instagram-480.png" alt="" width="40px" class="icono">
                </a></li>
                <li><a href="https://web.whatsapp.com/" target="_blank">
                  <img src="img/iconos/icons8-whatsapp-480.png" alt="" width="40px" class="icono">
                </a></li>
                <li><a href="https://www.tiktok.com/es/" target="_blank">
                  <img src="img/iconos/icons8-tiktok-480.png" alt="" width="40px" class="icono">
                </a></li>
            </ul>
        </div>
    </footer>
  
</body>
</html>