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


$value = Clientes:: getID('*','cargos',$_GET['id'],null,null);


if(!$value instanceof Clientes){
    header('location: index.php?status=error');

    exit;
}



if(isset($_GET['nome'])){
    
    $item->nome             = $_GET['nome'];
    $item->telefone         = $_GET['telefone'];
    $item->email            = $_GET['email'];
    $item->localidade       = $_GET['localidade'];
    $item->logradouro       = $_GET['logradouro'];
    $value->complemento     = $_GET['complemento'];
    $item->numero           = $_GET['numero'];
    $item->bairro           = $_GET['bairro'];
    $item->cep              = $_GET['cep'];
    $item->uf               = $_GET['uf'];
    $value-> atualizar();

    header('location: clientes-list.php?status=edit');

    exit;
}


