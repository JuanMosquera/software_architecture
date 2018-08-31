<%-- 
    Document   : vehiculos
    Created on : Sep 24, 2017, 08:46:12 PM
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
        <title>Vehículos</title>
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
                    <a class="a2" href="agregarVehiculo.jsp">&nbsp;&nbsp;Agregar Vehículo&nbsp;&nbsp;</a><hr/>
                    <a class="a2" href="Servlet?action=listarVehiculos">&nbsp;&nbsp;Ver Vehículos&nbsp;&nbsp;</a><hr/>
                    <form action="Servlet?action=buscarVehiculo" method="post" enctype="multipart/form-data">
                    <label><b>Buscar Matrícula:</b></label>
                    <input type="text" placeholder="Matrícula Vehículo" name="matriculaSearch" required=""/>
                    <input type="submit"/>
                    </form><hr/>
                    <form action="Servlet?action=eliminarVehiculo" method="post" enctype="multipart/form-data">
                    <label><b>Eliminar Matrícula:</b></label>
                    <input type="text" placeholder="Matrícula Vehículo" name="matriculaDelete" required=""/>
                    <input type="submit"/>
                    </form>
                <c:if test="${not empty vehiculo}">
                    <hr/>
                    <label><b>Matrícula:</b>${vehiculo.matricula}</label><br/>
                    <label><b>Marca:</b>${vehiculo.marca}</label><br/>
                    <label><b>Modelo:</b>${vehiculo.modelo}</label><br/>
                    <label><b>Tipo:</b>${vehiculo.tipo}</label><br/>
                    <label><b>Precio:</b>${vehiculo.precio}</label>
                    <c:set var="vehiculo" value="${null}"/>
                </c:if>
            </div>            
        </div>
    </body>
</html>