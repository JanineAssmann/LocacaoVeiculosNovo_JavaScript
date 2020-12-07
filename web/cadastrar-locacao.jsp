<%-- 
    Document   : cadastrar-locacao
    Created on : 2 de dez de 2020, 15:44:51
    Author     : Janine
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="classes.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCADORA DE VEÍCULOS INDAIAL</title>
    </head>
    <body>
        <h1>Locação de Veículos</h1>
        <h2>Cadastro de Locações</h2>
        <hr/>
        <%
            Carro carro = new Carro();
            List<Carro> carros = carro.consultar();
            
            Cliente cliente = new Cliente();
            List<Cliente> clientes = cliente.consultar();
        %>

        <form action="recebe-cadastrar-locacao.jsp" method="POST">
            <label>Selecionar Veículo para Locação</label>
            <select name="idcarro">
                <%for (Carro car : carros) {%>
                <option value="<%out.write(String.valueOf(car.getId()));%>">
                    <%out.write(car.getPlaca() + " / " + car.getModelo());%>
                </option>
                <%}%>
            </select>
            <br/><br/>
            <label>Selecionar Cliente para Locação</label>
            <select name="idcliente">
                <%for (Cliente cli : clientes) {%>
                <option value="<%out.write(String.valueOf(cli.getId()));%>">
                    <%out.write(cli.getNome() + " / " + cli.getCpf());%>
                </option>
                <%}%>
            </select>
            <br/><br/>
            <label>Data da Reserva</label>
            <input type="date" name="data"/>
            <br/><br/>
            <label>Data Prevista para Retirada</label>
            <input type="date" name="dataprevretirada"/>
            <br/><br/>
            <label>Km do Veículo na Retirada</label>
            <input type="text" name="kminicial"/>
            <br/><br/>
            <label>Prazo de Locação</label>
            <input type="text" name="prazolocacao"/>
            <br/><br/>
            <label>Data Prevista para Devolução</label>
            <input type="date" name="dataprevdevolucao"/>
            <br/><br/>
            <hr/>
            <input type="submit" value="Salvar Cadastro de Locação"/>

        </form>
    </body>
</html>