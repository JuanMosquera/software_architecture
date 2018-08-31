<%-- 
    Document   : agregarVehiculo
    Created on : 22/09/2017, 10:10:36 PM
    Author     : jdavid.sanchez
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
        <title>Agregar Vehículos</title>
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
                <h1>Agregar Vehículo</h1>
                <div class="container well">
                    <form action="Servlet?action=nuevoVehiculo" method="post" enctype="multipart/form-data">
                        <table>
                            <p>Matrícula</p>
                            <input type="text" placeholder="Ingresar Matricula" class="it" name="matricula" required=""/><hr/>
                            <p>Marca</p>
                            <input type="text" placeholder="Ingresar Marca" class="it" name="marca" required=""/><hr/>
                            <p>Modelo</p>
                            <input type="text" placeholder="Ingresar Modelo" class="it" name="modelo" required=""/><hr/>
                            <p>Tipo</p>
                            <input type="text" placeholder="Ingresar Tipo" class="it" name="tipo" required=""/><hr/>
                            <p>Precio</p>
                            <input type="text" placeholder="Ingresar Precio" class="it" name="precio" required=""/><hr/>
                            <p>Imagen</p>
                            <input type="file" name="imagen" required="required"/><br/><br/>
                            <input type="submit"/>
                        </table>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>