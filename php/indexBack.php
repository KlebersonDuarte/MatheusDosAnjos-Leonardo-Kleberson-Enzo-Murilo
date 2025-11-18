<?php

include("conexao.php");

if(isset($_POST ['EMAIL']) || isset ($_POST ["SENHA"])){
    if(strlen($_POST["EMAIL"]) == 0){
        echo 'Preencha seu email manito';
    }

    else if(strlen($_POST ["SENHA"]) == 0){
        echo 'Preencha sua senha';
    }
    else{
        $EMAIL = $mysqli->real_escape_string($_POST["EMAIL"]);   
        $SENHA = $mysqli->real_escape_string($_POST["SENHA"]); 
        
        $sql_code = "SELECT * FROM tb_login WHERE EMAIL = '$EMAIL' AND SENHA = '$SENHA'";
        $sql_query = $mysqli->query($sql_code) or die ("Erro fatal");
    
        $quantidade = $sql_query->num_rows;

        if($quantidade == 1){

            $usuario = $sql_query->fetch_assoc();

            if(!isset($_SESSION)){
                session_start();
            }
        
        $_SESSION['user'] = $usuario['ID'];
        $_SESSION['name'] = $usuario['NAME'];
        
            header('Location: index.php');
    }

        else{
            echo 'Falha ao logar';
        }
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="POST">
<label for="EMAIL">Email</label>
<input type="email" name="EMAIL" id="EMAIL">

<label for="Senha">Senha</label>
<input type="password" name="SENHA" id="SENHA">

<input type="submit" value="Enviar">
    </form>
</body>
</html>