<%-- 
    Document   : recebe-cadastrar-locacao
    Created on : 2 de dez de 2020, 18:07:15
    Author     : Janine
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="utils.DataHora"%>
<%@page import="classes.Carro"%>
<%@page import="classes.Locacao"%>
<%@page import="classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCAÇÃO DE VEÍCULOS INDAIAL</title>
        <link rel="shortcut icon" href="car3.ico" type="image/x-icon"> <!-- Inserção do ícone na barra de título do navegador -->
    </head>
    <body>
        <h1>Locação de Veículos</h1>
        <h2>Cadastro de Veículos</h2>

        <%
            Integer idcarro = Integer.parseInt(request.getParameter("idcarro"));
            Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
            LocalDate data = LocalDate.parse(request.getParameter("data"));
            LocalDate dataprevretirada = LocalDate.parse(request.getParameter("dataprevretirada"));
            //LocalDateTime dataretirada = LocalDateTime.parse(request.getParameter("dataretirada"));
            Integer kminicial = Integer.parseInt(request.getParameter("kminicial"));
            Integer prazolocacao = Integer.parseInt(request.getParameter("prazolocacao"));
            LocalDate dataprevdevolucao = LocalDate.parse(request.getParameter("dataprevdevolucao"));
            
            Locacao locacao = new Locacao();
            Carro carro = new Carro();
            carro = carro.consultar(idcarro);
            locacao.setCarro(carro);
            Cliente cliente = new Cliente();
            cliente = cliente.consultar(idcliente);
            locacao.setCliente(cliente);
            locacao.setData(data);
            locacao.setDataprevretirada(dataprevretirada);
            //locacao.setDataretirada(dataretirada);
            locacao.setKminicial(kminicial);
            locacao.setPrazolocacao(prazolocacao);
            
            try {
                locacao.salvar();
                out.write("Locação Cadastrada com Sucesso<br/><br/>" + 
                          "<button onclick='history.go(-1)'>Retornar para Página Anterior</button><br/><br/>" + 
                          "<button onclick='history.go(-2)'>Retornar para Página Principal</button>");
            } catch (Exception ex) {
                out.write("Erro: " + ex.getMessage());
            }
        %>
    </body>
</html>
