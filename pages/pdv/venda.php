<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Clientes;
use App\Entidy\FormaPagamento;
use App\Session\Login;

$subtotal_desconto=0;

$usuariologado = Login::getUsuarioLogado();

$usuarios_id = $usuariologado['id'];
$usuarios_nome = $usuariologado['nome'];

define('TITLE', 'Atendente: '.$usuarios_nome);
define('BRAND', 'produtos');



$desc = 0;
$sub = 0;

$alertaLogin  = '';
$alertaCadastro = '';

$codigo = substr(uniqid(rand()), 0, 6);

Login::requireLogin();

$_SESSION['pagamento-insert'] = array();

$_SESSION['dados-adicionais'] = array();

$_SESSION['dados-rodape'] = array();

$total_venda = 0;
$total_desconto = 0;
$troco = 0;
$desconto = 0;
$subtotal_desconto = 0;
$form_pag = 0;
$cliente_id = "";

if (isset($_POST['receber'])) {

  if (isset($_POST['cliente_id'])) {
   $cliente_id = $_POST['cliente_id'];
  }else{
    $cliente_id = 18;
  }

    $form_pag = $_POST['formaPagamento_id'];

    $valor_recebido = $_POST['receber'];

    $clientes   = Clientes :: getID('*','clientes',$cliente_id,null,null);

    $clienteId = $clientes->id;
    $clienteNome = $clientes->nome;
    $clienteEmail = $clientes->email;
    $clienteTelefone = $clientes->telefone;
    $clienteLogradouro = $clientes->logradouro;
    $clienteBairro = $clientes->bairro;
    $clienteNumero = $clientes->numero;
    $clienteLocalidade = $clientes->localidade;
    $clienteUF = $clientes->uf;

    $pagamentos = FormaPagamento :: getID('*','forma_pagamento',$form_pag ,null,null);

    $forma = $pagamentos->nome;
}

if (isset($_SESSION['dados-venda'])) {

    foreach ($_SESSION['dados-venda'] as $item) {
        $produto            = $item['nome'];
        $codigo_prod        = $item['codigo'];
        $barra              = $item['barra'];
        $produtos_id        = $item['produtos_id'];
        $qtd                = $item['qtd'];
        $desconto           = $item['desconto'];
        $uni                = $item['valor_venda'];
        $subtotal           = $item['subtotal'];
        $sub_venda          = ($qtd *  $uni);

      
        $subtotal_desconto  = $sub_venda - ($sub_venda * intval($desconto) / 100);
               
        
        $total_venda += floatval($subtotal_desconto) ;

        if($desconto == null){
         $desc = "Nenhum";
        }else{
         $desc = $desconto. " %";
         
         $total_desconto += intval($desc);
         
        }

        $result .= '
        <tr>
        <td>'.$produto.' </td>
        <td>'.$qtd.' </td>
        <td> R$ '.number_format($uni,"2",",",".").' </td>
        <td> '.intval($desc).' </td>
        <td> R$ '.number_format($subtotal_desconto,"2",",",".").' </td>
        </tr>
    ';


    array_push(
        $_SESSION['pagamento-insert'],

        array(
          'produtos_id'             => $produtos_id,
          'total_desconto'          => $total_desconto,
          'qtd'                     => $qtd,
          'valor_venda'             => $uni,
          'subtotal'                => $sub_venda,
        )
      );

      array_push(
        $_SESSION['dados-adicionais'],

        array(
          'cliente'             => $clientes->id,
          'pagamento'           => $form_pag
          
        )
      );
    }

}

$val1              = $_POST['receber'];
$val2              = str_replace(".", "", $val1);
$val_recebido      = str_replace(",", ".",  $val2);
$id_valor          = intval($val_recebido);

if($val_recebido >= $total_venda ){

    $troco = ($val_recebido - $total_venda);

    array_push(
        $_SESSION['dados-rodape'],

        array(
          'recebido'             => $val_recebido,
          'troco'                => $troco
          
        )
      );

}else{

    header('location: pdv.php?status=menor');

    exit;

}

include __DIR__.'../../../includes/layout/header.php';
include __DIR__.'../../../includes/layout/top.php';
include __DIR__.'../../../includes/layout/menu.php';
include __DIR__.'../../../includes/layout/content.php';
include __DIR__.'../../../includes/venda/venda-form.php';
include __DIR__.'../../../includes/layout/footer.php';



