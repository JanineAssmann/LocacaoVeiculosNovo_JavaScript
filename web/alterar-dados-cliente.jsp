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
                    <label>Código</label>
                    <input type="text" name="idcliente" readonly="true" value="<%out.write(String.valueOf(cli.getId()));%>"/>
                    <br/><br/>
                    <label>CPF</label>
                    <input type="text" name="cpf" value="<%out.write(cli.getCpf());%>"/>
                    <br/><br/>
                    <label>Nome</label>
                    <input type="text" name="nome" value="<%out.write(cli.getNome());%>"/>
                    <br/><br/>
                    <label>E-Mail</label>
                    <input type="text" name="email" value="<%out.write(cli.getEmail());%>"/>
                    <br/><br/>
                    <label>Telefone</label>
                    <input type="text" name="telefone" value="<%out.write(cli.getTelefone());%>"/>
                    <br/><br/>
                    <label>Número do Cartão</label>
                    <input type="text" name="numcartao" value="<%out.write(cli.getNumcartao());%>"/>
                    <hr/>
                    <input type="submit" value="Confirmar Alteração dos Dados"/>
                    <br/><br/>
                </form>
            </article>
        </section>
            <button onclick="location.href='consultar-cliente.jsp'">Retornar para Página Anterior</button><br/><br/>
            <button onclick="location.href='index.html'">Retornar para Página Principal</button>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>