<?php
	try{
		$fusca = new PDO("mysql:host=localhost;dbname=app_gerenciamento_concessionaria","root","");
		//echo "Conexão efetuada com sucesso";
	} 
	catch(PDOException $e){
		echo $e->getMessage(); //método amplamente utilizado
	}
?>	
