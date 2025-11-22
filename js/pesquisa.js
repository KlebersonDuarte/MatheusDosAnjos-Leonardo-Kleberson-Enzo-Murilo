
//pesquisar o item no estoque
async function fPesquisar() {
        const pesquisa = document.getElementById("PESQUISAR").value;
        if(!pesquisa) return alert("Digite algo para pesquisar");

        try {
            const Retorno = await fetch("pesquisa.php", {
                method: "POST", // Agora usamos POST
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({ acao: "pesquisar", PESQUISAR: pesquisa })
            });

            const Resposta = await Retorno.json();

            const tabela = document.getElementById("tabelaProdutos");
            tabela.innerHTML = `
                <tr>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Categoria</th>
                    <th>Descrição</th>
                </tr>
            `;

            if(Resposta.length === 0){
                tabela.innerHTML += `<tr><td colspan="4">Nenhum produto encontrado</td></tr>`;
            } else {
                Resposta.forEach(prod => {
                    tabela.innerHTML += `
                        <tr>
                            <td>${prod.NOME_PRODUTO}</td>
                            <td>${prod.PRECO_PRODUTO}</td>
                            <td>${prod.CATEGORIA_PRODUTO}</td>
                            <td>${prod.DESCRICAO_PRODUTO}</td>
                        </tr>
                    `;
                });
            }

        } catch (error) {
            console.error("Erro ao pesquisar:", error);
            alert(Resposta.msg);
        }
    }