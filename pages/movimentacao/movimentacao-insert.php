<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Session\Login;
use App\Entidy\Movimentacao;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuarios_id = $usuariologado['id'];

Login::requireLogin();

if(isset($_POST['forma_pagamento_id'])){

    $val1              = $_POST['valor'];
    $val2              = str_replace(".", "", $val1);
    $preco             = str_replace(",", ".",  $val2);


    $item = new Movimentacao;
    $item->catdespesas_id = $_POST['catdespesas_id'];
    $item->usuarios_id = $usuarios_id;
    $item->status = $_POST['status'];
    $item->tipo = $_POST['tipo'];
    $item->descricao = $_POST['descricao'];
    $item->forma_pagamento_id = $_POST['forma_pagamento_id'];
    $item->valor = $preco;
    $item->data = $_POST['data'];
    $item->cadastar();

    header('location: movimentacao-list.php?status=success');
    exit;
}

