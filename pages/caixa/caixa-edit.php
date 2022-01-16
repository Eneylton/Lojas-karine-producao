<?php 

require __DIR__.'../../../vendor/autoload.php';



$alertaCadastro = '';

define('TITLE','Editar');
define('BRAND','Editar ');

use App\Entidy\Caixa;
use App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Caixa:: getID('*','caixa',$_GET['id'],null,null);


if(!$value instanceof Caixa){
    header('location: index.php?status=error');

    exit;
}





if(isset($_GET['valor'])){

    $vl1            = $_GET['valor'];
    $vl2            = str_replace(".", "", $vl1);
    $vl3            = str_replace(",", ".",$vl2);
    
    $value->valor = $vl3;
    $value->forma_pagamento_id = $_GET['forma_pagamento_id'];
    $value-> atualizar();

    header('location: caixa-list.php?status=edit');

    exit;
}


