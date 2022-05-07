<?php

// Estrutura basica do grafico
$grafico = array(
    'dados' => array(
        'cols' => array(
            array('type' => 'string', 'label' => 'Marca'),
            array('type' => 'number', 'label' => 'Carros')
        ),  
        'rows' => array()
    ),
    'config' => array(
        'title' => 'Quantidade de carros novos por marca',
        'width' => 720,
        'height' => 720
    )
);

// Consultar dados no BD
$pdo = new PDO("mysql:host=localhost;dbname=app_gerenciamento_concessionaria","root","");
//inner join serve para juntar 2 ou mais entidades com o mesmo codigo relacional entre livro e genero
$sql ='SELECT tb_marcas.nome as marca, COUNT(*) as quantidade FROM tb_modelos_novos inner join tb_marcas on tb_modelos_novos.id_marca = tb_marcas.id_marca GROUP BY tb_modelos_novos.id_marca';
//$sql = 'SELECT genero, COUNT(*) as quantidade FROM tb_livro  GROUP BY cod_genero';
$stmt = $pdo->query($sql);
while ($obj = $stmt->fetchObject()) {//pegar todos os registros que retornaram da consulta
    //monta as informações para gerar o grafico
    $grafico['dados']['rows'][] = array('c' => array(
        array('v' => $obj->marca),
        array('v' => (int)$obj->quantidade)
    ));
}

// Enviar dados na forma de JSON
header('Content-Type: application/json; charset=UTF-8');
echo json_encode($grafico);
exit(0);
