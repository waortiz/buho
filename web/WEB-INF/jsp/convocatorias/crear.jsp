<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<div id="contenido">
    <div class="container">
        <div id="alert_placeholder_convocatoria"></div>
        <form:form method="POST" modelAttribute="convocatoria">
            <legend><h2>Convocatoria</h2></legend>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="tipoConvocatoria">Tipo de convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de convocatoria">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                        <form:select style="width: 100%;" path="tipoConvocatoria" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de convocatoria">
                            <option></option>
                            <c:forEach var="tipoConvocatoria" items="${tiposConvocatoria}">
                                <option value="${tipoConvocatoria.getId()}">${tipoConvocatoria.getNombre()}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="fechaInicio">Fecha de inicio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <div class='input-group date'>
                            <form:input class="form-control fecha" path="fechaInicio" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="fechaFin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaci&oacute;n" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de finalización">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <div class='input-group date'>
                            <form:input class="form-control fecha" path="fechaFin" />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="area">&Aacute;rea de convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el &aacute;rea de convocatoria">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                        <form:select style="width: 100%;" path="area" class="js-select-basic-single js-states form-control">
                            <option></option>
                            <c:forEach var="area" items="${areasConvocatoria}">
                                <option value="${area.getId()}">${area.getNombre()}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nombre">Nombre</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de la convocatoria">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <form:input class="form-control" path="nombre" data-validation="required" data-validation-error-msg="Debe ingresar el nombre" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="descripcion">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe describir el perfil requerido con el cargo y la experiencia requerida">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <form:textarea class="form-control" path="descripcion" data-validation="required" data-validation-error-msg="Debe ingresar la descripción" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label for="documento">Documento de soporte</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe adjuntar un documento de la convocatoria">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <input type="file" class="form-control" name="documento" id="documento" >
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="fechaPublicacionResultados">Fecha publicación resultados</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de resultado de publicaci&oacute;n">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                        <div class='input-group date' id='datetimepicker1'>
                            <form:input class="form-control fecha" path="fechaPublicacionResultados" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de publicación de resultados"/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-header"><h2>Adendas</h2></div>
            <div class="row">   
                <div class="col-md-12"> 
                    <label>Agregar adendas</label> 
                    <button style="margin-bottom: 20px;"  type="button" class="btn btn-success" data-toggle="modal" data-target="#md_adenda"><span class="glyphicon glyphicon-plus"></span></button>     
                    <table class="table table-hover tableestilo" id="tbadendas"> 
                        <thead>
                            <tr>    
                                <th style="width: 30%">Tipo de adenda</th>
                                <th style="width: 20%">Descripci&oacute;n</th>
                                <th style="width: 10%">Fecha</th>
                                <th style="width: 20%">Documento</th>
                                <th width="5">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: adendas }">
                            <tr class="table-row">
                                <td style="width: 30%">
                                    <span data-bind="text: nombreTipoAdenda" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: tipoAdenda, attr: { 'name': 'adendas[' + $index() + '].tipoAdenda'  }">
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: descripcion" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'adendas[' + $index() + '].descripcion'  }">
                                </td>
                                <td style="width: 10%">
                                    <span data-bind="text: fecha" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: fecha, attr: { 'name': 'adendas[' + $index() + '].fecha'  }">
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: documento" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: documento, attr: { 'name': 'adendas[' + $index() + '].documento'  }">
                                </td>
                                <td style='white-space: nowrap'>
                                    <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarAdenda"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                    <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarAdenda"><span class='glyphicon glyphicon-remove'></span></button>
                                    <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'adendas[' + $index() + '].consecutivo'  }" />
                                </td>
                            </tr>
                        </tbody>                                         
                    </table>
                </div>
                <div id="md_adenda" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header" >
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Agregar adenda</h4>
                            </div>
                            <div class="modal-body">  
                                <div class="form-group">
                                    <label for="tipoAdenda">Tipo de adenda</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                    <select style="width: 100%;" name="tipoAdenda" id="tipoAdenda" class="js-select-basic-single js-states form-control">
                                        <option></option>
                                        <c:forEach var="tipoAdenda" items="${tiposAdenda}">
                                            <option value="${tipoAdenda.getId()}">${tipoAdenda.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" id="consecutivo" name="consecutivo" />
                                </div>  
                                <div class="form-group">    
                                    <label>Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la descripcion de la adenda">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                    <textarea type="text" name="descripcionAdenda" id="descripcionAdenda" class="form-control"></textarea>
                                </div>
                                <div class="form-group form-inline">
                                    <label for="fechaAdenda">Fecha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>                                
                                    <input type='text' class="form-control fecha" name="fechaAdenda" id="fechaAdenda" />
                                </div>
                                <div class="form-group">    
                                    <label>Documento de adenda</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el documento de adenda">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>       
                                    <input type="file" name="documentoAdenda" id="documentoAdenda" class="form-control">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" data-bind="click: adicionarAdenda">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            <input type="submit" class="btn btn-success" style="margin-bottom: 10px;" value="Guardar" />
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="id" />
        </form:form>
        <div class="modal fade" id="confirmacionAlmacenamientoConvocatoria" tabindex="-1" role="dialog" aria-labelledby="confirmacionAlmacenamientoProyectoLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <c:if test = "${convocatoria.getId() == 0}">
                                Registro Convocatoria
                            </c:if>
                            <c:if test = "${convocatoria.getId() > 0}">
                                Actualización Convocatoria
                            </c:if>
                        </h4>   
                    </div>
                    <div class="modal-body">
                            <c:if test = "${convocatoria.getId() == 0}">
                                La convocatoria se ha registrado exitosamente
                            </c:if>
                            <c:if test = "${convocatoria.getId() > 0}">
                                La convocatoria se ha actualizado exitosamente
                            </c:if>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>             
    </div>
</div>
<!-- jQuery -->
<script>
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    $('#tbadendas').DataTable({
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"}
        },
        "oAria": {
            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    });

    $(document).ready(function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var output = (dd < 10 ? '0' : '') + dd + '/' + (mm < 10 ? '0' : '') + mm + "/" + yyyy;
        $('fechaInicio').val(output);
        $('fechaFin').val(output);
    });

    $('.fecha').datepicker({
        dateFormat: "dd/mm/yy"
    });

    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '< Ant',
        nextText: 'Sig >',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);

    $('#convocatoria').submit(function (evt) {
        evt.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/convocatorias/crear",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response == "") {
                    $('#confirmacionAlmacenamientoConvocatoria').modal('show');
                    if(parteInt($('#id').val()) > 0) {
                        $('#tipoConvocatoria').val('');
                        $('#fechaInicio').val('');
                        $('#fechaFin').val('');
                        $('#area').val('');
                        $('#nombre').val('');
                        $('#descripcion').val('');
                        $('#documento').val('');
                        $('#fechaPublicacionResultados').val('');
                        adendaModel.adendas.removeAll();
                    }
                } else {
                    bootstrap_alert_convocatoria.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_convocatoria.warning("Error al almacenar la convocatoria.");
            }});
    });

    bootstrap_alert_convocatoria = function () { };
    bootstrap_alert_convocatoria.warning = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.success = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.removeWarning = function () {
        $('#alert_placeholder_convocatoria').html('');
    };

    var AdendaModel = function (adendas) {
        self = this;
        self.adendas = ko.observableArray(adendas);
        self.adicionarAdenda = function () {
            var tipoAdenda = $('#tipoAdenda').val();
            var nombreTipoAdenda = $('#tipoAdenda option:selected').text();
            var descripcionAdenda = $('#descripcionAdenda').val();
            var fechaAdenda = $('#fechaAdenda').val();
            if ($('#consecutivo').val() == "") {
                self.adendas.push({
                    consecutivo: ko.observable(self.adendas().length + 1),
                    tipoAdenda: ko.observable(tipoAdenda),
                    nombreTipoAdenda: ko.observable(nombreTipoAdenda),
                    descripcion: ko.observable(descripcionAdenda),
                    documento: ko.observable(''),
                    fecha: ko.observable(fechaAdenda)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.adendas().length; i++) {
                    if (self.adendas()[i].consecutivo() == consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.adendas()[indice].tipoAdenda(tipoAdenda);
                self.adendas()[indice].nombreTipoAdenda(nombreTipoAdenda);
                self.adendas()[indice].descripcion(descripcionAdenda);
                self.adendas()[indice].documento('');
                self.adendas()[indice].fecha(fechaAdenda);
            }
            $('#md_adenda').modal('hide');
            $('#tipoAdenda').val("");
            $('#fechaAdenda').val("");
            $('#descripcionAdenda').val("");
        };
        
        self.eliminarAdenda = function (adenda) {
            self.adendas.remove(adenda);
        };
        self.editarAdenda = function (adenda) {
            $('#tipoAdenda').val(adenda.tipoAdenda());
            $('#fechaAdenda').val(adenda.fecha());
            $('#descripcionAdenda').val(adenda.descripcion());
            $('#consecutivo').val(adenda.consecutivo());
            $('#md_adenda').modal('show');
        };
    };

var adendaModel = new AdendaModel([]);
    ko.applyBindings(adendaModel);
</script>
