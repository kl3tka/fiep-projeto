<!DOCTYPE html>
<?php
	include "conexao.php";
	$sql = "SELECT * FROM tb_usuarios WHERE status_perfil > 0 ORDER BY nome";
	$pessoas = $fusca ->prepare($sql);
	$pessoas -> execute();
	$fusca = null; //encerra conexão com o banco
?>
<html lang="pt-br">
<!-- Estrutura básica -->
	<head>
		<meta charset="UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">

        <style>
				table {
  border-collapse: collapse;
  width: 100%;
	}

	th, td {
  text-align: left;
  padding: 8px;
	}

	tr:nth-child(even) {background-color: white;}
        body {
		font-family: 'Roboto Mono', monospace;
	    }
        </style>
		<title>Agenda v2.2</title>
	</head>
	<body>
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
					<th>Op.</th>
				</tr>
				<?php
					foreach($pessoas as $bolacha){
						$id         = $bolacha['id_contato'];
						$nome       = $bolacha['nome'];
						$email      = $bolacha['email'];
						$nascimento = date('d/m/Y',strtotime($bolacha['nascimento']));
						if($nascimento == '01/01/1970'){
							$nascimento = " - ";
						}
						$perfil    = $bolacha['perfil'];
						switch ($perfil){
							case 1:
							$perfil = "Colaborador";
							break;
							case 3:
							$perfil = "Administrador";
						}							
						$excluir = "<a href='excluir.php?id=$id&nome=$nome' title='Excluir $nome'><input type='button' value='Excluir'></a>";
						$editar  = "<a href='editar.php?tucano=$id'><input type='button' value='Editar'></a>"; 
						echo "<tr>";				
						echo "<td>".$id."</td>";
						echo "<td>".$nome."</td>";
						echo "<td>".$celular."</td>";
						echo "<td>".$email."</td>";
						echo "<td align='center'>".$nascimento."</td>";
						echo "<td align='center'>".$perfil."</td>";
						echo "<td>".$excluir."".$editar."</td>";
						echo "</tr>";
					}
				?>
			</table>
		</center>
	</body>
</html>