<?php
session_start();

require("conexao.php");

$Method = $_SERVER['REQUEST_METHOD'];

switch($Method){

 case "POST":
    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string);
    $acao = $data->acao ?? 'desconhecida';

if ($acao === 'cadastrar') {
    $name  = trim($data->NOME ?? '');
    $email = trim($data->EMAILnew  ?? '');
    $senha = trim($data->SENHAnew  ?? '');
    $cpf   = trim($data->CPF  ?? '');
    $senhaConfir = trim($data->SENHArept ?? '');


    if (
        strlen($senha) < 8 ||
        !preg_match('/[A-Z]/', $senha) || 
        !preg_match('/[a-z]/', $senha) ||
        !preg_match('/[0-9]/', $senha) || 
        !preg_match('/[\W]/', $senha)
    ) {
        echo json_encode(['Resposta' => false, 'msg' => "A senha deve conter: mínimo 8 caracteres, letra MAIÚSCULA, minúscula, número e símbolo."]);
        exit;
    }

    // Verificar se já existe usuário com o mesmo email
    $preEmail = $mysqli->prepare("SELECT ID_USUARIO FROM tb_usuario WHERE EMAIL_USUARIO = ?");
    $preEmail->bind_param("s", $email);
    $preEmail->execute();
    $preEmail->store_result();

    // Verificar CPF duplicado
    $preCPF = $mysqli->prepare("SELECT ID_USUARIO FROM tb_usuario WHERE CPF_USUARIO = ?");
    $preCPF->bind_param("s", $cpf);
    $preCPF->execute();
    $preCPF->store_result();

    
    if ($preEmail->num_rows > 0 || $preCPF->num_rows > 0) {
        echo json_encode(['Resposta' => false, 'msg' => "Email ou CPF já cadastrado."]);
        exit;
    } 
    
    else if ($senha != $senhaConfir) {
        echo json_encode(['Resposta' => false, 'msg' => "Senhas não coenciedem"]);
    exit;}

    else {

        // Criar hash seguro da senha
        $hash = password_hash($senha, PASSWORD_DEFAULT);

        // Inserir novo usuário com prepared statement
        $pre = $mysqli->prepare("INSERT INTO tb_usuario(NOME_USUARIO, EMAIL_USUARIO, SENHA_USUARIO,CPF_USUARIO) VALUES (?,?,?,?)");
        $pre->bind_param("ssss", $name, $email, $hash, $cpf);

        if ($pre->execute()) {
            echo json_encode(['Resposta' => true, 'msg' => "Cadastro realizado com sucesso."]);
            exit;
        } else {
            echo json_encode(['Resposta' => true, 'msg' => "Erro ao cadastrar: " . $pre->error]);
            exit; 
        }
    }
}

else if ($acao === "login"){

    $email = trim($data->EMAIL  ?? '');
    $senha = trim($data->SENHA  ?? '');

    $preEmail = $mysqli->prepare("SELECT ID_USUARIO, NOME_USUARIO, SENHA_USUARIO FROM tb_usuario WHERE EMAIL_USUARIO = ?");
    $preEmail->bind_param("s", $email);
    $preEmail->execute();
    $resultado = $preEmail->get_result();

    if ($resultado && $resultado->num_rows === 1) {
        $usuario = $resultado->fetch_assoc();
        $hash = $usuario['SENHA_USUARIO'];

        if (password_verify($senha, $hash)) {
            $_SESSION['user'] = $usuario['ID_USUARIO'];
            $_SESSION['name'] = $usuario['NOME_USUARIO'];
            session_regenerate_id(true);

            echo json_encode(['Resposta' => true, 'msg' => "Login realizado com sucesso.", 'redirecionamento' => 'index.php']);
            exit;
        } else {
            echo json_encode(['Resposta' => false, 'msg' => "Email ou senha inválidos"]);
            exit;
        }
    } else {
        echo json_encode(['Resposta' => false, 'msg' => "Email ou senha inválidos"]);
        exit;
    }
}

else if ($acao === "deslogar") {

    // se a sessão usa cookies, apaga o cookie
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

  unset($_SESSION['ID_USUARIO']);
    unset($_SESSION['NOME_USUARIO']);

    echo json_encode(['Resposta' => true,'msg' => "adeus",'redirecionamento' => "index.php"]);

    exit;
}


else {
    echo json_encode(['Resposta' => false, 'msg' => "Falha no sistema"]);
    exit;
}

break;

case "GET":
    echo json_encode(['Resposta' => false, 'msg' => "O sistema não suporta GET"]); 
    break;

default:
    echo json_encode(['Resposta' => false, 'msg' => "Falha no sistema"]); 
    break;
}
