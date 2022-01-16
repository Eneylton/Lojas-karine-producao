<?php 

require __DIR__.'../../../vendor/autoload.php';

$alertaCadastro = '';

define('TITLE','Editar Clientes');
define('BRAND','Clientes');

use \App\Entidy\Clientes;
use   \App\Session\Login;


Login::requireLogin();


if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}


$value = Clientes:: getID('*','clientes',$_GET['id'],null,null);


if(!$value instanceof Clientes){
    header('location: index.php?status=error');

    exit;
}



if(isset($_GET['nome'])){
    
    $value->nome             = $_GET['nome'];
    $value->telefone         = $_GET['telefone'];
    $value->email            = $_GET['email'];
    $value->localidade       = $_GET['localidade'];
    $value->logradouro       = $_GET['logradouro'];
    $value->complemento     = $_GET['complemento'];
    $value->numero           = $_GET['numero'];
    $value->bairro           = $_GET['bairro'];
    $value->cep              = $_GET['cep'];
    $value->uf               = $_GET['uf'];
    $value-> atualizar();

    header('location: clientes-list.php?status=edit');

    exit;
}


