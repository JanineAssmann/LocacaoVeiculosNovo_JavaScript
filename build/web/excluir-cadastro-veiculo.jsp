<%-- 
    Document   : excluir-cadastro-veiculo
    Created on : 28 de nov de 2020, 20:46:45
    Author     : Janine
--%>

<%@page import="classes.Carro"%>
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
                    String idcarro = request.getParameter("idcarro");
                    Carro c = new Carro();
                    if (idcarro != null) {
                        c = c.consultar(Integer.parseInt(idcarro));
                        if (c == null) {
                            out.write("Cadastro não localizado");
                        } else {
                            if (c.excluir()) {
                                out.write("Cadastro Excluído com Sucesso");
                            } else {
                                out.write("Erro ao Excluir Cadastro");
                            }
                        }
                    }
                %>
                <!-- Incluir a confirmação antes da exclusão -->

            </article>
        </section>
        <hr/>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>
