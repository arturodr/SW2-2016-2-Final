<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<%-- Obtengo los parámetros enviados desde el Servlet--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>GameShop 2!!!</title>
        <link rel="shortcut icon" href="<spring:url value="/resources/img/store_icon.png"/>">
        <link rel="stylesheet" href='<spring:url value="/resources/css/bootstrap.css"/>' />
        <script type='text/javascript' src='<spring:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>
    </head>
    <body>
        <%-- Navbar superior--%>
        <div class="navbar navbar-fixed-top" style="position: relative">
            <div class="navbar-inner">
                <div class="container" style="width: auto; padding: 0 20px;">
                    <ul class="nav">
                        <li class="active">
                            <a href="#">${usuarioBean.nombres} ${usuarioBean.apellidos} (${usuarioBean.correo}) 
                                <sec:authorize access="hasRole('ROLE_ADMIN')"> - Administrador </sec:authorize>
                                </a>
                            </li>
                        </ul>
                        <a href="<spring:url value='/logout.do'/>" class="btn pull-right">Cerrar Sessión</a>
                </div>
            </div>
        </div>
        <%-- Panel Superior--%>        
        <div>  
            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>GameShop 2!!!</h1><br>
                            <p>Carrito de Compras</p>
                        </header>
                    </div>
                </div>
            </div>
        </div> 
        <br>

        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <%-- Lista de opciones --%> 
            <div class="span2">
                <ul class="nav nav-list well">
                    <li><a href="<spring:url value="/home.do"/>"><i class="icon-home"></i> Inicio</a></li>
                    <li><a href="<spring:url value='/juego'/>"><i class="icon-chevron-right"></i> Mis Juegos</a></li>
                    <li  class="active"><a href="<spring:url value='/shop/catalogo'/>"><i class="icon-chevron-right"></i> Tienda</a></li>
                </ul>
            </div>
            <%-- Tabla con los datos --%>             
            <div class="span10">
                <c:choose>
                    <c:when test="${ListaCarrito.size()>0}">
                        Se encontraron ${ListaCarrito.size()} videojuegos en el carrito

                        <a href="<spring:url value='/shop/catalogo'/>" class="btn pull-right"><i class="icon-chevron-left"></i>  Regresar</a><br><br>
                        <br>
                        <table class="items table table-bordered">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                    <th>Genero</th>
                                    <th>Plataforma</th>
                                    <th>Editora</th>
                                    <th>Distribuidora</th> 
                                    <th>Cantidad</th>
                            </thead>
                            <tbody>
                                <c:forEach var="juego" items="${ListaCarrito}">  
                                    <tr>
                                        <td>${juego.nombre}</td>
                                        <td>${juego.descripcion}</td>
                                        <td>${juego.precio}</td>
                                        <td>${juego.genero.nombre}</td>
                                        <td>${juego.plataforma.nombre}</td>
                                        <td>${juego.editora.nombre}</td>
                                        <td>${juego.distribuidora.nombre}</td>   
                                        <td>${juego.cantidad}</td>
                                    </tr>
                                </c:forEach>                                         
                            </tbody>
                        </table>
                        El monto total ha pagar es ${total} soles.
                        <a href="<spring:url value='/shop/factura'/>" class="btn btn-primary pull-right">Generar Factura</a>
                    </c:when>
                    <c:otherwise>
                        No se han agregado elementos al carrito.<a href="<spring:url value='/shop/catalogo'/>" class="btn pull-right"><i class="icon-chevron-left"></i>  Regresar</a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

        <%-- Footer --%>             
        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2014 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
                    Comentarios y/o sugerencias: <a href="mailto:jbarturen@pucp.pe">jbarturen@pucp.pe</a></p>

            </footer></div>
    </body>
</html>


