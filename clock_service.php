<?php

/*
Este servicio regresa la hora actual del servidor
Regresa JSON {status, msg, data}
*/
    if(isset($_GET[debug])){
		ini_set('display_errors', 1);
		ini_set('display_startup_errors', 1);
		error_reporting(E_ALL);
	}


    header('Content-Type: application/json');
        $json = array(
            'status'	=> 0,
            'msg'		=> '',
            'data'      => array(

                )
    );
    $dateTime                   = new DateTime();
    
    $json['status']             = 200;
    $json['msg']                = 'OK';
    $json['data']['hour']       = $dateTime->format('H');
    $json['data']['minute']     = $dateTime->format('i');
    $json['data']['second']     = $dateTime->format('s');
    
    $json['data']['complete']   = $dateTime->format('d/m/Y H:i:s');
    $json['data']['zone']       = $dateTime->getTimezone()->getName();
    
    print(JSON_ENCODE($json))



?>
