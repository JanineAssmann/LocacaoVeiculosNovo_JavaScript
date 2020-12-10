<%-- 
    Document   : recebe-alterar-dados-veiculo
    Created on : 28 de nov de 2020, 20:47:48
    Author     : Janine
--%>

<%@page import="classes.Carro"%>
<%@page import="utils.Web"%>
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
                    Integer idcarro = Integer.parseInt(request.getParameter("idcarro"));
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");
                    String placa = request.getParameter("placa");
                    Integer km = Integer.parseInt(request.getParameter("km"));
                    Boolean arcond = Web.valorCheckbox(request.getParameter("arcond"));
                    Boolean dirhidraulica = Web.valorCheckbox(request.getParameter("dirhidraulica"));
                    Boolean cambioautom = Web.valorCheckbox(request.getParameter("cambioautom"));

                    Carro carro = new Carro();
                    carro.setId(idcarro);
                    carro.setMarca(marca.toUpperCase());
                    carro.setModelo(modelo.toUpperCase());
                    carro.setPlaca(placa.toUpperCase());
                    carro.setKm(km);
                    carro.setArcond(arcond);
                    carro.setDirhidraulica(dirhidraulica);
                    carro.setCambioautom(cambioautom);

                    try {
                        carro.alterar();
                        out.write("Dados Alterados com Sucesso");
                    } catch (Exception ex) {
                        out.write("Erro: " + ex.getMessage());
                    }
                %>
            </article>
        </section>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>
