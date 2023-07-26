<?php
include_once 'Modelo/clsconexion.php';

class clsClientes extends clsconexion{

	
	public function ConsultaClienteDatos()
	{
		$sql = "CALL Sp_TablaClientes();";

		$resultado = $this->conectar->query($sql);	

		return $resultado;
	}
	public function AgregarCliente($nombre,$ap,$am,$telefono,$direccion,$usuario,$pssw)
	{

		$sql = "CALL sp_Icliente('$nombre','$ap','$am','$telefono','$direccion','$usuario','$pssw');";
	
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}
	
	public function AgregarEmpleado($nombre,$ap,$am,$telefono,$direccion,$usuario,$pssw)
	{

		$sql = "CALL Sp_AñadirEmpleado('$nombre','$ap','$am','$telefono','$direccion','$usuario','$pssw');";
	
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}
	public function ActualizaDatosCliente($cod,$nombre,$ap,$am,$telefono,$direccion,$usuario){

		$sql = "CALL Sp_ActualizaClientes('$cod','$nombre','$ap','$am','$telefono','$direccion','$usuario');";

		$resultado = $this->conectar->query($sql);	

		return $resultado;
	}
	public function EliminaCliente($IdCliente){

		$sql = "CALL Sp_EliminaCliente('$IdCliente');";

		$resultado = $this->conectar->query($sql);	

		return $resultado;

	}
	public function ConsultaEmpleadosDatos()
	{
		$sql = "CALL Sp_TablaEmpleados();";

		$resultado = $this->conectar->query($sql);	

		return $resultado;
	}
	public function ActualizaDatosEmpleado($cod,$nombre,$ap,$am,$telefono,$direccion,$usuario){

		$sql = "CALL Sp_ActualizaEmpleado('$cod','$nombre','$ap','$am','$telefono','$direccion','$usuario');";

		$resultado = $this->conectar->query($sql);	

		return $resultado;
	}
	public function EliminaEmpleado($cod){

		$sql = "CALL Sp_EliminaEmpleado('$cod')";

		$resultado = $this->conectar->query($sql);	

		return $resultado;

	}
		
}

?>