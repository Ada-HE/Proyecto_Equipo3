<?php
include_once 'Modelo/clsconexion.php';

class compra extends clsconexion{

    public function creaCompra($cliente) {
		
		$sql = "INSERT INTO compra(idC, idCliente, total, fecha) 
        SELECT NULL, IdCliente, 0, NOW() FROM cliente WHERE Usuario = '".$cliente."';";
        echo($sql);
		$resultado = $this->conectar->query($sql);

		return $this->conectar->insert_id;
		   
	}

    public function agregar($producto, $cantidad, $idcompra)
    {
        //Buscamos el producto, para después usar su precio 
        $cantidad = (int)$cantidad;
        $sql = "INSERT INTO tbldetallescompra (idDC, idC, idP, precio, Cantidad, Subtotal)
            SELECT null, '".$idcompra."', Idp, Precio, '".$cantidad."', ".$cantidad."*Precio  
            FROM productos WHERE idP = '".$producto."';";
            echo $sql;
        $resultado = $this->conectar->query($sql);
        return $this->conectar->insert_id;
    }

}