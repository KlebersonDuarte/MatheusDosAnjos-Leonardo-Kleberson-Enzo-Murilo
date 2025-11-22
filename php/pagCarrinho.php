<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho de Compras - HealthFarms</title>
    <link rel="stylesheet" href="../css/carrinho.css">
</head>
<body>
    <header>
        <h1>HealthFarms</h1>
        <button type="button" onclick="fVerCarrinho()">Ver Carrinho</button>
    </header>

    <div class="container">
        <h2>Produtos Disponíveis</h2>
        <div id="produtosContainer" class="produtos-grid"></div>
    </div>

    <div id="carrinhoModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Meu Carrinho</h2>
                <button type="button" onclick="fFecharCarrinho()" class="btn-fechar">×</button>
            </div>
            <div id="itensCarrinho" class="itens-carrinho"></div>
            <div class="carrinho-footer">
                <div class="total">
                    <strong>Total: R$ <span id="totalCarrinho">0.00</span></strong>
                </div>
                <div class="botoes-carrinho">
                    <button type="button" onclick="fContinuarComprando()" class="btn-continuar">Continuar Comprando</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/carrinho.js"></script>
    <script>
        // Carregar produtos ao abrir a página
        window.onload = function() {
            fCarregarProdutos();
        };
    </script>
</body>
</html>
