<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Movimentacao;
use App\Entidy\Produto;
use App\Entidy\Prodvenda;
use App\Entidy\Venda;
use  \App\Session\Login;
use Dompdf\Dompdf;
use Dompdf\Options;

$usuariologado = Login::getUsuarioLogado();

$usuarios_id = $usuariologado['id'];
$usuarios_nome = $usuariologado['nome'];

$total_estoque = 0;

$codigo = substr(uniqid(rand()), 0, 6);

if (isset($_POST['troco'])) {

    $troco                  =   $_POST['troco'];
    $clienteId              =   $_POST['clienteId'];
    $clienteNome            =   $_POST['clienteNome'];
    $clienteEmail           =   $_POST['clienteEmail'];
    $clienteTelefone        =   $_POST['clienteTelefone'];
    $clienteLogradouro      =   $_POST['clienteLogradouro'];
    $clienteBairro          =   $_POST['clienteBairro'];
    $clienteNumero          =   $_POST['clienteNumero'];
    $clienteLocalidade      =   $_POST['clienteLocalidade'];
    $clienteUF              =   $_POST['clienteUF'];
}

if (isset($_SESSION['dados-rodape'])) {

    foreach ($_SESSION['dados-rodape'] as $item) {


        $recebido           = $item['recebido'];
        $troco              = $item['troco'];
    }
}

if (isset($_SESSION['dados-adicionais'])) {

    foreach ($_SESSION['dados-adicionais'] as $item) {


        $cliente           = $item['cliente'];
        $pagamento         = $item['pagamento'];
    }
}

if (isset($_SESSION['caixa'])) {

    foreach ($_SESSION['caixa'] as $item) {


        $caixa_id           = $item['caixa_id'];
        $data               = $item['data'];
      
    }
}

if (isset($_SESSION['pagamento-insert'])) {

    foreach ($_SESSION['pagamento-insert'] as $item) {


        $produto_id         = $item['produtos_id'];
        $total_desconto     = $item['total_desconto'];
        $qtd                = $item['qtd'];
        $subtotal           = $item['subtotal'];

        $value = Produto::getID('*', 'produtos', $produto_id, null, null);

        $estoque = $value->estoque;

        $total_estoque = ($estoque - $qtd);

        date_default_timezone_set('America/Sao_Paulo');
        $hoje = date('Y-m-d H:i');

        $value->data = $hoje;
        $value->estoque = $total_estoque;
        $value->atualizar();


        $codigo = substr(uniqid(rand()), 0, 6);

        $item = new Prodvenda;
        $item->qtd                     = $qtd;
        $item->valor                   = $subtotal;
        $item->codigo                  = $codigo;
        $item->produtos_id             = $produto_id;
        $item->clientes_id             = $cliente;
        $item->forma_pagamento_id      = $pagamento;
        $item->cadastar();
        

    }

    $item = new Venda;

    $item->codigo                   = $codigo;
    $item->recebido                 = $recebido;
    $item->troco                    = $troco;
    $item->usuarios_id              = $usuarios_id;
    $item->clientes_id              = $cliente;
    $item->forma_pagamento_id       = $pagamento;
    $item->mov_cat_id               = 1;
    $item->tipo_id                  = 1;

    $item->cadastar();



    switch ($pagamento) {
        case '2':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 1;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            $moviment->cadastar();

            break;

        case '3':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 0;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            $moviment->cadastar();

            break;

        case '4':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 0;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            $moviment->cadastar();

            break;

        case '5':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 0;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            $moviment->cadastar();

            break;

        case '6':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 0;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            $moviment->cadastar();

            break;


        case '7':
            $moviment = new Movimentacao;

            $moviment->valor                   = $recebido;
            $moviment->troco                   = $troco;
            $moviment->descricao               = "Produto foi vendido...";
            $moviment->tipo                    = 1;
            $moviment->status                  = 0;
            $moviment->usuarios_id             = $usuarios_id;
            $moviment->catdespesas_id          = 15;
            $moviment->forma_pagamento_id      = $pagamento;
            $moviment->caixa_id                = $caixa_id ;
            $moviment->data                    = $data ;
            
            $moviment->cadastar();

            break;

            case '8':
                $moviment = new Movimentacao;
    
                $moviment->valor                   = $recebido;
                $moviment->troco                   = $troco;
                $moviment->descricao               = "Produto foi vendido...";
                $moviment->tipo                    = 1;
                $moviment->status                  = 1;
                $moviment->usuarios_id             = $usuarios_id;
                $moviment->catdespesas_id          = 15;
                $moviment->forma_pagamento_id      = $pagamento;
                $moviment->caixa_id                = $caixa_id ;
                $moviment->data                    = $data ;
                $moviment->cadastar();
    
                break;

        default:
            # code...
            break;
    }






    if (isset($_POST['submit'])) {

        $dompdf = new Dompdf();
        $options = new Options();
        $options->set('isRemoteEnabled', true);
        $options->set('isHtml5ParserEnabled', true);

        ob_start();

        if (isset($_GET['dataInicio'])) {

            $nome = $_GET['nome'];
            $barra = $_GET['barra'];
            $dataFim = $_GET['dataFim'];
            $dataInicio = $_GET['dataInicio'];
            $categorias_id = $_GET['categorias_id'];
        }

        require __DIR__ . "/recibo-pdf.php";

        $dompdf->loadHtml(ob_get_clean());

        // echo $pdf;

        $dompdf->setPaper("A7", "landscape");

        $dompdf->render();

        $dompdf->stream("recibo.pdf", ["Attachment" => false]);
    }

    unset($_SESSION['carrinho']);
    unset($_SESSION['dados-venda']);
    unset($_SESSION['pagamento-insert']);

    header('location: pdv.php?caixa_id='.$caixa_id);

    exit;
}
