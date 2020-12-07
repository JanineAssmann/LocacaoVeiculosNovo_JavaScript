<%-- 
    Document   : alterar-dados-veiculo
    Created on : 28 de nov de 2020, 20:45:58
    Author     : Janine
--%>

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
                    String idcarro = request.getParameter("idcarro");
                    Carro c = new Carro();
                    if (idcarro != null) {
                        c = c.consultar(Integer.parseInt(idcarro));
                    }
                %>
                <form action="recebe-alterar-dados-veiculo.jsp" method="POST">
                    <label>Código</label>
                    <input type="text" name="idcarro" readonly="true" value="<%out.write(String.valueOf(c.getId()));%>"/>
                    <br/><br/>
                    <label>Marca</label>
                    <input type="text" name="marca" value="<%out.write(c.getMarca());%>"/>
                    <br/><br/>
                    <label>Modelo</label>
                    <input type="text" name="modelo" value="<%out.write(c.getModelo());%>"/>
                    <br/><br/>
                    <label>Placa</label>
                    <input type="text" name="placa" value="<%out.write(c.getPlaca());%>"/>
                    <br/><br/>
                    <label>Km</label>
                    <input type="text" name="km" value="<%out.write(String.valueOf(c.getKm()));%>"/>
                    <br/><br/>
                    <input type="checkbox" name="arcond" <%out.write(c.isArcond()?"checked='checked'":"");%>/>
                    <label>Ar Condicionado</label>
                    <br/><br/>
                    <input type="checkbox" name="dirhidraulica" <%out.write(c.isDirhidraulica()?"checked='checked'":"");%>/>
                    <label>Direção Hidráulica</label>
                    <br/><br/>
                    <input type="checkbox" name="cambioautom" <%out.write(c.isCambioautom()?"checked='checked'":"");%>/>
                    <label>Câmbio Automático</label>
                    <hr/>
                    <input type="submit" value="Confirmar Alteração dos Dados"/>
                    <br/><br/>
                </form>
            </article>
        </section>
            <button onclick="location.href='consultar-veiculo.jsp'">Retornar para Página Anterior</button><br/><br/>
            <button onclick="location.href='index.html'">Retornar para Página Principal</button>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>
