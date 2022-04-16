<!DOCTYPE html>
<?php
	$bolacha = $_GET['tucano'];
		
	include "conexao.php";
	$sql = "SELECT * FROM tb_usuarios WHERE id_usuario='$bolacha'";
	$contato = $fusca ->prepare($sql);
	$contato -> execute();
	$fusca = null; //encerra conexão com o banco
		
	foreach($contato as $b){
		$nome    = $b['nome'];				
		$email   = $b['email'];						
	}
	
	//Salvando os valores
	if(isset($_POST['salvar'])){
		$nome       = $_POST['nome'];
		$email      = $_POST['email'];		
		
		$sql = "
			UPDATE tb_usuarios SET 
			nome       = ?,
			email      = ?
			WHERE 
			id_usuario = ?
		";
		include "conexao.php";
		$contato = $fusca -> prepare($sql);
		$contato -> execute(array($nome,$email,$bolacha));
		$fusca = null;
		echo "
			<script>
				alert('Contato alterado com sucesso');
				window.location.href='listar.php';
			</script>
		";
	}
	
?>
<html lang="pt-br">
<!-- Estrutura básica -->
	<head>
		<meta charset="UTF-8">
		<title>Agenda</title>
	<style>
		body {
        background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
        color: white;
        text-shadow: 2px black;
        }
		h1 {
			font-family: 'Roboto Mono', monospace;
		}
		input[type=text], select {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
	border-style: groove;
		}
		input[type=email], select {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
	border-style: groove;
		}
		input[type=submit] {
    		padding:5px 15px; 
    		background:#ccc; 
    		border-style: groove;
    		cursor: pointer;
    		-webkit-border-radius: 5px;
    		border-radius: 5px; 
		}
		textarea {
			width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 4px;
	box-sizing: border-box;
	border-style: groove;
		}
	</style>
	</head>
	<body>
		<?php include "menu.php";?>
		<hr>
		<h1 style="font-weight: bold; text-shadow: 2px 2px black;" align="center">Editar</h1>
		<hr>		
		<center>
			<form action="" method="POST">
				Nome:<br>
				<input type="text" name="nome" value="<?php echo $nome;?>"><br><br>			
				E-mail:<br>
				<input type="email" name="email" value="<?php echo $email;?>"><br><br>
				Observações:<br>
				<textarea name="obs"></textarea><br><br>
				<input type="submit" value="Salvar" name="salvar">
				<input type='button' value='Cancelar' onclick='window.history.back();'>
			</form>
			
		</center>
	</body>
</html>