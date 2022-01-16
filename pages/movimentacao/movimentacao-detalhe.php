<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Caixa;
use App\Entidy\Movimentacao;
use App\Session\Login;

define('TITLE','Movimentações financeiras');
define('BRAND','Financeiro');

Login::requireLogin();

if(isset($_GET['id'])){

    $idcaixa = $_GET['id'];

    $result = Caixa :: getID('*','caixa',$idcaixa,null,null);

    $troco = $result->valor;
 
}

$entrada = Movimentacao :: getList(' m.id as id,
m.data as data,
c.nome as categorias,
f.nome as pagamento,
m.valor as valor,
m.troco as troco
',' movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)','m.tipo = 1 AND m.caixa_id ='.$idcaixa,null,null);

$saida = Movimentacao :: getList(' m.id as id,
m.data as data,
c.nome as categorias,
f.nome as pagamento,
m.valor as valor,
m.troco as troco','movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)','m.tipo = 0 AND m.caixa_id ='.$idcaixa,null,null);

$caixa  = Caixa :: getID('*','caixa',$idcaixa,null,null);

$valor_caixa = $caixa->valor;

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/movimentacao/detalhe-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$(document).ready(function(){
    $('.editbtn').on('click', function(){
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#usuarios_id').val(data[1]);
        $('#catdespesas_id').val(data[2]);
        $('#forma_pagamento_id').val(data[3]);
        $('#data').val(data[4]);
        $('#valor').val(data[5]);
        $('#descricao').val(data[6]);
        $('#tipo').val(data[7]);
        $('#status').val(data[8]);
        $('#usuario').val(data[9]);
        $('#categoria').val(data[10]);
        $('#pagamento').val(data[11]);
    });
});
</script>


<script type="text/javascript">

    function carregarImg() {

        var target = document.getElementById('target');
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            target.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);


        } else {
            target.src = "";
        }
    }

</script>

<script>

$("#valor_compra").on("change", function(){

    var idCompra = $("#valor_compra").val();
    $.ajax({
        url:'produto-list.php',
        type:'POST',
        data:{
            id:idCompra
        },
        success: function(data){
            $('#valor_venda').val(Number((idCompra) / 0.40).toFixed(2));
        }

    })

});

</script> 

<script>

$("#compra1").on("change", function(){

    var idCompra = $("#compra1").val();
    $.ajax({
        url:'produto-list.php',
        type:'POST',
        data:{
            id:idCompra
        },
        success: function(data){
            $('#venda1').val(Number((idCompra) / 0.40).toFixed(2));
        }

    })

});

</script> 

<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php
           
            foreach ($entrada as $item) {
           
                echo "'".date('d / M', strtotime($item->data))."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• ENTRADA •',
            data: [
                <?php
            foreach ($entrada as $item) {
                echo "'".$item->valor."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
             
            ],
            borderColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8'
             
            ],
            borderWidth: 1
        },
        
        {
            label: '• SAIDA •',
            data: [
                
                
                <?php
            foreach ($saida as $item) {
                echo "'".$item->valor."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000'
            ],
            borderColor: [
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000'
             
            ],
            borderWidth: 1
        }
        
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
