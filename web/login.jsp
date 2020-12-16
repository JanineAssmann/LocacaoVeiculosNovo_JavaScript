<%-- 
    Document   : login
    Created on : 11 de dez de 2020, 08:15:16
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
            <div>
                <h1>LOGIN</h1>
                <form method="POST">
                    <div class="login">
                        <label>Usuário</label><br/>
                        <input type="text" name="usuario" width="100px"/><br/>
                        <label>Senha</label><br/>
                        <input type="password" name="senha" style=width:50px"/><br/>
                        <input type="submit" value="Entrar"/><br/>
                        <a href="cadastar-cliente.jsp"><input type="button" value="Cadastrar"/></a><br/>
                    </div>
                </form>        
            </div>   
            <%
                String usuario = request.getParameter("usuario");
                String senha = request.getParameter("senha");

                if((usuario != null) && (senha != null) && !(usuario.isEmpty()) && !(senha.isEmpty()) ){
                    //crie a seção             
                    if (Cliente.podeLogar(usuario, senha)) {
                        session.setAttribute("usuario", usuario);
                        response.sendRedirect("cadastrar-locacao.jsp");
                    }
                }

            %>
        </section>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
