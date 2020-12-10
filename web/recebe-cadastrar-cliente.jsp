<%-- 
    Document   : recebe-cadastrar-cliente
    Created on : 1 de dez de 2020, 20:40:21
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
                    String cpf = request.getParameter("cpf");
                    String nome = request.getParameter("nome");
                    String numcartao = request.getParameter("numcartao");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String usuario = request.getParameter("usuario");
                    String senha = request.getParameter("senha");

                    Cliente cliente = new Cliente();
                    if (cliente.userExist(request.getParameter("usuario"))) {
                        String msg = "Já existe cadastro com usuário informado.";
                        response.sendRedirect("informacao.jsp?msg=" + msg);
                    } else {
                        cliente.setCpf(cpf);
                        cliente.setNome(nome.toUpperCase());
                        cliente.setNumcartao(numcartao);
                        cliente.setEmail(email.toLowerCase());
                        cliente.setTelefone(telefone);
                        cliente.setUsuario(usuario);
                        cliente.setSenha(senha);
                        try {
                            cliente.salvar();
                            String msg = "Dados Cadastrados com Sucesso";
                            response.sendRedirect("informacao.jsp?msg=" + msg);
                        } catch (Exception ex) {
                            out.write("Erro: " + ex.getMessage());
                        }
                    }
                %>
            </article>
        </section>
    </div>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
