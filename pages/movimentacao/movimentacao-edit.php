<?php

require __DIR__ . '../../../vendor/autoload.php';

$alertaCadastro = '';

define('TITLE', 'Editar Categoria');
define('BRAND', 'Categoria');

use App\Entidy\Movimentacao;
use  \App\Session\Login;


Login::requireLogin();

if (!isset($_GET['id']) or !is_numeric($_GET['id'])) {

    header('location: index.php?status=error');

    exit;
}

$value = Movimentacao:: getID('*','movimentacoes',$_GET['id'],null,null);


if (!$value instanceof Movimentacao) {
    header('location: index.php?status=error');

    exit;
}


if (isset($_GET['form_pagamento'])) {
    date_default_timezone_set('America/Sao_Paulo');

    $val1              = $_GET['valor2'];
    $val2              = str_replace(".", "", $val1);
    $preco             = str_replace(",", ".",$val2);

    $value->status = 1;
    $value->data = date('Y-m-d H:i:s');
    $value->forma_pagamento_id = $_GET['form_pagamento'];
    $value->valor =  $preco;
    $value->atualizar();

    header('location: movimentacao-list.php?status=success');

    exit;
}
