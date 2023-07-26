
    <form class="form" action="/Mix-Sand/?C=Seleccion&M=insertarproductos" method="POST" enctype="multipart/form-data">
    <link rel="stylesheet" href="Vistas/EstilosVistas/crearEs.css">
    <div class="d1">
    <h2>Productos</h2>
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="txtnombre" required>
    </div>
    <div class="form-group">
      <label for="txtprecio">Precio:</label>
      <input type="text" id="txtprecio" name="txtprecio" required>
    </div>
    <div class="frmImg">
      <label for="txtarchivo">Imagen:</label>
      <input type="file" id="txtarchivo" name="txtarchivo" accept="image/*"  required>
    </div>
    <div class="frmCategoria">
        <select name="categoria" class="form-control">
            <?php while($filas=$Consulta->fetch_object()){ ?>
                <option value="<?php echo $filas->idCategoria; ?>"><?php echo $filas->descripcion; ?></option>
            <?php } ?>
        </select>
        
    </div>
    <div class="form-group">
      <button type="submit" id="b" >Guardar</button>
    </div>
    </div>
   
</form>

<br></br>
<br></br>
<div class="table-container">
  <table class="centered-table">
    <thead>
      <tr>
        <th>Código Producto</th>
        <th>Nombre</th>
        <th>Precio</th>
        <th>Imagen</th>
        <th>Categoria</th>
        <th>Accion</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
            while ($prod= $ConsultaProductos->fetch_object()) {
              $IMAGE=$prod->Imagen;
              $IMAG='data:image/*;base64,' . base64_encode($IMAGE);
              echo '<form class="form" action="/Mix-Sand/?C=Seleccion&M=ActualizarXEliminar" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtcodigo_prod" value="'.$prod->Idp.'" readonly> </td>';
                echo '<td> <input type="text" name="txtnombre" value="'.$prod->Nombre.'" ></td>';
                echo '<td> <input type="text" name="txtprecio" value="'.$prod->Precio.'" ></td>';
                echo '<td> <img src="'.$IMAG.'" alt="Imagen" width=100></td>';
                echo '<td> <input type="text" name="txtcategoria" value="'.$prod->IdCategoria.'" ></td>';
                echo '<td width=250>';
                echo '<button type="submit" name="btnActualizar" value="btnActualizar" class="submit-button" >Actualizar</button>';
                echo '&nbsp;';
                echo '<br>';
                echo '<button type="submit" name="btnEliminar" value="btnEliminar" class="submit-button">Eliminar</button>';
                echo '</td>';
                echo '</tr>';
                
                echo '</form>';
            }
      
      ?>
    
    </tbody>
  </table>
</div>