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
                            <a href="#">${usuarioBean.nombres} ${usuarioBean.apellidos} (${usuarioBean.correo}) - 
                                <sec:authorize access="hasRole('ROLE_ADMIN')"> Administrador </sec:authorize>
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
                            <p>Juegos - Update</p>
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
                    <li><a href="<spring:url value="/home.do"/>"><i class="icon-home"></i> Home</a></li>
                    <li class="active"><a href="#"><i class="icon-chevron-right  icon-white"></i> Juegos</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Géneros</a></li>
                    <li><a href="#"><i class="icon-chevron-right "></i> Distribuidoras</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Editoras</a></li>
                    <li><a href="#"><i class="icon-chevron-right"></i> Plataformas</a></li>                  

                </ul>
            </div>

            <div class="span10">
                <%-- Formulario con los datos --%>   
                <form:form class="form-horizontal" action="${pageContext.request.contextPath}/juego/save" method="post" modelAttribute="juego">
                    <div class="control-group">
                        <label class="control-label">Nombre</label>
                        <div class="controls">
                            <form:input class="span4" path="nombre" />
                            <form:errors path="nombre" cssStyle="color:red" element="p" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Descripción</label>
                        <div class="controls">
                            <form:textarea class="span4" path="descripcion"></form:textarea>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Precio</label>
                            <div class="controls">
                            <%-- Agregar FORM INPUT --%> 
                             <form:input readonly="true" class="span4" path="precio"/>
                            <%-- Agregar FORM ERRORS --%>   
                            <form:errors path="precio.idgenero" cssStyle="color:red" element="p" />
                        </div>
                    </div>  

                    <div class="control-group">
                        <label class="control-label">Género</label>
                        <div class="controls">
                            <form:select path="genero.idgenero" >
                                <form:option value="0" label="Todos"/>
                                <form:options items="${ListaGeneros}" itemValue="idgenero" itemLabel="nombre"/>
                            </form:select>
                            <form:errors path="genero.idgenero" cssStyle="color:red" element="p" />
                        </div>
                    </div>    

                    <div class="control-group">
                        <label class="control-label">Plataforma</label>
                        <div class="controls">
                            <%-- Agregar FORM SELECT --%>  
                             <form:input readonly="true" class="span4" path="plataforma"/>
                            <%-- Agregar FORM ERRORS --%>  
                            <form:errors path="plataforma.idplataforma" cssStyle="color:red" element="p" />
                        </div>
                    </div>    

                    <div class="control-group">
                        <label class="control-label">Editora</label>
                        <div class="controls">
                            <%-- Agregar FORM SELECT --%>  
                  <form:input readonly="true" class="span4" path="editora"/>
                            <%-- Agregar FORM ERRORS --%>  
                    <form:errors path="editora.ideditora" cssStyle="color:red" element="p" />
                        </div>
                    </div>   
 
                    <div class="control-group">
                        <label class="control-label">Distribuidora</label>
                        <div class="controls">
                            <%-- Agregar FORM SELECT --%>  
                    <form:input readonly="true" class="span4" path="distribuidora"/>
                            <%-- Agregar FORM ERRORS --%>  
                    <form:errors path="distribuidora.iddistribuidora" cssStyle="color:red" element="p" />
                        </div>
                    </div>   

                    <div class="control-group">
                        <div class="controls">
                            <a class="btn btn-primary" href="<spring:url value="/admin/juego"/>">Regresar</a>&nbsp;&nbsp;&nbsp;                            
                            <input class="btn btn-success" type="submit" value="Guardar"/>                            
                        </div>
                    </div>
                    <form:hidden path="idjuego"/>
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
