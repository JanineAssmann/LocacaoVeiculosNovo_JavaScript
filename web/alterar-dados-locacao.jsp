<%-- 
    Document   : alterar-dados-locacao
    Created on : 6 de dez de 2020, 19:46:00
    Author     : Janine
--%>

<%@page import="classes.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCADORA DE VEÍCULOS INDAIAL</title>
    </head>
    <body>
        <h1>Locadora de Veículos</h1>
        <h2>Consulta de Locações Cadastradas</h2>
        <h3>Alteração de Locações Cadastradas</h3>
        <hr/>
        <%
            String idlocacao = request.getParameter("idlocacao");
            Locacao loc = new Locacao();
            if (idlocacao != null) {
                loc = loc.consultar(Integer.parseInt(idlocacao));
            }
        %>
        <form action="recebe-alterar-dados-locacao.jsp" method="POST">
            <label>Código</label>
            <input type="text" name="idlocacao" readonly="true" value="<%out.write(String.valueOf(loc.getId()));%>"/>
            <br/><br/>
            <label>Código Cliente</label>
            <input type="text" name="idcliente" value="<%out.write(String.valueOf(loc.getCliente()));%>"/>
            <br/><br/>
            <label>Código Carro</label>
            <input type="text" name="idcarro" value="<%out.write(String.valueOf(loc.getCarro()));%>"/>
            <br/><br/>
            <label>Data de Retirada</label>
            <input type="text" name="dataretirada" value="<%out.write(String.valueOf(loc.getDataretirada()));%>"/>
            <br/><br/>
            <label>Prazo de Locação</label>
            <input type="text" name="prazolocacao" value="<%out.write(String.valueOf(loc.getPrazolocacao()));%>"/>
            <br/><br/>
            <hr/>
            <input type="submit" value="Confirmar Alteração dos Dados"/>
            <br/><br/>
        </form>
            <button onclick="location.href='consultar-locacao.jsp'">Retornar para Página Anterior</button><br/><br/>
            <button onclick="location.href='index.html'">Retornar para Página Principal</button>
            
    </body>
</html>
