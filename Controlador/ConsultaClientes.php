<?php
include_once 'Modelo/clientes.php';
class ConsultaClientes
{
    private $vista;  
    public function ConsultaClientes()
    {

        $login= new clsClientes();

        $Consulta=$login->ConsultaClienteDatos();
        $vista="Vistas/Consultas/frmConsultaClientes.php";
        include_once("Vistas/frmPlantilla.php");    
    
    }
    public function ActualizarXEliminar()
	{	
	
		$modificar=new clsClientes();
        if(!empty($_POST))
		{
		if(isset($_POST['btnActualizar']))
		{
            $cod=$_POST['txtcodigo'];
            $nombre=$_POST['txtnombre'];
			$ap=$_POST['txtApaterno'];
			$am=$_POST['txtAmaterno'];
			$telefono=$_POST['txtTelefono'];
			$direccion=$_POST['txtDireccion'];
			$usuario=$_POST['txtusuario'];
            $modificar->ActualizaDatosCliente($cod,$nombre,$ap,$am,$telefono,$direccion,$usuario);
			$Consultaproductos=$modificar->ConsultaClienteDatos();
            $vista="Vistas/Consultas/frmConsultaCliente.php";
			include_once("Vistas/frmPlantilla.php");

			

			
		}
			else if(isset($_POST['btnEliminar']))
			{
				
				$IdCliente=$_POST['txtcodigo'];
				$modificar->EliminaCliente($IdCliente);
				$Consultaproductos=$modificar->ConsultaClienteDatos();
				$vista="Vistas/Consultas/frmConsultaCliente.php";
			    include_once("Vistas/frmPlantilla.php");
			}
			
		}	
		
		else
		{
			$Consultaproductos=$modificar->ConsultaClienteDatos();
			$vista="Vistas/Consultas/frmConsultaCliente.php";
			include_once("Vistas/frmPlantilla.php");
		}

    }

}



?>