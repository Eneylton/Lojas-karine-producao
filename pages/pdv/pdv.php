<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Produto;
use App\Db\Pagination;
use App\Entidy\Clientes;
use App\Entidy\FormaPagamento;
use App\Session\Login;



define('TITLE', 'Caixa');
define('BRAND', 'PDV modulo caixa');

Login::requireLogin();

// USUARIO LOGADO


$usuariologado = Login::getUsuarioLogado();
$usuario = $usuariologado['nome'];

// LISTAR CLIENTES / MECÂNICOS

$clientes  = Clientes::getList('*', 'clientes');

// LISTAR PRODUTOS

$codigo = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
  strlen($buscar) ? 'p.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" 
                       or 
                       p.codigo LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       c.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       p.barra LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       p.data LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$pagamentos = FormaPagamento::getList('*', 'forma_pagamento;', 'nome ASC');

$qtd = Produto::getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 150);

$listar = Produto::getList(
  'p.id as id,
                            p.codigo as codigo,
                            p.barra as barra,
                            p.nome as nome,
                            p.foto as foto,
                            p.qtd as  qtd,
                            p.estoque as estoque,
                            p.aplicacao as aplicacao,
                            p.valor_compra as valor_compra,
                            p.valor_venda as valor_venda,
                            p.categorias_id as categorias_id,
                            c.nome as categoria',
  //TABELAS
  'produtos AS p
                             INNER JOIN
                             categorias AS c ON (p.categorias_id = c.id)',
  $where,
  'p.nome ASC',
  $pagination->getLimit()
);


if (!isset($_SESSION['carrinho'])) {
  $_SESSION['carrinho'] = array();
}

if (isset($codigo)) {


  $barra = Produto::getBarra('*','produtos',$codigo,null,null);

  if ($barra != false) {

    $id =  $barra->id;

    if (!isset($_SESSION['carrinho'][$id])) {

      $_SESSION['carrinho'][$id] = 1;
    } else {
      $_SESSION['carrinho'][$id] += 1;
    }
  }
}

if (isset($_GET['acao'])) {

  if ($_GET['acao'] == 'add2') {
    $id = intval($_GET['id']);

    if (!isset($_SESSION['carrinho'][$id])) {

      $_SESSION['carrinho'][$id] = 1;
    } else {
      $_SESSION['carrinho'][$id] += 1;
    }
  }

  if ($_GET['acao'] == 'add') {
    $id = intval($_GET['id']);

    if (!isset($_SESSION['carrinho'][$id])) {

      $_SESSION['carrinho'][$id] = 1;
    } else {
      $_SESSION['carrinho'][$id] += 1;
    }
  }
}

if (isset($_GET['acao'])) {

  if ($_GET['acao'] == 'add') {
    $id = intval($_GET['id']);

    if (!isset($_SESSION['carrinho'][$id])) {

      $_SESSION['carrinho'][$id] = 1;
    } else {
      $_SESSION['carrinho'][$id] += 1;
    }
  }

  if ($_GET['acao'] == 'up') {

    if (is_array($_POST['prod'])) {

      foreach ($_POST['prod'] as $id => $qtd) {

        $id = intval($id);
        $qtd = intval($qtd);

        if (!empty($qtd) || $qtd != 0) {

          $_SESSION['carrinho'][$id] = $qtd;
        } else {

          unset($_SESSION['carrinho'][$id]);
        }
      }
    }

    if (is_array($_POST['val'])) {

      foreach ($_POST['val'] as $id => $valor) {

        $item = Produto::getID('*', 'produtos', $id, null, null);
        $val1              = $valor;
        $val2              = str_replace(".", "", $val1);
        $preco             = str_replace(",", ".", $val2);

        $item->valor_venda = $preco;
        $item->atualizar();
      }
    }
  }

  if ($_GET['acao'] == 'del') {
    $id = intval($_GET['id']);

    if (isset($_SESSION['carrinho'][$id])) {
      unset($_SESSION['carrinho'][$id]);
    }
  }
}

if (isset($_POST['submit'])) {

  if (isset($_POST['id'])) {

    foreach ($_POST['id'] as $id) {

      if (isset($_POST['id'])) {

        $id  = intval($id);

        if (!isset($_SESSION['carrinho'][$id])) {

          $_SESSION['carrinho'][$id] = 1;
        } else {

          $_SESSION['carrinho'][$id] += 1;
        }
      }
    }
  }
}



include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/pdv/pdv-form.php';
include __DIR__ . '../../../includes/layout/footer.php';


?>


<script type="text/javascript">
  $(document).ready(function() {
    $("#cpf").mask("000.000.000-00")
    $("#telefone").mask("(00) 0000-0000")
    $("#dinheiro2").mask("999.999.990,00", {
      reverse: true
    })
  })
</script>

<script>
  $("#cep1").on("change", function() {

    var idCEP = $("#cep1").val();
    $.ajax({
      url: 'https://viacep.com.br/ws/' + idCEP + '/json/unicode/',
      dataType: 'json',
      success: function(resposta) {

        $("#logradouro1").val(resposta.logradouro);
        $("#bairro1").val(resposta.bairro);
        $("#cidade1").val(resposta.localidade);
        $("#uf1").val(resposta.uf);
        $("#numero1").focus();
      }

    })

  });
</script>