<%-- 
    Document   : clientes
    Created on : Sep 24, 2017, 08:47:06 PM
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
        <title>Clientes</title>
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
                <div id="contenido">
                    <a class="a2" href="registroClientes.jsp">&nbsp;&nbsp;Registrar Cliente&nbsp;&nbsp;</a><hr/>
                    <a class="a2" href="Servlet?action=listClientes">&nbsp;&nbsp;Ver Clientes&nbsp;&nbsp;</a><hr/>
                    <form action="Servlet?action=buscarCliente" method="post" enctype="multipart/form-data">
                    <label><b>Buscar Cliente:</b></label>
                    <input type="text" placeholder="Cédula Cliente" name="idSearch" required=""/>
                    <input type="submit"/>
                    </form><hr/>
                    <form action="Servlet?action=eliminarCliente" method="post" enctype="multipart/form-data">
                    <label><b>Eliminar Cliente:</b></label>
                    <input type="text" placeholder="Cédula Cliente" name="idDelete" required=""/>
                    <input type="submit"/>
                    </form>
                <c:if test="${not empty cliente}">
                    <hr/>
                    <label><b>Cédula:</b>${cliente.cedula}</label><br/>
                    <label><b>Nombre:</b>${cliente.nombre}</label><br/>
                    <label><b>Apellido:</b>${cliente.apellido}</label><br/>
                    <label><b>Email:</b>${cliente.email}</label><br/>
                    <label><b>Teléfono:</b>${cliente.telefono}</label>
                    <c:set var="vehiculo" value="${null}"/>
                </c:if>
            </div>             
        </div>
    </body>
</html>