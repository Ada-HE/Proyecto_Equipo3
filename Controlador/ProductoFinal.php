<?php

include_once 'Modelo/clsProductoF.php';

class ProductoFinal
{
	private $vista;
	
	public function insertarProFinal()
	{
		$proFinal=new clsProductoF();
		
		if(!empty($_POST))
		{
			$Des=$_POST['txtDesc'];
			$Precio=$_POST['txtPrecio'];
			$cod=$_POST['txtid'];
			$Cant=$_POST['txtStock'];

			
			$proFinal->agregarproductofinal($Des,$Precio,$cod,$Cant);
			$Consulta=$proFinal->consultaProductoFinal();
            $proFinal=new clsProductoF();
			$vista="Vistas/ProductoFinal/frmProductoF.php";
            include_once("Vistas/frmPlantillaCliente.php");
		}
		else
		{
			$Consulta=$proFinal->consultaProductoFinal();
            $proFinal=new clsProductoF();
			$vista="Vistas/ProductoFinal/frmProductoF.php";
            include_once("Vistas/frmPlantillaCliente.php");
		}
	}
	public function ActualizarXEliminar()
	{	
	
		$proFinal=new clsProductoF();
		if(!empty($_POST))
		{
			if(isset($_POST['btnActualizar']))
			{
				
				$PF=$_POST['txtidProductoF'];
				$Des=$_POST['txtDesc'];
				$Precio=$_POST['txtPrecio'];
				$cod=$_POST['txtidCli'];
				$Cant=$_POST['txtCantidad'];

				$proFinal->Actualizar($PF,$Des,$Precio,$cod,$Cant);
				$Consulta=$proFinal->consultaProductoFinal();
                $proFinal=new clsProductoF();
				$vista="Vistas/ProductoFinal/frmProductoF.php";
                include_once("Vistas/frmPlantillaCliente.php");
			}
			else if(isset($_POST['btnEliminar']))
			{
				
				$PF=$_POST['txtidProductoF'];
				$proFinal->Eliminar($PF);
				$Consulta=$proFinal->consultaProductoFinal();
                $proFinal=new clsProductoF();
                $vista="Vistas/ProductoFinal/frmProductoF.php";
                include_once("Vistas/frmPlantillaCliente.php");
			}
			
		}
		else
		{
			$Consulta=$proFinal->consultaProductoFinal();
            $proFinal=new clsProductoF();
            $vista="Vistas/ProductoFinal/frmProductoF.php";
            include_once("Vistas/frmPlantillaCliente.php");
		}

    }
}
?>