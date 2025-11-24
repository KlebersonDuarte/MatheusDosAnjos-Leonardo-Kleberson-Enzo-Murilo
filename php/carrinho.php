<?php
session_start();
require("conexao.php");

$Method = $_SERVER['REQUEST_METHOD'];

switch($Method){

case "POST":

    $json_string = file_get_contents("php://input");
    $data = json_decode($json_string);
    $acao = $data->acao ?? 'desconhecida';

//LISTAR PRODUTOS

    if ($acao === "listarProdutos") {
        $pre = $mysqli->prepare("SELECT ID_PRODUTO, NOME_PRODUTO, PRECO_PRODUTO, CATEGORIA_PRODUTO, DESCRICAO_PRODUTO FROM tb_produto");
        $pre->execute();
        $pre->store_result();
        
        $produtos = [];
        if ($pre->num_rows > 0) {
            $pre->bind_result($id, $nome, $preco, $categoria, $descricao);
            while ($pre->fetch()) {
                $produtos[] = ['ID_PRODUTO' => $id,'NOME_PRODUTO' => $nome,'PRECO_PRODUTO' => $preco,'CATEGORIA_PRODUTO' => $categoria,'DESCRICAO_PRODUTO' => $descricao];
            }
        }

        echo json_encode(['Resposta' => true, 'produtos' => $produtos]);
        exit;
    }

// ADICIONAR ITEM AO CARRINHO
    if ($acao === "adicionar") {

        $idProduto = $data->ID_PRODUTO ?? 0;
        $qtd = $data->QUANTIDADE ?? 1;

        // Usar sessão para identificar carrinho (sem login)
        // Se não tem carrinho na sessão, criar um novo
        if (!isset($_SESSION['id_carrinho'])) {
            // Criar novo carrinho com ID_USUARIO = 0 (usuário não logado)
            $pre2 = $mysqli->prepare("INSERT INTO tb_carrinho (ID_USUARIO) VALUES (0)");
            $pre2->execute();
            $idCarrinho = $pre2->insert_id;
            $_SESSION['id_carrinho'] = $idCarrinho;
        } else {
            $idCarrinho = $_SESSION['id_carrinho'];
            
            // Verificar se o carrinho ainda existe
            $preCheck = $mysqli->prepare("SELECT ID_CARRINHO FROM tb_carrinho WHERE ID_CARRINHO = ?");
            $preCheck->bind_param("i", $idCarrinho);
            $preCheck->execute();
            $preCheck->store_result();
            
            if ($preCheck->num_rows === 0) {
                // Carrinho foi deletado, criar novo
                $pre2 = $mysqli->prepare("INSERT INTO tb_carrinho (ID_USUARIO) VALUES (0)");
                $pre2->execute();
                $idCarrinho = $pre2->insert_id;
                $_SESSION['id_carrinho'] = $idCarrinho;
            }
        }

        // Verificar se o produto já está no carrinho
        $preItem = $mysqli->prepare("SELECT ID_ITEM_CARRINHO, QUANTIDADE_ITEM FROM tb_item_carrinho WHERE ID_CARRINHO = ? AND ID_PRODUTO = ?");
        $preItem->bind_param("ii", $idCarrinho, $idProduto);
        $preItem->execute();
        $preItem->store_result();

        if ($preItem->num_rows === 1) {
            // já existe → atualizar quantidade
            $preItem->bind_result($idItemCarrinho, $qtdAtual);
            $preItem->fetch();

            $novaQtd = $qtdAtual + $qtd;

            // atualizar
            $up = $mysqli->prepare("UPDATE tb_item_carrinho SET QUANTIDADE_ITEM = ?, TOTAL_ITEM = PRECO_UNITARIO * ? WHERE ID_ITEM_CARRINHO = ?");
            $up->bind_param("iii", $novaQtd, $novaQtd, $idItemCarrinho);
            $up->execute();

            echo json_encode(['Resposta' => true, 'msg' => "Quantidade atualizada"]);
            exit;

        } else {
            // não existe → inserir novo item
            // pegar preço do produto
            $pp = $mysqli->prepare("SELECT PRECO_PRODUTO FROM tb_produto WHERE ID_PRODUTO = ?");
            $pp->bind_param("i", $idProduto);
            $pp->execute();
            $pp->store_result();

            if ($pp->num_rows !== 1) {
                echo json_encode(['Resposta' => false, 'msg' => "Produto inválido"]);
                exit;
            }

            $pp->bind_result($preco);
            $pp->fetch();

            $total = $preco * $qtd;

            $ins = $mysqli->prepare(
                "INSERT INTO tb_item_carrinho (ID_CARRINHO, ID_PRODUTO, QUANTIDADE_ITEM, PRECO_UNITARIO, TOTAL_ITEM) VALUES (?, ?, ?, ?, ?)"
            );

            $ins->bind_param("iiidd", $idCarrinho, $idProduto, $qtd, $preco, $total);
            $ins->execute();

            echo json_encode(['Resposta' => true, 'msg' => "Produto adicionado ao carrinho"]);
            exit;
        }
    }
 //LISTAR CARRINHO
    if ($acao === "listar") {
        
        if (!isset($_SESSION['id_carrinho'])) {
            echo json_encode(['Resposta' => true, 'itens' => []]);
            exit;
        }

        $idCarrinho = $_SESSION['id_carrinho'];

        // pega os itens
        $it = $mysqli->prepare("SELECT ic.ID_ITEM_CARRINHO, p.NOME_PRODUTO, p.CATEGORIA_PRODUTO, ic.QUANTIDADE_ITEM, ic.PRECO_UNITARIO, ic.TOTAL_ITEM FROM tb_item_carrinho ic JOIN tb_produto p ON ic.ID_PRODUTO = p.ID_PRODUTO WHERE ic.ID_CARRINHO = ? ");
        $it->bind_param("i", $idCarrinho);
        $it->execute();
        $it->store_result();

        $array = [];
        if ($it->num_rows > 0) {
            $it->bind_result($idItem, $nome, $categoria, $qtd, $precoUnit, $total);
            while ($it->fetch()) {
                $array[] = [ 'ID_ITEM_CARRINHO' => $idItem,'NOME_PRODUTO' => $nome,'CATEGORIA_PRODUTO' => $categoria,'QUANTIDADE_ITEM' => $qtd,'PRECO_UNITARIO' => $precoUnit,'TOTAL_ITEM' => $total];
            }
        }

        echo json_encode(['Resposta' => true, 'itens' => $array]);
        exit;
    }

//ATUALIZAR QUANTIDADE
    if ($acao === "atualizar") {

        $idItem = $data->ID_ITEM_CARRINHO ?? 0;
        $novaQtd = $data->QUANTIDADE ?? 1;

        if ($novaQtd <= 0) {
            echo json_encode(['Resposta' => false, 'msg' => "Quantidade deve ser maior que zero"]);
            exit;
        }

        $up = $mysqli->prepare("UPDATE tb_item_carrinho SET QUANTIDADE_ITEM = ?, TOTAL_ITEM = PRECO_UNITARIO * ? WHERE ID_ITEM_CARRINHO = ?");
        $up->bind_param("iii", $novaQtd, $novaQtd, $idItem);
        $up->execute();

        echo json_encode(['Resposta' => true, 'msg' => "Item atualizado"]);
        exit;
    }

//REMOVER ITEM
    if ($acao === "remover") {

        $idItem = $data->ID_ITEM_CARRINHO ?? 0;

        $del = $mysqli->prepare("DELETE FROM tb_item_carrinho WHERE ID_ITEM_CARRINHO = ?");
        $del->bind_param("i", $idItem);
        $del->execute();

        echo json_encode(['Resposta' => true, 'msg' => "Item removido"]);
        exit;
    }

    echo json_encode(['Resposta' => false, 'msg' => "Ação inválida"]);
    exit;

break;

default:
    echo json_encode(['Resposta' => false, 'msg' => "Método inválido"]);
    break;
}
