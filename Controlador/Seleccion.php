<?php
include_once 'Modelo/clsMenu.php';
    class seleccion
    {
        private $vista;
        
        /*public function IniciarForm()   
        {
            $vista="vistas/CrearSand/crear.php";
            include_once("vistas/frmPlantillaCliente.php");
        }
        public function IniciarFormAdmin()   
        {
            $vista="vistas/CrearSand/crear.php";
            include_once("vistas/frmPlantilla.php");
        }*/
        public function insertarproductos()
	    {
		$productos=new menus();
		
		if(!empty($_POST))
		{
			$nombre=$_POST['txtnombre'];
			$precio=$_POST['txtprecio'];
            $categoria=$_POST['categoria'];
            $imagen =$_FILES['txtarchivo'];
			$imagenData = file_get_contents($imagen['tmp_name']);
			$imagenData2 =$productos->conectar->real_escape_string($imagenData);
			//echo("<script>console.log('Valor" . $nombre . "');</script>");
			$productos->insertarProductos($nombre,$precio,$categoria,$imagenData2);
			$Consulta=$productos->consultacategorias();
			$productos=new menus();
			$ConsultaProductos=$productos->ConsultaProductos();
			$vista="Vistas/CrearSand/crear.php";
        	include_once("Vistas/frmPlantilla.php");
            
		}
		else
		{
			$Consulta=$productos->consultacategorias();
			$productos=new menus();
			$ConsultaProductos=$productos->ConsultaProductos();
			$vista="Vistas/CrearSand/crear.php";
        	include_once("Vistas/frmPlantilla.php");
		}
	}
	public function ActualizarXEliminar()
	{	

		$productos=new menus();
		if(!empty($_POST))
		{
			if(isset($_POST['btnActualizar']))
			{
				
				$codigo_prod=$_POST['txtcodigo_prod'];
				$nombre=$_POST['txtnombre'];
			    $precio=$_POST['txtprecio'];
                $categoria=$_POST['txtcategoria'];
				$productos->ActualizarProducto($codigo_prod,$nombre,$precio,$categoria);
				$Consulta=$productos->consultacategorias();
				$productos=new menus();
				$ConsultaProductos=$productos->ConsultaProductos();
				$vista="Vistas/CrearSand/crear.php";
        	    include_once("Vistas/frmPlantilla.php");
			}
			else if(isset($_POST['btnEliminar']))
			{
				
				$codigo_prod=$_POST['txtcodigo_prod'];
				$productos->Eliminar($codigo_prod);
				$Consulta=$productos->consultacategorias();
				$productos=new menus();
				$ConsultaProductos=$productos->ConsultaProductos();
				$vista="Vistas/CrearSand/crear.php";
        	    include_once("Vistas/frmPlantilla.php");
			}
			
		}
		else
		{
			$Consulta=$productos->consultacategorias();
			$productos=new menus();
			$ConsultaProductos=$productos->ConsultaProductos();
			$vista="Vistas/CrearSand/crear.php";
        	include_once("Vistas/frmPlantilla.php");
		}

    }

}
    
?>