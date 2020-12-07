<%-- 
    Document   : recebe-alterar-dados-cliente
    Created on : 2 de dez de 2020, 15:03:28
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
                    Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
                    String cpf = request.getParameter("cpf");
                    String nome = request.getParameter("nome");
                    String telefone = request.getParameter("telefone");
                    String email = request.getParameter("email");
                    String numcartao = request.getParameter("numcartao");

                    Cliente cliente = new Cliente();
                    cliente.setId(idcliente);
                    cliente.setCpf(cpf);
                    cliente.setNome(nome.toUpperCase());
                    cliente.setTelefone(telefone);
                    cliente.setEmail(email.toLowerCase());
                    cliente.setNumcartao(numcartao);

                    try {
                        cliente.alterar();
                        out.write("Dados Alterados com Sucesso<br/><br/><hr/>" + 
                                  "<a href='consultar-cliente.jsp'>Retornar para Página Anterior</a><br/><br/>" + 
                                  "<a href='index.html'>Retornar para Página Principal</a>");
                    } catch (Exception ex) {
                        out.write("Erro: " + ex.getMessage());
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
