<%-- 
    Document   : registroClientes
    Created on : Sep 22, 2017, 11:37:04 AM
    Author     : sebastian.gomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Registro Clientes</title>
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
                <h1>Registro Clientes</h1>              
                <div class="container well">
                    <form action="Servlet?action=registroCts" method="post">
                        <table>
                            <tr>
                                <th><label><b>Identificación:</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese cedula" class="it" name="id" required=""/>
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
                                <th><label><b>Email:</b></label></th>
                                <th>
                                    <input type="email" placeholder="ingrese correo" class="it" name="email" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Teléfono</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese teléfono" class="it" name="tel" required=""/>
                                </th>
                            </tr>
                        </table> 
                        <input class="is" type="submit" name="action" value="Insert"> 
                        <input class="is" type="reset" name="action" value="Reset">           
                    </form> 
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>