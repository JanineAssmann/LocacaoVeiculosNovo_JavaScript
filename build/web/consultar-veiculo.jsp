<%-- 
    Document   : consultar-veiculo
    Created on : 16 de nov de 2020, 08:56:11
    Author     : Janine
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Carro"%>
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
                    List <Carro> carros = null;
                    if (tipo == null || "".equals(tipo)) {
                        carros = Carro.consultar();
                    }
                    else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        Carro carro = null;
                        switch(tipo){
                            case "id":
                                carro = Carro.consultar(Integer.parseInt(txtPesquisa));
                                carros = new ArrayList<>();
                                carros.add(carro);
                                break;
                            case "marca":
                                carros = Carro.consultarMarca(txtPesquisa);
                                break;
                            case "modelo":
                                carros = Carro.consultarModelo(txtPesquisa);
                                break;
                            case "placa":
                                carro = Carro.consultarPlaca(txtPesquisa);
                                carros = new ArrayList<>();
                                carros.add(carro);
                        }
                    }
                %>
                <form method="POST">
                    <label>Pesquisar: </label>
                    <select name="tipo">
                        <option value="" <% out.write("".equals(tipo) || tipo == null ? " selected='selected'" : "");%> > </option> <!-- retorna a lista completa dos carros cadastrados -->
                        <option value="id" <% out.write("id".equals(tipo) ? " selected='selected'" : "");%> >Código</option> <!-- fixa a opção de consulta no código após busca -->
                        <option value="marca" <% out.write("marca".equals(tipo) ? " selected='selected'" : "");%> >Marca</option>
                        <option value="modelo" <% out.write("modelo".equals(tipo) ? " selected='selected'" : "");%> >Modelo</option>
                        <option value="placa" <% out.write("placa".equals(tipo) ? " selected='selected'" : "");%> >Placa</option>
                    </select>
                    <input type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button type="submit">Buscar</button>
                <hr/>
                </form>
                    <table> <!-- Indicação do início da tabela -->
                        <thead> <!-- Indicação de início do cabeçalho da tabela -->
                            <th>Código</th> <!-- Item do cabeçalho da tabela -->
                            <th>Marca</th> <!-- Item do cabeçalho da tabela -->
                            <th>Modelo</th> <!-- Item do cabeçalho da tabela -->
                            <th>Placa</th> <!-- Item do cabeçalho da tabela -->
                            <th>Km</th> <!-- Item do cabeçalho da tabela -->
                            <th>Ar Condicionado</th> <!-- Item do cabeçalho da tabela -->
                            <th>Direção Hidráulica</th> <!-- Item do cabeçalho da tabela -->
                            <th>Câmbio Automático</th> <!-- Item do cabeçalho da tabela -->
                            <th>Alterar Dados</th> <!-- Item do cabeçalho da tabela -->
                            <th>Excluir Registro</th> <!-- Item do cabeçalho da tabela -->

                            <!--criar os botões para as opções de excluir e editar-->

                        </thead> <!-- Indicação de final do cabeçalho da tabela -->
                        <tbody> <!-- Indicação de início do corpo da tabela -->
                            <% for (Carro car: carros) { %>
                            <tr> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                                <td><% out.write(String.valueOf(car.getId())); %></td> <!-- Conteúdo da célula -->
                                <td><% out.write(car.getMarca()); %></td> <!-- Conteúdo da célula -->
                                <td><% out.write(car.getModelo()); %></td> <!-- Conteúdo da célula -->
                                <td><% out.write(car.getPlaca()); %></td> <!-- Conteúdo da célula -->
                                <td><% out.write(String.valueOf(car.getKm())); %></td> <!-- Conteúdo da célula -->
                                <%
                                out.write("<td>" + (car.isArcond() ? "Sim" : "Não") + "</td>"); /* operador ternário para marcação do checkbox */
                                out.write("<td>" + (car.isDirhidraulica() ? "Sim" : "Não") + "</td>"); /* operador ternário para marcação do checkbox */
                                out.write("<td>" + (car.isCambioautom() ? "Sim" : "Não") + "</td>"); /* operador ternário para marcação do checkbox */
                                %>

                            <td><%out.write("<a href=alterar-dados-veiculo.jsp?idcarro="+String.valueOf(car.getId())+">Alterar</a>");%></td>
                            <td><%out.write("<a href=excluir-cadastro-veiculo.jsp?idcarro="+String.valueOf(car.getId())+">Excluir</a>");%></td>
                            </tr> <!-- Indicação do fim dos itens que formarão as linhas da tabela -->
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
