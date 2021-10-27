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
      case 'barra':
         $icon  = 'error';
         $title = 'Atenção';
         $text = 'Código de barras já cadastrado !!!';
         break;

      case 'edit':
         $icon  = 'warning';
         $title = 'Parabéns';
         $text = 'Cadastro atualizado com sucesso !!!';
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

$resultados = '';

foreach ($listar as $item) {

   if (empty($item->foto)) {
      $foto = 'imgs/sem.jpg';
   } else {
      $foto = $item->foto;
   }

   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->codigo . '</td>
                      <td style="display:none">' . $item->barra . '</td>
                      <td style="display:none">' . $item->nome . '</td>
                      <td style="display:none">' . $item->foto . '</td>
                      <td style="display:none">' . $item->usuarios_id . '</td>
                      <td style="display:none">' . $item->qtd . '</td>
                      <td style="display:none">' . $item->categorias_id . '</td>
                      <td style="display:none">' . $item->estoque . '</td>
                      <td style="display:none">' . $item->aplicacao . '</td>
                      <td style="display:none">' . $item->valor_compra . '</td>
                      <td style="display:none">' . $item->valor_venda . '</td>
                     
                      
                      <td><img style="width:80px; heigth:70px" src="../.' . $foto . '" class="img-thumbnail"></td>
                      <td style="text-transform: uppercase; font-size:14px">' . $item->categoria . '</td>
                      <td style="text-transform: uppercase; font-size:14px">' . $item->nome . '</td>
                      <td style="text-align:center">
                        
                        <span style="font-size:16px" class="' . ($item->estoque <= 3 ? 'badge badge-danger' : 'badge badge-primary') . '">' . $item->estoque . '</span>
                        
                      </td>
                      <td> <button type="button" class="btn btn-warning x-small"> R$ ' . number_format($item->valor_compra, "2", ",", ".") . '</button></td>
                      <td> <button type="button" class="btn btn-info x-small"> R$ ' . number_format($item->valor_venda, "2", ",", ".") . '</button></td>
                    

                      <td style="text-align: center;">
                                         
                      <button type="submit" class="btn btn-success editbtn" > <i class="fas fa-paint-brush"></i> </button> &nbsp;

                     <a href="produto-delete.php?id=' . $item->id . '">
                     <button type="button" class="btn btn-danger"> <i class="fas fa-trash"></i></button>
                     </a>

                     </td>
                     </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="7" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
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
                        <div class="col-3">

                           <label>Código de barras</label>
                           <input placeholder="Barras" type="text" class="form-control" name="buscar3" value="<?= $buscar3 ?>" autofocus>

                        </div>
                        <div class="col-3">

                           <label>Buscar por Produto</label>
                           <input placeholder="Nome do Produto" type="text" class="form-control" name="buscar" value="<?= $buscar ?>">

                        </div>
                        <div class="col-3">


                           <label>Categorias</label>
                           <select class="form-control select2" style="width: 100%;" name="buscar2">
                              <option value="<?= $buscar2 ?>"> Selecione uma categoria </option>
                              <?php

                              foreach ($categorias as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>


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
                              <td colspan="7">
                                 <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modal-default" > <i class="fas fa-plus"></i> &nbsp; Novo</button>
                                  
                                 <button type="submit" class="btn btn-default float-right" data-toggle="modal" data-target="#modal-data"> <i class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>


                              </td>
                           </tr>

                        <tr>
                           <th> IMAGEM </th>
                          
                           <th> CATEGORIAS </th>
                           <th> NOME DO PRODUTO </th>
                           <th style="text-align:center"> ESTOQUE </th>
                           <th> COMPRA </th>
                           <th> VENDA </th>
                           <th style="text-align: center;"> AÇÃO </th>
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
   <div class="modal-dialog modal-lg">
      <div class="modal-content bg-light">
         <form action="./produto-insert.php" method="post" enctype="multipart/form-data">

            <div class="modal-header">
               <h4 class="modal-title">Novo produto
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-lg-3 col-3">
                     <div id="divImgConta">
                        <?php if ($foto2 != "") { ?>
                           <img src="../../imgs/<?php echo $foto2 ?>" width=50%" id="target">
                        <?php  } else { ?>
                           <img src="../../imgs/sem-foto.jpg" width="50%" id="target">
                        <?php } ?>
                     </div>
                  </div>
                  <div class="col-lg-8 col-12 custom-file">
                     <input type="file" name="arquivo" class="form-control" value="<?php echo $foto2 ?>" id="imagem" name="arquivo" onChange="carregarImg();">
                     <br>
                  </div>

               </div>
               <br>

               <div class="row">
                  <div class="col-6">
                     <div class="form-group">
                        <label>Código de Barras</label>
                        <input type="text" class="form-control" name="barra">
                     </div>
                  </div>
                  <div class="col-6">
                     <div class="form-group">
                        <label>Categorias</label>
                        <select class="form-control select2" style="width: 100%;" name="categorias_id">
                           <option value=""> Selecione uma categoria </option>
                           <?php

                           foreach ($categorias as $item) {
                              echo '<option style="text-transform:uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>

                  </div>

               </div>

               <div class="row">
                  <div class="col-6">
                     <div class="form-group">
                        <label>Nome do produto</label>
                        <input type="text" class="form-control" name="nome" style="text-transform: uppercase;">
                     </div>

                  </div>

                  <div class="col-3">
                     <div class="form-group">
                        <label>Compra</label>
                        <input placeholder="R$ 0,00" type="text" class="form-control" name="valor_compra" id="compra1" required>
                     </div>

                  </div>

                  <div class="col-3">
                     <div class="form-group">
                        <label>Venda</label>
                        <input placeholder="R$ 0,00" type="text" class="form-control" name="valor_venda" id="venda1" required>
                     </div>

                  </div>


               </div>

               <div class="row">
                  <div class="col-4">
                     <div class="form-group">
                        <label>Quantidade</label>
                        <input type="text" class="form-control" name="estoque">
                     </div>

                  </div>

                  <div class="col-8">
                     <div class="form-group">
                        <label>Descrição</label>
                        <textarea class="form-control" name="aplicacao" cols="60" rows="5"  style="text-transform: uppercase;"></textarea>
                     </div>

                  </div>

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
   <div class="modal-dialog modal-lg">
      <form action="./produto-edit.php" method="POST" enctype="multipart/form-data">
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

               <div class="row">
                  <div class="col-lg-3 col-3">
                     <div id="divImgConta">
                        <?php if ($foto2 != "") { ?>
                           <img src="../../imgs/<?php echo $foto2 ?>" width=50%" id="target">
                        <?php  } else { ?>
                           <img src="../../imgs/sem-foto.jpg" width="50%" id="target">
                        <?php } ?>
                     </div>
                  </div>
                  <div class="col-lg-8 col-12 custom-file">
                     <input type="file" name="arquivo" class="form-control" value="<?php echo $foto2 ?>" id="imagem" name="arquivo" onChange="carregarImg();">
                     <br>
                     <br>
                     <br>

                  </div>

               </div>

               <div class="row">
                  <div class="col-6">
                     <div class="form-group">
                        <label>Código de Barras</label>
                        <input type="text" class="form-control" name="barra" id="barra">
                     </div>
                  </div>
                  <div class="col-6">
                     <div class="form-group">
                        <label>Categorias</label>
                        <select class="form-control select" style="width: 100%;" name="categorias_id" id="categorias_id">
                           <option value=""> Selecione uma categoria </option>
                           <?php

                           foreach ($categorias as $item) {
                              echo '<option style="text-transform:uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>

                  </div>

               </div>

               <div class="row">
                  <div class="col-6">
                     <div class="form-group">
                        <label>Nome do produto</label>
                        <input type="text" class="form-control" name="nome" id="nome"  style="text-transform: uppercase;">
                     </div>

                  </div>

                  <div class="col-3">
                     <div class="form-group">
                        <label>Compra</label>
                        <input placeholder="R$ 0,00" type="text" class="form-control" name="valor_compra" id="valor_compra">
                     </div>

                  </div>

                  <div class="col-3">
                     <div class="form-group">
                        <label>Venda</label>
                        <input placeholder="R$ 0,00" type="text" class="form-control" name="valor_venda" id="valor_venda">
                     </div>

                  </div>


               </div>

               <div class="row">
                  <div class="col-4">
                     <div class="form-group">
                        <label>Quantidade</label>
                        <input type="text" class="form-control" name="estoque" id="estoque">
                     </div>

                  </div>

                  <div class="col-8">
                     <div class="form-group">
                        <label>Descrição</label>
                        <textarea class="form-control" name="aplicacao" cols="60" rows="5" id="aplicacao"  style="text-transform: uppercase;"></textarea>
                     </div>

                  </div>

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

<div class="modal fade" id="modal-data">
      <div class="modal-dialog modal-lg">
         <div class="modal-content ">
            <form action="./produto-gerar.php" method="GET" enctype="multipart/form-data">

               <div class="modal-header">
                  <h4 class="modal-title">Relatórios
                  </h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="card-body">

                  <div class="form-group">

                     <div class="row">

                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataInicio">
                        </div>


                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataFim">
                        </div>


                        <div class="col-lg-4 col-4">

                           <select class="form-control select" name="categorias_id">
                              <option value=""> Categorias </option>
                              <?php

                              foreach ($categorias as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>

                        </div>

                     </div>
                  </div>

                  <div class="row">
                  <div class="col-lg-8 col-8">
                        <input placeholder="Nome do produto" class="form-control" type="text" name="nome">
                     </div>

                     <div class="col-lg-4 col-4">
                        <input placeholder="Código de barras" class="form-control" type="text" name="barra">
                     </div>

                  </div>
               </div>
               <div class="modal-footer justify-content-between">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                  <button type="submit" class="btn btn-primary">Gerar relatório</button>
               </div>

            </form>

         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>