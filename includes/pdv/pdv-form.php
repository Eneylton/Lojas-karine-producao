<?php

$listProdutos  = '';
$resultados    = '';
$result_cli    = '';

foreach ($clientes as $item) {

  $result_cli .= '
  <option value="' . $item->id . '">' . $item->nome . '</option>
   
  ';
}


foreach ($listar as $item) {

  if (empty($item->foto)) {

    $foto = './imgs/sem.jpg';
  } else {

    $foto = $item->foto;
  }

  $listProdutos .= '
                <tr>
                  <td>
                        <div class="icheck-red ">
                        <input type="checkbox" value="' . $item->id . '" name="id[]" id="[' . $item->id . ']">
                        <label for="[' . $item->id . ']"></label>
                        </div>
                        </td>
                        <td>
                        <div class="product-img">
                        <img src="../.' . $foto . '" class="img-size-50" class="img-thumbnail">
                        </div>
                        </td>
                        <td style="text-transform:uppercase"><span>' . $item->nome . '</span> <br>
                        <span style="font-size:small;color:#696969">' . $item->categoria . '</span></td>
                        <td style="text-align:center">
                        <span style="font-size:16px" class="' . ($item->estoque <= 3 ? 'badge badge-danger' : 'badge badge-primary') . '">' . $item->estoque . '</span>
                        </td>
                        <td style="font-weight:600"> R$ ' . number_format($item->valor_venda, "2", ",", ".") . '</td>
                        <td>
                        <a href="?acao=add2&id=' . $item->id . '">
                         <i class="fas fa-plus-circle" style="font-size:28px;color:#30da04"></i>
                       </a>
                  </td>
                </tr>
';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="6" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
                                                     </tr>';

unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
  $class = $pagina['atual'] ? 'btn-primary' : 'btn-dark';
  $paginacao .= '<li class="page-item"><a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">
                  <button type="button" class=" btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  &nbsp; </a></li>';
}

?>

<div class="row" style="margin-top:10px">

  <!-- LISTA DE PRODUTOS -->

  <div class="col-lg-7 col-6">
    <div class="card card-dark">
      <div class="card-header">
        <h3 class="card-title">Atendente: &nbsp; <span style="text-transform: uppercase; color:yellow"><?= $usuario ?></span></h3>

        <div class="card-tools">
          <ul class="pagination pagination-sm float-right">
            <?= $paginacao ?>
          </ul>
        </div>
      </div>


      <div class="card-body">
        <form method="get">
          <h3 class="card-title">
            <div class="input-group input-group-sm" style="width: 350px;">
              <input type="text" name="buscar" class="form-control float-right" placeholder="Pesquisar...." autofocus>

              <div class="input-group-append">
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>
          </h3>
        </form>
        <form id="form1" action="pdv.php" method="post">
          <div class="card-header">

            <div class="card-tools">
              <button type="submit" name="submit" class="btn btn-flat btn-warning ">Adicionar todos &nbsp; <i class="fas fa-chevron-right"></i></button>
            </div>

          </div>

          <div class="table-responsive p-0" style="height: 550px;">
            <table class="table table-dark table-head-fixed text-nowrap">
              <thead>
                <th>
                  <div class="icheck-warning d-inline">
                    <input type="checkbox" id="select-all">
                    <label for="select-all">
                    </label>
                  </div>

                </th>
                <th>IMAGEM</th>
                <th>PRODUTO</th>
                <th style="text-align:center">ESTOQUE</th>
            
                <th>VALOR</th>
                <th>AÇÃO</th>
              </thead>
              <tbody>
                <?= $listProdutos ?>
              </tbody>
            </table>
          </div>


        </form>
      </div>


    </div>

  </div>

  <!-- CAIXA -->

  <div class="col-lg-5 col-6">
    <?php

    use \App\Entidy\Produto;

    $_SESSION['dados-venda'] = array();

    $listItem = '';
    $total = 0;
    $total1 = 0;
    $total2 = 0;
    $valor = 0;
    $porcentagem = 0;
    $porcento = 0;
    $valor_porcento = 0;


    foreach ($_SESSION['carrinho'] as $id => $qtd) {

      if (isset($_POST['porcent'][$id])) {

        $porcento = $_POST['porcent'][$id];
      }

      if ($porcento != null) {

        $item = Produto::getID('*', 'produtos', $id, null, null);

        $valor1 = $item->valor_venda;

        $valor2 = str_replace(".", ",", $valor1);

        $nome = $item->nome;

        $valor_porcento  = $qtd * $valor1;

        $sub  = $valor_porcento  - ($valor_porcento  * $porcento / 100);

        $total += $sub;
      } else {

        $item = Produto::getID('*', 'produtos', $id, null, null);

        $valor1 = $item->valor_venda;

        $valor2 = str_replace(".", ",", $valor1);

        $nome = $item->nome;

        $sub = $qtd * $valor1;

        $total += $sub;
      }

      $listItem .= '
            <tr>
            <td style="text-transform:uppercase; font-size:small">' . $nome . '</td>
            <td style="width:80px">
            <input type="text" size="1" name="prod[' . $id . ']" value="' . $qtd . '" style="width:50px" />
            </td>
            
            <td style="width:150px">R$
            <input type="text" size="2" id="dinheiro2" name="val[' . $id . ']" value="' . $valor2 . '" />
            </td>
            <td style="text-align:left">
            <select name="porcent[' . $id . ']">
            <option value=""></option>
            <option value="5">5%</option>
            <option value="10">10%</option>
            <option value="15">15%</option>
            <option value="20">20%</option>
          </select>
          
          </td>
            <td> R$ ' . number_format($sub, "2", ",", ".") . '</td>
            <td style="text-align:right">
            <button type="submit"><i class="fas fa-pen"></i></button>
            &nbsp;&nbsp;
            <a href="?acao=del&id=' . $id . '"
            <i class="fas fa-times" style="color:#ff0000"></i>
            </a></td>
            </tr>
            ';

      array_push(
        $_SESSION['dados-venda'],

        array(
          'nome'         => $nome,
          'codigo'       => $item->codigo,
          'barra'        => $item->barra,
          'qtd'          => $qtd,
          'valor_venda'  => $valor1,
          'subtotal'     => $sub,
          'desconto'     => $porcento,
          'produtos_id'  => $id
        )
      );
    }

    ?>


    <div class="card card-danger">
      <div class="card-header">
        <h1 class="card-title"><span style="font-size: xx-large; font-weight:600;">R$ &nbsp;

            <?= number_format($total, "2", ",", ".") ?>

          </span></h1>

        <div class="card-tools">
          <span style="text-transform: uppercase;">
            <?php
            setlocale(LC_TIME, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
            date_default_timezone_set('America/Sao_Paulo');
            echo strftime('%A, %d de %B de %Y', strtotime('today'));
            ?>
          </span>

        </div>
      </div>

      <div class="card-body">

        <div class="tab-content p-0 direct-chat-messages" style="height: 200px;">
          <form action="?acao=up" method="post">
            <table class="table table-hover table-dark table-striped table-sm">
              <thead>
                <tr>
                  <th style="text-align:left; width:220px"> PRODUTO </th>
                  <th> QTD </th>
                  <th style="text-align:left"> VALOR </th>
                  <th style="text-align:center"> DES % </th>
                  <th> SUBTOTAL </th>
                  <th style="width:100px;text-align:right"> AÇÕES </th>
                </tr>
              </thead>
              <tbody>

                <?= $listItem ?>

              </tbody>
            </table>
          </form>

        </div>

        <hr>
        <form action="venda.php" method="post">

          <div class="row">
            <div class="col-8">
              <select class="form-control select2" name="clientes_id" required>
                <option value="">Selecione um cliente</option>


                <?= $result_cli; ?>


              </select>
            </div>
            <div class="col-4">
              <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-primary"><i class="fas fa-plus"></i></button>
            </div>


          </div>
          <br>
          
          <div class="row">

              <div class="col-6">

                <input style="background-color:#313031;color:#fff; font-size:x-large" type="text" class="form-control" name="receber" id="dinheiro" placeholder="R$ 0,00">

              </div>
              <div class="col-6">
              <div class="form-group">
                       
                        <select class="form-control select" style="width: 100%;" name="formaPagamento_id" required>
                           <option value=""> Forma de Pagamento </option>
                           <?php

                           foreach ($pagamentos as $item) {
                              echo '<option style="text-transform:capitalize" value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>
              </div>

          </div>

          <hr>

          <div class="row">

            <div class="col-12">
              <textarea class="form-control" rows="3" placeholder="Observeções" name="obs"></textarea>
            </div>



            <div class="col-12">
              <button type="submit" class="btn btn-warning btn-lg btn-block" style="margin-top: 10px;">ENVIAR</button>

            </div>


        </form>

      </div>


    </div>


  </div>
  <!-- FIM -->
</div>
</div>
<form action="../clientes/clientes-modal.php" method="post">
  <div class="modal fade" id="modal-primary">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Novo Cliente</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label>Nome</label>
                <input type="text" class="form-control" name="nome">
              </div>

            </div>

          </div>

          <div class="row">
            <div class="col-8">
              <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" name="email">
              </div>

            </div>
            <div class="col-4">

              <div class="form-group">
                <label>Telefone</label>
                <input type="text" class="form-control" name="telefone" id="cel">
              </div>

            </div>

          </div>
          <div class="row">
            <div class="col-2">
              <div class="form-group">
                <label>CEP</label>
                <input type="text" class="form-control" name="cep" id="cep1">
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label>Logradouro</label>
                <input type="text" class="form-control" name="logradouro" id="logradouro1">
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                <label>Bairro</label>
                <input type="text" class="form-control" name="bairro" id="bairro1">
              </div>
            </div>
          </div>

          <div class="row">

            <div class="col-2">
              <div class="form-group">
                <label>Nº</label>
                <input type="text" class="form-control" name="numero" id="numero1">
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                <label>Complemento</label>
                <input type="text" class="form-control" name="complemento">
              </div>
            </div>

            <div class="col-3">
              <div class="form-group">
                <label>Cidade</label>
                <input type="text" class="form-control" name="localidade" id="cidade1">
              </div>
            </div>
            <div class="col-3">

              <div class="form-group">
                <label>Estado</label>
                <input type="text" class="form-control" name="uf" id="uf1">
              </div>

            </div>

          </div>


        </div>
        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-danger float-right" data-dismiss="modal">Fechar</button>
          <button type="submit" class="btn btn-primary">Salvar</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>