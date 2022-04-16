<DOCTYPE html>
  <html>
  <head>
  <head>
      <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap CSS -->
      <link href="css/bootstrap.min.css" rel="stylesheet">
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

          hr  { 
          display: block; 
          content: ""; 
          height: 15px; 
          margin-top: 16px; 
          border-style: solid; 
          border-color: black; 
          border-width: 1 1 1px 0; 
          border-radius: 20px; 
          }

          body {
          background: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
          color: #FFFFFF;
          text-shadow: 2px black;
          }

          h1, h2, h3, h4, li, ul,{
          text-shadow: 2px 2px black;
          font-family: 'Roboto Mono', monospace;
          }
          p {
            font-family: 'Roboto Mono', monospace;
            color: grey;
          }
        </style>
      <title>Menu</title>
  </head>
  <hr>
  <center>
  <a href="menu.php"><input type="button" value="Menu"></a>
  <a href="listar.php"><input type="button" value="Usuários"></a>
  <a href="sobre.php"><input type="button" value="Sobre"></a>
  <a href="cadastro.php"><input type="button" value="Cadastrar"></a>
  <a href="listar_usuarios.php"><input type="button" value="Usuários do Sistema" title="Usuários do sistema"></a>
  <a href="status_data_center.php"><input type="button" value="Status Data Center" title="Status Data Center"></a>
  <a style="padding-left:400px;"href="login.php"><input type="button" value="Login" title="Login"></a>
  </center>
  <hr>

  <div
    class="p-5 text-center bg-image rounded-3"
    style="
    background-image: url('https://www.copilotsearch.com/uploads/photo-of-used-car-dealership-lot-in-philadelphia.jpg');
    height: 400px; 
    "
  >
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
      <div class="d-flex justify-content-center align-items-center h-100">
        <div class="text-white">
          <h1 style="color: white;font-family: 'Roboto Mono', monospace; font-weight: bold; text-shadow: 4px 4px black;" class="mb-3">Seja bem-vindo</h1>
          <h4 style="color: white;font-family: 'Roboto Mono', monospace; font-weight: bold; text-shadow: 4px 4px black;" class="mb-3">Gerenciamento da Concessionária</h4>
        </div>
      </div>
    </div>
  </div>

  </html>