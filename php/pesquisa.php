<?php

require("conexao.php");

$method = $_SERVER["REQUEST_METHOD"];

switch($method){

    case "POST":

    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string, true);
    $acao = $data["acao"] ?? 'desconhecida';

if($acao === "pesquisar"){
    $pesquisa = $data["PESQUISAR"] ?? '';
    $pesquisa = "%$pesquisa%";

    $prePesq = $mysqli->prepare("SELECT * FROM tb_produto WHERE NOME_PRODUTO LIKE ? OR PRECO_PRODUTO LIKE ? OR CATEGORIA_PRODUTO LIKE ? OR DESCRICAO_PRODUTO LIKE ?");
    $prePesq->bind_param("ssss", $pesquisa, $pesquisa, $pesquisa, $pesquisa);
    $prePesq->execute();
    $result = $prePesq->get_result();

    $produtos = [];
    while($row = $result->fetch_assoc()){
        $produtos[] = $row;
    }

    echo json_encode($produtos);
    exit;
}
else{
    echo json_encode(["Resposta" => false, "msg" => "Falha ao enviar"]);
    exit;


}
exit;
    case "GET":
    echo json_encode(["Resposta" => false, "msg" => "O sistema não suporta GET"]);
    exit;

    default:
        echo json_encode(["Resposta" => false, "msg" => "Falha no sistema"]);
    exit;
}