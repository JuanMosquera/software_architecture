<%-- 
    Document   : registroAdministradores
    Created on : Sep 22, 2017, 11:47:02 AM
    Author     : sebastian.gomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Registro Administradores</title>
    </head>
    <body>
        <c:if test="${empty login}">
            <%
                String redirectURL = "login.jsp";
                response.sendRedirect(redirectURL);
            %>
        </c:if>
        <div id="body">
            <jsp:include page="menu.jsp"></jsp:include>
            <div class="contenido">
                <h1>Registro Administradores</h1>              
                <div class="container well">
                    <form action="Servlet?action=registroA" method="post">
                        <table>
                            <tr>
                                <th><label><b>Cedula:</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese identificación" class="it" name="id" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Nombre:</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese nombre" class="it" name="nombre" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Apellidos:</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese apellidos" class="it" name="apellidos" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Username:</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese nombre de usuario" class="it" name="username" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Password:</b></label></th>
                                <th>
                                    <input type="password" placeholder="ingrese password" class="it" name="password" required=""/>
                                </th>
                            </tr>
                        </table>    
                        <input class="is" type="submit" name="action" value="Registrar"> 
                        <input class="is" type="reset" name="action" value="Limpiar">
                    </form> 
                    <br>

                </div>
            </div>
        </div>
    </body>
</html>