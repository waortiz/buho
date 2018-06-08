<%-- 
    Document   : privilegios
    Created on : 23-jul-2017, 14:00:00
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">         
<div class="container">
    <form:form method="POST" action="${pageContext.request.contextPath}/privilegios/crear" modelAttribute="privilegio">
        <br />
        <div id="alert_placeholder_privilegio"></div>
        <div id="formdatosgen">
            <legend><h3>Privilegio</h3></legend>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="codigo">Código</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el código">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                            <form:input path="codigo" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el código" maxlength="45" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nombre">Nombre</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el nombre">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                            <form:input path="nombre" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre" maxlength="50" />
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <form:hidden path="idPrivilegio" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="opciones">Opciones menú</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar las opciones">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                        <table align="center">
                        <tr>
                            <td rowspan="2">
                                <select name="opcionesMenuPorAsignar" id="opcionesMenuPorAsignar" class="form-control" multiple="true" style="width:450px; height: 200px">
                                    <c:forEach var="opcionMenu" items="${opcionesMenuPorAsignar}">
                                        <option value="${opcionMenu.getIdOpcionMenu()}">${opcionMenu.getNombre()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <a href="JavaScript:void(0);" id="asignar"><span class="glyphicon glyphicon-arrow-right"></span></a><br><br>
                                <a href="JavaScript:void(0);" id="remover"><span class="glyphicon glyphicon-arrow-left"></span></a>
                            </td>
                            <td>&nbsp;</td>
                            <td rowspan="2">
                                <form:select path="opcionesMenu" id="opcionesMenu" cssClass="form-control" multiple="true" style="width:450px; height: 200px">
                                    <form:options items="${opcionesMenuAsignados}" itemLabel="nombre" itemValue="idOpcionMenu"/>
                                </form:select>                                    
                            </td>
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <c:if test = "${privilegio.getIdPrivilegio() == 0}">
                <input type="submit" value="Crear privilegio" class="btn btn-success" style="margin-top: 30px;float: right;" />
            </c:if>
            <c:if test = "${privilegio.getIdPrivilegio() > 0}">
                <input type="submit" value="Actualizar privilegio" class="btn btn-success" style="margin-top: 30px;float: right;" />
            </c:if>                
        </div>   
    </form:form>
</div>
</div>
<script>
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    $(document).ready(function () {

        $('#asignar').click(function () {
            $('#opcionesMenuPorAsignar option:selected').each(function () {
                $('#opcionesMenu').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
            });
            ordenarOpcionesMenu($('#opcionesMenu option'));
        });
        $('#remover').click(function () {
            $('#opcionesMenu option:selected').each(function () {
                $('#opcionesMenuPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
            });
            ordenarOpcionesMenu($('#opcionesMenuPorAsignar option'));
        });
    });

    function ordenarOpcionesMenu(options) {
        var arr = options.map(function (_, o) {
            return {
                t: $(o).text(),
                v: o.value
            };
        }).get();
        arr.sort(function (o1, o2) {
            return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0;
        });
        options.each(function (i, o) {
            o.value = arr[i].v;
            $(o).text(arr[i].t);
        });
    }

    $('#privilegio').submit(function (evt) {
        if ($("#opcionesMenu option").length == 0) {
            bootstrap_alert_privilegio.warning('Debe asignar al menos una opción de menú');
            return false;
        }
        $('#opcionesMenu option').prop('selected', true);
        evt.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/privilegios/crear",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },            
            success: function (response) {
                if (response != "") {
                    bootstrap_alert_privilegio.warning(response);
                } else {
                    if ($('#idPrivilegio').val() == 0) {
                        $('#codigo').val("");
                        $('#nombre').val("");
                        $('#opcionesMenu option').each(function () {
                            $('#opcionesMenuPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                            $(this).remove();
                            ordenarOpcionesMenu($('#opcionesMenuPorAsignar option'));
                        });                        
                        bootstrap_alert_privilegio.success("Privilegio creado exitosamente");
                    } else {
                        bootstrap_alert_privilegio.success("Privilegio actualizado exitosamente");
                    }
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_privilegio.warning("Error al crear el privilegio");
            }});
    });

    bootstrap_alert_privilegio = function () { };
    bootstrap_alert_privilegio.warning = function (message) {
        $('#alert_placeholder_privilegio').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_privilegio.success = function (message) {
        $('#alert_placeholder_privilegio').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_privilegio.removeWarning = function () {
        $('#alert_placeholder_privilegio').html('');
    };
</script>
