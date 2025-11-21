<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

        <form id="PRODUTOS" action="" method ="">
<label for="NOME">NOME</label>
<input type="text" name='NOMEprod' id='NOMEprod'><br>

<label for="PRECO">PREÇO</label>
<input type="number" name='PRECO' id='PRECO'><br>
 
<label for="DESCRICAO">DESCRIÇÃO</label>
<input type="text" name='DESCRICAO' id='DESCRICAO'><br>
 
<label for="CATEGORIA">CATEGORIA</label>
<input type="text" name='CATEGORIA' id='CATEGORIA'><br>
 
<label for="FABRICACAO">FABRICAÇÃO</label>
<input type="date" name='FABRICACAO' id='FABRICACAO'><br>
 
<label for="VALIDADE">VALIDADE</label>
<input type="date" name='VALIDADE' id='VALIDADE'><br>
 
<button type="button" onclick="fProd()">Enviar</button>
</form>

<button type="button" onclick="fRenovar()">Renovar</button>
<div id="ProdsVencidos" onload="fListaVencidos"></div>


<script src="../js/prod.js"></script>
</body>
</html>