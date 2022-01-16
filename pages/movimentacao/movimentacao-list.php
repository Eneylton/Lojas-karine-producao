<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Catdespesa;
use App\Entidy\FormaPagamento;
use App\Entidy\Movimentacao;
use App\Session\Login;

define('TITLE','Movimentações financeiras');
define('BRAND','Financeiro');

Login::requireLogin();

if(isset($_GET['id'])){

    $idcaixa = $_GET['id'];
 
}  

$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$filtroStatus = filter_input(INPUT_GET, 'filtroStatus', FILTER_SANITIZE_STRING);
$filtroStatus = in_array($filtroStatus,['0','1']) ? $filtroStatus : '';

$condicoes = [
    strlen($buscar) ? 'm.tipo LIKE "%'.str_replace(' ','%',$buscar).'%" or
                       m.status LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       f.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       c.nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null,
                       strlen($filtroStatus) ? 'm.status = "'.$filtroStatus.'"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);


$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Movimentacao:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 100);

$listar = Movimentacao::getList('   m.id AS id,m.usuarios_id AS usuarios_id,m.catdespesas_id AS catdespesas_id,m.troco as troco,
                                    m.forma_pagamento_id AS forma_pagamento_id,m.data AS data,m.valor AS valor,
                                    m.descricao AS descricao,m.tipo AS tipo,m.status AS status,
                                    u.nome AS usuario,c.nome AS categoria,f.nome AS pagamento',
                                                            
                                    'movimentacoes AS m INNER JOIN usuarios AS u ON (m.usuarios_id = u.id) INNER JOIN
                                     catdespesas AS c ON (m.catdespesas_id = c.id) INNER JOIN forma_pagamento AS f ON (m.forma_pagamento_id = f.id)',
                                     'm.caixa_id='. $idcaixa, 'm.id DESC',$pagination->getLimit());

$categorias = Catdespesa :: getList('*','catdespesas');
$pagamentos = FormaPagamento :: getList('*','forma_pagamento');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/movimentacao/movimentacao-form-list.php';
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
