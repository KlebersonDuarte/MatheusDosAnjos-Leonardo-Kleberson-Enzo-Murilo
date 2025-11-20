async function fCadastrar() {
    const CADASTRAR = document.getElementById("CADASTRAR");

    const DadosCadas = new FormData(CADASTRAR);

  const dados = Object.fromEntries(DadosForm.entries());
  dados.acao = "cadastrar";


  try{
    const Retorno = await fetch("cadastro.php",{
        method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(dados)
    })

    const Resposta = await Retorno.json();
alert(Resposta.msg);
}
  catch (error) {
    console.error("Erro:",error)
  }
  
}

async function fLogin() {
        const LOGIN = document.getElementById("LOGIN");


         const DadosLogin = new FormData(LOGIN);

  const entrar = Object.fromEntries(DadosForm.entries());
  entrar.acao = "login";


  try {
    const Retorno = await fetch("login.php",{
        method: "POST",
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(entrar)
    })

    const Resposta = await Retorno.json();
alert(Resposta.msg);

  } catch (error) {
    console.error("Erro:",error)
  }
}