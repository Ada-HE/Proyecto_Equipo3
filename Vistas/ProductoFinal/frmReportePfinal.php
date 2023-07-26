

<br><br> 
<link rel="stylesheet" href="Vistas/EstilosVistas/TablaCompra.css">
  <div class="table-container">
    <h2>Detalles Compra</h2>
  <table class="centered-table">
    <thead>
      <tr>
        <th>Id Final</th>
        <th>IdProducto</th>
        <th>Total a pagar</th>
        <th>ID del Cliente</th>
        <th>Ingrediente</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
        
            while ($fila= $Consulta->fetch_object()) {
                echo '<form class="form" action="/Mix-Sand?C=ReportePF&M=iniciaformulario" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtId" value="'.$fila->Idfinal.'" readonly> </td>';
                echo '<td> <input type="text" name="txtidprod" value="'.$fila->Idproducto.'" readonly> </td>';
                echo '<td> <input type="text" name="txttotal" value="'.$fila->Total.'" readonly></td>';
                echo '<td> <input type="text" name="txtidcli" value="'.$fila->Idcliente.'" readonly></td>';
                echo '<td> <input type="text" name="txtDesc" value="'.$fila->Descripcion.'" readonly></td>';
                echo '</tr>';
              echo '</form>';    
            }

      ?>
    
    </tbody>
  </table>
</div>
