<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<div id="contenido">
    <div class="contenido-nav2">
        <ul class="navbar-nav navbar-sidenav">
            <li class="nav-item" id="btndatosgen" data-toggle="tooltip" data-placement="right" title="" data-original-title="Datos generales">
                <a class="nav-link" >
                    <i  class="fa fa-address-book" style="font-size:36px;"></i>
                    <span class="nav-link-text">Datos generales</span>
                </a>
            </li>
            <li class="nav-item" id="btncrithab" data-toggle="tooltip" data-placement="right" title="" data-original-title="Criterios habilitantes">
                <a class="nav-link" >
                    <i  class="fa fa-address-book-o" style="font-size:36px;"></i>
                    <span class="nav-link-text">Criterios habilitantes</span>
                </a>
            </li>
            <li class="nav-item" id="btncriteva" data-toggle="tooltip" data-placement="right" title="" data-original-title="Criterios evaluaci&oacute;n" style="margin-right: 5px !important;">
                <a class="nav-link" >
                    <i class="fa fa-check-square-o" style="font-size:36px;"></i>
                    <span class="nav-link-text">Criterios evaluaci&oacute;n</span>
                </a>
            </li>
            <li class="nav-item" id="btnadendas" data-toggle="tooltip" data-placement="right" title="" data-original-title="Adendas">
                <a class="nav-link" >          
                    <i class="fa fa-pencil-square-o" style="font-size:36px;"></i>
                    <span class="nav-link-text">Adendas </span>
                </a>
            </li>

        </ul>
    </div>    
    <div class="container">
        <div id="alert_placeholder_convocatoria"></div>
        <form:form method="POST" modelAttribute="convocatoria">
            <div id="formdatosgen">
                <legend><h3>Convocatoria</h3></legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="tipoConvocatoria">Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                <form:select style="width: 100%;" path="tipoConvocatoria" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de convocatoria">
                                    <form:option value=""></form:option>
                                    <form:options items="${tiposConvocatoria}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-3">
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
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="fechaFin">Fecha de cierre</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaci&oacute;n" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de finalización">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                            <div class='input-group date'>
                                <form:input class="form-control fecha" path="fechaFin" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de finalización"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="fechaPublicacionResultados">Fecha publicación resultados</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de resultado de publicaci&oacute;n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                            <div class='input-group date' id='datetimepicker1' style="width: 165px">
                                <form:input class="form-control fecha" path="fechaPublicacionResultados" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de publicación de resultados" style="width: 126px"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="area">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el el núcleo básico del conocimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                <form:select style="width: 100%;" path="nucleoBasicoConocimiento" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${nucleosBasicosConocimiento}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-4">
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
                <div id="formcurso" style="display: none">
                    <div class="row">
                        <div class="col-md-12 ">
                            <div class="form-group form-inline">
                                <label>Curso</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el curso">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><button style="margin-left: 10px;"  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_curso"><span class="glyphicon glyphicon-search"></span></button> 
                            </div>
                        </div>
                    </div>
                    <div class="row" id="inputscurso" >
                        <div class="col-md-3">
                            <label>Sede</label>
                            <div class="form-group">
                                <form:input path="sedeCurso" class="form-control input-sm" readonly="true" />
                                <form:hidden path="idSedeCurso" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label>Programa</label>
                            <div class="form-group">
                                <form:input path="programaCurso" class="form-control input-sm" readonly="true" />
                                <form:hidden path="idProgramaCurso" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label>Curso</label>
                            <div class="form-group">
                                <form:input path="nombreCurso" class="form-control input-sm" readonly="true" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label>Total de horas</label>
                            <div class="form-group">
                                <form:input path="totalHorasSemestreCurso" class="form-control input-sm" readonly="true" />
                            </div>
                        </div>
                    </div> 
                    <div id="md_curso" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header mhsuccess" >
                                    <button class="close" data-dismiss="modal">&times;</button>
                                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Agregar curso</h4>
                                </div>
                                <div class="modal-body"> 
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="sede">Sede</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la sede">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                                <select style="width: 100%;" id="sede" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="sede" items="${sedes}">
                                                        <option value="${sede.getId()}">${sede.getNombre()}</option>
                                                    </c:forEach>                                        
                                                </select>
                                            </div>
                                        </div>
                                    </div>   
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="programa">Programa </label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el programa del curso">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <select style="width: 100%;" id="programa" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="curso">Curso </label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el programa del curso">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                                <input style="width: 100%;" id="curso" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Total de horas</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el total de horas">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" id="totalHorasSemestre" class="form-control">
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" id="addcurso">Agregar</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                        
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="documento">Documento de soporte</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe adjuntar un documento de la convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <div class="form-inline">
                                <input type="file" class="form-control" name="documento" id="documento" >
                                <c:if test = "${convocatoria.getId() > 0}">
                                    <button class="btn btn-success btn-xs" type="button" onclick="verDocumentoConvocatoria()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="formcrithab" style="display: none;" >
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" class="btn btn-success">Criterios habilitantes</button>
                    </div>
                </div>
                <legend>Criterios Habilitantes</legend>
                <div class="row">

                </div>
                <div class="row">  
                    <div class="col-md-2" >
                        <div class="form-group">
                            <label>Años experiencia</label>
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo2">
                                    <thead>
                                        <tr>
                                            <th>M&iacute;nimo de a&ntilde;os</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <center>
                                                    <input type="text" name="minimoAnyosExperiencia" id="minimoAnyosExperiencia" class="form-control input-sm" style="width: 100px;text-align: center;">
                                                </center>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" >
                        <label>Agregar a&ntilde;os experiencia</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoAnyosExperiencia()" ><span class="glyphicon glyphicon-plus"></span></button>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo2">
                                <thead>
                                    <tr>
                                        <th style="width:300px;">Nucleo básico de conocimiento</th>
                                        <th>M&iacute;nimo de a&ntilde;os</th>
                                        <th>Opción</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: anyosExperiencias }">
                                    <tr class="table-row">
                                        <td style="width: 90%">
                                            <span data-bind="text: nombreNucleoBasicoConocimiento" ></span>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarAnyosExperiencia"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarAnyosExperiencia"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: nucleoBasicoConocimiento, attr: { 'name': 'anyosExperiencias[' + $index() + '].nucleoBasicoConocimiento'  }" />
                                            <input type="hidden" data-bind="value: anyos, attr: { 'name': 'anyosExperiencias[' + $index() + '].anyos'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'anyosExperiencias[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'anyosExperiencias[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                    <div class="modal fade" role="dialog" id="md_anyos_experiencia">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button class="close" data-dismiss="modal">&times;</button>
                                    <h4>A&ntilde;os experiencia</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_anyos_experiencia"></div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcleo básico de conocimiento">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <select style="width: 100%;" name="nucleoBasicoConocimientoAnyosExperiencia" id="nucleoBasicoConocimientoAnyosExperiencia" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                                        <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                                        </c:forEach>
                                                    </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group ">
                                                <label>A&ntilde;os experiencia minima</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el valor de años experiencia minima">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                <input  name="anyosExperiencia" id="anyosExperiencia" class="form-control" >
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-bind="click: adicionarAnyosExperiencia">Agregar</button>
                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaAnyosExperiencia();">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Agregar idioma requerido</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formidiom"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbformidiom">
                                <thead>
                                    <th>Idioma</th>
                                    <th>Opción</th>
                                </thead>
                                <tbody data-bind="foreach: { data: idiomas }">
                                    <tr class="table-row">
                                        <td style="width: 90%">
                                            <span data-bind="text: nombreIdioma" ></span>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarIdioma"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarIdioma"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: idioma, attr: { 'name': 'idiomas[' + $index() + '].idioma'  }" />
                                            <input type="hidden" data-bind="value: nombreIdioma, attr: { 'name': 'idiomas[' + $index() + '].nombreIdioma'  }" />
                                            <input type="hidden" data-bind="value: tipoCertificacion, attr: { 'name': 'idiomas[' + $index() + '].tipoCertificacion'  }" />
                                            <input type="hidden" data-bind="value: nombreTipoCertificacion, attr: { 'name': 'idiomas[' + $index() + '].nombreTipoCertificacion'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'idiomas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'idiomas[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                    <div class="modal fade" role="dialog" id="md_idiomas">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button class="close" data-dismiss="modal">&times;</button>
                                    <h4>Idioma requerido</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_idioma"></div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="idioma">Idioma</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="idioma" id="idioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                     <c:forEach var="idioma" items="${idiomas}">
                                                     <option value="${idioma.getId()}">${idioma.getNombre()}</option>
                                                     </c:forEach>   
                                                </select>
                                            </div>
                                        </div>  
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Tipo de certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                                <select style="width: 100%;" name="tipoCertificacionIdioma" id="tipoCertificacionIdioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="tipoCertificacion" items="${tiposCertificacion}">
                                                    <option value="${tipoCertificacion.getId()}">${tipoCertificacion.getNombre()}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>  
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6" id="divOtroCertificacionIdioma" style="display: none;">
                                            <div class="form-group">
                                                <label for="">Cual?</label>
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el otro tipo de certificación">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="otraCertificacionIdioma" id="otraCertificacionIdioma" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="">Puntaje minimo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje minimo de estudio idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="puntajeMinimoCertificacionIdioma" id="puntajeMinimoCertificacionIdioma" class="form-control" style="width: 70px;">
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-bind="click: adicionarIdioma">Agregar</button>
                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaIdioma();">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_form"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbform">
                                <thead>
                                    <th>Programa</th>
                                    <th>Nivel de formaci&oacute;n</th>
                                    <th>Opciones</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n complementaria requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formcomreq"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbformcomreq">
                                <thead>
                                <th>Nombre de la capacitación o certificaci&oacute;n</th>
                                <th>Tipo</th>
                                <th>Opciones</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_form">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Formaci&oacute;n requerida</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="con_descripcion">Nivel de formaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe describir el perfil requerido con el cargo y la experiencia requerida">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <select name="freq_nivel_form" id="freq_nivel_form" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                               <c:forEach var="nivelEstudio" items="${nivelesEstudio}">
                                                    <option value="${nivelEstudio.getId()}">${nivelEstudio.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="freq_nucleo" id="freq_nucleo" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                                <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-inline">
                                            <label for="est_programa_cursado">Programa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input  name="txtformpro" id="txtformpro" class="form-control" style="width:210px;"><button type="button" class="btn btn-success btn-sm" id="btnbuscapro" style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-5" style="margin-top: 10px;">
                                        <div class="form-group">
                                            <select name="prog[]" id="selpro" class="form-control" multiple size="10">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="margin-top: 20px;">
                                        <center><button class="btn btn-success btn-xs" type="button" id="pasarderfreq" ><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center><br>
                                        <center><button class="btn btn-success btn-xs" type="button" id="pasarizqfreq" ><i class="fa fa-arrow-left" aria-hidden="true"></i></button></center>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <div class="table-responsive">
                                                <table class="table table-hover tableestilo2" id="tbfreqpro">
                                                    <thead>
                                                        <tr>
                                                            <th>Programa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addprog">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_formcomreq">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Formaci&oacute;n complementaria requerida</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">Tipo de capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el tipo de capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="con_tipo_capacitacion" id="con_tipo_capacitacion" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="tipoCapacitacion" items="${tiposCapacitacion}">
                                                <option value="${tipoCapacitacion.getId()}">${tipoCapacitacion.getNombre()}</option>
                                                </c:forEach>    
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="conformreq_nbc" id="conformreq_nbc" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                                <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-9">
                                        <div class="form-group form-inline">
                                            <label for="est_programa_cursado">Nombre de la capacitaci&oacute;n o certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" name="con_capaci_certi" id="con_capaci_certi" class="form-control" style="width: 500px" ><button type="button" class="btn btn-success btn-sm" id="btnbuscap" style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-5" style="margin-top: 10px;">
                                        <div class="form-group">
                                            <select name="capaci[]" id="selcapaci" class="form-control" multiple size="10">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="margin-top: 20px;">
                                        <center><button class="btn btn-success btn-xs" type="button" id="pasardercapaci" ><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center><br>
                                        <center><button class="btn btn-success btn-xs" type="button" id="pasarizqcapaci" ><i class="fa fa-arrow-left" aria-hidden="true"></i></button></center>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <div class="table-responsive">
                                                <table class="table table-hover tableestilo2" id="tbcapaci">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre de la capacitación o certificación</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addformcomreq">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <div class="form-group">
                            <label>Agregar nuevo criterio</label>
                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_crithab" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Configurar criterios nuevos</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo2" id="tbcrihab">
                                <thead>
                                <th>Criterio</th>
                                <th>Tipo</th>
                                <th>Campo</th>
                                <th>Opciones</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <center><button class="btn btn-success btn-xs" type="button" id="pasarder" ><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center><br>
                        <center><button class="btn btn-success btn-xs" type="button" id="pasarizq" ><i class="fa fa-arrow-left" aria-hidden="true"></i></button></center>
                    </div>
                    <div class="col-md-5">
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo2" id="tbconfig">
                                <thead>
                                <th>Criterio</th>
                                <th></th>
                                <th></th>
                                <th>Valor</th>
                                <th>Opciones</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_crithab">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Criterio</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Nombre de criterio</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" name="txtcritnew" id="txtcritnew" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tipo</label>
                                            <select style="width: 100%;" id="tipcrit" name="tipcrit" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Numerico">Num&eacute;rico</option>
                                                <option value="Categoria">Texto o categoria</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Campo de hoja de vida</label>
                                            <select style="width: 80%;" id="camhoja" id="camhoja" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="sexo">Sexo</option>
                                                <option value="Libreta">Libreta</option>
                                                <option value="Etnico">Etnico</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addcrithab">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_configcampo">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close btnclose" data-dismiss="modal" >&times;</button>
                                <h4>Configuraci&oacute;n</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Nombre de criterio</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%" class="js-select-basic-single js-states" id="txtcritnew3" name="txtcritnew3">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tipo</label>
                                            <input type="text" name="tipcrit3" id="tipcrit3" class="form-control" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Campo de hoja de vida</label>
                                            <input type="text" name="camhoja3" id="camhoja3" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"  style="display: none;" id="inpvalornum">
                                    <div class="col-md-5">
                                        <label>Valor</label>
                                        <input type="text" name="txtvalornum" class="form-control txtvalornum" >
                                    </div>
                                </div>
                                <div class="row" style="display: none;" id="selvalcat">
                                    <div class="col-md-5">
                                        <label>Valor</label>
                                        <select class="js-select-basic-single js-states form-control " id="txtvalornum"  name="txtvalornum" style="width: 100%;">
                                            <option value=""></option>
                                            <option value="ejemplo1">ejemplo1</option>
                                            <option value="ejemplo2">ejemplo2</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addconfiguracion">Agregar</button>
                                <button type="button" class="btn btn-default btnclose" data-dismiss="modal" >Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="formadendas" style="display: none;">
                <div class="row">
                    <div class="col-md-12"> 
                        <legend>Adendas</legend>
                        <label>Agregar adendas</label> 
                        <button style="margin-bottom: 20px;"  type="button" class="btn btn-success" onclick="nuevaAdenda()"><span class="glyphicon glyphicon-plus"></span></button>     
                        <table class="table table-hover tableestilo" id="tbadendas"> 
                            <thead>
                                <tr>    
                                    <th style="width: 30%">Tipo</th>
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
                                        <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoAdenda, visible: tieneDocumento" style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                    </td>
                                    <td style='white-space: nowrap'>
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarAdenda"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarAdenda"><span class='glyphicon glyphicon-remove'></span></button>
                                        <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'adendas[' + $index() + '].consecutivo'  }" />
                                        <input type="hidden" data-bind="value: id, attr: { 'name': 'adendas[' + $index() + '].id'  }" />
                                    </td>
                                </tr>
                            </tbody>                                         
                        </table>
                    </div>
                    <div id="md_adenda" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button class="close" onclick="cerrarVentanaAndenda();">&times;</button>
                                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Agregar adenda</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_adenda"></div>
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
                                        <div id="documentosAdenda">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button"  class="btn btn-success" data-bind="click: adicionarAdenda">Agregar</button>
                                    <button type="button" class="btn btn-default" onclick="cerrarVentanaAndenda();">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="submit" class="btn btn-success" style="margin-bottom: 10px;" value="Guardar" />
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="id" />
        </form:form>
        <div class="modal fade" id="confirmacionAlmacenamientoConvocatoria" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <c:if test = "${convocatoria.getId() == 0}">
                            <button type="button" class="close" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/crear'">&times;</button>
                        </c:if>
                        <c:if test = "${convocatoria.getId() > 0}">
                            <button type="button" class="close" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/editar/${convocatoria.getId()}'">&times;</button>
                        </c:if>
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
                        <c:if test = "${convocatoria.getId() == 0}">
                            <button type="button" class="btn btn-success" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/crear'">Cerrar</button>
                        </c:if>
                        <c:if test = "${convocatoria.getId() > 0}">
                            <button type="button" class="btn btn-success" onclick="window.location.href = '${pageContext.request.contextPath}/convocatorias/editar/${convocatoria.getId()}'">Cerrar</button>
                        </c:if>                        
                    </div>
                </div>
            </div>
        </div>             
    </div>
</div>
<!-- jQuery -->
<script>
    var DOCENCIA_MEDELLIN = "3";
    var DOCENCIA_REGIONES = "4";
    var TIPO_CERTIFICACION_OTRO = "8";
    
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

        $('#tipoConvocatoria').change(function () {
            var valor = $(this).val();
            if (valor === DOCENCIA_MEDELLIN || valor === DOCENCIA_REGIONES) {
                $('#formcurso').show();
            } else {
                $('#formcurso').hide();
            }
        });

        $('#sede').change(function () {
            var idSede = $(this).val();
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/convocatorias/programasSede/" + idSede,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response !== "") {
                        $('#programa').find('option').remove();
                        $('#programa').append('<option></option>');
                        var programas = JSON.parse(response);
                        for (var i = 0; i < programas.length; i++) {
                            $('#programa').append('<option value=' + programas[i].id + '>' + programas[i].nombre + '</option>');
                        }
                    }
                }});
        });

        $('#addcurso').click(function () {
            var sede = $('#sede').val();
            var nombreSede = $('#sede option:selected').text();
            var programa = $('#programa').val();
            var nombrePrograma = $('#programa option:selected').text();
            var curso = $('#curso').val();
            var tothoras = $('#totalHorasSemestre').val();

            $('#idSedeCurso').val(sede);
            $('#sedeCurso').val(nombreSede);
            $('#idProgramaCurso').val(programa);
            $('#programaCurso').val(nombrePrograma);
            $('#nombreCurso').val(curso);
            $('#totalHorasSemestreCurso').val(tothoras);
            $('#inputscurso').show();
            $('#md_curso').modal('hide');
        });
        if ($('#tipoConvocatoria').val() === DOCENCIA_MEDELLIN || $('#tipoConvocatoria').val() === DOCENCIA_REGIONES) {
            $('#formcurso').show();
        } else {
            $('#formcurso').hide();
        }
    });
    $('#tipoCertificacion').change(function(){
      var valor = $(this).val();
      if(valor === TIPO_CERTIFICACION_OTRO) {
        $('#divOtroCertificacionIdioma').css("display","block");
      } else {
        $('#divOtroCertificacionIdioma').css("display","none");
      }
    });
    $('#btndatosgen').click(function () {
        $('#formdatosgen').css('display', 'block');
        $('#formcrithab').css('display', 'none');
        $('#formcriteva').css('display', 'none');
        $('#formadendas').css('display', 'none');
    });
    $('#btncrithab').click(function () {
        $('#formdatosgen').css('display', 'none');
        $('#formcrithab').css('display', 'block');
        $('#formcriteva').css('display', 'none');
        $('#formadendas').css('display', 'none');
    });
    $('#btncriteva').click(function () {
        $('#formdatosgen').css('display', 'none');
        $('#formcrithab').css('display', 'none');
        $('#formcriteva').css('display', 'block');
        $('#formadendas').css('display', 'none');
    });
    $('#btnadendas').click(function () {
        $('#formdatosgen').css('display', 'none');
        $('#formcrithab').css('display', 'none');
        $('#formcriteva').css('display', 'none');
        $('#formadendas').css('display', 'block');
    });

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
                if (response === "") {
                    $('#confirmacionAlmacenamientoConvocatoria').modal('show');
                } else {
                    bootstrap_alert_convocatoria.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_convocatoria.warning("Error al almacenar la convocatoria.");
            }});
    });

    bootstrap_alert_convocatoria = { };
    bootstrap_alert_convocatoria.warning = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.success = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.removeWarning = function () {
        $('#alert_placeholder_convocatoria').html('');
    };

    bootstrap_alert_adenda = {};
    bootstrap_alert_adenda.warning = function (message) {
        $('#alert_adenda').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_adenda.removeWarning = function () {
        $('#alert_adenda').html('');
    };

    bootstrap_alert_anyos_experiencia = {};
    bootstrap_alert_anyos_experiencia.warning = function (message) {
        $('#alert_anyos_experiencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_experiencia.removeWarning = function () {
        $('#alert_anyos_experiencia').html('');
    };

    var ConvocatoriaModel = function (adendas, anyosExperiencias, idiomas) {
        self = this;
        self.adendas = ko.observableArray(adendas);
        self.anyosExperiencias = ko.observableArray(anyosExperiencias);
        self.idiomas = ko.observableArray(idiomas);
        self.adicionarAdenda = function () {
            var tipoAdenda = $('#tipoAdenda').val();
            var nombreTipoAdenda = $('#tipoAdenda option:selected').text();
            var descripcionAdenda = $('#descripcionAdenda').val();
            var fechaAdenda = $('#fechaAdenda').val();
            
            if (tipoAdenda === "") {
                bootstrap_alert_adenda.warning('Debe seleccionar el tipo de adenda');
                return false;
            }
            if (descripcionAdenda === "") {
                bootstrap_alert_adenda.warning('Debe ingresar la descripción de la adenda');
                return false;
            }
            if (fechaAdenda === "") {
                bootstrap_alert_adenda.warning('Debe ingresar la fecha de la adenda');
                return false;
            }
            
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="adendas[' + self.adendas().length + '].documento"]').val() === "") {
                    bootstrap_alert_adenda.warning('Debe ingresar el documento');
                    return false;
                }
                self.adendas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.adendas().length),
                    tipoAdenda: ko.observable(tipoAdenda),
                    nombreTipoAdenda: ko.observable(nombreTipoAdenda),
                    descripcion: ko.observable(descripcionAdenda),
                    documento: ko.observable(''),
                    fecha: ko.observable(fechaAdenda),
                    tieneDocumento: ko.observable(false)
                });
                $('input:file[name="adendas[' + self.adendas().length + '].documento"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.adendas().length; i++) {
                    if (self.adendas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.adendas()[indice].tipoAdenda(tipoAdenda);
                self.adendas()[indice].nombreTipoAdenda(nombreTipoAdenda);
                self.adendas()[indice].descripcion(descripcionAdenda);
                self.adendas()[indice].documento('');
                self.adendas()[indice].fecha(fechaAdenda);
                $('input:file[name="adendas[' + indice + '].documento"]').hide();
            }
            $('#md_adenda').modal('hide');
            $('#tipoAdenda').val("").trigger('change');
            $('#fechaAdenda').val("");
            $('#descripcionAdenda').val("");
        };

        self.eliminarAdenda = function (adenda) {
            $('input:file[name="adendas[' + adenda.consecutivo() + '].documento"]').remove();
            self.adendas.remove(adenda);
        };

        self.editarAdenda = function (adenda) {
            ocultarDocumentoAdendas();
            $('#tipoAdenda').val(adenda.tipoAdenda()).trigger('change');
            ;
            $('#fechaAdenda').val(adenda.fecha());
            $('#descripcionAdenda').val(adenda.descripcion());
            $('#consecutivo').val(adenda.consecutivo());
            $('input:file[name="adendas[' + adenda.consecutivo() + '].documento"]').show();
            $('#md_adenda').modal('show');
        };

        self.verDocumentoAdenda = function (adenda) {
            if (adenda.tieneDocumento()) {
                window.location.href = "${pageContext.request.contextPath}/convocatorias/adenda/documento/" + adenda.id();
            }
        };
        
        self.adicionarAnyosExperiencia = function () {
            var nucleoBasicoConocimientoAnyosExperiencia = $('#nucleoBasicoConocimientoAnyosExperiencia').val();
            var nombreNucleoBasicoConocimientoAnyosExperiencia = $('#nucleoBasicoConocimientoAnyosExperiencia option:selected').text();
            var anyosExperiencia = $('#anyosExperiencia').val();

            if (nucleoBasicoConocimientoAnyosExperiencia === "") {
                bootstrap_alert_anyos_experiencia.warning('Debe seleccionar el núcleo básico de conocimento');
                return false;
            }
            if (anyosExperiencia === "") {
                bootstrap_alert_anyos_experiencia.warning('Debe ingresar el número de años de experiencia');
                return false;
            }

            if ($('#consecutivo').val() === "") {
                self.anyosExperiencias.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.anyosExperiencias().length),
                    nucleoBasicoConocimiento: ko.observable(nucleoBasicoConocimientoAnyosExperiencia),
                    nombreNucleoBasicoConocimiento: ko.observable(nombreNucleoBasicoConocimientoAnyosExperiencia),
                    anyos: ko.observable(anyosExperiencia)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.anyosExperiencias().length; i++) {
                    if (self.anyosExperiencias()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.anyosExperiencias()[indice].nucleoBasicoConocimiento(nucleoBasicoConocimientoAnyosExperiencia);
                self.anyosExperiencias()[indice].nombreNucleoBasicoConocimiento(nombreNucleoBasicoConocimientoAnyosExperiencia);
                self.anyosExperiencias()[indice].anyos(anyosExperiencia);
            }
            $('#md_anyos_experiencia').modal('hide');
        };

        self.eliminarAnyosExperiencia = function (anyosExperiencia) {
            self.anyosExperiencias.remove(anyosExperiencia);
        };

        self.editarAnyosExperiencia = function (anyosExperiencia) {
            $('#nucleoBasicoConocimientoAnyosExperiencia').val(anyosExperiencia.nucleoBasicoConocimiento()).trigger('change');
            $('#anyosExperiencia').val(anyosExperiencia.anyos());
            $('#consecutivo').val(anyosExperiencia.consecutivo());
            bootstrap_alert_anyos_experiencia.removeWarning();
            $('#md_anyos_experiencia').modal('show');
        };

        self.adicionarIdioma = function () {
            var idioma = $('#idioma').val();
            var nombreIdioma = $('#idioma option:selected').text();
            var otraCertificacion = $('#otraCertificacionIdioma').val();
            var tipoCertificacion = $('#tipoCertificacionIdioma').val();
            var nombreTipoCertificacion = $('#tipoCertificacionIdioma option:selected').text();
            var puntajeMinimoCertificacion = $('#puntajeMinimoCertificacionIdioma').val();

            if (idioma === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el idioma');
                return false;
            }
            if (tipoCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el tipo de certificación');
                return false;
            }
            if (tipoCertificacion === TIPO_CERTIFICACION_OTRO && otraCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar la certificación');
                return false;
            }
            if (puntajeMinimoCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar el puntaje de certificación');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                self.idiomas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.idiomas().length),
                    idioma: ko.observable(idioma),
                    nombreIdioma: ko.observable(nombreIdioma),
                    otraCertificacion: ko.observable(otraCertificacion),
                    tipoCertificacion: ko.observable(tipoCertificacion),
                    nombreTipoCertificacion: ko.observable(nombreTipoCertificacion),
                    puntajeMinimoCertificacion: ko.observable(puntajeMinimoCertificacion)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.idiomas().length; i++) {
                    if (self.idiomas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.idiomas()[indice].idioma(idioma);
                self.idiomas()[indice].nombreIdioma(nombreIdioma);
                self.idiomas()[indice].otraCertificacion(otraCertificacion);
                self.idiomas()[indice].tipoCertificacion(tipoCertificacion);
                self.idiomas()[indice].nombreTipoCertificacion(nombreTipoCertificacion);
                self.idiomas()[indice].puntajeMinimoCertificacion(puntajeMinimoCertificacion);
            }
            $('#md_idioma').modal('hide');
        };

        self.eliminarIdioma = function (idioma) {
            self.idiomas.remove(idioma);
        };

        self.editarIdioma = function (idioma) {
            ocultarCertificadosIdiomas();
            $('#idioma').val(idioma.idioma()).trigger('change');
            $('#nivelConversacionIdioma').val(idioma.nivelConversacion()).trigger('change');
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if($('#tipoCertificacionIdioma').val() === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#puntajeMinimoCertificacionIdioma').val(idioma.puntajeMinimoCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            bootstrap_alert_idioma.removeWarning();
            $('#md_idioma').modal('show');
        };
    };

    function verDocumentoConvocatoria() {
        window.location.href = "${pageContext.request.contextPath}/convocatorias/documento/" + $('#id').val();
    }

    function nuevaAdenda() {
        $('#tipoAdenda').val("").trigger('change');
        $('#fechaAdenda').val("");
        $('#descripcionAdenda').val("");
        ocultarDocumentoAdendas();
        var fileInput = $('input:file[name="adendas[' + convocatoriaModel.adendas().length + '].documento"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" id="adendas[' + (convocatoriaModel.adendas().length) + '].documento" name="adendas[' + (self.adendas().length) + '].documento" />');
            $('#documentosAdenda').append(fileInput);
        } else {
            fileInput.show();
        }
        $('#md_adenda').modal('show');
    }

    function nuevoAnyosExperiencia() {
        $('#nucleoBasicoConocimientoAnyosExperiencia').val("").trigger('change');
        $('#anyosExperiencia').val("");
        $('#consecutivo').val("");
        bootstrap_alert_anyos_experiencia.removeWarning();
        $('#md_anyos_experiencia').modal('show');
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeMinimoCertificacionIdioma').val("");
        $('#consecutivo').val("");
        bootstrap_alert_idioma.removeWarning();
        $('#md_idioma').modal('show');
    }
    
    function cerrarVentanaAndenda() {
        if ($('input:file[name="adendas[' + self.documentosSoporte().length + '].documento"]')) {
            $('input:file[name="adendas[' + self.documentosSoporte().length + '].documento"]').remove();
        }
        $('#md_adenda').modal('hide');
    }

    function cerrarVentanaAnyosExperiencia() {
        $('#md_anyos_experiencia').modal('hide');
    }

    function cerrarVentanaIdioma() {
        $('#md_idioma').modal('hide');
    }

    function ocultarDocumentoAdendas() {
        for (var i = 0; i < convocatoriaModel.adendas().length; i++) {
            $('input:file[name="adendas[' + i + '].documento"]').hide();
        }
        var fileInput = $('input:file[name="adendas[' + convocatoriaModel.adendas().length + '].documento"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }

    var adendas = [];
    var anyosExperiencias = [];
    <c:if test = "${adendasJSON != null}">
    adendas = ${adendasJSON};
    for (var i = 0; i < adendas.length; i++) {
        var fileInput = $('<input type="file" class="form-control" id="adendas[' + i + '].documento" name="adendas[' + i + '].documento" />');
        $('#documentosAdenda').append(fileInput);
        $('input:file[name="adendas[' + i + '].documento"]').hide();
    }
    </c:if>
    <c:if test = "${anyosExperienciasJSON != null}">
    anyosExperiencias = ${anyosExperienciasJSON};
    </c:if>
    <c:if test = "${idiomasJSON != null}">
    idiomas = ${idiomasJSON};
    </c:if>
    var convocatoriaModel = new ConvocatoriaModel(adendas, anyosExperiencias, idiomas);
    ko.applyBindings(convocatoriaModel);
</script>
