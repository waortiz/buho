<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>BUHO: Banco Único de Hojas de Vida</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/udeaIco.png" />' type="image/png" />
        <link rel="stylesheet" href='<c:url value="/resources/css/reset.min.css"/>'>
        <link rel='stylesheet prefetch' href='<c:url value="/resources/css/font-awesome.min.css"/>'>
        <link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
        <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />'>
        <link rel="stylesheet" href='<c:url value="/resources/css/login.css" />'>
        
        <!--Estilos CSS Ajax -->
        <link rel="stylesheet" href='<c:url value="/resources/css/reset.min.css"/>' />
        <!-- Bootstrap General CSS -->
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.min.css" />'>
        <!-- CSS Personalizadas -->
        <link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
        <link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet">
                
        <script src='<c:url value="/resources/js/jquery.js" />' type="text/javascript"></script>
        <script src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
    </head>
    <body>
        <section id="site-content">
            <tiles:insertAttribute name="body" />
        </section>
    </body>
</html>