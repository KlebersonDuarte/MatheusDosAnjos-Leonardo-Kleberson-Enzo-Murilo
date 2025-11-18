<?php
//armezenar os produtos
//soma de produtos
//desconto 
//preço
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'POST':
      $json_string = file_get_contents("php://input");
      $data = json_decode($json_string);
      $acao = $data->acao ?? 'desconhecida';
//Total
$total = $prods;

//Desconto

  
    case 'GET':
      echo json_encode(['Resposta' => false, 'msg' => 'Método GET não suportado para esta operação.']);
      break;
  
    default:
      echo json_encode(['Resposta' => false, 'msg' => 'Método não permitido.']);
      break;
  }

