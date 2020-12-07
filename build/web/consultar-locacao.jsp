<%-- 
    Document   : consultar-locacao
    Created on : 2 de dez de 2020, 22:03:08
    Author     : Janine
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Locacao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCADORA DE VEÍCULOS INDAIAL</title>
        <link rel="shortcut icon" href="car3.ico" type="image/x-icon"> <!-- Inserção do ícone na barra de título do navegador -->

    </head>
    <body>
        <h2>Locação de Veículos</h2>
        <h3>Consulta de Locações Cadastrados</h3>
        <hr/>
        <%
            String tipo = request.getParameter("tipo");
            String txtPesquisa = "";
            List <Locacao> locacoes = null;
            if (tipo == null || "".equals(tipo)) {
                locacoes = Locacao.consultar();
            } else {
                txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                Locacao locacao = null;
                switch(tipo) {
                    case "id":
                        locacao = Locacao.consultar(Integer.parseInt(txtPesquisa));
                        locacoes = new ArrayList<>();
                        locacoes.add(locacao);
                        break;
                    case "placa":
                        locacao = Locacao.consultarPlaca(txtPesquisa);
                        locacoes = new ArrayList<>();
                        locacoes.add(locacao);
                        break;
                    case "nome":
                        locacoes = Locacao.consultarNome(txtPesquisa);
                }
            }
        %>
        <form method="POST">
            <label>Pesquisar: </label>
            <select name="tipo">
                <option value="" <%out.write("".equals(tipo) || tipo == null ? "selected='selected'":"");%> ></option>
                <option value="id" <%out.write("id".equals(tipo) ? "selected='selected'":"");%> >Código Locação</option>
                <option value="placa" <%out.write("placa".equals(tipo) ? "selected='selected'":"");%> >Placa</option>
                <option value="nome" <%out.write("nome".equals(tipo) ? "selected='selected'":"");%> >Cliente</option>
            </select>
                <input type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                <button type="submit">Buscar</button>
            <hr/>
        </form>
        <table>
            <thead>
                <th>Código</th>
                <th>Carro</th>
                <th>Cliente</th>
                <th>Data</th>
                <th>Data Prevista para Retirada</th>
                <th>Data de Retirada</th>
                <th>Prazo de Locação</th>
                <th>Data Prevista para Devolução</th>
                <th>Data de Devolução</th>
                <th>Km na Retirada do Veículo</th>
                <th>Km na Devolução do Veículo</th>
                <th>Alterar Dados da Locação</th>
                <th>Excluir Locação Cadastrada</th>
            </thead>
            <tbody>
                <%for (Locacao loc: locacoes) {%>
                <tr>
                    <td><%out.write(String.valueOf(loc.getId()));%></td>
                    <td><%out.write(loc.getCarro().getPlaca());%></td>
                    <td><%out.write(loc.getCliente().getNome());%></td>
                    <td><%out.write(String.valueOf(loc.getData()));%></td>
                    <td><%out.write(String.valueOf(loc.getDataprevretirada()));%></td>
                    <td><%out.write(String.valueOf(loc.getDataretirada()));%></td>
                    <td><%out.write(String.valueOf(loc.getPrazolocacao()));%></td>
                    <td><%out.write(String.valueOf(loc.getDataprevdevolucao()));%></td>
                    <td><%out.write(String.valueOf(loc.getDatadevolucao()));%></td>
                    <td><%out.write(String.valueOf(loc.getKminicial()));%></td>
                    <td><%out.write(String.valueOf(loc.getKmfinal()));%></ td>
                    <td><%out.write("<a href=alterar-dados-locacao.jsp?idcliente="+String.valueOf(loc.getId())+">Alterar</a>");%></td>
                    <td><%out.write("<a href=excluir-cadastro-locacao.jsp?idcliente="+String.valueOf(loc.getId())+">Excluir</a>");%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <hr/>
        <button onclick="location.href='index.html'">Retornar para Página Principal</button>
    </body>
</html>
