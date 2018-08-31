<%-- 
    Document   : listaVehiculos
    Created on : 23/09/2017, 02:13:20 PM
    Author     : jdavid.sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Lista Vehículos</title>
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
                <table id="tbl">
                <c:set var="actual" value="${0}"/>
                <c:forEach var="i" items="${imagenes}">
                    <c:set var="auto" value="${0}"/>
                    <tr class="tr">
                        <td><img src="data:image/jpg;base64,${i}" width="200" height="100" alt="Image not found" /></td>
                            <c:forEach var="v" items="${vehiculos}">
                                <c:if test="${auto == actual}">
                                <td class="ds" >Marca: ${v.marca}<br/>Modelo: ${v.modelo}<br/>Precio: ${v.precio}</td>      
                                <td class="tv"><a class="evt" href="Servlet?action=vender">Vender</a></td>
                                <td class="td"><a class="evt" onclick="return confirm('Esta seguro?')" href="Servlet?action=deleteCoche&matricula=${v.matricula}">Eliminar</a></td>
                            </c:if>
                            <c:set var = "auto" value="${auto+1}"/>
                        </c:forEach>
                    </tr>
                    <c:set var = "actual" value="${actual+1}"/>
                </c:forEach>
            </table>      
        </div>
    </body>
</html>
