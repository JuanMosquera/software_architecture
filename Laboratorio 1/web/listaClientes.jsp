<%-- 
    Document   : listaClientes
    Created on : 22/09/2017, 06:16:33 PM
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
        <title>Lista Clientes</title>
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
                <c:forEach var="c" items="${clientes}">
                    <tr class="tr">
                        <td class="ds" ><label>Cédula:&nbsp;&nbsp;</label>${c.id}
                            <br/><label>Nombre:&nbsp;&nbsp;</label> ${c.nombre}
                            <br/><label>Apellido:&nbsp;&nbsp;</label> ${c.apellido}
                            <br/><label>Email:&nbsp;&nbsp;</label> ${c.email}
                            <br/><label>Teléfono:&nbsp;&nbsp;</label> ${c.telefono}
                            <hr/>
                    </tr>
                </c:forEach>
            </table>      
        </div>
    </body>
</html>