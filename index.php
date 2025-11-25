<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/inicio.css">
    <script src = "./inicio.js"></script> 
    <title>Framácia</title>
</head>
<body>

    <!--               HEADER              -->
    <header class="topo">
            <!-- nome da farmacia -->
                <div class= "nome">
                    <h1><></h1>
                </div>
            <!--barra de pesquisa-->

                <div class= "pesquisa">
                        <div class="iconeP">
                            

                        </div>

                        <div class="CaixaP">
                            
                            <input   type="text" name="barraP" id="barraP"  placeholder="pesquisa">
                            <div id="sugestoes" class="sugestoes"></div>

                        </div>
                </div>

                <div class="login">
<?php
session_start();

if (isset($_SESSION['name'])) {
    echo '<a href="login.php"><p>' . htmlspecialchars($_SESSION['name']) . '</p></a>';

} else {
    echo '<a href="login.php"><p>Login</p></a>';
}
?>

<button type="button" onclick="fDeslogar()"> </button>
                </div>


                
          <!-- carrinho -->
            <div class= "carrinho">
                <a href=""></a>
            </div>


                


    </header>

    <!--                  MAIN              -->
    <main>

        <div class="INDEimagens">

            <div class="INDEremedios">
                <a href="remedios.php">
                <img src="img/INDEcomprimidos.jpeg" alt="">
                </a>
                <p>Remédios</p>
            </div>
    
            <div class="INDEcosmedicos">    
                <a href="cosmedicos.php">
                    <img src="img/INDEcreme.jpeg" alt="">
                </a>
                <p>Cosmédos</p>
            </div>
            
            <div class="INDEhigiene">
                <a href="higiene.php">
                <img src="img/INDEsabonete.jpeg" alt="">
                </a>
                <p>Higiene pessoal</p>
            </div>
            
            <div class="INDEbebes">
                <a href="bebes.php">
                <img src="img/INDEchupeta.jpeg" alt="">
                </a>
                <p>Produtos para bebês</p>
            </div>
            
            <div class="INDEsocorros.php">
                <a href="socorros">
                <img src="img/INDEsocorros.jpeg" alt="">
                </a>
                <p>Primeiros socorros</p>
            </div>
            
            <div class="INDEequipamentos">
                <a href="equipamentos.php">
                <img src="img/INDEseringa.jpeg" alt="">
                </a>
                <p>Equipamentos médicos</p>
            </div>
            
            <div class="INDEvitaminas">
                <a href="vitaminas.php">
                <img src="img/INDEvitaminas.jpeg" alt="">
                </a>
                <p>Vitaminas e minerais</p>
            </div>
            
            <div class="INDEsaudesex">
                <a href="saudesex.php">
                <img src="img/INDEsaudesex.jpeg" alt="">
                </a>
                <p>Saúde sexual</p>
            </div>
            
            <div class="INDEperfumes">
                <a href="perfumes.php">
                <img src="img/INDEperfume.jpeg" alt="">
                </a>
                <p>Perfumes</p>
            </div>
            
            <div class="INDEdescontos">
                <a href="descontos.php">
                <img src="img/INDEdescontos.jpeg" alt="">
                </a>
                <p>Descontos</p>
            </div>

      

    </div>






    </main>

    <!--                 FOOTER             -->

<script src="js/pesquisa.js"></script>
<script src="js/usuario.js"></script>
</body>
</html>