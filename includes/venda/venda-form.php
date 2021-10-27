<?php

if (isset($_GET['status'])) {

  switch ($_GET['status']) {
    case 'success':
      $icon  = 'success';
      $title = 'Parabéns';
      $text = 'Cadastro realizado com Sucesso !!!';
      break;

    case 'del':
      $icon  = 'error';
      $title = 'Parabéns';
      $text = 'Esse usuário foi excluido !!!';
      break;

    case 'menor':
      $icon  = 'warning';
      $title = 'Opss !!!';
      $text = 'O valor informado e menor que total da venda !!!';
      break;


    default:
      $icon  = 'error';
      $title = 'Opss !!!';
      $text = 'Algo deu errado entre em contato com admin !!!';
      break;
  }

  function alerta($icon, $title, $text)
  {
    echo "<script type='text/javascript'>
     Swal.fire({
       type:'type',  
       icon: '$icon',
       title: '$title',
       text: '$text'
      
     }) 
     </script>";
  }

  alerta($icon, $title, $text);
}


?>


<section class="content">

  <div class="container-fluid">

    <div class="row">
      <div class="col-3">

      </div>

      <div class="col-6">
        <form action="pagamento-insert.php" method="post">
          <input type="hidden" name="troco" value="<?= $troco ?>">
          <input type="hidden" name="clienteId" value="<?= $clienteId ?>">
          <input type="hidden" name="clienteNome" value="<?= $clienteNome ?>">
          <input type="hidden" name="clienteEmail" value="<?= $clienteEmail ?>">
          <input type="hidden" name="clienteTelefone" value="<?= $clienteTelefone ?>">
          <input type="hidden" name="clienteLogradouro" value="<?= $clienteLogradouro ?>">
          <input type="hidden" name="clienteBairro" value="<?= $clienteBairro ?>">
          <input type="hidden" name="clienteNumero" value="<?= $clienteNumero ?>">
          <input type="hidden" name="clienteLocalidade" value="<?= $clienteLocalidade ?>">
          <input type="hidden" name="clienteUF" value="<?= $clienteUF ?>">
          <div class="card card-success">
            <div class="card-header">
              <h1 class="card-title"><span style="font-size: xx-large; font-weight:600;">TROCO R$ <?= number_format($troco, "2", ",", ".") ?>

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

              <div class="row">
                <div class="col-4">
                  <span style="font-weight: 600;">CLIENTE: </span>&nbsp; <?= $clienteNome ?>
                </div>
                <div class="col-4">
                  <span style="font-weight: 600;">EMAIL: </span>&nbsp; <?= $clienteEmail ?>
                </div>
                <div class="col-4">
                  <span style="font-weight: 600;">CONTATO: </span>&nbsp; <?= $clienteTelefone ?>
                </div>
                <div class="col-12">
                  <span style="font-weight: 600;">ENDEREÇO: </span>&nbsp; <?= $clienteLogradouro ?> &nbsp; Nº <?= $clienteNumero ?> &nbsp; <?= $clienteBairro ?>
                  &nbsp; <?= $clienteLocalidade ?> &nbsp; - <?= $clienteUF ?>
                  <hr>
                </div>
                <div class="col-6">
                  <span style="font-weight: 600;">FORMA DE PAGAMENTO: </span>&nbsp; <?= $forma ?>
                  <hr>
                </div>



                <hr>
                <table class="table  table-light table-sm">
                  <thead>
                    <tr>
                      <th>PRODUTO(S)</th>
                      <th>QTD</th>
                      <th>UNI</th>
                      <th>DESCONTO(S)</th>
                      <th>SUBTOTAL</th>
                    </tr>

                  </thead>
                  <tbody>

                    <?= $result; ?>

                    <tr>
                      <td colspan="3">TOTAL</td>
                      <td style="font-weight: 600; color:#ff0000"><?= $total_desconto  ?> %</td>
                      <td style="font-weight: 600; color:#ff0000">R$ <?= number_format($total_venda, "2", ",", ".")  ?></td>

                    </tr>

                  </tbody>
                </table>


                <div class="col-6">
 
                <a href="gerar-recibo.php" class="btn btn-danger btn-lg btn-block swalDefaultError" target="_blank" rel="noopener noreferrer">
                <span style="font-size: x-large;">RECIBO </span>
                </a>
              
                </div>

                <div class="col-6">

                  <button type="submit" class="btn btn-warning btn-lg btn-block swalDefaultError"><span style="font-size: x-large;">NOVA VENDA</span></button>

                </div>


              </div>


            </div>


          </div>
        </form>

      </div>

      <div class="col-3">



      </div>

    </div>