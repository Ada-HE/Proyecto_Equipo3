<?php
    define("controlador","Controlador/");
    

    $control=isset($_GET['C'])?$_GET['C']:'';

    $ruta=controlador.$control.'.php';


    if(file_exists($ruta) && !empty($control)){
        require_once($ruta);
        $objeto=new $control();

        $metodo=isset($_GET['M'])?$_GET['M']:'';

        if(method_exists($objeto,$metodo) && !empty($metodo)){
            $objeto->$metodo();
        }
    }else{
        require_once("Controlador/principal.php");
        $default=new DefaultController();
        $default->index();    
    }
?>