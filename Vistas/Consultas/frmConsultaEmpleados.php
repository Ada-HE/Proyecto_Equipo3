<center>
<h2>Reporte De Los Clientes</h2><br><br>
<link rel="stylesheet" href="Vistas/EstilosVistas/EstiloRegistroU.css">
<div class="divReporte">
  <table class="tablaReporte">
    <thead>
      <tr>
      <th>Id Empleado</th>
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
              echo '<form class="form" action="http://localhost/Mix-Sand?C=ConsultaCliente&M=ConsultaEmpleados" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->idEmpleado.'"></td>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->Nombre.'"></td>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->APaterno.'"></td>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->AMaterno.'"></td>';
                echo '<td> <input type="text" name="txtTipo" value="'.$prod->Telefono.'"></td>';
                echo '<td> <input type="text" name="txtTipo" value="'.$prod->Direccion.'"></td>';
                echo '<td> <input type="text" name="txtTipo" value="'.$prod->Usuario.'"></td>';
                echo '<td width=350>';
                echo '<button type="submit" name="btnActualizar" value="btnActualizar" class="submit-button" >Actualizar</button>';
                echo '&nbsp;';
                echo '<button type="submit" name="btnEliminar" value="btnEliminar" class="submit-button">Eliminar</button>';
                echo '</td>';
                echo '</tr>';
                
                echo '</form>';
            }
      
      ?>
    
    </tbody>
  </table>
  </div>
  </center>