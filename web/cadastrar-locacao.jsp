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
                    String usuario = (String) session.getAttribute("usuario");
                    if (usuario == null) {
                        response.sendRedirect("login.jsp");
                    }
                %>
                <%
                    Carro carro = new Carro();
                    List<Carro> carros = carro.consultar();

                    Cliente cliente = new Cliente();
                    List<Cliente> clientes = cliente.consultar();
                %>
                <p id="erros"></p>
                <form action="recebe-cadastrar-locacao.jsp" method="POST">
                <table class="cadastro">
                    <tr class="selection">
                        <td><label>Selecionar Veículo para Locação</label></td>
                        <td>
                            <select name="idcarro">
                                <%for (Carro car : carros) {%>
                                <option value="<%out.write(String.valueOf(car.getId()));%>">
                                    <%out.write(car.getPlaca() + " / " + car.getModelo());%>
                                </option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr class="selection">
                        <td><label>Selecionar Cliente para Locação</label></td>
                        <td>
                            <select name="idcliente">
                                <%for (Cliente cli : clientes) {%>
                                <option value="<%out.write(String.valueOf(cli.getId()));%>">
                                    <%out.write(cli.getNome() + " / " + cli.getCpf());%>
                                </option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Data da Reserva</label></td>
                        <td><input type="date" name="data"/></td>
                    </tr>
                    <tr>
                        <td><label>Data Prevista para Retirada</label></td>
                        <td><input type="date" name="dataprevretirada"/></td>
                    </tr>
                    <tr>
                        <td><label>Km do Veículo na Retirada</label></td>
                        <td><input type="text" name="kminicial"/></td>                
                    </tr>
                    <tr>
                        <td><label>Prazo de Locação</label></td>
                        <td><input type="text" name="prazolocacao"/></td>
                    </tr>
                    <tr>
                        <td><label>Data Prevista para Devolução</label></td>
                        <td><input type="date" name="dataprevdevolucao"/></td>
                    </tr>
                </table>
                <hr/>
                <div class="botao">
                    <input type="submit" value="Salvar" onclick="enviarForm()"/>
                    <input type="reset" value="Cancelar"/>
                </div>
                </form>
            </article>
        </section>
    </div>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
        <script>
            function enviarForm() {
                var semErros = true;
                var erros = document.getElementById("erros");
                var marca = document.getElementsByName("marca");
                if (marca[0].value === "") {
                    erros.innerHTML = "Informe Marca";
                    document.getElementById("erroCpf").innerHTML = "Informar Marca";
                    //marca[0].focus();
                    semErros = false;
                }
                
                var modelo = document.getElementsByName("modelo");
                if (modelo[0].value === "") {
                    modelo[0].focus();
                    alert("Informe o Modelo");
                    exit();
                }
                
                var placa = document.getElementsByName("placa");
                if (placa[0].value === "") {
                    placa[0].focus();
                    alert("Informe a Placa");
                    exit();
                }

                var km = document.getElementsByName("km");
                if (km[0].value === "") {
                    km[0].focus();
                    alert("Informe Km");
                    exit();
                }

                document.forms[0].submit();
            }
        </script>
    </body>
</html>