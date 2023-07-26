<center>
<h2>Reporte De Los Clientes</h2><br><br>
<link rel="stylesheet" href="Vistas/EstilosVistas/EstiloRegistroU.css">
<div class="divReporte">
  <table class="tablaReporte">
    <thead>
      <tr>
      <th>Id</th>
        <th>Nombre</th>
        <th>Apellido Paterno</th>
        <th>Apellido Materno</th>
        <th>Telefono</th>
        <th>Direccion</th>
        <th>Usuario</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
            while ($prod= $Consulta->fetch_object()) {
              echo '<form class="form" action="http://localhost/Mix-Sand?C=ConsultaClientes&M=ActualizarXEliminar" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtcodigo" value="'.$prod->IdCliente.'"readonly></td>';
                echo '<td> <input type="text" name="txtnombre" value="'.$prod->Nombre.'"readonly></td>';
                echo '<td> <input type="text" name="txtApaterno" value="'.$prod->APaterno.'"readonly></td>';
                echo '<td> <input type="text" name="txtAmaterno" value="'.$prod->AMaterno.'"readonly></td>';
                echo '<td> <input type="text" name="txtTelefono" value="'.$prod->Telefono.'"readonly></td>';
                echo '<td> <input type="text" name="txtDireccion" value="'.$prod->Direccion.'"readonly></td>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->Usuario.'"readonly></td>';
              
                echo '</tr>';
                
                echo '</form>';
            }
      
      ?>
    
    </tbody>
  </table>
  </div>
  </center>