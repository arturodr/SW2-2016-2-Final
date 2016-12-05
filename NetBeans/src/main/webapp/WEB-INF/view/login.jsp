<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>GameShop 2!!!</title>
        <link rel="shortcut icon" href="<spring:url value="/resources/img/store_icon.png"/>">
        <link rel="stylesheet"
              href='<spring:url value="/resources/css/bootstrap.css"/>' />
        <script type='text/javascript' src='<spring:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>
    </head>

    <body>

        <div style="width: 100%;">  

            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>Bienvenido a GameShop 2!!!</h1><br>
                            <p class="intro" style="padding-right: 30%;">
                                GameShop 2 es una tienda virtual de video juegos. Los usuarios registrados tendrán acceso al catálogo de juegos y podrán realizar compras online.
                            </p>

                        </header>

                    </div>

                </div>

            </div>

        </div> 
        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <div class="span4">

                <div class="thumbnail">
                    <img src="<spring:url value="/resources/img/assassins-creed-3.jpg"/>" alt="">
                    <div class="caption"><br>
                        <h6 style="font-size: 10px;">Catálogo de Juegos</h6>
                        <h5 style="font-weight: lighter;">
                            El catálogo de juegos, además del nombre, descripción y precio, muestra también el género, la plataforma,
                            la editora y la distribuidora.


                        </h5>
                    </div>
                </div>

            </div>
            <div class="span4">
                <div class="thumbnail">
                    <img src="<spring:url value="/resources/img/halo.jpg"/>" alt="">
                    <div class="caption"><br>
                        <h6 style="font-size: 10px;">Tienda Online</h6>
                        <h5 style="font-weight: lighter;">Los usuarios podrán seleccionar del catálogo los juegos que deseen comprar y agregarlos al carrito de compras.</h5>
                    </div>
                </div>
            </div>
            <div class="span4">

                <div class="thumbnail">
                    <div class="modal-header">

                        <h3>Ingresar a GameShop</h3>
                    </div>
                    <div class="modal-body">
                        <spring:url value="/dologin.do" var="url" />
                        <form class="well form-inline" role="form" action="${url}" method="POST">
                            <% if (request.getParameter("error") != null) {%><div class="alert alert-error">Los datos ingresados son incorrectos</div> <% }%>
                            <div class="control-group">
                                <label class="control-label">Correo</label>
                                <div class="controls">
                                    <input type="text" name="correo" placeholder="usuario@pucp.pe">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Password</label>
                                <div class="controls">
                                    <input type="password" name="password">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <label class="checkbox">
                                        <input type="checkbox"> Recordar cuenta
                                    </label>
                                    &nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success">Ingresar</button>
                                </div>
                            </div>

                        </form> 

                    </div>
                    <div class="modal-footer">
                        <a href="#">Registrarse en GameShop</a><br>
                        <a href="#">Recuperar Contraseña</a><br>
                        <a href="#">Reenviar Código de Activación</a>
                    </div>
                </div>


            </div>

        </div>


        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2014 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
                    Comentarios y/o sugerencias: <a href="mailto:jbarturen@pucp.pe">jbarturen@pucp.pe</a></p>

            </footer></div>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").css("display", "none");
        $("body").fadeIn(2000);                                                                                      

    });   
  
</script>
