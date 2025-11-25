const barraP = document.getElementById("barraP");
const caixa = document.getElementById("sugestoes");

// Dispara a pesquisa enquanto digita
barraP.addEventListener("input", () => {
    fPesquisar();
});

// Pressionar ENTER também pesquisa
barraP.addEventListener("keydown", (event) => {
    if(event.key === "Enter"){
        event.preventDefault();
        fPesquisar();
    }
});


// Função que pesquisa no PHP
async function fPesquisar() {

    const pesquisa = barraP.value;

    if (pesquisa === "") {
        caixa.innerHTML = "";
        return;
    }

    try {
        const Retorno = await fetch("pesquisa.php", {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({acao: "pesquisar",PESQUISAR: pesquisa })});

        const Resposta = await Retorno.json();

        // Limpa antes de adicionar
        caixa.innerHTML = "";

        // Se vier vazio, não mostra nada
        if (!Resposta || Resposta.length === 0) return;

        // Cria lista de sugestões
        Resposta.forEach(prod => {
            const item = document.createElement("div");
            item.classList.add("sug-item");
            item.textContent = prod.NOME_PRODUTO;

            // Quando clicar → coloca no input
            item.addEventListener("click", () => {
                barraP.value = prod.NOME_PRODUTO;
                caixa.innerHTML = "";
            });

            caixa.appendChild(item);
        });

    } catch (error) {
        console.error("Erro:", error);
    }
}
