<?php

$list = '';

$resultados = '';

foreach ($listar as $item) {

   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->data . '</td>
                      <td style="display:none">' . $item->valor . '</td>
                      <td style="display:none">' . $item->forma_pagamento_id . '</td>
                      <td >' . $item->id . '</td>
                      <td style="text-transform:uppercase; width:300px"> <h3><span class="badge badge-pill badge-primary">
                      <i class="fa fa-clock" aria-hidden="true"></i> &nbsp; &nbsp;' .date('d/m/Y à\s H:i:s ', strtotime($item->data)). '</span></h3> </td>
                     
                      <td style="text-transform:uppercase; width:100px"> <h3><span class="badge badge-pill badge-success">
                      <i class="fas fa-check"></i> &nbsp;' . $item->pagamento . '</span></h3> </td>

                      <td style="text-transform:uppercase; width:100px;text-align:center"> <h3><span class="badge badge-pill badge-warning">
                      <i class="fas fa-plus-circle"></i>&nbsp; R$ &nbsp;' . number_format($item->valor,"2",",",".") . '</span></h3> </td>
                    
                      <td style="text-align: center;">
                      <a href="../pdv/pdv.php?id_caixa=' . $item->id . '&data='.$item->data.'">
                      <button type="button" class="btn btn-primary"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> &nbsp;  &nbsp;  INICIAR</button>
                      </a>
                      
                      &nbsp;
                      
                      
                      <a href="../movimentacao/movimentacao-list.php?id=' . $item->id . '">
                      <button type="button" class="btn btn-default"><i class="fas fa-sync"></i> &nbsp;  &nbsp;  MOVIMENTAÇÕES</button>
                      </a>
                     
                      &nbsp;
                      
                      <button type="submit" class="btn btn-success editbtn" > <i class="fas fa-paint-brush"></i> </button>
                      &nbsp;

                       <a href="caixa-delete.php?id=' . $item->id . '">
                       <button type="button" class="btn btn-danger"> <i class="fas fa-trash"></i></button>
                       </a>



                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="5" class="text-center" > Nenhum caixa aberto até o memento !!!!! </td>
                                                     </tr>';


unset($_GET['status']);
unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-secondary';
   $paginacao .= '<a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class="btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  </a>';
}

?>

<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card card-purple">
               <div class="card-header">

                  <form method="get">
                     <div class="row ">
                        <div class="col-4">

                           <label>Buscar por data</label>
                           <input type="text" class="form-control" name="buscar" value="<?= $buscar ?>">

                        </div>


                        <div class="col d-flex align-items-end">
                           <button type="submit" class="btn btn-warning" name="">
                              <i class="fas fa-search"></i>

                              Pesquisar

                           </button>

                        </div>


                     </div>

                  </form>
               </div>

               <div class="table-responsive">

                  <table class="table table-bordered table-dark table-bordered table-hover table-striped">
                     <thead>
                        <tr>
                           <td colspan="5">
                              <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modal-default"> <i class="fas fa-plus"></i> &nbsp; Abrir caixa </button>
                           </td>
                        </tr>
                        <tr>
                           <th style="text-align: left; width:80px"> CÓDIGO </th>
                           <th> DATA </th>
                           <th> TIPO DE ENTRADA </th>
                           <th style="text-align:center"> VALOR </th>
                          
                           <th style="text-align: center; width:300px"> AÇÃO </th>
                           
                        </tr>
                     </thead>
                     <tbody>
                        <?= $resultados ?>
                     </tbody>

                  </table>

               </div>


            </div>

         </div>

      </div>

   </div>

</section>

<?= $paginacao ?>


<div class="modal fade" id="modal-default">
   <div class="modal-dialog">
      <div class="modal-content bg-light">
         <form action="./caixa-insert.php" method="post">

            <div class="modal-header">
               <h4 class="modal-title">Nova entrada
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <label>Entrada</label>
                  <input type="text" class="form-control" name="valor" required id="dinheiro">
               </div>
               <div class="form-group">
                        <label>Forma de pagamento</label>
                        <select class="form-control select" style="width: 100%;" name="forma_pagamento_id" required>
                           <option value=""> Selecione um tipo de pagamento </option>
                           <?php

                           foreach ($pagamentos as $item) {
                              echo '<option style="text-transform:uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Salvar</button>
            </div>

         </form>

      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<!-- EDITAR -->

<div class="modal fade" id="editmodal">
   <div class="modal-dialog">
      <form action="./caixa-edit.php" method="get">
         <div class="modal-content bg-light">
            <div class="modal-header">
               <h4 class="modal-title">Editar
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <input type="hidden" name="id" id="id">
               <div class="form-group">
                  <label>Valor</label>
                  <input type="text" class="form-control" name="valor" id="valor" required >
               </div>
       
           
            <div class="form-group">
                        <label>Forma de pagamento</label>
                        <select class="form-control select" style="width: 100%;" name="forma_pagamento_id" id="forma_pagamento_id">
                           <?php

                           foreach ($pagamentos as $item) {
                              echo '<option style="text-transform:uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Salvar
               </button>
            </div>
         </div>
      </form>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>