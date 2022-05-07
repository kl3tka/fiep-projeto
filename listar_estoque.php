<!DOCTYPE html>
<?php
	include "conexao.php";
	$sql = "SELECT * FROM tb_modelos_novos WHERE idmodelo_novo > 0 ORDER BY idmodelo_novo";
	$pessoas = $fusca ->prepare($sql);
	$pessoas -> execute();
	$fusca = null; //encerra conexão com o banco
?>
<html lang="pt-br">
    <head>
    <style>
    table {
  border-collapse: collapse;
  width: 100%;
	}

	th, td {
  text-align: left;
  padding: 8px;
  color: black;
	}

	tr:nth-child(even) {background-color: white;}
        body {
		font-family: 'Roboto Mono', monospace;
	    }
        </style>
    </head>
        <body>
<?php include "menu.php";?>
	<body>
		<hr>
		<p align="center">
		</p>		
		<hr>		
		<center>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>Modelo</th>
					<th>Ano</th>
					<th>Categoria</th>
				</tr>
                <?php
					foreach($pessoas as $bolacha){
						$idmodelo_novo         = $bolacha['idmodelo_novo'];
						$nome       = $bolacha['nome'];
						$ano      = $bolacha['ano'];
						$categoria = $bolacha['categoria'];						
						$excluir = "<a href='excluir.php?id=$idmodelo_novo&modelo=$nome' title='Excluir $nome'><input type='button' value='Excluir'></a>";
						echo "<tr>";				
						echo "<td>".$idmodelo_novo."</td>";
						echo "<td>".$nome."</td>";
						echo "<td>".$ano."</td>";
						echo "<td>".$categoria."</td>";
						echo "</tr>";
					}
				?>
            </table>
        </center>
        </body>
</html>