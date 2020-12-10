<%-- 
    Document   : alterar-dados-cliente
    Created on : 2 de dez de 2020, 10:55:28
    Author     : Janine
--%>

<%@page import="classes.Cliente"%>
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
                <%
                    String idcliente = request.getParameter("idcliente");
                    Cliente cli = new Cliente();
                    if (idcliente != null) {
                        cli = cli.consultar(Integer.parseInt(idcliente));
                    }
                %>
                <form action="recebe-alterar-dados-cliente.jsp" method="POST">
                    <table class="cadastro">
                        <tr>
                            <td><label>Código</label></td>
                            <td><input type="text" name="idcliente" readonly="true" value="<%out.write(String.valueOf(cli.getId()));%>"/></td>
                        </tr>
                        <tr>
                            <td><label>CPF</label></td>
                            <td><input type="text" name="cpf" value="<%out.write(cli.getCpf());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Nome</label></td>
                            <td><input type="text" name="nome" value="<%out.write(cli.getNome());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>E-Mail</label></td>
                            <td><input type="text" name="email" value="<%out.write(cli.getEmail());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Telefone</label></td>
                            <td><input type="text" name="telefone" value="<%out.write(cli.getTelefone());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Número do Cartão</label></td>
                            <td><input type="text" name="numcartao" value="<%out.write(cli.getNumcartao());%>"/></td>
                        </tr>
                    </table>
                    <hr/>
                    <div class="botao">
                        <input type="submit" value="Confirmar" onclick="enviarForm()"/>
                        <input type="reset" value="Cancelar"/>
                    </div>
                </form>
            </article>
        </section>
    </div>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
        <script>
            function enviarForm() {
                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    nome[0].focus();
                    alert("Informe a Nome");
                    exit();
                }
                
                var email = document.getElementsByName("email");
                if (email[0].value === "") {
                    email[0].focus();
                    alert("Informe a E-Mail");
                    exit();
                }
                
                var telefone = document.getElementsByName("telefone");
                if (telefone[0].value === "") {
                    telefone[0].focus();
                    alert("Informe a Telefone");
                    exit();
                }

                var numcartao = document.getElementsByName("numcartao");
                if (numcartao[0].value === "") {
                    numcartao[0].focus();
                    alert("Informe Número do Cartão");
                    exit();
                }

                document.forms[0].submit();
            }
        </script>
    </body>
</html>