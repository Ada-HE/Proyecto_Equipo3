<?php
include_once 'Modelo/clsconexion.php';

class menus extends clsconexion{

	public function consultacategorias() {
		
		$sql = "CALL Sp_ConsultaCategoria();";
		$resultado = $this->conectar->query($sql);
		return $resultado;
		   
	}
	public function insertarProductos($nombre,$precio,$categoria,$imagenData2) {
		
		$sql = "CALL SpIngresaProducto('$nombre','$precio','$categoria','$imagenData2');";
        $resultado = $this->conectar->query($sql);
		return $resultado;
		   
	}
	
	public function ActualizarProducto($codigo_prod,$nombre,$precio,$categoria)
	{
		$sql = "CALL Sp_ActualizaProducto('$codigo_prod','$nombre','$precio','$categoria');";
		$resultado = $this->conectar->query($sql);
		return $resultado;
	}
	public function Eliminar($codigo_prod)
	{
		
		$sql = "CALL Sp_EliminaProducto('$codigo_prod');";
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}public function ConsultaProductos()
	{
		#$sql = "CALL Sp_TablaProductos();";
		$sql = "SELECT p.Idp, p.Nombre, p.Precio, p.Imagen, 
			c.IdCategoria, c.descripcion as desc_categoria FROM productos p 
			inner join categorias c ON c.IdCategoria = p.Categoria 
			ORDER BY c.descripcion, p.Nombre ;";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}

?>