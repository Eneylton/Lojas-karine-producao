<?php 

require __DIR__.'../../../vendor/autoload.php';

use \App\Entidy\Movcate;
use   \App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Movcate::getID('*','mov_cat',$_GET['id'],null,null);

if(!$value instanceof Movcate){
    header('location: index.php?status=error');

    exit;
}



if(!isset($_POST['excluir'])){
    
 
    $value->excluir();

    header('location: movcate-list.php?status=del');

    exit;
}

