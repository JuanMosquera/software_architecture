<%-- 
    Document   : login
    Created on : 11/01/2017, 08:55:53 PM
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
        <title>Login</title>
    </head>
    <body>
        <div id="body">
            <jsp:include page="menu.jsp"></jsp:include>
            <c:if test="${param.error==1}">
                <font color="red">Usuario Invalido. Intentelo de nuevo</font>
            </c:if>     
            <div class="container well">
                <h1>Información de Usuario</h1>
                <form action="Servlet?action=login" method="post">
                    <table>
                        <tr>
                            <th>  <label><b>Usuario:</b></label> </th>
                            <th> 
                                <input type="text" placeholder="Ingresar Usuario" class="form-control" name="username" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th> <label><b>Contraseña:</b></label></th>
                            <th><input type="password" placeholder="Ingresar Contraseña" class="form-control" name="password" required=""/> </th>
                        </tr>

                        <div class="break"></div>                        
                        </div>

                        <tr>
                            <td colspan="2">
                                <input class="btn btn-info btn-lg" type="submit" name="action" value="Ingresar">
                                <span class="glyphicon glyphicon-lock"></span>

                                <!--			<span class="glyphicons glyphicons-user-add img-circle text-success"></span>-->

                                <input class="btn btn-info btn-lg" type="reset" name="action" value="Limpiar">
                                <span class="glyphicon glyphicon-remove"></span>
                            </td>
                        </tr>
                    </table>
                </form>
                <br>
            </div>
        </div>
    </body>
</html>