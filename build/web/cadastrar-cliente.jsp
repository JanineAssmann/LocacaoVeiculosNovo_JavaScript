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
                <form action="recebe-cadastrar-cliente.jsp" method="POST">
                    <table class="cadastro">
                    <tr>
                        <td><label>CPF</label></td>
                        <td><input type="text" name="cpf"/></td>
                        <td><label id="erroCpf" class="error"></label></td>
                    </tr>
                    <tr>
                        <td><label>Nome Completo</label></td>
                        <td><input type="text" name="nome"/></td>
                    </tr>
                    <tr>
                        <td><label>Número do Cartão</label></td>
                        <td><input type="text" name="numcartao"/></td>
                    </tr>
                    <tr>
                        <td><label>E-Mail</label></td>
                        <td><input type="text" name="email"/></td>
                    </tr>
                    <tr>
                        <td><label>Telefone</label></td>
                        <td><input type="text" name="telefone"/></td>
                    </tr>
                    <tr>
                        <td><label>Usuário</label></td>
                        <td><input type="text" name="usuario"/></td>
                    </tr>
                    <tr>
                        <td><label>Senha</label></td>
                        <td><input type="password" name="senha"/></td>
                    </tr>
                    </table>
                    <hr/>
                    <div class="botao">
                        <input type="submit" value="Salvar" onclick="enviarForm()"/>
                        <input type="reset" value="Cancelar"/>
                    </div>
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
