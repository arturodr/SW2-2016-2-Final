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
                <!--CHAT-->
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: #1b6d85;"><h4 style="color: white">
                                <span class="glyphicon glyphicon-comment"></span> Chat</h4>              
                        </div>
                        <div id="panell2" class="panel-body">
                            <ul id="chatt" class="chat">
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
<script>
    function updateScroll() {
        var element = document.getElementById("panell2");
        element.scrollTop = element.scrollHeight;
    }
</script>

<script>
    function table() {

        $.getJSON("http://35.162.22.16:8080/Proyecto/chat/",
                function (data) {
                    var cad = "";
                    $.each(data, function (key, val) {
                        console.log(val);
                        cad = cad + val.texto;
                    });
                    $("#chatt").append(cad);
                    updateScroll();
                });
    }
</script>

<script>
    $(document).on('click', '#btn-chat', function () {
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
        var cad = "<li "+${usuarioBean.nombres}+" "+${usuarioBean.apellidos}+"class=\"left clearfix\"><span class=\"chat-img pull-left\">" +
                "<img width=\"60\" height=\"60\" src=\"/Proyecto/descargar/imagen?ruta=" + "${usuarioBean.ruta.ruta}" + "\" alt=\"User Avatar\" class=\"img-circle\" /></span>" +
                "<div class=\"chat-body clearfix\"><div class=\"header\"><strong class=\"primary-font\">" + "${usuarioBean.nombre}" +
                "</strong> <small class=\"pull-right text-muted\"><span class=\"glyphicon glyphicon-time\"></span>" + strTime + "</small></div><p>" +
                text + "</p></div></li>";

        $.ajax({
            url: "http://35.162.22.16:8080/Proyecto/chat/",
            type: 'POST',
            dataType: 'json',
            headers: {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({"texto": cad}),
            success: function (data) {
                console.log(data);
                table();
                updateScroll();
            }
        });
    });
</script>

<script>
    table();
    updateScroll();
</script>


<script>
    var socket = io.connect('http://35.162.22.16:3000');
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
        var cad = "<li"+${usuarioBean.nombres}+" "+${usuarioBean.apellidos}+"class=\"left clearfix\"><span class=\"chat-img pull-left\">" +
                "<img width=\"60\" height=\"60\" src=\"/Proyecto/descargar/imagen?ruta=" + "${usuarioBean.ruta.ruta}" + "\" alt=\"User Avatar\" class=\"img-circle\" /></span>" +
                "<div class=\"chat-body clearfix\"><div class=\"header\"><strong class=\"primary-font\">" + "${usuarioBean.nombre}" +
                "</strong> <small class=\"pull-right text-muted\"><span class=\"glyphicon glyphicon-time\"></span>" + strTime + "</small></div><p>" +
                text + "</p></div></li>";

        socket.emit('chat message', cad);
        $('#btn-input').val('');
        return false;
    });
    socket.on('chat message', function (msg) {
        $('#chatt').append(msg);
        updateScroll();
    });

</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("body").css("display", "none");
        $("body").fadeIn(2000);

    });

</script>
