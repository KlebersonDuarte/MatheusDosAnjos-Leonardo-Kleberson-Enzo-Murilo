💥 Primeiro: onde esses códigos entram?

Você vai usar cada trecho em um arquivo separado (ou juntos dependendo da lógica do seu projeto):

✔ inserir dados → geralmente em arquivo tipo:

add.php

processaCadastro.php

ou até no mesmo arquivo do formulário

✔ listar dados → normalmente:

index.php

produtos.php

lista.php

================================================================================
📌 Mas ambos SEMPRE precisam incluir conexao.php


<?php
include 'conexao.php';

$sql = "INSERT INTO produtos (nome, preco, estoque) VALUES ('Dorflex', 12.50, 100)";

if ($mysqli->query($sql)) {
    echo "Produto inserido com sucesso!";
} else {
    echo "Erro: " . $mysqli->error;
}
?>


<?php
include 'conexao.php';

$sql = "SELECT * FROM produtos";
$result = $mysqli->query($sql);

while ($linha = $result->fetch_assoc()) {
    echo $linha['nome'] . " - R$ " . $linha['preco'] . "<br>";
}
?>

=====================================================================================
include = se der erro, ele só mostra um aviso e continua
require = se der erro, PARA o script

Use require para arquivos importantes como conexões.
======================================================================================
o $SESSEION GUARDA INFO POR UM TEMPO

TEM Q INICIAR ELA EM UMA PAG Q FOR PRECISAR DELA
======================================================================================

MATAR O SCRIPT SE A PAG FOR ACESSADO SEM PERMISSÃO