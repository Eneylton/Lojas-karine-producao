<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Categoria;
use App\Entidy\Produto;
use App\Session\Login;

define('TITLE','Lista de Produtos');
define('BRAND','Produtos');

Login::requireLogin();

$foto2 = "";

$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$buscar2 = filter_input(INPUT_GET, 'buscar2', FILTER_SANITIZE_STRING);
$buscar3 = filter_input(INPUT_GET, 'buscar3', FILTER_SANITIZE_STRING);

$id = (int)$buscar2;

$condicoes = [
    strlen($buscar) ? 'p.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null,

    strlen($buscar2) ? 'p.categorias_id = ' . str_replace(' ', '', $id) . '' : null,

    strlen($buscar3) ? 'p.barra LIKE "%'  . str_replace(' ', '%', $buscar3) . '%"' : null

];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);


$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Produto:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 200);

$listar = Produto::getList('p.id as id,
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
                             categorias AS c ON (p.categorias_id = c.id)',$where, 'p.id DESC',$pagination->getLimit());

$categorias = Categoria :: getList('*','categorias');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/produto/produto-form-list.php';
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
        $('#codigo').val(data[1]);
        $('#barra').val(data[2]);
        $('#nome').val(data[3]);
        $('#foto').val(data[4]);
        $('#usuarios_id').val(data[5]);
        $('#qtd').val(data[6]);
        $('#categorias_id').val(data[7]);
        $('#estoque').val(data[8]);
        $('#aplicacao').val(data[9]);
        $('#valor_compra').val(data[10]);
        $('#valor_venda').val(data[11]);
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
            $('#valor_venda').val(Number((idCompra) / 0.50).toFixed(2));
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
            $('#venda1').val(Number((idCompra) / 0.50).toFixed(2));
        }

    })

});

</script> 
