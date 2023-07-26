<?php

include_once 'Modelo/ReportesPDF.php';
include_once 'LibreriaFPDF/fpdf.php';

class ControladorReportes
{
	private $vista;
	
	public function reportesDireccion()
	{	
	
		$dir=new ReportesPDF();
        if(!empty($_POST))
		{
            //recibo la caja de texto del formulario html
            $nombre=$_POST['txtRdireccion'];
           
            // Crear el objeto FPDF
		    $pdf = new FPDF();
		
		    // Agregar una página
		    $pdf->AddPage();

		
		    // Establecer la fuente y el tamaño del título
		    $pdf->SetFont('Arial', 'B', 14);
		    $pdf->Cell(0, 10,utf8_decode('Reporte Cantidad De Empleados Por Dirección'), 0, 1, 'C');

		    // Consulta a la base de datos
            
            $Consulta=$dir->ConsultaEmpleadosXDireccion($nombre);	    
		    //Centrar la tabla
            $pdf->SetLeftMargin(60);
            if ($Consulta->num_rows > 0) {
        
                // Establecer la fuente y el tamaño del encabezado de la tabla
                $pdf->SetFont('Arial', 'B', 10);

                // Imprimir los encabezados de la tabla
                $pdf->Cell(50, 10, 'Direccion Empleado', 1, 0, 'C');
                $pdf->Cell(40, 10, 'Cantidad de empleados', 1, 1, 'C');
            
                // Establecer la fuente y el tamaño del contenido de la tabla
                $pdf->SetFont('Arial', '', 9);

                // Imprimir los datos de la tabla
                while ($row = $Consulta->fetch_assoc()) {
                    $pdf->Cell(50, 10, $row["Direccion"], 1, 0, 'L');
                    $pdf->Cell(40, 10, $row["EmpleadosDireccion"], 1, 1, 'C');
                   
                }

                // Salto de línea después de la tabla
                $pdf->Ln(10);

                $dir->conectar->close();
                // Mostrar el PDF
                $pdf->Output();
            } else {
                echo "No se encontraron registros.";
            }

            $dir->conectar->close();
            //******************	
            
           
        }else
        {
            $vista="Vistas/Reportes/ReportesEmpleadoDirec.php";
			include_once("Vistas/frmplantilla.php");
        }

    }
}
?>