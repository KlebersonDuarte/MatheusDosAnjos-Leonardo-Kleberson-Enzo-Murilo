//adicionar o produto ao banco de dados
async function fProd() {
    const prod = document.getElementById("PRODUTOS");
    const dadosEstoque = new FormData(prod);
    const estoque = Object.fromEntries(dadosEstoque.entries()); 
    estoque.acao = "armazenar";

    if (!estoque.NOMEprod || !estoque.PRECO || !estoque.DESCRICAO || !estoque.CATEGORIA || !estoque.FABRICACAO || !estoque.VALIDADE) {
        alert("Preencha todos os campos.");
        return; 
    }

    try {
        const Retorno = await fetch("prod.php",{
            method: "POST",
            headers: {'Content-Type': 'application/json' },
            body: JSON.stringify (estoque)
        })

        const Resposta = await Retorno.json();

        alert(Resposta.msg)
    } catch (error) {
        console.error("Error:",error)
    }
}

//renovar produto vencido
async function fRenovar() {
    const caixa = document.getElementById("ProdsVencidos");
    const renovar = {acao : "renovar"};

       try {
        const Retorno = await fetch("prod.php",{
            method: "POST",
            headers: {'Content-Type': 'application/json' },
            body: JSON.stringify (renovar)
        })

        const Resposta = await Retorno.json();

        caixa.textContent = 'Os seguintes produtos foram renovados:' + Resposta.msg; 
    } catch (error) {
        console.error("Error:",error)
    }
}