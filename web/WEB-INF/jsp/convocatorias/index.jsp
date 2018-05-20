<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">
    <div class="container"> 
        <div id="alert_placeholder_convocatoria"></div>
        <div class="row">
            <div class="col-md-12">
                <div class="page-header">
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Convocatorias o invitaciones vigentes Facultad Nacional de Salud Pública</h4>
                </div>
                <div class="form-group">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a data-toggle="tab" href="#tabvige">
                                <i class="fa fa-unlock" aria-hidden="true"></i>
                                Vigente
                            </a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#tabcer">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                                Cerrada
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tabvige">
                            <div class="form-group" style="margin-top: 10px;">
                                <div id="addscroll">
                                    <table class="table tabla table-hover" id="tbConvocatorias">
                                        <thead>
                                            <tr>
                                                <td><input type="text" id="nombreConvocatoriaVigente" class="form-control input-sm" placeholder="Buscar nombre de convocatoria"></td>
                                                <td><input type="text" id="fechaFinConvocatoriaVigente" class="form-control input-sm fecha" placeholder="Buscar fecha de finalización"></td>
                                                <td><input type="text" id="fechaPostulacionConvocatoriaVigente" class="form-control input-sm" placeholder="Buscar fecha de postulación"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr> 
                                                <th>Nombre</th>
                                                <th>Fecha de finalización</th>
                                                <th>Fecha de postulación</th>
                                                <th>Documento</th>
                                                <th>Aplicar</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="convocatoria" items="${convocatoriasVigentes}">   
                                                <tr>
                                                    <td>${convocatoria.getNombre()}</td>               
                                                    <td style="text-align: center">${convocatoria.getFechaFinFormateada()}</td>
                                                    <td style="text-align: center">${convocatoria.getFechaPostulacionFormateada()}</td>
                                                    <td style="text-align: center">
                                                        <a href="#" title="Ver documento" onclick="verDocumentoConvocatoria(${convocatoria.getId()})"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <div class="input-group">
                                                            <c:if test = "${convocatoria.isPostulado()}">
                                                                <div id="radioBtn" class="btn-group">
                                                                    <a class="btn btn-primary btn-sm active" id="btnPostulado${convocatoria.getId()}Si" data-toggle="postulado${convocatoria.getId()}" data-title="Y" href="javascript:postularConvocatoria(${convocatoria.getId()})">SI</a>
                                                                    <a class="btn btn-primary btn-sm notActive" id="btnPostulado${convocatoria.getId()}No" data-toggle="postulado${convocatoria.getId()}" data-title="N" href="javascript:retirarPostulacionConvocatoria(${convocatoria.getId()})">NO</a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test = "${!convocatoria.isPostulado()}">
                                                                <div id="radioBtn" class="btn-group">
                                                                    <a class="btn btn-primary btn-sm notActive" id="btnPostulado${convocatoria.getId()}Si" data-toggle="postulado${convocatoria.getId()}" data-title="Y" href="javascript:postularConvocatoria(${convocatoria.getId()})">SI</a>
                                                                    <a class="btn btn-primary btn-sm active" id="btnPostulado${convocatoria.getId()}No" data-toggle="postulado${convocatoria.getId()}" data-title="N" href="javascript:retirarPostulacionConvocatoria(${convocatoria.getId()})">NO</a>
                                                                </div>                                                
                                                            </c:if>
                                                        </div>
                                                    </td>
                                                    <td style='white-space: nowrap'>
                                                        <button type="button" class="btn btn-success btn-sm" style="margin-right: 10px;" onclick="mostrarConvocatoria(${convocatoria.getId()})">Ver</button>
                                                        <button type="button" class="btn btn-success btn-sm"  onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/editar/${convocatoria.getId()}'" style="margin-right: 5px;" >
                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                        </button>
                                                        <button type='button'  id='btnborrar' class='btn btn-danger btn-sm' onclick="confirmarEliminacionConvocatoria(${convocatoria.getId()})">
                                                            <span id='btnbo' class='glyphicon glyphicon-remove'></span>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tabcer">
                            <div class="form-group" style="margin-top: 10px;">
                                <table class="table tabla table-hover" id="tbCerradas">
                                    <thead>
                                        <tr>
                                            <td><input type="text" id="nombreConvocatoriaCerrada" class="form-control input-sm" placeholder="Buscar nombre de convocatoria"></td>
                                            <td><input type="text" id="descripcionConvocatoriaCerrada" class="form-control input-sm fecha" placeholder="Buscar la descripci&oacute;n"></td>
                                        </tr>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Descripci&oacute;n</th>
                                            <th>Resultados</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="convocatoria" items="${convocatoriasCerradas}">   
                                            <tr>
                                                <td>${convocatoria.getNombreTipoConvocatoria()}</td>
                                                <td>${convocatoria.getNombre()}</td>               
                                                <td style="text-align: center">
                                                    <a href="#" onclick="verDocumentoResultado(${convocatoria.getId()})" target="_black" title="Ver documento" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a>
                                                </td>
                                                <td style='white-space: nowrap'>
                                                    <button type="button" class="btn btn-success btn-sm"  onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/editar/${convocatoria.getId()}'" style="margin-right: 5px;" >
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </button>
                                                    <button type='button'  id='btnborrar' class='btn btn-danger btn-sm' onclick="confirmarEliminacionConvocatoria(${convocatoria.getId()})">
                                                        <span id='btnbo' class='glyphicon glyphicon-remove'></span>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div  id="md_postular" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header mhsuccess">
                    <button class="close" data-dismiss="modal"><label style="color:white !important;">&times;</label></button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Confirmacion</h4>
                </div>
                <div class="modal-body">
                    <label for="">Su hoja de vida fue postulada para la convocatoria, recuerde actualizarla y cargar todos los documentos de soporte</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div  id="md_retirar_postulacion" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header mhsuccess">
                    <button class="close" data-dismiss="modal"><label style="color:white !important;">&times;</label></button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Confirmacion</h4>
                </div>
                <div class="modal-body">
                    <label for="">Su hoja de vida fue retirada de la convocatoria</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>    
    <div id="modalConvocatoria" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header mhsuccess" >
                    <input type="hidden" id="idConvocatoria" />
                    <input type="hidden" id="tieneDocumento">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Información de la convocatoria<small> FNSP</small></h4>
                </div>
                <div class="modal-body">
                    <div class="row">   
                        <div class="col-md-3"> 
                            <div class="form-group">    
                                <label>Fecha de inicio</label>
                                <input id="fechaInicio" name="fechaInicio" disabled style="border: 0; text-align: center;margin-left: 0px; font-style: italic;font-weight: normal; width: 140px;" value="">
                            </div>        
                        </div>
                        <div class="col-md-4"> 
                            <div class="form-group">    
                                <label>Fecha de vigencia(cierre)</label>
                                <input id="fechaVigencia" name="fechaVigencia" disabled style="border: 0; text-align: center;margin-left: 0px; font-style: italic;font-weight: normal; width: 140px;" value="">
                            </div>  
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">    
                                <label>Fecha publicación resultados</label>
                                <input type="text" id="fechaPublicacion" name="fechaPublicacion" style="border: 0;font-style: italic;  text-align: center;" disabled value="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Nombre de la convocatoria</label>
                                <input id="nombre" type="text" name="nombre" style="border: 0;font-style: italic; margin-left: 20px;width: 50%" readonly value="">
                            </div>
                        </div>
                    </div>                        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Descripci&oacute;n de la convocatoria</label>
                                <textarea disabled style="border: 1;border-style:dotted;border-color:#aeb6bf;margin-left: 1px;width: 98%;" id="descripcion" readonly>
                                </textarea>   
                            </div>
                        </div>
                    </div>
                    <div class="row" id="inputscurso">
                        <div class="col-md-2">
                            <label for="">Sede</label><br>
                            <input type="text" style="border:0;font-style: italic;margin-left: 20px;" readonly id="sede" value="">
                        </div>
                        <div class="col-md-4">
                            <label for="">Programa</label><br>
                            <input type="text" name="" style="border: 0;font-style: italic; margin-left: 20px; width: 300px;"   readonly id="programa" value="">
                        </div>
                        <div class="col-md-3">
                            <label for="">Curso</label><br>
                            <input type="text" name="" style="border: 0;font-style: italic; margin-left: 20px;" readonly id="curso" value="">
                        </div>
                        <div class="col-md-3">
                            <label for="">Total de horas</label><br>
                            <input type="text" style="border:0;font-style: italic;margin-left: 20px; width:120px; " readonly id="totalHorasSemestre" value="">
                        </div>
                    </div>                    
                    <div class="row">
                        <div class="col-md-12">
                            <label for="">Documento de convocatoria</label>
                            <button id="verDocumentoConvocatoria" onclick="verDocumentoConvocatoria();" title="Ver documento" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></button>
                        </div>
                    </div>
                    <hr>
                    <center><legend>Informaci&oacute;n de adenda</legend></center>   
                    <div class="form-group">    
                        <table class="table tabla table-hover tableestilo" id="adendas">
                            <thead> 
                                <tr>
                                    <th>Tipo de Adenda</th>
                                    <th>Adenda</th>
                                    <th>Documento</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div id="modalEliminacionConvocatoria" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header mhsuccess" >
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Eliminar Convocatoria</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>¿Desea eliminar la convocatoria?</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="eliminarConvocatoria()">Aceptar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>    
</div>

<!-- jQuery -->
<script>
    var adendas = null;
    var DOCENCIA_MEDELLIN = "3";
    var DOCENCIA_REGIONES = "4";

    $(document).ready(function () {
        var tbConvocatorias = $('#tbConvocatorias').DataTable({
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

        var tbCerradas = $('#tbCerradas').DataTable({
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

        adendas = $('#adendas').DataTable({
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

        $('#nombreConvocatoriaVigente').on('keyup', function () {
            tbConvocatorias
                    .columns(0)
                    .search(this.value)
                    .draw();
        });
        $('#fechaFinConvocatoriaVigente').on('keyup', function () {
            tbConvocatorias
                    .columns(1)
                    .search(this.value)
                    .draw();
        });
        $('#fechaPostulacionConvocatoriaVigente').on('keyup', function () {
            tbConvocatorias
                    .columns(2)
                    .search(this.value)
                    .draw();
        });

        $('#nombreConvocatoriaCerrada').on('keyup', function () {
            tbCerradas
                    .columns(0)
                    .search(this.value)
                    .draw();
        });
        $('#descripcionConvocatoriaCerrada').on('keyup', function () {
            tbCerradas
                    .columns(1)
                    .search(this.value)
                    .draw();
        });

        $('#radioBtn a').on('click', function () {
            var sel = $(this).data('title');
            var tog = $(this).data('toggle');
            $('#' + tog).prop('value', sel);
            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
        });
    });

    function postularConvocatoria(idConvocatoria) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/postular/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var resultado = JSON.parse(response);
                    if (resultado.resultado) {
                        $('#md_postular').modal({backdrop: 'static', keyboard: false});
                    } else {
                        if (resultado.mensaje != '') {
                            bootstrap_alert_convocatoria.warning('No cumple con los criterios para postularse a la convocatoria: ' + resultado.mensaje);
                        } else {
                            bootstrap_alert_convocatoria.warning('Ocurrió un error al postularse a la convocatoria');
                        }
                        $('#btnPostulado' + idConvocatoria + 'No').removeClass('notActive').addClass('active');
                        $('#btnPostulado' + idConvocatoria + 'Si').removeClass('active').addClass('notActive');
                    }
                }
            }});
    }

    function retirarPostulacionConvocatoria(idConvocatoria) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/retirarPostulacion/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var resultado = JSON.parse(response);
                    if (resultado.resultado) {
                        $('#md_retirar_postulacion').modal({backdrop: 'static', keyboard: false});
                    } else {
                        bootstrap_alert_convocatoria.warning('No se pudo retirar la postulación de la convocatoria');
                        $('#btnPostulado' + idConvocatoria + 'Si').removeClass('notActive').addClass('active');
                        $('#btnPostulado' + idConvocatoria + 'No').removeClass('active').addClass('notActive');
                    }
                }
            }});
    }

    function mostrarConvocatoria(idConvocatoria) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/ver/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var convocatoria = JSON.parse(response);
                    $('#idConvocatoria').val(convocatoria.id);
                    $('#fechaInicio').val(convocatoria.fechaInicioFormateada);
                    $('#fechaVigencia').val(convocatoria.fechaFinFormateada);
                    $('#nombre').val(convocatoria.nombre);
                    $('#fechaPublicacion').val(convocatoria.fechaPublicacionResultadosFormateada);
                    $('#descripcion').val(convocatoria.descripcion);
                    if (convocatoria.tipoConvocatoria == DOCENCIA_MEDELLIN || convocatoria.tipoConvocatoria == DOCENCIA_REGIONES) {
                        $('#inputscurso').show();
                        $('#sede').val(convocatoria.sedeCurso);
                        $('#programa').val(convocatoria.programaCurso);
                        $('#curso').val(convocatoria.nombreCurso);
                        $('#totalHorasSemestre').val(convocatoria.totalHorasSemestreCurso);
                    } else {
                        $('#inputscurso').hide();
                        $('#sede').val('');
                        $('#programa').val('');
                        $('#curso').val('');
                        $('#totalHorasSemestre').val('');
                    }
                    adendas.clear().draw();
                    for (var i = 0; i < convocatoria.adendas.length; i++) {
                        var row = "";
                        if (convocatoria.adendas[i].tieneDocumento) {
                            row = $('<tr><td>' + convocatoria.adendas[i].nombreTipoAdenda +
                                    '</td><td>' + convocatoria.adendas[i].descripcion +
                                    '</td><td><a href="#" onclick="verDocumentoAdenda(' + convocatoria.adendas[i].id + ')" title="Ver documento" style="margin-left: 30px;" \n\
                                    class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" \n\
                                    aria-hidden="true"></i></a><td></tr>');
                        } else {
                            row = $('<tr><td>' + convocatoria.adendas[i].nombreTipoAdenda +
                                    '</td><td>' + convocatoria.adendas[i].descripcion +
                                    '</td><td>&nbsp;<td></tr>');
                        }
                        adendas.row.add(row).draw();
                    }
                    $('#tieneDocumento').val(convocatoria.tieneDocumento);
                    if (!convocatoria.tieneDocumento) {
                        $('#verDocumentoConvocatoria').attr("title", 'La convocatoria no tiene documento');
                    } else {
                        $('#verDocumentoConvocatoria').attr("title", 'Ver documento');
                    }
                    $('#modalConvocatoria').modal({backdrop: 'static', keyboard: false});
                }
            }});
    }

    function verDocumentoConvocatoria(idConvocatoria) {
        if(idConvocatoria == undefined || idConvocatoria == null) {
          idConvocatoria = $('#idConvocatoria').val();  
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/documento/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/convocatorias/documento/" + idConvocatoria;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verDocumentoResultado(idConvocatoria) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/resultado/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/convocatorias/resultado/" + idConvocatoria;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verDocumentoAdenda(idAdenda) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/resultado/adenda/documento/" + idAdenda,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/convocatorias/adenda/documento/" + idAdenda;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function confirmarEliminacionConvocatoria(idConvocatoria) {
        $('#idConvocatoria').val(idConvocatoria);
        $('#modalEliminacionConvocatoria').modal({backdrop: 'static', keyboard: false});
    }

    function eliminarConvocatoria() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/eliminar/" + $('#idConvocatoria').val(),
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var resultado = JSON.parse(response);
                    if (resultado.resultado) {
                        window.location.href = '${pageContext.request.contextPath}/convocatorias/index';
                    } else {
                        bootstrap_alert_convocatoria.warning('No se pudo eliminar la convocatoria');
                    }
                    $('#modalEliminacionConvocatoria').modal('hide');
                }
            }});
    }

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
</script>
