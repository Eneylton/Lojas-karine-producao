<?php

require __DIR__ . '../../../vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

if (isset($_GET['dataInicio'])) {

    $dataInicio = $_GET['dataInicio'];
    $dataFim = $_GET['dataFim'];


    if ($_GET['form_pagamento'] == "") {

        $form_pagamento = "";
    } else {

        $form_pagamento = $_GET['form_pagamento'];
    }

    if ($_GET['catdespesas_id'] == "") {

        $catdespesas_id = "";
    } else {

        $catdespesas_id = $_GET['catdespesas_id'];
    }

    if (isset($_GET['status'])) {
        if ($_GET['status'] == "") {

            $status = "";
        } else {

            $status = $_GET['status'];
        }
    }

    if (isset($_GET['tipo'])) {
        if ($_GET['tipo'] == "") {

            $tipo = "";
        } else {

            $tipo = $_GET['tipo'];
        }
    }
}



$dompdf = new Dompdf();
$options = new Options();
$options->set('isRemoteEnabled', true);
$options->set('isHtml5ParserEnabled', true);

ob_start();

require __DIR__ . "/data-pdf.php";

$dompdf->loadHtml(ob_get_clean());

// echo $pdf;

$dompdf->setPaper("A4", "landscape");

$dompdf->render();

$dompdf->stream("movimentacao.pdf", ["Attachment" => false]);
