<?php

class RegistroCliente
{
    private $vista;
    
    public function MostrarRegistroCliente()
    {

        $vista="vistas/Registro/frmRegistroCliente.php";
        include_once("vistas/frmPlantilla.php");    
    }
}
?>