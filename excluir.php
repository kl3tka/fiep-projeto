<!DOCTYPE html>
<?php
	$id   = $_GET['id'];
	$nome = $_GET['nome'];
	
	if(isset($_POST['sim'])){
		$sql = "DELETE FROM tb_usuarios WHERE id_usuario='$id'";
		include "conexao.php";
		$cont_exc = $fusca -> prepare($sql);
		$cont_exc -> execute();
		$fusca = null;		
		echo "
			<script>
				alert('Contato excluído com sucesso.');
				window.location.href='listar.php';
			</script>
		";
	}	
?>
<html>
    <head>
    <meta charset="UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">

        <style>
        body {
		font-family: 'Roboto Mono', monospace;
	    }
        </style>
    </head>
	<body>
		<center>
			Excluir: <?php echo $nome;?>?<br><br>
			<form action="" method='POST'>
				<input type='submit' value='Sim' name='sim'>
				<input type='button' value='Não' onclick='window.history.back();'>
			</form>
		</center>
	</body>	
</html>

