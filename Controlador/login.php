<?php
session_start();

include_once 'Modelo/clsLogin.php';
include_once 'Modelo/clientes.php';


class login
{
	private $vista;
	
	
	public function mostrar()
	{	

        include_once("Vistas/Acceso/frmLogin.php");	
    }

	public function Acceder()
	{
		$login = new clsLogin();
	
		if (!empty($_POST))
		{

			$usuario = $_POST['txtusuario'];
			$passw = $_POST['txtpassword'];
			$tipo=$_POST['selectTipo'];
			if($tipo=='Cliente')
			{
				$datos = $login->buscausuario($usuario, $passw);
				if ($datos->num_rows > 0)
				{
					$_SESSION['idUsuario']= $usuario;
					$vista = "Vistas/Inicio/home.php";
					include_once("Vistas/frmPlantillaCliente.php");

				}
				else
			    {
				include_once("Vistas/Acceso/frmDenegado.php");
			    }
			}
			else if($tipo=='Empleado')
			{
				$datos = $login->buscaEmpleado($usuario, $passw);
				if ($datos->num_rows > 0)
				{
					$vista = "Vistas/Inicio/home.php";
					include_once("Vistas/frmPlantilla.php");
				}
				else
			    {
				include_once("Vistas/Acceso/frmDenegado.php");
			    }
			}
			else
			{
				include_once("Vistas/Acceso/frmDenegado.php");
			}
		}
	}
	
	public function MostrarRegistro()
	{
		$vista="vistas/Registro/frmRegistroUsuario.php";
        include_once("vistas/frmPlantillaPublica.php");	
	}
	public function RegistraClientes()
	{

		$login=new clsClientes();

		if(!empty($_POST))
		{
		
			$nombre=$_POST['txtnombre'];
			$ap=$_POST['txtApaterno'];
			$am=$_POST['txtAmaterno'];
			$telefono=$_POST['txtTelefono'];
			$direccion=$_POST['txtDireccion'];
			$usuario=$_POST['txtusuario'];
    		$pssw=$_POST['txtpassword'];
            $login->AgregarCliente($nombre,$ap,$am, $telefono, $direccion,$usuario,$pssw);
			$vista="vistas/Registro/frmRegistroUsuario.php";
			include_once("Vistas/Acceso/frmLogin.php");

			
		}
	}
	/*public function MostrarRegistroEmpleado()
	{
		$login=new clsClientes();
		$Consulta=$login->ConsultaEmpleadosDatos();
		$vista="vistas/Registro/frmRegistroUsuarioAdmin.php";
        include_once("vistas/frmPlantilla.php");	
	}*/
	public function RegistraEmpleados()
	{

		$login2=new clsClientes();

		if(!empty($_POST))
		{
			$nombre=$_POST['txtnombre'];
			$ap=$_POST['txtApaterno'];
			$am=$_POST['txtAmaterno'];
			$telefono=$_POST['txtTelefono'];
			$direccion=$_POST['txtDireccion'];
			$usuario=$_POST['txtusuario'];
    		$pssw=$_POST['txtpassword'];
            $login2->AgregarEmpleado($nombre,$ap,$am,$telefono,$direccion,$usuario,$pssw);
			$Consulta=$login2->ConsultaEmpleadosDatos();
			$login2=new clsClientes();
			$vista="vistas/Registro/frmRegistroUsuarioAdmin.php";
			include_once("Vistas/frmPlantilla.php");
		}
		else
		{
			$Consulta=$login2->ConsultaEmpleadosDatos();
			$login2=new clsClientes();
			$vista="vistas/Registro/frmRegistroUsuarioAdmin.php";
			include_once("Vistas/frmPlantilla.php");
		}
	}
	public function ActualizarXEliminar()
	{	
	
		$login2=new clsClientes();
		if(!empty($_POST))
		{
			if(isset($_POST['btnActualizar']))
			{
				$cod=$_POST['txtid'];
				$nombre=$_POST['txtnombre'];
			    $ap=$_POST['txtApaterno'];
			    $am=$_POST['txtAmaterno'];
			    $telefono=$_POST['txtTelefono'];
			    $direccion=$_POST['txtDireccion'];
			    $usuario=$_POST['txtusuario'];
				$login2->ActualizaDatosEmpleado($cod,$nombre,$ap,$am,$telefono,$direccion,$usuario);
				$login2=new clsClientes();
				$Consulta=$login2->ConsultaEmpleadosDatos();
				$login2=new clsClientes();
				$vista="Vistas/Registro/frmRegistroUsuarioAdmin.php";
			    include_once("Vistas/frmPlantilla.php");
			}
			else if(isset($_POST['btnEliminar']))
			{
				
				$cod=$_POST['txtid'];
				$login2->EliminaEmpleado($cod);
				$Consulta=$login2->ConsultaEmpleadosDatos();
				$login2=new clsClientes();
				$vista="vistas/Registro/frmRegistroUsuarioAdmin.php";
			    include_once("Vistas/frmPlantilla.php");
			}
			
		}
		else
		{
			$Consulta=$login2->ConsultaEmpleadosDatos();
			$login2=new clsClientes();
			$vista="vistas/Registro/frmRegistroUsuarioAdmin.php";
			include_once("Vistas/frmPlantilla.php");
		}

    }

	public function cerrarsesion()
    {
      session_destroy();
	  $vista="Vistas/Inicio/home.php";
      include_once("vistas/frmPlantillaPublica.php");
    }
}
?>