<%-- 
    Document   : logout
    Created on : 11 de dez de 2020, 08:15:42
    Author     : Janine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
  
        // Professor colocou apenas as linhas abaixo, o restante não existe
        
<%
  session.invalidate();
  response.sendRedirect("login.jsp");
%>
        
        
        
        
        
        
        
        
    </body>
</html>
