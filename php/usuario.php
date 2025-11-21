<?php
session_start();

require("conexao.php");

$Method = $_SERVER['REQUEST_METHOD'];

switch($Method){

 case "POST":
    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string);
    
    // Verificar se o JSON foi decodificado corretamente
    if (json_last_error() !== JSON_ERROR_NONE || $data === null) {
        echo json_encode(['Resposta' => false, 'msg' => "Erro ao processar dados: " . json_last_error_msg()]);
        exit;
    }
    
    $acao = $data->acao ?? 'desconhecida';

if ($acao === 'cadastrar') {
    $name  = trim($data->NOME ?? '');
    $email = trim($data->EMAILnew  ?? '');
    $senha = trim($data->SENHAnew  ?? '');
    $cpf   = trim($data->CPF  ?? '');


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
    } else {

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

    // Validar se email e senha foram fornecidos
    if (empty($email) || empty($senha)) {
        echo json_encode(['Resposta' => false, 'msg' => "Email e senha são obrigatórios"]);
        exit;
    }

    $preEmail = $mysqli->prepare("SELECT ID_USUARIO, NOME_USUARIO, SENHA_USUARIO FROM tb_usuario WHERE EMAIL_USUARIO = ?");
    
    if (!$preEmail) {
        echo json_encode(['Resposta' => false, 'msg' => "Erro na preparação da query: " . $mysqli->error]);
        exit;
    }
    
    $preEmail->bind_param("s", $email);
    
    if (!$preEmail->execute()) {
        echo json_encode(['Resposta' => false, 'msg' => "Erro ao executar query: " . $preEmail->error]);
        exit;
    }
    
    // Usar store_result() e bind_result() como alternativa mais compatível
    $preEmail->store_result();
    
    if ($preEmail->num_rows === 1) {
        $preEmail->bind_result($id_usuario, $nome_usuario, $hash_senha);
        $preEmail->fetch();
        
        if (password_verify($senha, $hash_senha)) {
            $_SESSION['user'] = $id_usuario;
            $_SESSION['name'] = $nome_usuario;
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
    
    $preEmail->close();
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
