<%-- 
    Document   : index
    Created on : Oct 25, 2019, 8:30:45 PM
    Author     : felix
--%>

<%@page import="java.io.IOException"%>
<%@page import="JavaClasses.User"%>
<%@page import="java.util.List"%>
<%@page import="JavaClasses.SQLStatements"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%
            String emailAdd = "";
            if (session.getAttribute("emailAddress") != null) {
                emailAdd = (String) session.getAttribute("emailAddress");
                //cancelDelete = (String)session.getAttribute("cancelDelete");
            }

            if (emailAdd.equals("")) {
                session.setAttribute("viewMode", "normal");
                response.sendRedirect("index.jsp");
            }    
        %>
        <meta charset="UTF-8">
        <title></title> 
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="styles/estilos.css">
        <script type="text/javascript">
        </script>

    </head>  
    <body>
        <form class="formulario" method="POST">

            <h1>Deleting your account</h1>
            <div class="contenedor">

                <p>Confirm your password to continue:</p>
                <div class="input-contenedor">
                    <i class="fas fa-user icon"></i>
                    <input type="password" placeholder="Password" name="userPass">
                </div>
                <input style="display:none; height:auto;" type="text" name="userMail" value="<%=emailAdd%>"/>
                <input style="display:none; height:auto;" type="text" name="deleteConfirmed" value="yes"/>
                <input type="submit" value="Confirm" class="buttonDel_Save" formaction="userDelController"><p>
                <input type="submit" value="Cancel" class="buttonLogout" formaction="index.jsp">
            </div>
        </form>
    </body>
</html>