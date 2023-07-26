<?php
include_once 'Modelo/clsconexion.php';

class clsLogin extends clsconexion{

	
	public function buscausuario($usuario,$passw)
	{
		$sql = "CALL Sp_BusquedaU('$usuario','$passw');";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}		
	public function buscaEmpleado($usuario,$passw)
	{
		$sql = "CALL Sp_BusquedaEmpleado('$usuario','$passw');";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}		
	public function IngresaU($usuario,$passw,$tipo)
	{
		$sql = "CALL Sp_AñadirUsuario('$usuario','$passw','$tipo');";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}
?>