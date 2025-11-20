<?php

require("conexao.php");

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['EMAIL'] ?? '');//AQUI É O ID E N O NOME DA COLUNA
    $senha = trim($_POST['SENHA'] ?? '');

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
            header("Location: indexBack.php");
            exit;
        } else {
            $error = "Email ou senha inválidos.";
        }
    } else {
        $error = "Email ou senha inválidos.";
    }
    $stmt->close();
}