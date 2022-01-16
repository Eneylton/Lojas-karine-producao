<html>
<head>
<style>
p.inline {display: inline-block;}
span { font-size: 13px;}
</style>
<style type="text/css" media="print">
    @page 
    {
        size: auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */

    }
</style>
</head>
<body onload="window.print();">
	<div style="margin-left: 12%">
		<?php

		include 'barcode128.php';

		$valor               = $_POST['rate'];
      

		$product = $_POST['product'];
		$product_id = $_POST['product_id'];
		$rate = $valor;

		for($i=1;$i<=$_POST['print_qty'];$i++){
			echo "<p class='inline' style='text-transform:uppercase'><span ><b> $product</b></span>".bar128(stripcslashes($_POST['product_id']))."<span ><b>R$ ".$rate." </b><span></p>&nbsp&nbsp&nbsp&nbsp";
		}

		?>
	</div>
</body>
</html>