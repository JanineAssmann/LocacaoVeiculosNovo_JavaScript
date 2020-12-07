<%-- 
    Document   : cadastrar-veiculo
    Created on : 16 de nov de 2020, 09:31:03
    Author     : Janine
--%>

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
                <form action="recebe-cadastrar-veiculos.jsp" method="POST">
                <table id="cadastro">
                    <tr>
                        <td><label>Marca</label></td>
                        <td><input type="text" name="marca"/></td>
                    </tr>
                    <tr>
                        <td><label>Modelo</label></td>
                        <td><input type="text" name="modelo"/></td>
                    </tr>
                    <tr>
                        <td><label>Placa</label></td>
                        <td><input type="text" name="placa"/></td>
                    </tr>
                    <tr>
                        <td><label>Km </label></td>
                        <td><input type="text" name="km"/></td>
                    </tr>
                    <tr>
                        <td><label>Ar Condicionado</label></td>
                        <td><input type="checkbox" name="arcond"/></td>
                    </tr>
                    <tr>
                        <td><label>Direção Hidráulica</label></td>
                        <td><input type="checkbox" name="dirhidraulica"/></td>
                    </tr>
                    <tr>
                        <td><label>Câmbio Automático</label></td>
                        <td><input type="checkbox" name="cambioautom"/></td>
                    </tr>
                    </table>
                    <table>
                        <tr><td><input type="submit" value="Salvar Dados" onclick="enviarForm()"/></td></tr>
                    </table>
                    <hr/>
                    <input type="submit" value="Salvar Dados" onclick="enviarForm()"/>
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
