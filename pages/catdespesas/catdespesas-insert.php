<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Catdespesa;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();


if(isset($_POST['nome'])){

        $item = new Catdespesa;
        $item->nome = $_POST['nome'];
        $item->cadastar();

        header('location: catdespesas-list.php?status=success');
        exit;
    }
  
