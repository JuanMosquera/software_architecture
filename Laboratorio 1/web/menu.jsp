<%-- 
    Document   : menu
    Created on : Sep 20, 2017, 11:38:47 AM
    Author     : jdavid.sanchez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty login}">
    <table>
        <tr>
            <th><a class="a1" href="index.jsp">&nbsp;&nbsp;Inicio&nbsp;&nbsp;</a></th>
            <th><a href="login.jsp">&nbsp;&nbsp;Ingresar&nbsp;&nbsp;</a></th>
            <th><a href="vehiculos.jsp">&nbsp;&nbsp;Vehículos&nbsp;&nbsp;</a></th>
    </table>
</c:if>

<c:if test="${not empty login}">
    <table>
        <tr>
            <th><a class="a1" href="clientes.jsp">&nbsp;&nbsp;Clientes&nbsp;&nbsp;</a></th>
            <th><a href="vehiculos.jsp">&nbsp;&nbsp;Vehículos&nbsp;&nbsp;</a></th>
            <th><a href="ventas.jsp">&nbsp;&nbsp;Ventas&nbsp;&nbsp;</a></th>
            <th><a class="a1" href="registroAdministradores.jsp">&nbsp;&nbsp;Registrar Administradores&nbsp;&nbsp;</a></th>
            <th><a  href="Servlet?action=logout">&nbsp;&nbsp;Salir&nbsp;&nbsp;</a></th>    
    </table> 
</c:if>

<hr/>