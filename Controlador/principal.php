<?php
    class DefaultController
    {
        private $vista;
        
        public function index()
        {
            $vista="Vistas/Inicio/home.php";
            include_once("Vistas/frmPlantillaPublica.php");
        }
        public function indexAd()
        {
            $vista="Vistas/Inicio/home.php";
            include_once("Vistas/frmPlantilla.php");
        }
        public function indexC()
        {
            $vista="Vistas/Inicio/home.php";
            include_once("Vistas/frmPlantillaCliente.php");
        }
    }
?>