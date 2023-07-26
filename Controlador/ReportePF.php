<?php

include_once 'Modelo/clsReporte.php';


class ReportePF
{
	private $vista;

	public function iniciaformulario()
    {	
        $Repor= new clsReporte();
        $Consulta=$Repor->ConsultaPfinal();
		$vista="Vistas/ProductoFinal/frmReportePfinal.php";
        include_once("Vistas/frmPlantillaCliente.php");
    }
}
?>