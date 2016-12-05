<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <div class="navbar navbar-fixed-top" style="position: relative">
            <div class="navbar-inner">
                <div class="container" style="width: auto; padding: 0 20px;">
                    <ul class="nav">
                        <li class="active">
                            <a href="#">${usuarioBean.nombres} ${usuarioBean.apellidos} (${usuarioBean.correo}) - 
                                <sec:authorize access="hasRole('ROLE_ADMIN')"> Administrador </sec:authorize>
                            </a>
                        </li>
                    </ul>
                    <a href="<spring:url value='/logout.do'/>" class="btn pull-right">Cerrar Sessión</a>
                </div>
            </div>
        </div>
        <div>  
            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>GameShop!!!</h1><br>
                            <p>Home Page - Admin</p>
                        </header>
                    </div>
                </div>
            </div>
        </div> 
        <br>

        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <div class="span2">
                <ul class="nav nav-list well">
                    <li  class="active"><a href="#"><i class="icon-home icon-white"></i> Inicio</a></li>
                    <li><a href="<spring:url value='/admin/juego'/>"><i class="icon-chevron-right"></i> Juegos</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Géneros</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Distribuidoras</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Editoras</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Plataformas</a></li>                  
                </ul>
            </div>
            <div class="span2">

                <img src="<spring:url value="/resources/img/wiiu.jpg"/>" class="span2">

            </div>
            <div class="span2">

                <img src="<spring:url value="/resources/img/mario.jpg"/>" class="span2">

            </div>
            <div class="span2">

                <img src="<spring:url value="/resources/img/ps4new.jpg"/>" class="span2">

            </div>
            <div class="span2">

                <img src="<spring:url value="/resources/img/xbox.jpg"/>" class="span2">

            </div>

            <div class="span2">

                <img src="<spring:url value="/resources/img/hongo.jpg"/>" class="span2">

            </div>


        </div>


        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2012 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
                    Comentarios y/o sugerencias: <a href="mailto:jbarturen@pucp.pe">jbarturen@pucp.pe</a></p>

            </footer></div>
    </body>
</html>
