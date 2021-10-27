<?php

require __DIR__ . '/vendor/autoload.php';

use App\Entidy\Movimentacao;
use   \App\Session\Login;

define('TITLE', 'Painel de controle');
define('BRAND', 'Painel de controle ');

Login::requireLogin();

$resultado = "";

$diaria = Movimentacao::getListOne('sum(m.valor) as dia', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'm.data >= current_date() AND m.tipo=1 AND m.status=1 ', null, null);

$dia = $diaria->dia;

$mensal = Movimentacao::getListOne('sum(m.valor) as mes', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'month(m.data) AND m.tipo=1 AND m.status=1', null, null);

$mes = $mensal->mes;

$despesadia = Movimentacao::getListOne('sum(m.valor) as despdia', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'm.data >= current_date() AND m.tipo = 0 AND m.status = 1', null, null);

$despesadia = $despesadia->despdia;

$despesames = Movimentacao::getListOne('sum(m.valor) as desmes', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'month(m.data) AND m.tipo = 0 AND m.status = 1', null, null);

$despesames = $despesames->desmes;

$pagar = Movimentacao::getListOne('sum(m.valor) as pagamento', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'm.tipo = 0 AND m.status = 0', null, null);

$pagamento = $pagar->pagamento;

$receb = Movimentacao::getListOne('sum(m.valor) as receber', 'movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
forma_pagamento AS f ON (m.forma_pagamento_id = f.id)
INNER JOIN
usuarios AS u ON (m.usuarios_id = u.id)', 'm.tipo = 1 AND m.status = 0', null, null);

$recebimento = $receb->receber;

$invent = Movimentacao::getListOne('sum(p.valor_venda) as total', 'produtos as p ', 'month(p.data) = MONTH(CURRENT_DATE())', null, null);

$inventario = $invent->total;

$lucro = ($dia - $despesadia);

$grafico = Movimentacao::getList('(CASE month(p.data) 
when 1 then "Janeiro"
when 2 then "Fevereiro"
when 3 then "Março"
when 4 then "Abril"
when 5 then "Maio"
when 6 then "Junho"
when 7 then "Julho"
when 8 then "Agosto"
when 9 then "Setembro"
when 10 then "Outubro"
when 11 then "Novembro"
when 12 then "Dezembro"
END) AS mes, SUM(p.valor_venda) as total', 'produtos as p group by MONTH(p.data)', null, null, null);

include __DIR__ . '/includes/dashboard/header.php';
include __DIR__ . '/includes/dashboard/top.php';
include __DIR__ . '/includes/dashboard/menu.php';
include __DIR__ . '/includes/dashboard/content.php';
include __DIR__ . '/includes/dashboard/box-infor.php';
include __DIR__ . '/includes/dashboard/footer.php';

?>

<script type="text/javascript">
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [

                <?php

                foreach ($grafico as $item) {

                    echo "'" . $item->mes . "',";
                }

                ?>
            ],
            datasets: [{
                label: '¨ TOTAL POR MÊS ¨ ',
                data: [
                <?php
                
                foreach ($grafico as $item) {
    
                    echo "'".$item->total."',";
                }
            
            
             
            ?>
            ],
                backgroundColor: [
                    '#eb2525ad',
                    '#c0eb25ad',
                    '#29af13ad',
                    '#23e9acad',
                    '#8833aac2',
                    '#ffb953',
                    '#0084ff',
                    '#00ff3b',
                    '#fffb00',
                    '#ff005a',
                    '#a100ff',
                    '#00e3ff'
                ],
                borderColor: [
                    '#eb2525ad',
                    '#c0eb25ad',
                    '#29af13ad',
                    '#23e9acad',
                    '#8833aac2',
                    '#ffb953',
                    '#0084ff',
                    '#00ff3b',
                    '#fffb00',
                    '#ff005a',
                    '#a100ff',
                    '#00e3ff'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script type="text/javascript">
    var ctx = document.getElementById('myChart2').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [

                <?php

                foreach ($grafico as $item) {

                    echo "'" . $item->mes . "',";
                }

                ?>
            ],
            datasets: [{
                label: '¨ TOTAL POR MÊS ¨ ',
                data: [
                <?php
                
                foreach ($grafico as $item) {
    
                    echo "'".$item->total."',";
                }
            
            
             
            ?>
            ],
                backgroundColor: [
                    '#eb2525ad',
                    '#c0eb25ad',
                    '#29af13ad',
                    '#23e9acad',
                    '#8833aac2',
                    '#ffb953',
                    '#0084ff',
                    '#00ff3b',
                    '#fffb00',
                    '#ff005a',
                    '#a100ff',
                    '#00e3ff'
                ],
                borderColor: [
                    '#eb2525ad',
                    '#c0eb25ad',
                    '#29af13ad',
                    '#23e9acad',
                    '#8833aac2',
                    '#ffb953',
                    '#0084ff',
                    '#00ff3b',
                    '#fffb00',
                    '#ff005a',
                    '#a100ff',
                    '#00e3ff'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

