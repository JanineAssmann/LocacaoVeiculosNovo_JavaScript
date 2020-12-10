<%-- 
    Document   : informacao
    Created on : 10 de dez de 2020, 11:30:40
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
        <style>
            div#interface {
                display: block;
                width: auto;
                margin: auto;
                margin-top: 100px;
            }
            p {
                color: blue;
                font-weight: bold;
                font-size: 25px;
                text-align: center;
            }
        </style>
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
            <p>
                <%
                out.write(request.getParameter("msg"));
                %>
            </p>
        </section>
    </div>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
