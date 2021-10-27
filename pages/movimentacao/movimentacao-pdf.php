<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Movimentacao;
use \App\Session\Login;

$usuariologado = Login::getUsuarioLogado();

$usuarios_nome = $usuariologado['nome'];
$usuarios_email = $usuariologado['email'];

Login::requireLogin();

$result = "";

$listar = Movimentacao::getList('   m.id AS id,m.usuarios_id AS usuarios_id,m.catdespesas_id AS catdespesas_id,
                                    m.forma_pagamento_id AS forma_pagamento_id,m.data AS data,m.valor AS valor,
                                    m.descricao AS descricao,m.tipo AS tipo,m.status AS status,
                                    u.nome AS usuario,c.nome AS categoria,f.nome AS pagamento',
                                                            
                                    'movimentacoes AS m INNER JOIN usuarios AS u ON (m.usuarios_id = u.id) INNER JOIN
                                     catdespesas AS c ON (m.catdespesas_id = c.id) INNER JOIN forma_pagamento AS f ON (m.forma_pagamento_id = f.id)',
                                     'm.data >= current_date()', 'm.id DESC',null);

$despesa  = 0;
$receita  = 0;
$valor1  = 0;
$total = 0;
$resultados = '';
$list = '';
$status1 = '';
$total = 0;
$total_dinheiro = 0;

foreach ($listar as $item) {

    $total = $item->valor;
    $status1 = $item->status;
 
    if ($item->status <= 0) {
       $valor1 = 0;
       if ($item->tipo == 0) {
 
          $despesa += $valor1;
       } else {
 
          $receita += $valor1;
       }
    } else {
       if ($item->tipo == 0) {
 
          $despesa += $item->valor;
       } else {
 
          $receita += $item->valor;
       }
    }
 
    $total = ($receita - $despesa);
 

    $result .= '   <tr>
                        <td>
                         
                        <img src="../../imgs/'.($item->status <= 0 ? 'seta1.png' : 'seta2.png').'" style="width:20px; 10px">

                        </td>
                   
                        <td>
                                    
                        <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#0e8219') . '">
                        ' . ($item->status <= 0 ? 'EM ABERTO' : 'PAGO') . '
                        </span>

                        </td>

                        <td>' . date('d/m/Y à\s H:i:s ', strtotime($item->data)) . '</td>

                        <td style="text-transform: uppercase; font-weight:100; text-align:left">' . $item->categoria . '</td>
                        <td style="text-transform: uppercase; text-align:left ">' . $item->pagamento . '</td>
                        <td style="text-transform: uppercase; text-align:left ">' . $item->usuario . '</td>
                        <td style="text-transform: uppercase; text-align:left ">' . $item->descricao . '</td>
                        <td style="text-transform: uppercase; font-weight:200; text-align:left;font-size:12px"> R$ ' . number_format($item->valor, "2", ",", ".") . '</td>
                    
                   </tr>
                ';
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome-free/css/all.min.css">

    <style>
        @page {
            margin: 70px 0;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Open Sans", sans-serif;
        }

        .header {
            position: fixed;
            top: -70px;
            left: 0;
            right: 0;
            width: 100%;
            text-align: center;
            background-color: #555555;
            padding: 10px;
        }

        .header img {
            width: 160px;
        }

        .footer {
            bottom: -27px;
            left: 0;
            width: 100%;
            padding: 5px 10px 10px 10px;
            text-align: center;
            background: #555555;
            color: #fff;
        }

        .footer .page:after {
            content: counter(page);

        }

        table {
            width: 100%;
            border: 1px solid #555555;
            margin: 0;
            padding: 0;
        }

        th {
            text-transform: uppercase;
        }

        table,
        th,
        td {
            font-size: xx-small;
            border: 1px solid #555555;
            border-collapse: collapse;
            text-align: center;
            padding: 5px;

        }

        tr:nth-child(2n+0) {
            background: #eeeeee;
        }

        p {
            color: #888888;
            margin: 0;
            text-align: center;
        }

        h2 {
            text-align: center;

        }
    </style>

    <title>Movimentacao de caixa</title>
</head>

<body>

    
<table style="margin-top:-40px; width:100%">
        <tbody>
            <tr style="background-color: #fff; color:#000">

                <td style="text-align: left; width:260px; border:1px solid #fff; ">
                    <span style="margin-left:126px; margin-top: -50px; font-size:small">Karine Modas </span><br>
                    <span style="margin-left:126px; margin-top: -30px; font-size:xx-small ">Email:&nbsp; <?= $usuarios_email  ?> </span><br>
                    <span style="margin-left:126px; margin-top: -30px; font-size:xx-small">Atendente:&nbsp; <?= $usuarios_nome  ?> </span><br>
                    <img style="width:120px; height:50px; float:left;margin-top:-50px; padding:10px; margin-left:-12px;" src="../../01.png">
                    <br />
                    <br />

                </td>
                <td style="text-align:center; font-weight:600; font-size:16px; border:1px solid #fff;">**** MOVIMENTAÇÕES DIÁRIAS ****</td>
                <td style="text-align:right; border:1px solid #fff;">Data de Emissão: <?php echo date("d/m/Y") ?><br></td>

            </tr>
        </tbody>
    </table>
    <table style="margin-top:0;">
        <tbody>
            <tr style="background-color:#e52993; color:#fff">
                <td style="text-align: center; text-transform:uppercase" colspan="9">HISTÓRICO</td>
            </tr>

            <tr style="background-color: #000; color:#fff">

                <td style="text-align:center; font-size:x-small; width:20px"> #</td>
                <td style="text-align:center;  width:80px"> STATUS </td>
                <td style="text-align:center;  width:120px"> DATA </td>
                <td style="text-align:left;  width:130px"> CATEGORIA </td>
                <td style="text-align:left;  width:150px"> F. DE PAGAMENTO </td>
                <td style="text-align:left;  width:100px"> USUÁRIO</td>
                <td style="text-align:left;  width:315px"> DESCRIÇÃO</td>
                <td style="text-align:left;  width:155px"> VALOR</td>
                

                

            </tr>

            <?= $result ?>

                <tr style="background-color: #d1d1d1; color:#000">
                <td colspan="7" style="text-align: right;">
                <span style="font-size: 16px; font-weight:600"> TOTAL &nbsp; &nbsp;</span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 16px; font-weight:600;text-align:left;">R$ <?= number_format($total, "2", ",", "."); ?></span>
                </td>
                </tr>
            

        </tbody>
    </table>

</body>

</html>