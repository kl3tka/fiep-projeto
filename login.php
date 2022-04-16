<!DOCTYPE html>
<?php
	if(isset($_POST['login'])){
		$email_dig = $_POST['email'];
		$senha_dig = $_POST['senha'];
		
		$sql = "
			SELECT * 
			FROM tb_usuarios
			WHERE email = '$email_dig'
			AND senha = '$senha_dig'
			";
		include "conexao.php";
		$login = $fusca -> prepare($sql);
		$login -> execute();
		$fusca = null;
		$tucano = $login -> rowCount();
		if($tucano == 1){
			session_start();
			foreach($login as $l){
				$_SESSION['perfil'] = $l['perfil'];
				$_SESSION['login']  = "yes";
			}
			//var_dump($_SESSION['perfil']);
			header("Location: listar.php");
		}
		else{
			echo "
			<script>
				alert('Usuário ou senha incorretos');
				window.location.href='login.php';
			</script>
		";
		}
	}
?>
<html lang="pt-br">
<!-- Estrutura básica -->
	<head>
		<meta charset="UTF-8">
		<style>
			input[type=submit]{
				padding-bottom: 25px;
			}
		</style>
		<title>Login</title>
		<?php include "menu.php";?>	
	</head>
	<body>
		<hr>
		<h1 style="font-weight: bold;color:#ff4e33;" align="center">Login</h1>
		<hr>				
		<center>
			<form action="" method="POST">
				<h8 style="color: black">E-mail</h8>:<br>
				<input type="email" name="email" placeholder="Digite seu e-mail" autofocus required><br><br>
				<h8 style="color: black">Senha</h8><br>
				<input type="password" name="senha" placeholder="Digite sua senha" required><br><br>				
				<input type="submit" value="Logar" name="login">
			</form>
		</center>
	</body>
</html>