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
            String desc = "";
            String password = "";
            if (session.getAttribute("emailAddress") != null) {
                emailAdd = (String) session.getAttribute("emailAddress");
                desc = (String)session.getAttribute("userDesc");
                password = (String)session.getAttribute("userPass");
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

            <h1>Changing your password</h1>
            <div class="contenedor">

                <p>Confirm your current password to continue:</p>
                <div class="input-contenedor">
                    <i class="fas fa-user icon"></i>
                    <input type="password" placeholder="Password" name="currentPass">
                </div>
                
                <input style="display:none; height:auto;" type="text" name="userMail" value="<%=emailAdd%>"/>
                <input style="display:none; height:auto;" type="text" name="userDesc" value="<%=desc%>"/>
                <input style="display:none; height:auto;" type="text" name="userPass" value="<%=password%>"/>
                <input style="display:none; height:auto;" type="text" name="changePasswordConfirm" value="yes"/>
                <input type="submit" value="Confirm" class="buttonDel_Save" formaction="UserEditController"><p>
                <input type="submit" value="Cancel" class="buttonLogout" formaction="index.jsp">
            </div>
        </form>
    </body>
</html>