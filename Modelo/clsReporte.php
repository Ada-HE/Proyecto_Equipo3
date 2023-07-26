<?php
include_once 'Modelo/clsconexion.php';

class clsReporte extends clsconexion{

	
	
	public function ConsultaPfinal()
	{
		$sql = "CALL Sp_VistaDelFINAL();";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}


?>


