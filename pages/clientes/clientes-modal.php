<?php 

require __DIR__.'../../../vendor/autoload.php';

define('TITLE','Novo Usuário');
define('BRAND','Cadastrar Usuário');

use App\Entidy\Clientes;
use App\Entidy\Usuario;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();


if(isset($_POST['email'])){
         
    $cliEmail = Clientes:: getEmail('*','clientes','email = "' . $_POST['email'] . '"',null,null);

    if($cliEmail instanceof Clientes){
        
        header('location: ../pdv/pdv.php?status=email');
        exit;
        
    }else{

        $value = new Clientes;
        $value->nome             = $_POST['nome'];
        $value->telefone         = $_POST['telefone'];
        $value->email            = $_POST['email'];
        $value->localidade       = $_POST['localidade'];
        $value->logradouro       = $_POST['logradouro'];
        $value->numero           = $_POST['numero'];
        $value->bairro           = $_POST['bairro'];
        $value->cep              = $_POST['cep'];
        $value->complemento      = $_POST['complemento'];
        $value->uf               = $_POST['uf'];
        $value->cadastar();

        header('location: ../pdv/pdv.php?status=success');
        exit;
    }

}
  