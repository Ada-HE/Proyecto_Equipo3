<?php
session_start();
?>
<style>

.fila {
  display: flex;
}

/* Create two equal columns that sits next to each other */
.columna {
  flex: 50%;
  padding: 10px;
  height: 12em; /* Should be removed. Only for demonstration */
}
<?php 
$mensaje= null;
if (isset($_POST['cantidad'])) {
  $cantidades = $_POST['cantidad'];
  $ids = isset($_POST['id']) ? $_POST['id'] : [];
  $datos = [];
  
  foreach ($cantidades as $key => $value) {
    //Los que traen 0 no se toman en cuenta, esos no se seleccionaron 
    if ((int)$value <= 0) {continue;}
    //Valida qu e exista un id en la misma posición que cantidad, sino salta a la siguiente 
    
    if(!isset($ids[$key])) {
      continue;
    }

    $datos[] = [
      'id' => $ids[$key],
      'cantidad' => $value,
    ];
  }
  $idCompra = 0;
  if(count($datos) > 0) {
  $idCompra = (int)$compra->creaCompra(/*$_SESSION['idUsuario']*/'Brayan');
  }

  //Validas que se haya registrado la compra
  if ($idCompra == 0 ) {
    $mensaje = 'No se pudo crear tu pedido, vuelve a intentarlo';
    //No se pudo insertar, poner algo, para avisarle al usuario
  }
  else {
    //Cambiar 17 por el id del usuario
    //Además de validar que si lo que regresa agregar sea mayor a cero 
    // si es cero significa que no se agregó y hay que avisarle al usuario
    foreach ($datos as $key => $value) {
      $compra->agregar($value['id'], $value['cantidad'], $idCompra);
    }
    $mensaje = 'Se ha creado tu pedido #'.$idCompra;
  }
  
}

?>
</style>
<center>
  <link rel="stylesheet" href="Vistas/EstilosVistas/MenuElegir.css">
<h2>Menú de los ingredientes</h2>
<?php
if(isset($mensaje)){
  echo '<h5>',$mensaje,'</h5>';
}
?>
<div class="table-container">
  <!--table class="centered-table">
    <thead>
      <tr>
        <th>Código Producto</th>
        <th>Nombre</th>
        <th>Precio</th>
        <th>Imagen</th>
        <th>Categoria</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
          /*
            while ($prod= $Consulta->fetch_object()) {
                $IMAGE=$prod->Imagen;
                $IMAG='data:image/*;base64,' . base64_encode($IMAGE);
                echo '<form class="form" action="/Mix-Sand/?C=MostrarMenu&M=Productos" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtcodigo_prod" value="'.$prod->codigo_prod.'" readonly> </td>';
                echo '<td> <input type="text" name="txtnombre" value="'.$prod->Nombre.'" readonly></td>';
                echo '<td> <input type="text" name="txtprecio" value="'.$prod->Precio.'" readonly></td>';
                echo '<td> <img src="'.$IMAG.'" alt="Imagen" width=100></td>';
                echo '<td> <input type="text" name="txtcategoria" value="'.$prod->IdCategoria.'" readonly></td>';
                
                echo '</tr>';
                
                echo '</form>';
            }
          */
      ?>
    2
    </tbody>
  </table-->
  <form method="POST" class="" action="?C=MostrarMenu&M=Productos" >
  <?php 
  $numeroColumnas = 3;
  $contadorColumnas = 0;
  $categoriaActual = null;
  $tablita = '';
  $contadorFilas = 0;
  $contador = 0;
  while ($prod = $Consulta->fetch_object()) {
    // Si la categoria de la fila y la que se viene arrastrando(categoriaActual) son distintos
    // va a crear un encabezado de la categoria,
    // además, sino es la primera iteración se cerrará el div de la clase fila
    if ($categoriaActual != $prod->IdCategoria) {
      if ($contadorFilas > 0) {
        echo '</div>';
      }
      echo "<br/>";
      echo "<h3>", $prod->desc_categoria, "</h3>";
      echo "<hr>", '<div class="fila">';
      $categoriaActual = $prod->IdCategoria;
      $contadorFilas++;
    }
    $IMAG='data:image/*;base64,' . base64_encode($prod->Imagen);
    echo '<div class="columna">
      <img src="'.$IMAG.'" alt="Imagen" width=100>
      <p class="p1">'.$prod->Nombre.'<br/>
      $ '.$prod->Precio.'<br/>
      <input type="hidden" name="id['.$contador.']" value="'.$prod->Idp.'">
      <input name="cantidad['.$contador.']" type="number" value="0" min="0" style="width: 10%;"><br/>
      <!--button type="submit">Agregar</button-->
      </p>
    </div>';
    $contador++;
  }
  // Se valida si entró en el while para cerrar el último div con lase fila
  if ($contadorFilas > 0) {
    echo '</div>';
  }

  ?> 
    <button>Crear</button>
  </form>
</div>
</center>