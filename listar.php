<!DOCTYPE html>
<?php
	session_start();
	@$login = $_SESSION['login'];
	//var_dump($perfil);
	if($login <> "yes"){
		echo "
			<script>
				alert('Você não tem permissão de acesso');
				window.location.href='login.php';
			</script>
		";		
	}
	include "conexao.php";
	$sql = "SELECT * FROM tb_usuarios ORDER BY nome";
	$pessoas = $fusca ->prepare($sql);
	$pessoas -> execute();
	$fusca = null; //encerra conexão com o banco
?>
<html lang="pt-br">
<!-- Estrutura básica -->
	<head>
		<link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
	table {
  border-collapse: collapse;
  width: 100%;
	}

	th, td {
  text-align: left;
  padding: 8px;
	}

	tr:nth-child(even) {background-color: black;}
	body {
		font-family: 'Roboto Mono', monospace;
	}
	tr:nth-child(odd) {background-color: lightyellow;color: black;} 
</style>
</head>

		<title>Agenda v2.2</title>
	</head>
	<body>
		<hr>
		<h1 style="font-weight: bold;text-shadow: 4px 4px black, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;" align="center">Lista de Usuários</h1>
		<hr>
		<p align="center">
			<?php include "menu.php";?>
		</p>		
		<hr>		
		<center>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Ação</th>
				</tr>
				<?php
					foreach($pessoas as $bolacha){
						$id         = $bolacha['id_usuario'];
						$nome       = $bolacha['nome'];
						$email      = $bolacha['email'];

						$excluir = "<a href='excluir.php?id=$id&nome=$nome' title='Excluir $nome'><input type='button' value='Excluir'></a>";
						$editar  = "<a href='editar.php?tucano=$id'><input type='button' value='Editar'></a>"; 
						echo "<tr>";				
						echo "<td>".$id."</td>";
						echo "<td>".$nome."</td>";
						echo "<td>".$email."</td>";
						echo "<td>".$excluir."                ".$editar."</td>";
						echo "</tr>";
					}
				?>
			</table>
		</center>
	</body>
</html>