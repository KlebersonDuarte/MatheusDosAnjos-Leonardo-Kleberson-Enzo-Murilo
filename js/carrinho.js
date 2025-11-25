// Carregar produtos do banco
async function fCarregarProdutos() {
    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ acao: "listarProdutos" })
        });

        const Resposta = await Retorno.json();
        
        if (Resposta.Resposta && Resposta.produtos) {
            const container = document.getElementById("produtosContainer");
            container.innerHTML = "";

            if (Resposta.produtos.length === 0) {
                container.innerHTML = "<p>Nenhum produto disponível</p>";
                return;
            }

            Resposta.produtos.forEach(produto => {
                const card = document.createElement("div");
                card.className = "produto-card";
                card.innerHTML = `
                    <div class="card-header">
                        <h3>${produto.NOME_PRODUTO}</h3>
                        <span class="categoria">${produto.CATEGORIA_PRODUTO}</span>
                    </div>
                    <div class="card-body">
                        <p class="descricao">${produto.DESCRICAO_PRODUTO}</p>
                        <div class="preco">R$ ${parseFloat(produto.PRECO_PRODUTO).toFixed(2)}</div>
                    </div>
                    <div class="card-footer">
                        <button type="button" onclick="fAdicionarAoCarrinho(${produto.ID_PRODUTO})" class="btn-adicionar">
                            Adicionar ao Carrinho
                        </button>
                    </div>
                `;
                container.appendChild(card);
            });
        } else {
            alert("Erro ao carregar produtos");
        }
    } catch (error) {
        console.error("Erro:", error);
        alert("Erro ao carregar produtos");
    }
}

// Adicionar produto ao carrinho
async function fAdicionarAoCarrinho(idProduto) {
    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                acao: "adicionar",
                ID_PRODUTO: idProduto,
                QUANTIDADE: 1
            })
        });

        const Resposta = await Retorno.json();
        
        if (Resposta.Resposta) {
            alert(Resposta.msg);
            // Atualizar carrinho se estiver aberto
            if (document.getElementById("carrinhoModal").style.display === "block") {
                fMostrarCarrinho();
            }
        } else {
            alert(Resposta.msg || "Erro ao adicionar produto");
        }
    } catch (error) {
        console.error("Erro:", error);
        alert("Erro ao adicionar produto ao carrinho");
    }
}

// Mostrar carrinho
async function fMostrarCarrinho() {
    const modal = document.getElementById("carrinhoModal");
    modal.style.display = "block";
    
    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ acao: "listar" })
        });

        const Resposta = await Retorno.json();
        
        if (Resposta.Resposta) {
            const container = document.getElementById("itensCarrinho");
            let total = 0;

            if (Resposta.itens.length === 0) {
                container.innerHTML = "<p class='carrinho-vazio'>Carrinho vazio</p>";
                document.getElementById("totalCarrinho").textContent = "0.00";
                return;
            }

            container.innerHTML = "";
            
            Resposta.itens.forEach(item => {
                const itemDiv = document.createElement("div");
                itemDiv.className = "item-carrinho";
                itemDiv.innerHTML = `
                    <div class="item-info">
                        <h4>${item.NOME_PRODUTO}</h4>
                        <p class="item-categoria">${item.CATEGORIA_PRODUTO}</p>
                        <p class="item-preco-unit">R$ ${parseFloat(item.PRECO_UNITARIO).toFixed(2)} cada</p>
                    </div>
                    <div class="item-controles">
                        <div class="quantidade-controle">
                            <button type="button" onclick="fAtualizarQuantidade(${item.ID_ITEM_CARRINHO}, ${item.QUANTIDADE_ITEM - 1})" class="btn-qtd">-</button>
                            <span class="qtd-valor">${item.QUANTIDADE_ITEM}</span>
                            <button type="button" onclick="fAtualizarQuantidade(${item.ID_ITEM_CARRINHO}, ${item.QUANTIDADE_ITEM + 1})" class="btn-qtd">+</button>
                        </div>
                        <div class="item-total">
                            <strong>R$ ${parseFloat(item.TOTAL_ITEM).toFixed(2)}</strong>
                        </div>
                        <button type="button" onclick="fRemoverItem(${item.ID_ITEM_CARRINHO})" class="btn-remover">Remover</button>
                    </div>
                `;
                container.appendChild(itemDiv);
                total += parseFloat(item.TOTAL_ITEM);
            });

            document.getElementById("totalCarrinho").textContent = total.toFixed(2);
        } else {
            alert(Resposta.msg || "Erro ao carregar carrinho");
        }
    } catch (error) {
        console.error("Erro:", error);
        alert("Erro ao carregar carrinho");
    }
}

// Fechar carrinho
function fFecharCarrinho() {
    document.getElementById("carrinhoModal").style.display = "none";
}

// Atualizar quantidade
async function fAtualizarQuantidade(idItem, novaQuantidade) {
    if (novaQuantidade <= 0) {
        fRemoverItem(idItem);
        return;
    }

    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                acao: "atualizar",
                ID_ITEM_CARRINHO: idItem,
                QUANTIDADE: novaQuantidade
            })
        });

        const Resposta = await Retorno.json();
        
        if (Resposta.Resposta) {
            fMostrarCarrinho();
        } else {
            alert(Resposta.msg || "Erro ao atualizar quantidade");
        }
    } catch (error) {
        console.error("Erro:", error);
        alert("Erro ao atualizar quantidade");
    }
}

// Remover item
async function fRemoverItem(idItem) {
    if (!confirm("Deseja remover este item do carrinho?")) {
        return;
    }

    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                acao: "remover",
                ID_ITEM_CARRINHO: idItem
            })
        });

        const Resposta = await Retorno.json();
        
        if (Resposta.Resposta) {
            alert(Resposta.msg);
            fMostrarCarrinho();
        } else {
            alert(Resposta.msg || "Erro ao remover item");
        }
    } catch (error) {
        console.error("Erro:", error);
        alert("Erro ao remover item");
    }
}

async function fPagar() {
    if (!confirm("Deseja finalizar a compra?")) {
        return;
    }

    try {
        const Retorno = await fetch("carrinho.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ acao: "pagar" })
        });

        const Resposta = await Retorno.json();

        if (Resposta.Resposta) {
            alert("Compra finalizada com sucesso!\n\nPedido Nº: " + Resposta.pedido);

            // Fecha carrinho e limpa exibição
            fFecharCarrinho();
            document.getElementById("itensCarrinho").innerHTML = "";
            document.getElementById("totalCarrinho").textContent = "0.00";

            // Carrinho foi zerado no banco
        } else {
            alert(Resposta.msg || "Erro ao finalizar compra");
        }

    } catch (error) {
        console.error("Erro:", error);
        alert("Não foi possível finalizar a compra");
    }
}
