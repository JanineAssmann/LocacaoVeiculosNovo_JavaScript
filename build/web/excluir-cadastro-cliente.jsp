<%-- 
    Document   : excluir-cadastro-cliente
    Created on : 2 de dez de 2020, 15:35:35
    Author     : Janine
--%>

<%@page import="classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCADORA DE VEÍCULOS INDAIAL</title>
        <link rel="shortcut icon" href="imagens/car3.ico" type="image/x-icon"> <!-- Inserção do ícone na barra de título do navegador -->
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
                        if (cli == null) {
                            out.write("Cadastro não Localizado");
                        } else {
                            if (cli.excluir()) {
                                out.write("Cadastro Excluído com Sucesso");
                            } else {
                                out.write("Erro ao Excluir Cadastro");
                            }
                        }
                    }
                %>
        <hr/>
            </article>
        </section>
                <input type="button" value="Retornar para Página Anterior" onclick="location.href='consultar-cliente.jsp'"/><br/><br/>
        <input type="button" value="Retornar para Página Principal" onclick="location.href='index.html'"/>
    </div>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
