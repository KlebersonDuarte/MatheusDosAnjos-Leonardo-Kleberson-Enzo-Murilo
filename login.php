<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form id="CADASTRAR" action="" method ="">
<label for="NOME">NOME</label>
<input type="text" name='NOME' id='NOME'><br>

<label for="CPF">CPF</label>
<input type="text" name='CPF' id='CPF'  minlength="14" maxlength="14"><br>

<label for="EMAILnew">EMAIL</label>
<input type="email" name='EMAILnew' id='EMAILnew'><br>

<label for="SENHAnew">SENHA</label>
<input type="password" name='SENHAnew' id='SENHAnew'><br>

<label for="SENHArept">REPITA A SENHA</label>
<input type="password" name='SENHArept' id='SENHArept'><br>

<button type="button" onclick="fCadastrar()">Enviar</button>

    </form><br>

        <form id="LOGIN" action="" method ="">
<label for="EMAIL">EMAIL</label>
<input type="email" name='EMAIL' id='EMAIL'><br>

<label for="SENHA">SENHA</label>
<input type="password" name='SENHA' id='SENHA'><br>

<button type="button" onclick="fLogin()">Enviar</button>

</form><br>



<script src="https://unpkg.com/imask"></script>
<script>
IMask(document.getElementById('CPF'), {
  mask: '000.000.000-00',
})</script>

<script src="js/usuario.js"></script>
</body>

</html>