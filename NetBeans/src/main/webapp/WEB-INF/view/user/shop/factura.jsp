<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
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
                            <p>Carrito - Factura</p>
                        </header>
                    </div>
                </div>
            </div>
        </div> 
        <br>
        <%-- Lista de opciones --%> 
        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <div class="span2">
                <ul class="nav nav-list well">
                    <li><a href="<spring:url value="/home.do"/>"><i class="icon-home"></i> Inicio</a></li>
                    <li><a href="<spring:url value='/juego'/>"><i class="icon-chevron-right"></i> Mis Juegos</a></li>
                    <li  class="active"><a href="<spring:url value='/shop/catalogo'/>"><i class="icon-chevron-right"></i> Tienda</a></li>
                </ul>
            </div>

            <div class="span10">
                <%-- Formulario con los datos --%>   
                <form:form class="form-horizontal" action="<%-- Agregar ACTION --%>" method="post" modelAttribute="<%-- Agregar MODEL ATTRIBUTE --%>">
                    <div class="control-group">
                        <label class="control-label">Fecha</label>
                        <div class="controls">
                            <form:input class="form-control" path="fechaEnvio" placeholder="Fecha"/>
                            <form:errors path="fechaEnvio" cssStyle="color:red" element="p" /> 
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Tarjeta</label>
                        <div class="controls">
                            <form:input class="form-control" path="tarjeta" placeholder="Tarjeta"/>
                            <form:errors path="tarjeta" cssStyle="color:red" element="p" />  
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Código Verificacion</label>
                        <div class="controls">
                            <form:input class="form-control" path="codigoVerificacion" placeholder="Codigo Verificacion"/>
                            <form:errors path="codigoVerificacion" cssStyle="color:red" element="p" />   
                        </div>
                    </div>  
                    <div class="control-group">
                        <label class="control-label">Dirección</label>
                        <div class="controls">
                            <form:input class="form-control" path="direccion" placeholder="Codigo Direccion"/>
                            <form:errors path="direccion" cssStyle="color:red" element="p" />     
                        </div>
                    </div>  


                    <div class="control-group">
                        <div class="controls">
                            <a class="btn btn-primary" href="<spring:url value="/shop/carrito"/>">Regresar</a>&nbsp;&nbsp;&nbsp;                            
                            <input class="btn btn-success" type="submit" value="Guardar"/>                            
                        </div>
                    </div>
                    <form:hidden path="idfactura"/>
                </form:form>
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
