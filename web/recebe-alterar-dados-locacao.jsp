<%-- 
    Document   : recebe-alterar-dados-locacao
    Created on : 6 de dez de 2020, 19:56:45
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
        <h1>Locadora de Veículos</h1>
        <h2>Consulta de Locações Cadastradas</h2>
        <h3>Alteração de Dados de Locações</h3>
        <hr/>
        <%
            Integer idlocacao = Integer.parseInt(request.getParameter("idlocacao"));
            Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
            Integer idcarro = Integer.parseInt(request.getParameter("idcarro"));
            String cpf = request.getParameter("cpf");
            Integer prazolocacao = Integer.parseInt(request.getParameter("prazolocacao"));
            
            Locacao locacao = new Locacao();
            locacao.setId(idlocacao);
            locacao.setCliente(idcliente);
            locacao.setCarro(carro);
            locacao.setCliente(cpf);
            locacao.setPrazolocacao(prazolocacao);
            try {
                locacao.alterar();
                out.write("Dados Alterados com Sucesso<br/><br/><hr/>" + 
                          "<a href='consultar-locacao.jsp'>Retornar para Página Anterior</a><br/><br/>" + 
                          "<a href='index.html'>Retornar para Página Principal</a>");
            } catch (Exception ex) {
                out.write("Erro: " + ex.getMessage());
            }
        %>
    </body>
</html>
