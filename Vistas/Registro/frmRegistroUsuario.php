<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="vistas/EstilosVistas/loginU.css">
</head>
<body>
<br></br>
<form class="form" action="/Mix-Sand/?C=login&M=RegistraClientes" method="POST">
    
    <div class="d1">
    <h2>Registro Usuarios</h2>
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
    </div>
  </form>


</body>