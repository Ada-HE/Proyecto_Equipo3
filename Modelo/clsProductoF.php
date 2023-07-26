<?php
include_once 'Modelo/clsconexion.php';
class clsProductoF extends clsconexion{

	public function consultaProductoFinal() {
		
		$sql = "CALL Sp_TablaPF();";
		$resultado = $this->conectar->query($sql);
		return $resultado;
		   
	}
    public function agregarproductofinal($Des,$Precio,$cod,$Cant) {
		
		$sql = "CALL Sp_InsertaProductoF('$Des','$Precio','$cod','$Cant');";
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
		   
	}
	public function Actualizar($PF,$Des,$Precio,$cod,$Cant)
	{
		$sql = "CALL Sp_ActualizaPF('$PF','$Des','$Precio','$cod','$Cant');";
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}
	public function Eliminar($PF)
	{
		
		$sql = "CALL Sp_EliminaPF('$PF');";
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}
}

?>