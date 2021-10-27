<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Venda;
use App\Session\Login;

define('TITLE','Minhas vendas');
define('BRAND','Vendas');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'id LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Venda:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 5);

$listar = Venda::getList(' v.id AS id,
v.clientes_id AS clientes_id,
v.forma_pagamento_id AS forma_pagamento_id,
v.tipo_id AS tipo_id,
v.mov_cat_id AS mov_cat_id,
v.data AS data,
v.codigo AS codigo,
v.recebido AS recebido,
v.troco AS troco,
c.nome AS cliente,
f.nome AS pagamento,
t.nome AS tipo,
m.nome AS categoria','vendas AS v
INNER JOIN
usuarios AS u ON (v.usuarios_id = u.id)
INNER JOIN
clientes AS c ON (v.clientes_id = c.id)
INNER JOIN
forma_pagamento AS f ON (v.forma_pagamento_id = f.id)
INNER JOIN
tipo AS t ON (v.tipo_id = t.id)
INNER JOIN
mov_cat AS m ON (v.mov_cat_id = m.id)',$where, 'v.id desc',$pagination->getLimit());

$acessos = Venda :: getList('*','acessos');


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/venda/venda-form-list.php';
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
        $('#descricao').val(data[1]);
       
    });
});
</script>
