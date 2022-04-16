<!doctype html>
<?php
date_default_timezone_set('America/Sao_Paulo');
if(isset($_POST['cadastrar'])){
	//Captura os valores
	$nome       = $_POST['nome'];
	$email      = $_POST['email'];		
	$senha     = $_POST['senha'];
	$confirmar_senha        = $_POST['confirmar_senha'];
	
	//Insere no Banco de Dados
	$sql = "INSERT INTO tb_usuarios (nome,email,senha,confirmar_senha) VALUES (?,?,?,?)";
	include "conexao.php";
	$contato = $fusca -> prepare($sql);
	$contato -> execute(array($nome,$email,$senha,$confirmar_senha));
	$fusca = null;
	echo "
	<script>
	alert('Contato cadastrado com sucesso');
	window.location.href='listar.php';
	</script>
	";
}	
?>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
html {
	scroll-behavior: smooth;
}
body {
	font-family: 'Roboto Mono', monospace;
	color: white;
}
hr { 
	display: block; 
	content: ""; 
	height: 30px; 
	margin-top: 31px; 
	border-style: solid; 
	border-color: black; 
	border-width: 1 1 1px 0; 
	border-radius: 20px; 
}
input[type=password], select {
	
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
	border-style: groove;
}
input[type=email], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
	border-style: groove;
}
h1  { 
	color: white;
	font-family: 'Roboto Mono', monospace;
	text-shadow: 2px 2px black;
}
input[type=submit] {
	padding:5px 15px; 
	background:#ccc; 
	border-style: groove;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px; 
}

</style>
<title>Cadastro</title>
</head>
<body>
<hr>
<p align="center">
<?php include "menu.php";?>
</p>		
<div class="container">
<div class="row"> 
<div class="col"> 
<form action="" method="POST">
<div class="mb-3">
<label style="color: black" for="nome" class="form-label"> Nome completo </label>
<input type="text" class="form-control" name="nome" id="nome" aria-describedby="nome1" placeholder="Nome Completo">

</div>
<div class="mb-3">
<label style="color: black" for="email" class="form-label">Endereço de e-mail</label>
<input type="email" class="form-control" name="email" placeholder="E-mail">
</div>
<div class="mb-3">
<label style="color: black" for="senha" class="form-label">Senha</label>
<input type="password" class="form-control" name="senha" aria-describedby="passhelp" placeholder="Senha">

<div class="mb-3">
<label style="color: black" for="confirmar_senha" class="form-label">Confirmar senha</label>
<input type="password" class="form-control" name="confirmar_senha" aria-describedby="passhelp" placeholder="Confirme sua senha">

<hr>
</div>
<input type="submit" value="Cadastrar" name="cadastrar">

</form>
</div>
</div>
</div>


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>