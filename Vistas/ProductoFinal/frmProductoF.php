<form class="form" action="/Mix-Sand/?C=ProductoFinal&M=insertarProFinal" method="POST">
  <link rel="stylesheet" href="Vistas/EstilosVistas/crearSand.css">
  <div class="d1">
  <h2>Escoge</h2>
    <div class="form-group">
      <label for="Descripcion">Ingrediente:</label>
      <input type="text" id="Descripcion" name="txtDesc" required>
    </div>
     <div class="form-group">
      <label for="precio">$Precio:</label>
      <input type="text" id="precio" name="txtPrecio" required>
    </div>
    <div class="form-group">
      <label for="idCliente">Tu ID:</label>
      <input type="text" id="idCliente" name="txtid" required>
    </div>
    <div class="form-group">
      <label for="stock">Cantidad:</label>
      <input type="text" id="stock" name="txtStock" required>
    </div>
    
    <div class="form-group">
      <button type="submit" id="b">Guardar</button>
    </div>
  </form>
  </div>
    

<br></br>
<div class="table-container">
  <table class="centered-table">
    <thead>
      <tr>
        <th>idProductoFinal</th>
        <th>Ingrediente</th>
        <th>Precio</th>
        <th>Tu ID</th>
        <th>Cantidad</th>
        <th>Acción</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
            while ($fila= $Consulta->fetch_object()) {
              echo '<form class="form" action="/Mix-Sand/?C=ProductoFinal&M=ActualizarXEliminar" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtidProductoF" value="'.$fila->idProducto.'" readonly> </td>';
                echo '<td> <input type="text" name="txtDesc" value="'.$fila->Descripcion.'" ></td>';
                echo '<td> <input type="text" name="txtPrecio" value="'.$fila->precio.'" ></td>';
                echo '<td> <input type="text" name="txtidCli" value="'.$fila->idCliente.'" ></td>';
                echo '<td width=10> <input type="text" size="5" name="txtCantidad" value="'.$fila->Cantidad.'" ></td>';
                echo '<td width=250>';
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