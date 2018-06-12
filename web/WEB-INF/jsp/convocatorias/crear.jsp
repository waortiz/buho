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
            <li class="nav-item" id="btnresultado" data-toggle="tooltip" data-placement="right" title="" data-original-title="Resultados">
                <a class="nav-link" >
                    <i class="fa fa-line-chart" aria-hidden="true" style="font-size:30px;"></i>
                    <span class="nav-link-text">Resultados </span>
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
        <form:form method="POST" modelAttribute="convocatoria">
            <div class="form-group">
                <ul class="nav nav-tabs">
                    <li class="active" id="liconvoca"><a data-toggle="tab" href="#tabconvocatoria" >
                    <i  class="fa fa-address-book"></i>
                    Datos generales</a></li>
                     <li class="active" style="display: none;" id="licrihab"><a data-toggle="tab" href="#tabcruhab" >
                    <i  class="fa fa-address-book-o"></i>
                   Criterios habilitantes</a></li>
                     <li class="active" style="display: none;" id="licrieva"><a data-toggle="tab" href="#tabcrieva" >
                    <i class="fa fa-check-square-o"></i>
                    Criterios evaluaci&oacute;n</a></li>
                    <li class="active" style="display: none;" id="liresul"><a data-toggle="tab" href="#tabresultado" >
                    <i class="fa fa-line-chart" aria-hidden="true"></i>
                    Resultados</a></li>
                    <li class="active" style="display: none;" id="liadendas"><a data-toggle="tab" href="#tabadenda" >
                    <i class="fa fa-pencil-square-o"></i>
                   Adendas</a></li>
                </ul>
            </div>
            <div id="formdatosgen">
                <legend>Convocatoria</legend>
                <div id="alert_placeholder_convocatoria"></div>
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
                                 <button class="btn btn-success btn-xs" type="button" id="btnVerDocumento" onclick="verDocumentoConvocatoria()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" class="btn btn-success" type="button" style="margin-top: 30px;float: right;" value="Guardar" />
            </div>
            <div id="formcrithab" style="display: none;" >
                <legend>Criterios Habilitantes</legend>
                <div class="row">  
                    <div class="col-md-6" >
                        <div class="form-group">
                            <label>Años experiencia</label>
                            <div class="table-responsive">
                                <br />
                                <div id="alert_anyos_minima_experiencia"></div>
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
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevoAnyosExperiencia" onclick="nuevoAnyosExperiencia()" ><span class="glyphicon glyphicon-plus"></span></button>
                        <div class="table-responsive">
                            <br />
                            <div id="alert_anyos_experiencias"></div>
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
                                            <div class="form-group form-inline">
                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcleo básico de conocimiento">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <input type="text" name="nombreNucleoBasicoConocimientoAnyosExperiencia" id="nombreNucleoBasicoConocimientoAnyosExperiencia" class="form-control" style="width: 80%;" readonly>
                                                    <input type="hidden" name="nucleoBasicoConocimientoAnyosExperiencia" id="nucleoBasicoConocimientoAnyosExperiencia" />
                                                    <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoAnyosExperiencia','nombreNucleoBasicoConocimientoAnyosExperiencia')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
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
                </div>
                <div class="row">  
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar idioma requerido</label> 
                            <button  type="button" class="btn btn-success btn-sm" id="btnNuevoIdioma" onclick="nuevoIdioma()"><span class="glyphicon glyphicon-plus"></span></button><br>
                             <div class="table-responsive">
                                <br />
                                <div id="alert_idiomas"></div>
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
                                            </td>
                                        </tr>
                                    </tbody>    
                                </table>
                             </div>
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
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" id="btnNuevoPrograma" onclick="nuevoPrograma()"><span class="glyphicon glyphicon-plus"></span></button><br>
                             <div class="table-responsive">
                                <br />
                                <div id="alert_programas"></div>
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
                                        <div class="col-md-4">
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
                                        <div class="col-md-8">
                                            <div class="form-group form-inline">
                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <input type="text" name="nombreNucleoBasicoConocimientoPrograma" id="nombreNucleoBasicoConocimientoPrograma" class="form-control" style="width: 80%;" readonly>
                                                    <input type="hidden" name="nucleoBasicoConocimientoPrograma" id="nucleoBasicoConocimientoPrograma" />
                                                    <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoPrograma','nombreNucleoBasicoConocimientoPrograma')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
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
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n complementaria requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" id="btnNuevaEducacionContinua" onclick="nuevaEducacionContinua()"><span class="glyphicon glyphicon-plus"></span></button><br>
                             <div class="table-responsive">
                                <br />
                                <div id="alert_educaciones_continuas"></div>
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
                                            </td>
                                        </tr>
                                    </tbody>    
                                </table>
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
                                    <div class="col-md-4">
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
                                    <div class="col-md-8">
                                        <div class="form-group form-inline">
                                            <label for="nucleoBasicoConocimientoEducacionContinua">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                <input type="text" name="nombreNucleoBasicoConocimientoEducacionContinua" id="nombreNucleoBasicoConocimientoEducacionContinua" class="form-control" style="width: 80%;" readonly>
                                                <input type="hidden" name="nucleoBasicoConocimientoEducacionContinua" id="nucleoBasicoConocimientoEducacionContinua" />
                                                <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoEducacionContinua','nombreNucleoBasicoConocimientoEducacionContinua')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
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
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Agregar nuevo criterio</label>
                            <button style="margin-left: 10px;" type="button" id="btnNuevoCriterioHabilitante" class="btn btn-success btn-sm" onclick="nuevoCriterioHabilitante()" ><span class="glyphicon glyphicon-plus"></span></button>
                            <div class="table-responsive">
                                <br />
                                <div id="alert_criterios_habilitantes"></div>
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
                                                <span data-bind="text: texto" ></span>
                                            </td>
                                            <td style='white-space: nowrap; width: 10%' align="center">
                                                <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCriterioHabilitante"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                                <button class='btn btn-danger btn-xs' type='button' style='margin-left:10px;' data-bind="click: $root.eliminarCriterioHabilitante"><span class='glyphicon glyphicon-remove'></span></button>
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
                                            <select style="width: 100%;" id="campoHojaVidaCriterioHabilitante" id="campoHojaVidaCriterioHabilitante" class="js-select-basic-single js-states form-control" onchange="mostrarCampo(this.value)">
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
                                                <div class="form-group form-inline" id="divFecha">
                                                    <input class="form-control fecha" id="fecha" maxlength="10"/>
                                                </div>
                                                <div id="divTexto">
                                                    <input type="text" class="form-control" id="texto" maxlength="100"/>
                                                </div> 
                                                <div id="divLugar" class="form-group form-inline">
                                                    <input id="nombreLugar" name="nombreLugar" class="form-control" style="width: 90%" readonly />
                                                    <input type="hidden" id="lugar" name="lugar">
                                                    <button id="btnLugar" type="button" class="btn btn-success btn-sm" onclick="mostrarUbicacionModal('nombreLugar', 'lugar');">
                                                        <span class="glyphicon glyphicon-search"></span>
                                                    </button>
                                                </div>
                                                <div id="divSelect">
                                                    <div id="divTipoIdentificacion">
                                                        <select id="tipoIdentificacion" class="js-select-basic-single js-states form-control" style="width: 100%" >
                                                            <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getId()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="divNacionalidad">
                                                        <select id="nacionalidad" class="js-select-basic-single js-states form-control" style="width: 100%">
                                                            <option value=""></option>
                                                            <c:forEach var="pais" items="${paises}">
                                                                <option value="${pais.getId()}">${pais.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="divGrupoEtnico">
                                                        <select id="grupoEtnico" class="js-select-basic-single js-states form-control" style="width: 100%">
                                                            <option value=""></option>
                                                            <c:forEach var="grupoEtnico" items="${gruposEtnicos}">
                                                                <option value="${grupoEtnico.getId()}">${grupoEtnico.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="divDiscapacidad">
                                                        <select id="discapacidad" class="js-select-basic-single js-states form-control" style="width: 100%">
                                                            <option value=""></option>
                                                            <c:forEach var="discapacidad" items="${discapacidades}">
                                                                <option value="${discapacidad.getId()}">${discapacidad.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="divActividadEconomica">
                                                        <select id="actividadEconomica" class="js-select-basic-single js-states form-control" style="width: 100%"> 
                                                            <option value=""></option>
                                                            <c:forEach var="actividadEconomica" items="${actividadesEconomicas}">
                                                                <option value="${actividadEconomica.getId()}">${actividadEconomica.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="divTipoVinculacion">
                                                        <select id="tipoVinculacion" class="js-select-basic-single js-states form-control" style="width: 100%">
                                                            <option value=""></option>
                                                            <c:forEach var="tipoVinculacion" items="${tiposVinculacion}">
                                                                <option value="${tipoVinculacion.getId()}">${tipoVinculacion.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div id="divSexo">
                                                    <div id="radioSexo" class="btn-group" style="margin-left: 40px;">
                                                      <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="1" id="btnSexoSi">M</a>
                                                      <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="2" id="btnSexoNo">F</a>
                                                      <input type="hidden" id="sexo" name="sexo">
                                                    </div>
                                                </div>
                                                <div id="divRadio">
                                                    <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                      <a class="btn btn-primary btn-sm notActive" data-toggle="radio" data-title="true" id="btnRadioSi">Sí</a>
                                                      <a class="btn btn-primary btn-sm notActive" data-toggle="radio" data-title="false" id="btnRadioNo">No</a>
                                                      <input type="hidden" id="radio" name="radio">
                                                    </div>
                                                </div>
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
            </div>
            <div id="formadendas" style="display: none;">
                <div class="row">
                    <div class="col-md-12"> 
                        <legend>Adendas</legend>
                        <label>Agregar adendas</label> 
                        <button style="margin-bottom: 20px;"  type="button" id="btnNuevaAdenda" class="btn btn-success" onclick="nuevaAdenda()"><span class="glyphicon glyphicon-plus"></span></button>     
                        <div class="table-responsive">
                            <br />
                            <div id="alert_adendas"></div>
                            <table class="table tabla table-hover tableestilo" id="tbadendas"> 
                                <thead>
                                    <tr>    
                                        <th style="width: 20%">Tipo</th>
                                        <th style="width: 50%">Descripci&oacute;n</th>
                                        <th style="width: 10%">Fecha</th>
                                        <th style="width: 10%">Documento</th>
                                        <th style="width: 10%">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: adendas }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreTipoAdenda" ></span>
                                        </td>
                                        <td style="width: 50%">
                                            <span data-bind="text: descripcion" ></span>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: fecha" ></span>
                                        </td>
                                        <td style="width: 10%">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoAdenda" style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 10%" style='white-space: nowrap'>
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarAdenda"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarAdenda"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                         
                            </table>
                        </div>
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
                                        <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="documentoAdenda" id="documentoAdenda" >
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
            <div id="formresultado" style="display: none;">
                <div id="alert_resultado"></div>
                <div class="row">
                    <div class="col-md-12">
                        <legend>Resultados</legend>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Archivo de soporte de los resultados</label>
                                <div class="form-inline">
                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="resultado" id="resultado" >
                                <button class="btn btn-success btn-xs" type="button" id="btnVerResultado" onclick="verDocumentoResultado()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="modal" tabindex="1" id="ubicacionModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header mhsuccess">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Buscar ciudad</h4>
                        </div>                                
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="dep">Pa&iacute;s</label><a href="#" data-toggle="tooltip" data-placement="right" title = "debe seleccionar su país" style="margin-left: 5px;"><i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <select style="width: 100%" name="pais" id="pais" class="js-select-basic-single js-states form-control" onchange="buscarDepartamentos(this.value)">
                                    <option value=""></option>
                                    <c:forEach var="pais" items="${paises}">
                                        <option value="${pais.getId()}">${pais.getNombre()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group" id="divDepartamento">
                                <label for="departamento">Departamento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su departamento " style="margin-left: 5px;"><i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <select style="width: 100%" name="departamento" id="departamento" class="js-select-basic-single js-states form-control" onchange="buscarCiudades(this.value)"></select>
                            </div>
                            <div class="form-group">
                                <label for="ciudad">Ciudad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su ciudad " style="margin-left: 5px;"><i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <select style="width: 100%" id="ciudad" name="ciudad" class="js-select-basic-single js-states form-control"></select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" onclick="seleccionarUbicacion()">Aceptar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="md_nucleo_basico_conocimiento" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header mhsuccess">
                            <button class="close" data-dismiss="modal">&times;</button>
                            <h4><i class="fa fa-book" aria-hidden="true"></i>
                            Seleccione un núcleo</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Seleccione un N&uacute;cleo b&aacute;sico del conocimiento</label>
                                        <select size="10" class="form-control" id="nucleoBasicoConocimiento" name="nucleoBasicoConocimiento">
                                            <c:forEach var="nucleoBasicoConocimiento" items="${nucleosBasicosConocimiento}">
                                            <option value="${nucleoBasicoConocimiento.getId()}">${nucleoBasicoConocimiento.getNombre()}</option>
                                            </c:forEach>                                                 
                                        </select>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" onclick="seleccionarNucleoBasicoConocimiento();">Agregar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
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
        <div id="md_guardado_exitoso" class="modal fade" role="dialog" disabled>
           <div class="modal-dialog">
               <div class="modal-content">
                    <div class="modal-header mhsuccess">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4><i class="fa fa-book" aria-hidden="true"></i>
                        Convocatoria</h4>
                    </div>
                   <div class="modal-body">
                       <span id="mensaje"></span>
                   </div>
                   <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                   </div>
               </div>
           </div>
       </div>             
    </div>
</div>
<!-- jQuery -->
<script>
    var contextPath = "${pageContext.request.contextPath}";
    var adendas = [];
    var anyosExperiencias = [];
    var idiomas = [];
    var programas = [];
    var educacionesContinuas = [];
    var criteriosHabilitantes = [];
    <c:if test = "${adendasJSON != null}">
    adendas = ${adendasJSON};
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
</script>
<script type="text/javascript" src='<c:url value="/resources/js/convocatoria.js" />'></script> 