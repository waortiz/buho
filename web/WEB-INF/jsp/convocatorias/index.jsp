<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">
    <div class="container"> 
        <div id="alert_placeholder_convocatoria"></div>
        <div class="row">
            <div class="col-md-12">
                <div class="page-header">
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Convocatorias vigentes FNSP</h4>
                </div>
                <div id="addscroll">
                    <table class="table table-hover" id="tbconvo">
                        <thead>
                            <tr>
                                <td></td>
                                <td><input type="text" id="intip" class="form-control input-sm" placeholder="Buscar tipo de convocatoria"></td>
                                <td><input type="text" id="infechfin" class="form-control input-sm fecha" placeholder="Buscar fecha de finalización"></td>
                                <td><input type="text" id="innom" class="form-control input-sm" placeholder="Buscar nombre de convocatoria"></td>
                            </tr>
                            <tr> 
                                <th>Tipo</th>
                                <th>Nombre</th>
                                <th>Fecha de cierre</th>
                                <th>Documento</th>
                                <th>Aplicar</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="convocatoria" items="${convocatorias}">   
                                <tr>
                                    <td>${convocatoria.getNombreTipoConvocatoria()}</td>
                                    <td>${convocatoria.getNombre()}</td>               
                                    <td>${convocatoria.getFechaFinFormateada()}</td>
                                    <td>
                                        <c:if test = "${convocatoria.isTieneDocumento()}">
                                            <a href="#" title="Ver documento" onclick="verDocumento(${convocatoria.getId()})"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>
                                        </c:if>
                                        <c:if test = "${!convocatoria.isTieneDocumento()}">
                                            <a href="#" title="No tiene documento"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <c:if test = "${convocatoria.isPostulado()}">
                                                <div id="radioBtn" class="btn-group">
                                                    <a class="btn btn-primary btn-sm active" data-toggle="postulado${convocatoria.getId()}" data-title="Y" href="javascript:postularConvocatoria(${convocatoria.getId()})">SI</a>
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="postulado${convocatoria.getId()}" data-title="N" href="javascript:retirarPostulacionConvocatoria(${convocatoria.getId()})">NO</a>
                                                </div>
                                            </c:if>
                                            <c:if test = "${!convocatoria.isPostulado()}">
                                                <div id="radioBtn" class="btn-group">
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="postulado${convocatoria.getId()}" data-title="Y" href="javascript:postularConvocatoria(${convocatoria.getId()})">SI</a>
                                                    <a class="btn btn-primary btn-sm active" data-toggle="postulado${convocatoria.getId()}" data-title="N" href="javascript:retirarPostulacionConvocatoria(${convocatoria.getId()})">NO</a>
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
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Información de la convocatoria</h4>
                </div>
                <div class="modal-body">
                    <center><legend>Vigencia</legend></center>
                    <div class="row">   
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de inicio</label>
                                <input id="fechaInicio" name="fechaInicio" disabled style="border: 0; text-align: center;margin-left: 0px; font-style: italic;font-weight: normal; width: 140px;" value="21/11/2017">
                            </div>        
                        </div>
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de vigencia(cierre)</label>
                                <input id="fechaVigencia" name="fechaVigencia" disabled style="border: 0; text-align: center;margin-left: 0px; font-style: italic;font-weight: normal; width: 140px;" value="21/11/2017"">
                            </div>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Tipo de convocatoria</label>
                                <input id="tipoConvocatoria" type="text" name="tipoConvocatoria" style="border: 0;font-style: italic; margin-left: 20px;" readonly value="docencia">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>&Aacute;rea de saber</label>
                                <input id="area" type="text" name="area" style="border: 0;font-style: italic; margin-left: 20px;" readonly value="Tecnologia">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Nombre de la convocatoria</label>
                                <input id="nombre" type="text" name="nombre" style="border: 0;font-style: italic; margin-left: 20px;" readonly value="portal 80">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Fecha de publicaci&oacute;n de resultado</label>
                                <input type="text" id="fechaPublicacion" name="fechaPublicacion" style="border: 0;font-style: italic; margin-left: 20px;" readonly value="20/04/201753">
                            </div>
                        </div>
                    </div>                        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Descripci&oacute;n de la convocatoria</label>
                                <textarea disabled style="border: 1;border-style:dotted;border-color:#aeb6bf;margin-left: 1px;width: 98%;" id="descripcion" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo           consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </textarea>   
                            </div>
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
                        <table class="table table-hover tableestilo" id="adendas">
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

    $(document).ready(function () {
        var table = $('#tbconvo').DataTable({
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
        
        $('#intip').on('keyup', function () {
            table
                .columns(0)
                .search(this.value)
                .draw();
        });

        $('#infechfin').on('keyup', function () {
            table
                .columns(1)
                .search(this.value)
                .draw();
        });
        $('#innom').on('keyup', function () {
            table
                .columns(2)
                .search(this.value)
                .draw();
        });
        
        $('#radioBtn a').on('click', function(){
            var sel = $(this).data('title');
            var tog = $(this).data('toggle');
            $('#' + tog).prop('value', sel);
            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
        });
    });
    
    function postular(object) {
        var sel = object.data('title');
        var tog = object.data('toggle');
        $('#' + tog).prop('value', sel);

        $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
        $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
    }
  
    function postularConvocatoria(idConvocatoria) {
        $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/convocatorias/postular/" + idConvocatoria,
        processData: false,
        contentType: false,
        success: function (response) {
            if (response !== "") {
                var resultado = JSON.parse(response);
                if(resultado.resultado) {
                   $('#md_postular').modal('show');
                } else {
                   bootstrap_alert_convocatoria.warning('No se pudo postular a la convocatoria'); 
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
                if(resultado.resultado) {
                   $('#md_retirar_postulacion').modal('show');
                } else {
                   bootstrap_alert_convocatoria.warning('No se pudo retirar la postulación de la convocatoria'); 
                } 
            }
        }});      
    }

    function mostrarConvocatoria(idConvocatoria) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/" + idConvocatoria,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var convocatoria = JSON.parse(response);
                    $('#idConvocatoria').val(convocatoria.id);
                    $('#fechaInicio').val(convocatoria.fechaInicioFormateada);
                    $('#fechaVigencia').val(convocatoria.fechaFinFormateada);
                    $('#tipoConvocatoria').html(convocatoria.nombreTipoConvocatoria);
                    $('#area').html(convocatoria.nombreArea);
                    $('#nombre').html(convocatoria.nombre);
                    $('#fechaPublicacion').html(convocatoria.fechaPublicacionResultadosFormateada);
                    $('#descripcion').val(convocatoria.descripcion);
                    adendas.clear().draw();
                    for (var i = 0; i < convocatoria.adendas.length; i++) {
                        var row = "";
                        if(convocatoria.adendas[i].tieneDocumento) {
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
                    $('#modalConvocatoria').modal('show');
                }
            }});
    }

    function verDocumentoConvocatoria() {
        if ($('#tieneDocumento').val() === "true") {
           window.location.href = "${pageContext.request.contextPath}/convocatorias/documento/" + $('#idConvocatoria').val();
        }
    }

    function verDocumento(idConvocatoria) {
        window.location.href = "${pageContext.request.contextPath}/convocatorias/documento/" + idConvocatoria;
    }

    function verDocumentoAdenda(idAdenda) {
        window.location.href = "${pageContext.request.contextPath}/convocatorias/adenda/documento/" + idAdenda;
    }

    function confirmarEliminacionConvocatoria(idConvocatoria) {
        $('#idConvocatoria').val(idConvocatoria);
        $('#modalEliminacionConvocatoria').modal('show');
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
                if(resultado.resultado) {
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
