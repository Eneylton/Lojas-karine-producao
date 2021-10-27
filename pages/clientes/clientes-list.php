<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Clientes;
use App\Session\Login;
use App\Webservice\ViaCEP;

define('TITLE','Lista de Clientes');
define('BRAND','Clientes');


if (isset($_POST['id'])){

    $id = $_POST['id']; 

    $dadosCEP = ViaCEP ::consultaCEP($id);

    $logradouro  = $dadosCEP['logradouro'];
    $bairro  = $dadosCEP['bairro'];
    $localidade  = $dadosCEP['localidade'];
    $uf  = $dadosCEP['uf'];
    $cep  = $dadosCEP['cep'];

}else{
    $id = "";
    $logradouro  ="";
    $bairro  = "";
    $localidade  = "";
    $uf  = "";
    $cep  = "";
}



Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'id LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Clientes:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 5);

$listar = Clientes::getList('*','clientes',$where, 'id desc',$pagination->getLimit());


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/cliente/cliente-form-list.php';
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
        $('#nome').val(data[1]);
        $('#telefone').val(data[2]);
        $('#email').val(data[3]);
        $('#localidade').val(data[4]);
        $('#logradouro').val(data[5]);
        $('#numero').val(data[6]);
        $('#bairro').val(data[7]);
        $('#cep').val(data[8]);
        $('#uf').val(data[9]);
       
    });
});
</script>

<script>

$("#cep1").on("change", function(){

    var idCEP = $("#cep1").val();
    $.ajax({
        url: 'https://viacep.com.br/ws/'+idCEP +'/json/unicode/',
        dataType: 'json',
        success: function(resposta){
			
				$("#logradouro1").val(resposta.logradouro);
				$("#bairro1").val(resposta.bairro);
				$("#cidade1").val(resposta.localidade);
				$("#uf1").val(resposta.uf);
				$("#numero1").focus();
			}

    })

});

</script> 


<script>

$("#cep").on("change", function(){

    var idCEP = $("#cep").val();
    $.ajax({
        url: 'https://viacep.com.br/ws/'+idCEP +'/json/unicode/',
        dataType: 'json',
        success: function(resposta){
			
				$("#logradouro").val(resposta.logradouro);
				$("#bairro").val(resposta.bairro);
				$("#localidade").val(resposta.localidade);
				$("#uf").val(resposta.uf);
				$("#numero").focus();
			}

    })

});

</script> 