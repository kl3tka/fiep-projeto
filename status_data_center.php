    <!DOCTYPE html>
    <?php
    include "conexao.php";
    $sql = "SELECT * FROM tb_arduino ORDER BY id";
    $pessoas = $fusca ->prepare($sql);
    $pessoas -> execute();
    $fusca = null; //encerra conexão com o banco
    
    ?>
    <html>
    <head>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <meta charset="utf-8"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    
    <title>Status Data Center</title>
    
    <style>
        input[type=button], input[type=submit], input[type=reset] {
          padding:5px 15px; 
          background: #ff4e33; 
          border-style: groove;
          cursor: pointer;
          -webkit-border-radius: 40px 40px 40px 40px;
          border-radius: 8px;
          transition-duration: 0.4s;
          font-family: 'Roboto Mono', monospace;
          color: white;
          font-weight: bold;
          display: inline-block;
          border: none;
          }
    body{
        margin: 0 auto;
        text-align: center;
        background-color: #ffffff; 
        background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
        font-family: 'Roboto Mono', monospace;
        background-attachment: fixed;
    }
    h1{
        height: 100px;
        margin: 0 auto;
        background-color: #ffffff; 
        background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
        font-weight: 1000;
        font-family: 'Roboto Mono', monospace;
        color: black;
        font-size: 60px;
        background-attachment: fixed;
    }
    h2 {
        font-weight: bold;
        font-size: 45px;
        background-color: #ffffff; 
        background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
        background-attachment: fixed;
    }
    td, th {
        text-align: center;
        font-size: 30px;
        background-attachment: fixed;
        border: 1px solid black;
    }
    hr {
        border-top: 2px solid black;
    }
    table {
        border-collapse: collapse;
        border: 1px outset black;
        width: 100%;
    }
    .row::after {
        content: "";
        clear: both;
        display: table;
    }
    .column {
        float: left;
        width: 50%;
        padding: 5px;
    }
    
    
    </style>
    </head>
    <body>
    <a style="float: left;" href="menu.php"><input type="button" value="Voltar"></a>
    <h1>Sala do Data Center</h1>
    <hr>
    <table border=1, class="table">
        <thread>
                <tr>
                <th scope="col">Id  <br></th>
                <th scope="col">Data <br></th>
                <th scope="col">Temperatura <br></th>
                <th scope="col">Umidade <br></th>
            </tr>
        </thread>
    <?php 
    foreach($pessoas as $rows) {
        
        $id = $rows["id"];
        $hora_data = $rows["hora_data"];
        // $local = $rows["local"];
        $temp = $rows["temp"];
        $umid = $rows["umid"];
        
        echo "<tr>";
        echo "<td>".$id."</td>";
        echo "<td>".$hora_data."</td>";
        // echo "<td>".$local."</td>";
        echo "<td>".$temp."ºC</td>";
        echo "<td>".$umid."%</td>";
        echo "</tr>";
    }
    ?>
    </table>
    </body>
    </html>