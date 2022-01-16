<?php

$subtotal = 0;
$contador = 0;
$contador2 = 0;
$total1 = 0;
$total2 = 0;
$total3 = 0;
$total4 = 0;
$troco4  = 0;
$troco2 = 0;
$soma = 0;
$soma2 = 0;
$total_caixa = 0;

$resultados = "";
$resultados2 = "";

foreach ($entrada as $item) {

   $contador += 1;

   $subtotal = ($item->valor - $item->troco);

   $total1  += $item->valor;
   $troco2  += $item->troco;

   $resultados .= '<tr>

   
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">' . $contador . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">' . date('d/m/Y', strtotime($item->data)) . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-primary">' . $item->categorias . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-warning"> ' . $item->pagamento . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">R$ ' . number_format($item->valor,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-danger">R$  '.number_format($item->troco,"2",",",".").'</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-danger">R$  '.number_format($subtotal,"2",",",".").'</span></h5> </td>
                      </tr>

                      ';
}

foreach ($saida as $item2) {

   $contador2 += 1;

   $subtotal3 = ($item2->valor - $item2->troco);

   $total3  += $item2->valor;
   $troco4  += $item2->troco;
  

   $resultados2 .= '<tr>

   
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">' . $contador2 . '</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">' . date('d/m/Y', strtotime($item->data)) . '</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-danger">' . $item2->categorias . '</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-warning"> ' . $item2->pagamento . '</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">R$ ' . number_format($item2->valor,"2",",",".") . '</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-danger">R$  '.number_format($item2->troco,"2",",",".").'</span></h5> </td>
   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-danger">R$  '.number_format($subtotal3,"2",",",".").'</span></h5> </td>
   </tr>

                      ';
}





$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="7" class="text-center" > Nenhuma movimentação </td>
                                                     </tr>';

$soma = ($total1 - $troco2);

$soma2 = ($total3 - $total4);

$total_caixa = ($soma - $soma2) +  $troco;


?>

<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-lg-6">
         <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">SALDO ANTERIOR (TROCO)</h3>
                <div class="card-tools">
                  <h2 style="color:#4f99e3">R$ <?= number_format($valor_caixa,"2",",",".") ?></h2>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                       <?php
                        if ($soma <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000;font-size:25px">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($soma, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#28a745;font-size:25px" > 
                           <i class="ion ion-android-arrow-up text-success" ></i> &nbsp;' . number_format($soma, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        }
                        ?>
                    </span>
                    <span class="text-muted">SALDO EM DINHEIRO</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-danger text-xl">
                  <i class="fa fa-minus-circle" aria-hidden="true"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    <?php
                        if ($soma2 <= 0) {
                           echo '<span class="font-weight-bold" style="color:#28a745;font-size:25px">
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($soma2, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#ff0000;font-size:25px" > 
                           <i class="ion ion-android-arrow-down text-danger" ></i> &nbsp;' . number_format($soma2, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        }
                        ?>
                    </span>
                    <span class="text-muted">TOTAL DE DESPESAS</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="fas fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($total_caixa <= 0) {
                           echo '<span  style="color:#ff0000;font-size:35px">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($total_caixa, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CAIXA</span>';
                        } else {
                           echo '<span style="color:#0080ff;font-size:35px" > 
                           <i class="ion ion-android-arrow-up text-success" ></i> &nbsp;' . number_format($total_caixa, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CAIXA</span>';
                        }
                        ?>


                  </p>
                </div>
              

            
                <!-- /.d-flex -->
              </div>
            </div>

         </div>
         <div class="col-lg-6">
         <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">
                        <P>PRODUÇÃO DIÁRIA</P>
                     </h3>
                     <a href="javascript:void(0);">TOTAL POR DIA </a>
                  </div>
               </div>
               <div class="card-body">
                 
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <canvas id="myChart" width="400" height="130"></canvas>

                  </div>

                  <div class="d-flex flex-row justify-content-end">
                     <span class="mr-2">
                        <i class="fas fa-square text-success"></i> Entrada: R$ <?= number_format($soma,"2",",",".") ?>
                     </span>

                     <span>
                        <i class="fas fa-square text-danger"></i> Saida: R$ <?= number_format($soma2,"2",",",".") ?>
                     </span>
                  </div>
               </div>
            </div>


         </div>

         <div class="col-lg-6">
            <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">CAIXA</h3>
                     <a href="gerar-pdf.php?id=" target="_blank"> IMPRIMIR RELATÓRIO</a>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-flex">
                     <p class="d-flex flex-column">
                        <span class="text-bold text-lg">FATURAMENTO DIÁRIO &nbsp;</span>

                     </p>
                     <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-success">
                           <i class="fas fa-arrow-up"></i>&nbsp; R$ <?= number_format($soma,"2",",",".") ?>
                        </span>
                        <span class="text-muted">Saldo total em dinheiro</span>
                     </p>
                  </div>
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <table class="table table table-hover">
                        <thead>
                           <tr>
                              
                              <th>Nº</th>
                              <th>DATA</th>
                              <th>CATEGORIA</th>             
                              <th>PAGAMENTOS</th>             
                              <th>RECEBIDO</th>
                              <th>TROCO</th>
                              <th>SUBTOTAL</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <?= $resultados ?>
                           </tr>
                           <tr>
                             
                             <td  colspan="4" style="text-align: center;">
                                
                                <h5><span>TOTAL</span></h5>
                             </td>

                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-success">R$ <?= number_format($total1,"2",",",".") ?></span></h5>
                             </td>
                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-danger">R$ <?= number_format($troco2,"2",",",".") ?></span></h5>
                             </td>
                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-dark">R$ <?= number_format($soma,"2",",",".") ?></span></h5>
                             </td>
                          </tr>
                        </tbody>
                     </table>
                  </div>

                  
               </div>
            </div>

         </div>

         <div class="col-lg-6">
            <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">CAIXA</h3>
                     <a href="gerar-pdf.php?id=<?php echo $codigo ?>" target="_blank">RELATÓRIO DETALHADO</a>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-flex">
                     <p class="d-flex flex-column">
                        <span class="text-bold text-lg">DESPESAS: &nbsp;</span>

                     </p>
                     <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-danger">
                           <i class="fas fa-arrow-down"></i>&nbsp; R$<?= number_format($soma2,"2",",",".") ?>
                        </span>
                        <span class="text-muted">Total geral de despesas</span>
                     </p>
                  </div>
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <table class="table table table-hover">
                        <thead>
                           <tr>
                            
                           <th>Nº</th>
                              <th>DATA</th>
                              <th>CATEGORIA</th>             
                              <th>PAGAMENTOS</th>             
                              <th>RECEBIDO</th>
                              <th>TROCO</th>
                              <th>SUBTOTAL</th>
                           </tr>
                        </thead>
                        <tbody>
                         
                        <?= $resultados2 ?>
                         
                        </tbody>
                        <tr>
                             
                             <td  colspan="4" style="text-align: center;">
                                
                                <h5><span>TOTAL</span></h5>
                             </td>

                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-success">R$ <?= number_format($total3,"2",",",".") ?></span></h5>
                             </td>
                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-danger">R$ <?= number_format($total4,"2",",",".") ?></span></h5>
                             </td>
                             <td  colspan="1" style="text-align: center;">
                                
                                <h5><span class="badge badge-pill badge-dark">R$ <?= number_format($soma2,"2",",",".") ?></span></h5>
                             </td>
                          </tr>
                     </table>
                  </div>

                
               </div>
            </div>

         </div>
      

      </div>

</section>