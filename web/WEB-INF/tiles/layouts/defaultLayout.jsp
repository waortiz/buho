<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
    <head>
        
        <link rel="icon" type="image/png" href='<c:url value="/resources/imagenes/udeaIco.png" />' />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Banco Único de Hojas de Vida</title>
        <!-- Bootstrap General CSS -->
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
        <!-- Fuentes de Iconos -->
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.min.css" />'>
        <!-- CSS Personalizadas -->
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/dataTables.bootstrap.min.css" />' >
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilosPersonalizados.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/style.css"/>'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.datetimepicker.min.css"/>'> 
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery-ui.min.css"/>'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/select2.min.css"/>'>
        
        <!-- jQuery -->
        <script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script> 
        <script type="text/javascript" src='<c:url value="/resources/js/jquery-ui.min.js"/>'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/jspdf.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/html2canvas.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/jquery.dataTables.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/dataTables.bootstrap.min.js" />'></script>

        <!-- Bootstrap Core JavaScript -->
        <script type="text/javascript" src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script type="text/javascript" src='<c:url value="/resources/js/metisMenu.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/select2.min.js" />'></script>

        <!-- Morris Charts JavaScript -->
        <script type="text/javascript" src='<c:url value="/resources/js/raphael.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/morris.min.js" />'></script>

        <!-- Custom Theme JavaScript -->
        <script type="text/javascript" src='<c:url value="/resources/js/sb-admin-2.js" />'></script>
        
        <script type="text/javascript" src='<c:url value="/resources/js/jquery.form-validator.min.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/knockout-3.4.2.js" />'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/funciones.js" />'></script>
        
    </head>
    <body class="sidenav-toggled">
        <div id="contenedorA">
            <header id="header">
                <div id='cssmenu'>
                    <ul>
                        <li>
                            <span class="imagenMenu">
                                <img src='<c:url value="/resources/imagenes/logoUdeaLateral2.png" />'>
                            </span> 
                        </li>
                        <li>
                            <a href='${pageContext.request.contextPath}/index'>
                                <i class="fa fa-home fa-1x"></i>
                                Inicio
                            </a>
                        </li>
                        <tiles:insertAttribute name="menu" />
                    </ul>
                </div>
            </div>
            <div id="contenedorB">
                <div id='cssmenu'>
                    <tiles:insertAttribute name="usuario" />
                </div>
            </div>  
            <br>
            <br>                
            <tiles:insertAttribute name="body" />

            <tiles:insertAttribute name="footer" />
        </div>
        <script type="text/javascript">
            function abrirOpcion(opcion) {
                window.location.href = '${pageContext.request.contextPath}' + opcion;
            }
        </script>    
    </body>
</html>