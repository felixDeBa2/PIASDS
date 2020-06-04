<%-- 
    Document   : index
    Created on : Oct 25, 2019, 8:30:45 PM
    Author     : felix
--%>

<%@page import="JavaClasses.User"%>
<%@page import="java.util.List"%>
<%@page import="JavaClasses.SQLStatements"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%
            String emailAdd = "";
            boolean editMode;
            if ((String) session.getAttribute("viewMode") == "edit") {
                editMode = true;
            } else {
                editMode = false;
            }
            if (session.getAttribute("emailAddress") != null) {
                emailAdd = (String) session.getAttribute("emailAddress");
            }

            if (emailAdd == "") {
                response.sendRedirect("loginVista.html");
            }

            User loggedUser = new User();
            loggedUser.setEmailAddress(emailAdd);

            try {
                loggedUser = SQLStatements.SelectUser(loggedUser);
            } catch (Exception e) {

            }
        %>
        <meta charset="UTF-8">
        <title></title> 
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" href="styles/estilos.css">
    </head>  
    <body>
        <form class="formulario" method="POST">

            <h1>Profile</h1>
            <div class="contenedor">


                <div class="input-contenedor">
                    <i class="fas fa-user icon"></i>
                    <input type="text" placeholder="UserName" name="userName"
                           value="<%=loggedUser.getUserName()%>" readonly="readonly">
                </div>

                <div class="input-contenedor">
                    <i class="fas fa-envelope icon"></i>
                    <input type="email" placeholder="Correo Electronico" name="userMail"
                           value="<%=loggedUser.getEmailAddress()%>" readonly="readonly">
                </div>
                <%if (editMode) {%>
                <input style="display:none; height:auto;" type="text" name="changePasswordConfirm" value="no"/>
                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" placeholder="Password" name="userPass">
                </div>
                <%}%>
                <div class="input-description">
                    <i class="fas fa-id-card icon"></i>
                    <input type="text" rows="5" name="userDesc" 
                              placeholder="Descripción" <%if (!editMode) {%>
                              disabled="true"<%}%> value="<%=loggedUser.getDescription()%>">
                </div>
                <input style="display:none; height:auto;" type="text" name="deleteConfirmed" value="no"/>
                <p><button type="submit" value="Eliminar" 
                           formaction="userDelController"
                           class="buttonDel_Save">Delete</button>
                    <%if (editMode){%>
                    <input type="submit" value="Save" class="buttonDel_Save" 
                           name="save" formaction="UserEditController" onclick="<%session.setAttribute("viewMode", "normal");
                                   session.setAttribute("action", "edit");%>"><p>
                    <%}else{%>
                    <button value="Editar" class="buttonDel_Save" 
                            onclick="<%session.setAttribute("viewMode", "edit");%>">
                        Edit</button><p>
                        <%}%>
                    <input type="submit" value="Salir" class="buttonLogout" formaction="UserLogoutController"/>
            </div>
        </form>
    </body>
</html>