<%-- 
    Document   : consultar-cliente
    Created on : 20 de nov de 2020, 11:00:07
    Author     : Janine
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                    String tipo = request.getParameter("tipo");
                    String txtPesquisa = "";
                    List <Cliente> clientes = null;
                    if (tipo == null || "".equals(tipo)) {
                        clientes = Cliente.consultar();
                    } else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        Cliente cliente = null;
                        switch(tipo) {
                            case "id":
                                cliente = Cliente.consultar(Integer.parseInt(txtPesquisa));
                                clientes = new ArrayList<>();
                                clientes.add(cliente);
                                break;
                            case "cpf":
                                clientes = Cliente.consultarCpf(txtPesquisa);
                                break;
                            case "nome":
                                clientes = Cliente.consultarNome(txtPesquisa);
                        }
                    }
                %>
                <form method="POST">
                    <label>Pesquisar: </label>
                    <select name="tipo">
                        <option value="" <%out.write("".equals(tipo) || tipo == null ? "selected='selected'":"");%> ></option>
                        <option value="id" <%out.write("id".equals(tipo) ? "selected='selected'":"");%> >Código</option>
                        <option value="cpf" <%out.write("cpf".equals(tipo) ? "selected='selected'":"");%> >CPF</option>
                        <option value="nome" <%out.write("nome".equals(tipo) ? "selected='selected'":"");%> >Nome</option>
                    </select>
                    <input type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button type="submit">Buscar</button>
                <hr/>

                </form>
                <table> <!-- Indicação do início da tabela -->
                    <thead> <!-- Indicação de início do cabeçalho da tabela -->
                        <th>Código</th> <!-- Item do cabeçalho da tabela -->
                        <th>CPF</th> <!-- Item do cabeçalho da tabela -->
                        <th>Nome Completo</th> <!-- Item do cabeçalho da tabela -->
                        <th>Nº do Cartão</th> <!-- Item do cabeçalho da tabela -->
                        <th>E-Mail</th> <!-- Item do cabeçalho da tabela -->
                        <th>Telefone</th> <!-- Item do cabeçalho da tabela -->
                        <th>Alterar Dados</th> <!-- Item do cabeçalho da tabela -->
                        <th>Excluir Registro</th> <!-- Item do cabeçalho da tabela -->

                    </thead> <!-- Indicação de final do cabeçalho da tabela -->
                    <tbody> <!-- Indicação de início do corpo da tabela -->
                        <% for (Cliente cli : clientes) { %>
                        <tr> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                            <td><%out.write(String.valueOf(cli.getId()));%></td>
                            <td><%out.write(cli.getCpf());%></td>
                            <td><%out.write(cli.getNome());%></td>
                            <td><%out.write(cli.getNumcartao());%></td>
                            <td><%out.write(cli.getEmail());%></td>
                            <td><%out.write(cli.getTelefone());%></td>
                            <td><%out.write("<a href=alterar-dados-cliente.jsp?idcliente="+String.valueOf(cli.getId())+">Alterar</a>");%></td>
                            <td><%out.write("<a href=excluir-cadastro-cliente.jsp?idcliente="+String.valueOf(cli.getId())+">Excluir</a>");%></td>
                        </tr> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                        <% } %>
                    </tbody> <!-- Indicação de final do corpo da tabela -->
                </table> <!-- Indicação do final da tabela -->
                <hr/>
            </article>
        </section>
        <button onclick="location.href='index.html'">Retornar para Página Principal</button><br/>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>
