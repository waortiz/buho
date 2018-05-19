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
                                <form:input class="form-control fecha" path="fechaInicio" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" maxlength="10" />
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
                                <form:input class="form-control fecha" path="fechaFin" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de finalización" maxlength="10"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="fechaPublicacionResultados">Fecha publicación resultados</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de resultado de publicaci&oacute;n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                            <div class='input-group date'>
                                <form:input class="form-control fecha" path="fechaPublicacionResultados" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de publicación de resultados" maxlength="10"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="nombre">Nombre</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de la convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <form:input class="form-control" path="nombre" data-validation="required" data-validation-error-msg="Debe ingresar el nombre" maxlength="150"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="descripcion">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe describir el perfil requerido con el cargo y la experiencia requerida">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <form:textarea class="form-control" path="descripcion" data-validation="required" data-validation-error-msg="Debe ingresar la descripción" maxlength="300"/>
                        </div>
                    </div>
                </div>
                <div id="formcurso" style="display: none">
                    <div class="row">
                        <div class="col-md-12 ">
                            <div class="form-group form-inline">
                                <label>Curso</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el curso">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><button style="margin-left: 10px;"  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_curso" data-backdrop="static" data-keyboard="false"><span class="glyphicon glyphicon-search"></span></button> 
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
                                                    <input style="width: 100%;" id="curso" class="form-control" maxlength="100">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Total de horas</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el total de horas">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                    <input type="text" id="totalHorasSemestre" class="form-control" maxlength="5">
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
                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="documento" id="documento" >
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
                                <table class="table tabla table-hover tableestilo">
                                    <thead>
                                        <tr>
                                            <th>M&iacute;nimo de a&ntilde;os</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                    <center>
                                        <form:input path="anyosMinimosExperiencia" class="form-control input-sm" style="width: 100px;text-align: center;" maxlength="4" />
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
                            <table class="table tabla table-hover tableestilo">
                                <thead>
                                    <tr>
                                        <th style="width:300px;">Nucleo básico de conocimiento</th>
                                        <th>M&iacute;nimo de a&ntilde;os</th>
                                        <th>Opción</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: anyosExperiencias }">
                                    <tr class="table-row">
                                        <td style="width: 50%">
                                            <span data-bind="text: nombreNucleoBasicoConocimiento" ></span>
                                        </td>
                                        <td style="width: 40%">
                                            <span data-bind="text: anyos" ></span>
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
                                                    <input  name="anyosExperiencia" id="anyosExperiencia" class="form-control" maxlength="4">
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
                            <button  type="button" class="btn btn-success btn-sm" onclick="nuevoIdioma()"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table tabla table-hover tableestilo">
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
                                            <input type="hidden" data-bind="value: puntajeMinimoCertificacion, attr: { 'name': 'idiomas[' + $index() + '].puntajeMinimoCertificacion'  }" />
                                            <input type="hidden" data-bind="value: otraCertificacion, attr: { 'name': 'idiomas[' + $index() + '].otraCertificacion'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'idiomas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'idiomas[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                    <div class="modal fade" role="dialog" id="md_idioma">
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
                                                    <input type="text" name="otraCertificacionIdioma" id="otraCertificacionIdioma" class="form-control" maxlength="100">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="">Puntaje mínimo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje mínimo de estudio idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                    <input type="text" name="puntajeMinimoCertificacionIdioma" id="puntajeMinimoCertificacionIdioma" class="form-control" style="width: 70px;" maxlength="5">
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
                            <button  type="button" class="btn btn-success btn-sm" onclick="nuevoPrograma()"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table tabla table-hover tableestilo" id="tbform">
                                <thead>
                                <th>Programa</th>
                                <th>Nivel de formaci&oacute;n</th>
                                <th>Opciones</th>
                                </thead>
                                <tbody data-bind="foreach: { data: programas }">
                                    <tr class="table-row">
                                        <td style="width: 70%">
                                            <span data-bind="text: nombrePrograma" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreNivelFormacion" ></span>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarPrograma"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarPrograma"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: programa, attr: { 'name': 'programas[' + $index() + '].programa'  }" />
                                            <input type="hidden" data-bind="value: nivelFormacion, attr: { 'name': 'programas[' + $index() + '].nivelFormacion'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'programas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'programas[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n complementaria requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionContinua()"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <br>
                            <table class="table tabla table-hover tableestilo">
                                <thead>
                                <th>Nombre de la capacitación o certificaci&oacute;n</th>
                                <th>Tipo</th>
                                <th>Opciones</th>
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesContinuas }">
                                    <tr class="table-row">
                                        <td style="width: 70%">
                                            <span data-bind="text: nombreCapacitacion" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreTipoCapacitacion" ></span>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionContinua"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionContinua"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: nombreCapacitacion, attr: { 'name': 'educacionesContinuas[' + $index() + '].nombreCapacitacion'  }" />
                                            <input type="hidden" data-bind="value: tipoCapacitacion, attr: { 'name': 'educacionesContinuas[' + $index() + '].tipoCapacitacion'  }" />
                                            <input type="hidden" data-bind="value: nucleoBasicoConocimiento, attr: { 'name': 'educacionesContinuas[' + $index() + '].nucleoBasicoConocimiento'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'educacionesContinuas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'educacionesContinuas[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_programa">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Formaci&oacute;n requerida</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_programa"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nivelFormacion">Nivel de formaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel formación">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <select name="nivelFormacionPrograma" id="nivelFormacionPrograma" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="nivelEstudio" items="${nivelesFormacion}">
                                                    <option value="${nivelEstudio.getId()}">${nivelEstudio.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="nucleoBasicoConocimientoPrograma" id="nucleoBasicoConocimientoPrograma" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                                    <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <div class="form-group form-inline">
                                            <label for="programaCursado">Programa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="programaCursado" id="programaCursado" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarPrograma">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaPrograma();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_educacion_continua">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Formaci&oacute;n complementaria requerida</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_educacion_continua"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="tipoCapacitacionEducacionContinua">Tipo de capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el tipo de capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="tipoCapacitacionEducacionContinua" id="tipoCapacitacionEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="tipoCapacitacion" items="${tiposCapacitacion}">
                                                    <option value="${tipoCapacitacion.getId()}">${tipoCapacitacion.getNombre()}</option>
                                                </c:forEach>    
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nucleoBasicoConocimientoEducacionContinua">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="nucleoBasicoConocimientoEducacionContinua" id="nucleoBasicoConocimientoEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                                    <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-12">
                                        <div class="form-group form-inline">
                                            <label for="capacitacionEducacionContinua">Nombre de la capacitaci&oacute;n o certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="capacitacionEducacionContinua" id="capacitacionEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarEducacionContinua">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaEducacionContinua();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <div class="form-group">
                            <label>Agregar nuevo criterio</label>
                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoCriterioHabilitante()" ><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Configurar criterios nuevos</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table tabla table-hover tableestilo">
                                <thead>
                                <th>Campo</th>
                                <th>Valor</th>
                                <th>Opciones</th>
                                </thead>
                                <tbody data-bind="foreach: { data: criteriosHabilitantes }">
                                    <tr class="table-row">
                                        <td style="width: 45%">
                                            <span data-bind="text: nombreCampoHojaVida" ></span>
                                        </td>
                                        <td style="width: 45%">
                                            <span data-bind="text: valor" ></span>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCriterioHabilitante"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarCriterioHabilitante"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: campoHojaVida, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].campoHojaVida'  }" />
                                            <input type="hidden" data-bind="value: valor, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].valor'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>                                    
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_criterio_habilitante">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Criterio</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_criterio_habilitante"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Campo de hoja de vida</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el campo de la hoja de vida">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%;" id="campoHojaVidaCriterioHabilitante" id="campoHojaVidaCriterioHabilitante" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="campoHojaVida" items="${camposHojaVida}">
                                                    <option value="${campoHojaVida.getId()}">${campoHojaVida.getAlias()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Valor</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el valor del criterio habilitante">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                <input type="text" name="valorCriterioHabilitante" id="valorCriterioHabilitante" class="form-control" maxlength="100" >
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarCriterioHabilitante">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaCriterioHabilitante();">Cancelar</button>
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
                        <table class="table tabla table-hover tableestilo" id="tbadendas"> 
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
                                        <input type='text' class="form-control fecha" name="fechaAdenda" id="fechaAdenda" maxlength="10" />
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
            <input type="submit" class="btn btn-success" type="button" style="margin-top: 30px;float: right;" value="Guardar" />
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="id" />
        </form:form>
        <div id="md_guardar" class="modal fade" role="dialog" disabled>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header mhsuccess">
                        <h4>Por favor espere guardando...</h4>
                    </div>
                    <div class="modal-body">
                        <div class="barprogress">
                            <div class="progress" >
                                <div  class="progress-bar progress-bar-success progress-bar-striped active dynamic" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"><span id="current-progress"></span>

                                </div>
                            </div><span>Guardando...</span>
                        </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>             
        <div class="modal fade" id="confirmacionAlmacenamientoConvocatoria" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header mhsuccess">
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
    var programas = [];
    var programaCursado = '';
    var capacitacionEducacionContinua = '';
    var MAXIMO_TAMANYO_ARCHIVO = 2097152;
    
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    $('.fecha').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true
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
        var output = moment().format('DD/MM/YYYY');
        if($('#fechaInicio').val() == '') {
            $('#fechaInicio').val(output);
        }
        if($('#fechaFin').val() == '') {
            $('#fechaFin').val(output);
        }
        if($('#fechaPublicacionResultados').val() == '') {
            $('#fechaPublicacionResultados').val(output);
        }
        $('#fechaInicio').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaFin').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaPublicacionResultados').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaAdenda').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        
        $('#tipoConvocatoria').change(function () {
            var valor = $(this).val();
            if (valor === DOCENCIA_MEDELLIN || valor === DOCENCIA_REGIONES) {
                $('#formcurso').show();
            } else {
                $('#formcurso').hide();
            }
        });
        $('#totalHorasSemestre').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
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
        $('#nucleoBasicoConocimientoPrograma').change(function () {
            obtenerProgramasCursados();
        });
        $('#nucleoBasicoConocimientoEducacionContinua').change(function () {
            obtenerCapacitaciones();
        });
        $('#tipoCapacitacionEducacionContinua').change(function () {
            obtenerCapacitaciones();
        });

    });
    $('#tipoCertificacionIdioma').change(function () {
        var valor = $(this).val();
        if (valor === TIPO_CERTIFICACION_OTRO) {
            $('#divOtroCertificacionIdioma').css("display", "block");
        } else {
            $('#divOtroCertificacionIdioma').css("display", "none");
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
    
    $('#anyosMinimosExperiencia').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    $('#anyosExperiencia').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    $('#puntajeMinimoCertificacionIdioma').change(function () {
        var decimalOnly = /^\s*[0-9]\d*(\.\d+)?\s*$/;
        if(!decimalOnly.test(this.value)) {
            this.value = '';
        }
    });
        
    $('#convocatoria').submit(function (evt) {
        evt.preventDefault();
        if($('#documento').val() != "" && $('#documento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_convocatoria.warning("El documento de la convocatoria no puede ser mayor a 2MB.");
            return;
        }
        
        $('#md_guardar').modal({backdrop: 'static', keyboard: false})  ;
        current_progress = 0;
        var interval = setInterval(function () {
            current_progress += 10;
            $(".dynamic")
                    .css("width", current_progress + "%")
                    .attr("aria-valuenow", current_progress)
                    .text(current_progress + "% Completado");
            if (current_progress >= 100) {
                clearInterval(interval);
            }
            if (current_progress === 100) {
                $('#md_guardar').modal('hide');
            }
        }, 1000);
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
                $('#md_guardar').modal('hide');
                if (response === "") {
                    $('#confirmacionAlmacenamientoConvocatoria').modal({backdrop: 'static', keyboard: false})  ;
                } else {
                    bootstrap_alert_convocatoria.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_convocatoria.warning("Error al almacenar la convocatoria.");
                $('#md_guardar').modal('hide');
            }});
    });

    function obtenerProgramasCursados() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoPrograma').val();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/convocatorias/programas?nucleoBasicoConocimiento=" + nucleoBasicoConocimiento,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#programaCursado').find('option').remove();
                    $('#programaCursado').append('<option></option>');
                    programas = JSON.parse(response);
                    for (var i = 0; i < programas.length; i++) {
                        $('#programaCursado').append('<option value=' + programas[i].id + '>' + programas[i].nombre + '</option>');
                    }
                    if (programaCursado != '') {
                        $('#programaCursado').val(programaCursado).trigger('change');
                    }
                }
            }});
    }

    function obtenerCapacitaciones() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoEducacionContinua').val();
        var tipoCapacitacion = $('#tipoCapacitacionEducacionContinua').val();
        if (nucleoBasicoConocimiento !== "" && tipoCapacitacion !== "") {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/convocatorias/capacitaciones?nucleoBasicoConocimiento=" + nucleoBasicoConocimiento + "&tipoCapacitacion=" + tipoCapacitacion,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response !== "") {
                        $('#capacitacionEducacionContinua').find('option').remove();
                        $('#capacitacionEducacionContinua').append('<option></option>');
                        capacitaciones = JSON.parse(response);
                        for (var i = 0; i < capacitaciones.length; i++) {
                            $('#capacitacionEducacionContinua').append('<option value=' + capacitaciones[i].nombre + '>' + capacitaciones[i].nombre + '</option>');
                        }
                        if (capacitacionEducacionContinua != '') {
                            $('#capacitacionEducacionContinua').val(capacitacionEducacionContinua).trigger('change');
                        }
                    }
                }});
        }
    }

    bootstrap_alert_convocatoria = {};
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

    bootstrap_alert_idioma = {};
    bootstrap_alert_idioma.warning = function (message) {
        $('#alert_idioma').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idioma.removeWarning = function () {
        $('#alert_idioma').html('');
    };

    bootstrap_alert_programa = {};
    bootstrap_alert_programa.warning = function (message) {
        $('#alert_programa').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programa.removeWarning = function () {
        $('#alert_programa').html('');
    };

    bootstrap_alert_educacion_continua = {};
    bootstrap_alert_educacion_continua.warning = function (message) {
        $('#alert_educacion_continua').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_continua.removeWarning = function () {
        $('#alert_educacion_continua').html('');
    };
    
    bootstrap_alert_criterio_habilitante = {};
    bootstrap_alert_criterio_habilitante.warning = function (message) {
        $('#alert_criterio_habilitante').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_criterio_habilitante.removeWarning = function () {
        $('#alert_criterio_habilitante').html('');
    };
    

    var ConvocatoriaModel = function (adendas, anyosExperiencias, idiomas, programas, educacionesContinuas, criteriosHabilitantes) {
        self = this;
        self.adendas = ko.observableArray(adendas);
        self.anyosExperiencias = ko.observableArray(anyosExperiencias);
        self.idiomas = ko.observableArray(idiomas);
        self.programas = ko.observableArray(programas);
        self.educacionesContinuas = ko.observableArray(educacionesContinuas);
        self.criteriosHabilitantes = ko.observableArray(criteriosHabilitantes);

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
                if ($('input:file[name="adendas[' + self.adendas().length + '].documento"]')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_adenda.warning('El documento no debe ser mayor a 2MB');
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
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.adendas().length; i++) {
                    if (self.adendas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('input:file[name="adendas[' + indice + '].documento"]').val() != "" && 
                    $('input:file[name="adendas[' + indice + '].documento"]')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_adenda.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                self.adendas()[indice].tipoAdenda(tipoAdenda);
                self.adendas()[indice].nombreTipoAdenda(nombreTipoAdenda);
                self.adendas()[indice].descripcion(descripcionAdenda);
                self.adendas()[indice].documento('');
                self.adendas()[indice].fecha(fechaAdenda);
            }
            $('#md_adenda').modal('hide');
            $('#tipoAdenda').val("").trigger('change');
            $('#fechaAdenda').val("");
            $('#descripcionAdenda').val("");
        };

        self.eliminarAdenda = function (adenda) {
            $('input:file[name="adendas[' + adenda.consecutivo() + '].documento"]').remove();
            self.adendas.remove(adenda);
            for(i = adenda.consecutivo(); i < self.adendas().length; i++) {
               $('input:file[name="adendas[' + (i + 1) + '].documento"]').attr('name', 'adendas[' + i + '].documento'); 
                self.adendas()[i].consecutivo(i);
            }            
        };

        self.editarAdenda = function (adenda) {
            ocultarDocumentoAdendas();
            $('#tipoAdenda').val(adenda.tipoAdenda()).trigger('change');
            $('#fechaAdenda').val(adenda.fecha());
            $('#descripcionAdenda').val(adenda.descripcion());
            $('#consecutivo').val(adenda.consecutivo());
            $('input:file[name="adendas[' + adenda.consecutivo() + '].documento"]').show();
            $('#md_adenda').modal({backdrop: 'static', keyboard: false})  ;
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
            $('#md_anyos_experiencia').modal({backdrop: 'static', keyboard: false})  ;
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
                bootstrap_alert_idioma.warning('Debe ingresar la otra certificación');
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
            $('#idioma').val(idioma.idioma()).trigger('change');
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if ($('#tipoCertificacionIdioma').val() === TIPO_CERTIFICACION_OTRO) {
                $('#divOtroCertificacionIdioma').css("display", "block");
            } else {
                $('#divOtroCertificacionIdioma').css("display", "none");
            }
            $('#puntajeMinimoCertificacionIdioma').val(idioma.puntajeMinimoCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            bootstrap_alert_idioma.removeWarning();
            $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarPrograma = function () {
            var nivelFormacion = $('#nivelFormacionPrograma').val();
            var nombreNivelFormacion = $('#nivelFormacionPrograma option:selected').text();
            var nucleoBasicoConocimientoPrograma = $('#nucleoBasicoConocimientoPrograma').val();
            var programa = $('#programaCursado').val();
            var nombrePrograma = $('#programaCursado option:selected').text();

            if (nivelFormacion === "") {
                bootstrap_alert_programa.warning('Debe seleccionar el nivel de formación');
                return false;
            }
            if (programa === "") {
                bootstrap_alert_programa.warning('Debe seleccionar el programa');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                self.programas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.programas().length),
                    nivelFormacion: ko.observable(nivelFormacion),
                    nombreNivelFormacion: ko.observable(nombreNivelFormacion),
                    nucleoBasicoConocimiento: ko.observable(nucleoBasicoConocimientoPrograma),
                    programa: ko.observable(programa),
                    nombrePrograma: ko.observable(nombrePrograma)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.programas().length; i++) {
                    if (self.programas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.programas()[indice].nivelFormacion(nivelFormacion);
                self.programas()[indice].nombreNivelFormacion(nombreNivelFormacion);
                self.programas()[indice].nucleoBasicoConocimiento(nucleoBasicoConocimientoPrograma);
                self.programas()[indice].programa(programa);
                self.programas()[indice].nombrePrograma(nombrePrograma);
            }
            $('#md_programa').modal('hide');
        };

        self.eliminarPrograma = function (programa) {
            self.programas.remove(programa);
        };

        self.editarPrograma = function (programa) {
            programaCursado = programa.programa();
            $('#nivelFormacionPrograma').val(programa.nivelFormacion()).trigger('change');
            $('#nucleoBasicoConocimientoPrograma').val(programa.nucleoBasicoConocimiento()).trigger('change');
            $('#consecutivo').val(programa.consecutivo());
            bootstrap_alert_programa.removeWarning();
            $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarEducacionContinua = function () {
            var tipoCapacitacion = $('#tipoCapacitacionEducacionContinua').val();
            var nombreTipoCapacitacion = $('#tipoCapacitacionEducacionContinua option:selected').text();
            var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoEducacionContinua').val();
            var capacitacion = $('#capacitacionEducacionContinua').val();

            if (tipoCapacitacion === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el tipo de capacitación');
                return false;
            }
            if (nucleoBasicoConocimiento === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el núcleo básico de conocimiento');
                return false;
            }
            if (capacitacion === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar la capacitación');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                self.educacionesContinuas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.educacionesContinuas().length),
                    tipoCapacitacion: ko.observable(tipoCapacitacion),
                    nombreTipoCapacitacion: ko.observable(nombreTipoCapacitacion),
                    nucleoBasicoConocimiento: ko.observable(nucleoBasicoConocimiento),
                    nombreCapacitacion: ko.observable(capacitacion)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesContinuas().length; i++) {
                    if (self.educacionesContinuas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.educacionesContinuas()[indice].tipoCapacitacion(tipoCapacitacion);
                self.educacionesContinuas()[indice].nombreTipoCapacitacion(nombreTipoCapacitacion);
                self.educacionesContinuas()[indice].nucleoBasicoConocimiento(nucleoBasicoConocimiento);
                self.educacionesContinuas()[indice].nombreCapacitacion(capacitacion);
            }
            $('#md_educacion_continua').modal('hide');
        };

        self.eliminarEducacionContinua = function (educacionContinua) {
            self.educacionesContinuas.remove(educacionContinua);
        };

        self.editarEducacionContinua = function (educacionContinua) {
            capacitacionEducacionContinua = educacionContinua.nombreCapacitacion();
            $('#tipoCapacitacionEducacionContinua').val(educacionContinua.tipoCapacitacion()).trigger('change');
            $('#nucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nucleoBasicoConocimiento()).trigger('change');
            $('#capacitacionEducacionContinua').val(educacionContinua.nombreCapacitacion()).trigger('change');
            $('#consecutivo').val(educacionContinua.consecutivo());
            bootstrap_alert_educacion_continua.removeWarning();
            $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarCriterioHabilitante = function () {
            var campoHojaVidaCriterio = $('#campoHojaVidaCriterioHabilitante').val();
            var nombreCampoHojaVidaCriterio = $('#campoHojaVidaCriterioHabilitante option:selected').text();
            var valorCriterio = $('#valorCriterioHabilitante').val();

            if (campoHojaVidaCriterio === "") {
                bootstrap_alert_criterio_habilitante.warning('Debe seleccionar el campo de la hoja de vida');
                return false;
            }
            if (valorCriterio === "") {
                bootstrap_alert_criterio_habilitante.warning('Debe ingresar el valor');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                self.criteriosHabilitantes.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.criteriosHabilitantes().length),
                    campoHojaVida: ko.observable(campoHojaVidaCriterio),
                    nombreCampoHojaVida: ko.observable(nombreCampoHojaVidaCriterio),
                    valor: ko.observable(valorCriterio)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.criteriosHabilitantes().length; i++) {
                    if (self.criteriosHabilitantes()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.criteriosHabilitantes()[indice].campoHojaVida(campoHojaVidaCriterio);
                self.criteriosHabilitantes()[indice].nombreCampoHojaVida(nombreCampoHojaVidaCriterio);
                self.criteriosHabilitantes()[indice].valor(valorCriterio);
            }
            $('#md_criterio_habilitante').modal('hide');
        };

        self.eliminarCriterioHabilitante = function (criterio) {
            self.criteriosHabilitantes.remove(criterio);
        };

        self.editarCriterioHabilitante = function (criterio) {
            $('#campoHojaVidaCriterioHabilitante').val(criterio.campoHojaVida()).trigger('change');
            $('#valorCriterioHabilitante').val(criterio.valor()).trigger('change');
            $('#consecutivo').val(criterio.consecutivo());
            bootstrap_alert_criterio_habilitante.removeWarning();
            $('#md_criterio_habilitante').modal({backdrop: 'static', keyboard: false})  ;
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
            fileInput = $('<input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="adendas[' + (self.adendas().length) + '].documento" />');
            $('#documentosAdenda').append(fileInput);
        } else {
            fileInput.show();
        }
        $('#md_adenda').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoAnyosExperiencia() {
        $('#nucleoBasicoConocimientoAnyosExperiencia').val("").trigger('change');
        $('#anyosExperiencia').val("");
        $('#consecutivo').val("");
        bootstrap_alert_anyos_experiencia.removeWarning();
        $('#md_anyos_experiencia').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeMinimoCertificacionIdioma').val("");
        $('#consecutivo').val("");
        bootstrap_alert_idioma.removeWarning();
        $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoPrograma() {
        programaCursado = '';
        $('#programaCursado').val("").trigger('change');
        $('#nivelFormacionPrograma').val("").trigger('change');
        $('#nucleoBasicoConocimientoPrograma').val("").trigger('change');
        $('#consecutivo').val("");
        bootstrap_alert_programa.removeWarning();
        $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevaEducacionContinua() {
        capacitacionEducacionContinua = '';
        $('#tipoCapacitacionEducacionContinua').val("").trigger('change');
        $('#nucleoBasicoConocimientoEducacionContinua').val("").trigger('change');
        $('#capacitacionEducacionContinua').val("").trigger('change');
        $('#consecutivo').val("");
        bootstrap_alert_educacion_continua.removeWarning();
        $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoCriterioHabilitante() {
        $('#campoHojaVidaCriterioHabilitante').val("").trigger('change');
        $('#valorCriterioHabilitante').val("").trigger('change');
        $('#consecutivo').val("");
        bootstrap_alert_criterio_habilitante.removeWarning();
        $('#md_criterio_habilitante').modal({backdrop: 'static', keyboard: false})  ;
    }

    function cerrarVentanaAndenda() {
        if ($('input:file[name="adendas[' + self.adendas().length + '].documento"]')) {
            $('input:file[name="adendas[' + self.adendas().length + '].documento"]').remove();
        }
        $('#md_adenda').modal('hide');
    }

    function cerrarVentanaAnyosExperiencia() {
        $('#md_anyos_experiencia').modal('hide');
    }

    function cerrarVentanaIdioma() {
        $('#md_idioma').modal('hide');
    }

    function cerrarVentanaPrograma() {
        $('#md_programa').modal('hide');
    }

    function cerrarVentanaEducacionContinua() {
        $('#md_educacion_continua').modal('hide');
    }

    function cerrarVentanaCriterioHabilitante() {
        $('#md_criterio_habilitante').modal('hide');
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
    var idiomas = [];
    var programas = [];
    var educacionesContinuas = [];
    var criteriosHabilitantes = [];
    <c:if test = "${adendasJSON != null}">
    adendas = ${adendasJSON};
    for (var i = 0; i < adendas.length; i++) {
        var fileInput = $('<input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="adendas[' + i + '].documento" />');
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
    <c:if test = "${programasJSON != null}">
    programas = ${programasJSON};
    </c:if>
    <c:if test = "${educacionesContinuasJSON != null}">
    educacionesContinuas = ${educacionesContinuasJSON};
    </c:if>
    <c:if test = "${criteriosHabilitantesJSON != null}">
    criteriosHabilitantes = ${criteriosHabilitantesJSON};
    </c:if>
    var convocatoriaModel = new ConvocatoriaModel(adendas, anyosExperiencias, idiomas, programas, educacionesContinuas, criteriosHabilitantes);
    ko.applyBindings(convocatoriaModel);
</script>
