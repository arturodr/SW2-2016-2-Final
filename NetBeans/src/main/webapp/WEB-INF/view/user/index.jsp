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
          <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
<script src="/resources/node_modules/socket.io/socket.io.js"></script>

    </head>

    <body>
        
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
                        <a href="<spring:url value='logout.do'/>" class="btn pull-right">Cerrar Sessión</a>
                </div>
            </div>
        </div>
        <div>  
            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>GameShop 2!!!</h1><br>
                            <p>P&aacute;gina de Inicio</p>
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
                    <li><a href="<spring:url value='/juego'/>"><i class="icon-chevron-right"></i> Mis Juegos</a></li>
                    <li><a href="<spring:url value='/shop/catalogo'/>"><i class="icon-chevron-right"></i> Tienda</a></li>
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
        <div class="container col-sm-4"> </div>


         <div class="container">
            <div class="row">
                <div class="form-group">
                    <div class="well">
                        <h3> Chat de Gameshop2</h3>
                        <ul class="list-group" id=user> </ul>
                    </div>
                </div>
                <div class=col-md-3>
                    <div class="chat" id="chat">
                        Chat:<br>

                    </div>
                    <form id ="messageForm">
                        <div class="form-group">
                            <label>Escribir mensaje:</label>
                            <textarea class="form-control" id="message">
                            </textarea>
                            <br />
                            <input type="submit" class="btn btn-primary" value="submit">
                        </div>
                    </form>
                </div>


            </div>
        </div>  
        
        <script>
        $(function(){
            var socket=io.connect('http://127.0.0.1:3000');
            var $messageForm = $('#messageForm');
            var $message = $('#message');
            var $chat =$('#chat');
            $messageForm.submit(function(e){
                e.preventDefault();
                socket.emit('Enviar', $message.val());
                $message.val('');
            });
            socket.on('new message', function(data){
                $chat.append('<div class="well">' +'{usuarioBean.nombres}' +data.msg+'</div>')
                
          });
        });
          
        </script>
             

        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2014 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
                    Comentarios y/o sugerencias: <a href="mailto:jbarturen@pucp.pe">jbarturen@pucp.pe</a></p>

            </footer></div>

    </body>

</html>
