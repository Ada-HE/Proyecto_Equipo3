<?php
include_once 'Modelo/clsMenu.php';
include_once 'Modelo/clsCompra.php';
class mostrarMenu
{
    private $vista;
    
    public function IniciarMenu()   
    {

        $vista="vistas/CrearSand/menu.php";
        include_once("vistas/frmPlantillaUsuario.php");
    }
    public function IniciarMenuAdmin()   
    {

        $vista="Vistas/Inicio/home.php";
        include_once("vistas/frmPlantilla.php");
    }
    public function IniciarInicioU()   
    {

        $vista="Vistas/Inicio/home.php";
        include_once("Vistas/frmPlantillaCliente.php");
    }
    public function Productos()
    {

        $productos= new menus();
        $compra = new compra();

        $Consulta=$productos->ConsultaProductos();
        $vista="Vistas/CrearSand/Productos.php";
        include_once("Vistas/frmPlantillaPublica.php"); 
    
    }
    public function ProductosC()
    {

        $productos= new menus();
        $compra = new compra();

        $Consulta=$productos->ConsultaProductos();
        $vista="Vistas/CrearSand/Productos.php";
        include_once("Vistas/frmPlantillaCliente.php"); 
    
    }
    public function ProductosAd()
    {

        $productos= new menus();
        $compra = new compra();

        $Consulta=$productos->ConsultaProductos();
        $vista="Vistas/CrearSand/Productos.php";
        include_once("Vistas/frmPlantilla.php"); 
    
    }
}
class Inicio
{
    private $vista;
    
    public function IniciarInicioU()   
    {

        $vista="Vistas/Inicio/home.php";
        include_once("Vistas/frmPlantillaCliente.php");
    }
    public function IniciarInicioA()   
    {

        $vista="vistas/Inicio/home.php";
        include_once("vistas/frmPlantilla.php");
    }
}

?>