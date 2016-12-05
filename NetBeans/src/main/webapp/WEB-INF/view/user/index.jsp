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

        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #1b6d85;"><h4 style="color: white">
                    <span class="glyphicon glyphicon-comment"></span> Chat</h4>              
            </div>
            <div id="panell2" class="panel-body">
                <ul id="chatt" class="chat" >
                </ul>
            </div>
            <div id="panell" class="panel-footer">
                <form id="formmm" action="">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm" placeholder="Escriba su mensaje aquí..." />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat">
                                Send</button>
                        </span>
                    </div>
                </form>
            </div>
        </div>

        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2014 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
                    Comentarios y/o sugerencias: <a href="mailto:jbarturen@pucp.pe">jbarturen@pucp.pe</a></p>

            </footer></div>


        <style>
            .chat
            {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .chat li
            {
                margin-bottom: 10px;
                padding-bottom: 5px;
                border-bottom: 1px dotted #B3A9A9;
            }

            .chat li.left .chat-body
            {
                margin-left: 60px;
            }

            .chat li.right .chat-body
            {
                margin-right: 60px;
            }


            .chat li .chat-body p
            {
                margin: 0;
                color: #777777;
            }

            .panel .slidedown .glyphicon, .chat .glyphicon
            {
                margin-right: 5px;
            }

            .panel-body
            {
                overflow-y: scroll;
                height: 250px;
            }

            ::-webkit-scrollbar-track
            {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
                background-color: #F5F5F5;
            }

            ::-webkit-scrollbar
            {
                width: 12px;
                background-color: #F5F5F5;
            }

            ::-webkit-scrollbar-thumb
            {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
                background-color: #555;
            }

        </style>

        <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"/>"type="text/javascript"></script>
        <script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 

        <script>
            function updateScroll() {
                var element = document.getElementById("panell2");
                element.scrollTop = element.scrollHeight;
            }
        </script>

        <script>
            var socket = io.connect('http://localhost:3000');
            $('#formmm').submit(function () {
                var d = new Date();
                var hours = d.getHours();
                var minutes = d.getMinutes();
                var ampm = hours >= 12 ? 'pm' : 'am';
                hours = hours % 12;
                hours = hours ? hours : 12; // the hour '0' should be '12'
                minutes = minutes < 10 ? '0' + minutes : minutes;
                var strTime = hours + ':' + minutes + ' ' + ampm;
                var text = $("#btn-input").val();
                text = text.replace("<", "&lt;");
                text = text.replace(">", "&gt;");
                var cad = "<li>" + "${usuarioBean.nombres}" + " dice:" + text + '&nbsp;' + '&nbsp;' + '&nbsp;' + '&nbsp;' + '&nbsp;' + "hora:" + strTime + "</li>";
                socket.emit('chat message', cad);
                $('#btn-input').val('');
                return false;
            });
            socket.on('chat message', function (msg) {
                $('#chatt').append(msg);
                updateScroll();
            });

        </script>
    </body>
</html>
