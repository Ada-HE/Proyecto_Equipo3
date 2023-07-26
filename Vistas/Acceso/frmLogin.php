<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="Vistas/EstilosVistas/login.css">
</head>
<body>
<br></br>

<form class="form" action="/Mix-Sand/?C=login&M=Acceder" method="POST">
    
    <div class="d1">
      <h1>Iniciar Sesion</h1>
      <div class="form-group">
        <div class="img">
            <img src="/Mix-Sand/img/seseion.avif" alt="imgLogin" width="150">
        </div>  
        <input ttype="text" id="usuario" name="txtusuario" pattern="[A-Za-z] ?+" placeholder="Usuario" required>
      </div>
      <div class="form-group">
        <input type="password" id="password" name="txtpassword" pattern="[A-Za-z] ?+" placeholder="Contraseña" required>
      </div>

      <br>
      <select name="selectTipo" class="">
            <option value="Cliente">Cliente</option>
            <option value="Empleado">Empleado</option>
    </select>
      <div class="form-group">
        <button id="b" type="submit">Acceder</button>
      </div>
    </div>
    
  </form>


</body>
</html>