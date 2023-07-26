
<form class="form" action="/Mix-Sand/?C=login&M=RegistraEmpleados" method="POST">
<link rel="stylesheet" href="Vistas/EstilosVistas/RegistroEmpleado.css">

<div class="d1">
    <h2>Registro Empleados</h2>
    <div>
    <img src="img/seseion.avif" alt="" width="100px">
    </div>
    <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="txtnombre" pattern="[A-Za-z] ?+" minlength="3" maxlength="30" required>
      <label for="Apaterno">Apellido Paterno:</label>
      <input type="text" id="Apaterno" name="txtApaterno" pattern="[A-Za-z] ?+" minlength="3" maxlength="30" required>
      <label for="Amaterno">Apellido Materno:</label>
      <input type="text" id="Amaterno" name="txtAmaterno" pattern="[A-Za-z] ?+" minlength="3" maxlength="30" required>
      <label for="telefono">Telefono:</label>
      <input type="tel" id="telefono" name="txtTelefono" pattern="[0-9]{8,12}" maxlength="10" required>
      <label for="direccion">Direccion:</label>
      <input type="text" id="direccion" name="txtDireccion" required>
      <label for="usuario">Usuario:</label>
      <input type="text" id="usuario" name="txtusuario" pattern="[A-Za-z] ?+" minlength="3" maxlength="30" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="txtpassword" pattern="[A-Za-z] ?+" minlength="3" maxlength="30" required>
      <button id="b" type="submit">Registrar</button>
</div>
  </form>

<br></br>
<div class="table-container">
<link rel="stylesheet" href="Vistas/EstilosVistas/RegistroEmpleado.css">
  <table class="centered-table">
    <thead>
      <tr>
        <th>Id Empleado</th>
        <th>Nombre</th>
        <th>Apellido Paterno</th>
        <th>Apellido Materno</th>
        <th>Telefono</th>
        <th>Direccion</th>
        <th>Usuario</th>
        <th>Accion</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
            while ($prod= $Consulta->fetch_object()) {

                echo '<form class="form" action="/Mix-Sand/?C=login&M=ActualizarXEliminar" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtid" value="'.$prod->idEmpleado.'"readonly></td>';
                echo '<td> <input type="text" name="txtnombre" value="'.$prod->Nombre.'"></td>';
                echo '<td> <input type="text" name="txtApaterno" value="'.$prod->APaterno.'"></td>';
                echo '<td> <input type="text" name="txtAmaterno" value="'.$prod->AMaterno.'"></td>';
                echo '<td> <input type="text" name="txtTelefono" value="'.$prod->Telefono.'"></td>';
                echo '<td> <input type="text" name="txtDireccion" value="'.$prod->Direccion.'"></td>';
                echo '<td> <input type="text" name="txtusuario" value="'.$prod->Usuario.'"></td>';
                echo '<td width=350>';
                echo '<button type="submit" name="btnActualizar" value="btnActualizar" class="submit-button" >Actualizar</button>';
                echo '&nbsp;';
                echo '<button type="submit" name="btnEliminar" value="btnEliminar" class="submit-button">Eliminar</button>';

                echo '</tr>';
                
                echo '</form>';
            }
      
      ?>
    
    </tbody>
  </table>
</div>
