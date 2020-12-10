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
                    <table class="cadastro">
                        <tr>
                            <td><label>Código</label></td>
                            <td><input type="text" name="idcarro" readonly="true" value="<%out.write(String.valueOf(c.getId()));%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Marca</label></td>
                            <td><input type="text" name="marca" value="<%out.write(c.getMarca());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Modelo</label></td>
                            <td><input type="text" name="modelo" value="<%out.write(c.getModelo());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Placa</label></td>
                            <td><input type="text" name="placa" value="<%out.write(c.getPlaca());%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Km</label></td>
                            <td><input type="text" name="km" value="<%out.write(String.valueOf(c.getKm()));%>"/></td>
                        </tr>
                        <tr>
                            <td><label>Ar Condicionado</label></td>
                            <td><input type="checkbox" name="arcond" <%out.write(c.isArcond()?"checked='checked'":"");%>/></td>
                        </tr>
                        <tr>
                            <td><label>Direção Hidráulica</label></td>
                            <td><input type="checkbox" name="dirhidraulica" <%out.write(c.isDirhidraulica()?"checked='checked'":"");%>/></td>
                        </tr>
                        <td><label>Câmbio Automático</label></td>
                        <td><input type="checkbox" name="cambioautom" <%out.write(c.isCambioautom()?"checked='checked'":"");%>/></td>

                    </table>
                    <hr/>
                    <div class="botao">
                        <input type="submit" value="Alterar" onclick="enviarForm()"/>
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
                var marca = document.getElementsByName("marca");
                if (marca[0].value === "") {
                    marca[0].focus();
                    alert("Informe a Marca");
                    exit();
                }
                
                var modelo = document.getElementsByName("modelo");
                if (modelo[0].value === "") {
                    modelo[0].focus();
                    alert("Informe a Modelo");
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
