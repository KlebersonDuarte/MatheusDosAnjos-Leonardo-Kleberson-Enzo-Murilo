<?php

require("conexao.php");

$Method = $_SERVER['REQUEST_METHOD'];

switch($Method){

 case "POST":
    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string);
    $acao = $data->acao ?? 'desconhecida';

if ($acao == 'cadastrar') {
    $name  = trim($data->NOME ?? '');
    $email = trim($data->EMAIL  ?? '');
    $senha = trim($data->SENHA  ?? '');
    $cpf = trim($data->CPF  ?? '');

    // Verificar se já existe usuário com o mesmo email
    $stmt = $mysqli->prepare("SELECT ID_USUARIO FROM tb_usuario WHERE EMAIL_USUARIO = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
 echo json_encode(['Resposta' => true, 'msg' => "Email já cadastrado."]); 
        $stmt->close();
    } else {
        $stmt->close();
        // Criar hash seguro da senha
        $hash = password_hash($senha, PASSWORD_DEFAULT);

        // Inserir novo usuário com prepared statement
        $stmt2 = $mysqli->prepare("INSERT INTO tb_usuario  (NOME_USUARIO, EMAIL_USUARIO, SENHA_USUARIO,CPF_USUARIO) VALUES (?,?,?,?)");
        $stmt2->bind_param("ssss", $name, $email, $hash,$cpf);

        if ($stmt2->execute()) {
             echo json_encode(['Resposta' => true, 'msg' => "Cadastro realizado com sucesso."]); 
                        header("Location: index.php");
        } else {
            $error = "Erro ao cadastrar: " . $stmt2->error;
        }
        $stmt2->close();
    }

}

else if($acao == "login"){

    $email = trim($data->EMAIL  ?? '');
    $senha = trim($data->SENHA  ?? '');

    $stmt = $mysqli->prepare("SELECT ID_USUARIO, SENHA_USUARIO FROM tb_usuario WHERE EMAIL_USUARIO = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows === 1) {
        $usuario = $result->fetch_assoc();
        $hash = $usuario['SENHA_USUARIO'];

        if (password_verify($senha, $hash)) {
            $_SESSION['user'] = $usuario['ID_USUARIO'];
            $_SESSION['name'] = $usuario['NOME_USUARIO'];
            session_regenerate_id(true);
            header("Location: index.php");
             echo json_encode(['Resposta' => true, 'msg' => "Cadastro realizado com sucesso."]); 
            exit;
        } else {
            $error = "Email ou senha inválidos.";
        }
    } else {
        $error = "Email ou senha inválidos.";
    }
    $stmt->close();
}

else{

}
    break;

    case "GET":
        echo json_encode(['Resposta' => false, 'msg' => "Falha no sistema"]); 
        break;
    default:
    echo json_encode(['Resposta' => false, 'msg' => "Falha no sistema"]); 
    break;
}