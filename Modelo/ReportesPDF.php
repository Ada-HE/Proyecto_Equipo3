<?php
include_once 'Modelo/clsconexion.php';

class ReportesPDF extends clsconexion{

    public function ConsultaEmpleadosXDireccion($direccion)
	{
		$sql = "CALL Sp_ConsultaDireccionEmpleado('$direccion');";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	


}