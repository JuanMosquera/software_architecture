<%-- 
    Document   : ventas
    Created on : Sep 22, 2017, 11:49:09 AM
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
                <h1>Registro Venta</h1>              
                <div class="container well">
                    <form action="Servlet?action=insertarVenta" method="post">
                        <table>
                            <tr>
                                <th><label><b>Identificación cliente</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese cedula CLIENTE" class="it" name="id" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Identificacion Vendedor</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese cedula VENDEDOR" class="it" name="idAdmi" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Matricula auto</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese matricula" class="it" name="matricula" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Id venta</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese id venta" class="it" name="idVenta" required=""/>
                                </th>
                            </tr>
                            <tr>
                                <th><label><b>Precio</b></label></th>
                                <th>
                                    <input type="text" placeholder="ingrese precio" class="it" name="precio" required=""/>
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