<%-- 
    Document   : cadastrar-cliente
    Created on : 20 de nov de 2020, 10:37:05
    Author     : Janine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCADORA DE VEÍCULOS INDAIAL</title>
        <link rel="shortcut icon" href="car3.ico" type="image/x-icon"> <!-- Inserção do ícone na barra de título do navegador -->
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    <body>
    <div id="interface">

        <header id="cabecalho">
            <script src="scripts/cabecalho.js"></script>
        </header>

        <section>
            <nav id="menu">
                <script src="scripts/menu.js"></script>
            </nav>
            <article>
                <p id="erros"></p>
                <form action="receber-dados-cliente.jsp" method="POST">
                    <label>CPF</label>
                    <input type="text" name="cpf"/>
                    <label id="erroCpf" class="error"></label>
                    <br/>

                    <label>Nome Completo</label>
                    <input type="text" name="nome"/>
                    <br/>

                    <label>Número do Cartão</label>
                    <input type="text" name="numcartao"/>
                    <br/>

                    <label>E-Mail</label>
                    <input type="text" name="email"/>
                    <br/>

                    <label>Telefone</label>
                    <input type="text" name="telefone"/>
                    <br/>            

                    <hr/>
                    <input type="submit" value="Salvar Dados" onclick="enviarForm()"/>
                    <br/>
                </form>
            </article>
        </section>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>

        <script>
            function enviarForm() {
                var semErros = true;
                var erros = document.getElementById("erros");
                var cpf = document.getElementsByName("cpf");
                if (cpf[0].value === "") {
                    erros.innerHTML = "Informe CPF";
                    document.getElementById("erroCpf").innerHTML = "Informar CPF";
                    //cpf[0].focus();
                    semErros = false;
                }
            
                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    erros.innerHTML += "Informe Nome";
                    //document.getElementById("erroNome").innerHTML = "Informar Nome";
                    //cpf[0].focus();
                    semErros = false;
                }
                if (semErros)
                    document.forms[0].submit();
            }
        </script>
    </body>
</html>
