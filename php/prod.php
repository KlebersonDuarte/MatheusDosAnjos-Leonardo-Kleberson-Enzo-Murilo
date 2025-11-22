<?php

require("conexao.php");

$method = $_SERVER["REQUEST_METHOD"];

switch($method){
    case "POST":
    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string);
    $acao = $data->acao ?? 'desconhecida';

        if($acao === "armazenar"){
    $nome = $data->NOMEprod ?? '';
    $preco = trim($data->PRECO)?? '';
    $descricao = $data->DESCRICAO ?? '';
    $categoria = $data->CATEGORIA ?? '';
    $fabricacao = $data->FABRICACAO ?? '';
    $validade = $data->VALIDADE ?? '';
    
    $TimestampFabri = strtotime($fabricacao);
    $TimestampValid = strtotime($validade);

    $dataServidor = date("Y-m-d");
    $TimestampServidor = strtotime($dataServidor);

    if($TimestampFabri > $TimestampServidor){
        echo json_encode(["Resposta" => false, "msg" => "A data de fabricação tem que ser menor que a data atual."]);
        exit;
    }

    else if($TimestampValid < $TimestampServidor){
                echo json_encode(["Resposta" => false, "msg" => "O produto está vencido"]);
                        exit;
    }

    else if ($TimestampFabri > $TimestampValid){
                echo json_encode(["Resposta" => false, "msg" => "A data de fabricação não pode ser maior que a vailidade"]);
                exit;
    }

    else{
    $preNome = $mysqli->prepare("SELECT ID_PRODUTO FROM tb_produto WHERE NOME_PRODUTO = ?");
    $preNome->bind_param("s", $nome);
    $preNome->execute();
    $preNome->store_result();

    if($preNome->num_rows === 1){
        echo json_encode(["Resposta" => false, "msg" =>"Produto já cadastrado"]);
        exit;
    }

    else{
        $pre = $mysqli->prepare("INSERT INTO tb_produto(NOME_PRODUTO,PRECO_PRODUTO,CATEGORIA_PRODUTO,DESCRICAO_PRODUTO,FABRI_PRODUTO,VALIDADE_PRODUTO) VALUES (?,?,?,?,?,?)");
        $pre->bind_param("sdssss", $nome, $preco, $categoria ,$descricao, $fabricacao, $validade);
        if($pre->execute()){
        echo json_encode(["Resposta" => true, "msg" =>"Os seguinte produto foi cadastrado: $nome,com o preço: $preco"]);
            exit;}else{
                            echo json_encode(['Resposta' => false, 'msg' => "Erro ao cadastrar: " . $pre->error]);
            exit; 
            }
    }}
}


else if($acao === "renovar"){

    $hoje = date("Y-m-d");


    $tempo = $mysqli->prepare("SELECT ID_PRODUTO, NOME_PRODUTO, VALIDADE_PRODUTO FROM tb_produto WHERE VALIDADE_PRODUTO < ?");
    $tempo->bind_param("s", $hoje);
    $tempo->execute();
    $resultado = $tempo->get_result();


    if($resultado->num_rows === 0){
        echo json_encode(["Resposta" => false, "msg" => "Nenhum produto vencido encontrado."]);
        exit;
    }

    $produtos = [];
    while($row = $resultado->fetch_assoc()){
        $produtos[] = $row;
    }

    $update = $mysqli->prepare("UPDATE tb_produto SET VALIDADE_PRODUTO = ? WHERE ID_PRODUTO = ?");

    foreach($produtos as &$p){
        $novaValidade = date("Y-m-d", strtotime($p["VALIDADE_PRODUTO"]." +1 year"));
        $update->bind_param("si", $novaValidade, $p["ID_PRODUTO"]);
        $update->execute();

        $p["NOVA_VALIDADE"] = $novaValidade;
    }

        echo json_encode(["Resposta" => true,"msg" => $produtos]);
    exit;
}
else{
                echo json_encode(['Resposta' => false, 'msg' => "Falha ao cadastrar"]); 
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