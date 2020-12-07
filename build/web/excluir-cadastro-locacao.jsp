<%-- 
    Document   : excluir-cadastro-locacao
    Created on : 6 de dez de 2020, 19:46:34
    Author     : Janine
--%>

<%@page import="classes.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCAÇÃO DE VEÍCULOS INDAIAL</title>
    </head>
    <body>
        <h1>Locação de Veículos</h1>
        <h2>Consulta de Locações Cadastradas</h2>
        <h3>Exclusão de Cadastro de Locações</h3>
        <hr/>
        <%
            String idlocacao = request.getParameter("idlocacao");
            Locacao loc = new Locacao();
            if (idlocacao != null) {
                loc = loc.consultar(Integer.parseInt(idlocacao));
                if (loc == null) {
                    out.write("Cadastro não Localizado");
                } else {
                    if (loc.excluir()) {
                        out.write("Cadastro Excluído com Sucesso");
                    } else {
                        out.write("Erro ao Excluir Cadastro");
                    }
                }
            }
        %>
        <hr/>
        <input type="button" value="Retornar para Página Anterior" onclick="location.href='consultar-locacao.jsp'"/><br/><br/>
        <input type="button" value="Retornar para Página Principal" onclick="location.href='index.html'"/>
    </body>
</html>
