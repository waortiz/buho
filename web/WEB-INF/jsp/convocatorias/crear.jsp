<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<div id="contenido">
    <div class="container">
        <ul class="list-inline">
            <li><button id="btndatosgen" class="btn btn-success">Datos generales</button></li>
            <li><button id="btncrithab" class="btn btn-success">Criterios habilitantes</button></li>
            <li><button id="btncriteva" class="btn btn-success">Criterios evaluaci&oacute;n</button></li>
            <li><button id="btnadendas" class="btn btn-success">Adendas</button></li>
        </ul>
        <div id="alert_placeholder_convocatoria"></div>
        <form:form method="POST" modelAttribute="convocatoria">
            <div id="formdatosgen">
                <legend><h3>Convocatoria</h3></legend>
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="tipoConvocatoria">Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                <form:select style="width: 100%;" path="tipoConvocatoria" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de convocatoria">
                                    <form:option value=""></form:option>
                                    <form:options items="${tiposConvocatoria}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-2">
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
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="fechaFin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaci&oacute;n" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de finalización">
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
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="area">&Aacute;rea</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el &aacute;rea de convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                <form:select style="width: 100%;" path="area" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${areasConvocatoria}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-8">
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
                                    <button type="button"  class="btn btn-success" id="addcurso">Agregar</button>
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
            <div id="formcrithab" style="display: none;">
                <div class="row">   
                    <legend>Criterios Habilitantes</legend>
                    <div class="col-md-5"  style="margin-top: -15px;">
                        <div class="form-group">
                            <label>Agregar criterio habilitante</label>
                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_crithab" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                        <div class="modal fade" role="dialog" id="md_crithab">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header mhsuccess">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4>Criterio habilitante</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>Nombre de criterio habilitante</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                <input type="text" name="txtcrithab" id="txtcrithab" class="form-control">
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
                        <div class="form-group">
                            <select name="criteriosHabilitantesPorAsignar" id="criteriosHabilitantesPorAsignar" class="form-control" multiple>
                                <c:forEach var="criterioHabilitante" items="${criteriosHabilitantes}">
                                    <option value="${criterioHabilitante.getId()}">${criterioHabilitante.getNombre()}</option>
                                </c:forEach>                            
                            </select>                            
                        </div>
                    </div>
                    <div class="col-md-2" style="margin-top: 35px;">
                        <center><button class="btn btn-success btn-xs" type="button" id="asignarCriterioHabilitante" ><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center><br>
                    </div>
                    <div class="col-md-5" style="margin-top: 15px;">
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo2" id="tbcrihab">
                                    <thead>
                                        <tr>
                                            <th>Criterio</th>
                                            <th>Valor</th>
                                            <th>Opcion</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: criteriosHabilitantes }">
                                        <tr class="table-row">
                                            <td style="width: 60%">
                                                <span data-bind="text: nombre" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].nombre'  }">
                                            </td>
                                            <td style="width: 30%" align="center">
                                                <input type="text" class="form-control input-sm numbersOnly" style="width:100px;" data-bind="value: nombre, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].valor'  }">
                                            </td>
                                            <td style="width: 10%" align="center">
                                                <input type="hidden" data-bind="value: id, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].id'  }" />
                                                <button class='btn btn-danger btn-xs' type='button' data-bind="click: $root.eliminarCriterioHabilitante"><span class='glyphicon glyphicon-remove'></span></button>
                                            </td>
                                        </tr>
                                    </tbody>      
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_form"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbform">
                                <thead>
                                <th>Programa</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Agregar formaci&oacute;n complementaria requerida</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formcomreq"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbformcomreq">
                                <thead>
                                <th>Nombre de la capacitación o certificaci&oacute;n</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Agregar idioma requerido</label> 
                            <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formidiom"><span class="glyphicon glyphicon-plus"></span></button><br>
                            <table class="table table-hover tableestilo2" id="tbformidiom">
                                <thead>
                                <th>Idioma</th>
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
                                                <option value="T&eacute;cnico">T&eacute;cnico</option>
                                                <option value="Tecnol&oacute;go">Tecnol&oacute;go</option>
                                                <option value="Profesional">Profesional</option>
                                                <option value="Especialista">Especialista</option>
                                                <option value="Maestria">Maestr&iacute;a</option>
                                                <option value="Doctorado">Doctorado</option>
                                                <option value="Posdoctorado">Posdoctorado</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="freq_nucleo" id="freq_nucleo" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value='Administracion'>Administracion</option>
                                                <option value='Agronomia'>Agronomia</option>
                                                <option value='Antropologia, Artes Liberales'>Antropologia, Artes Liberales</option>
                                                <option value='Arquitectura'>Arquitectura</option>
                                                <option value='Artes Representativas'>Artes Representativas</option>
                                                <option value='Ates Plasticas, Visuales Y Afines'>Artes Plasticas, Visuales Y Afines</option>
                                                <option value='Bacteriologia'>Bacteriologia</option>
                                                <option value='Bibliotecologia, Otros De Ciencias Sociales Y'>Bibliotecologia, Otros De Ciencias Sociales Y</option>
                                                <option value='Biologia, Microbiologia Y Afines'>Biologia, Microbiologia Y Afines</option>
                                                <option value='Ciencia Politica, Relaciones Internacionales'>Ciencia Politica, Relaciones Internacionales</option>
                                                <option value='Comunicación Social, Periodismo Y Afines'>Comunicación Social, Periodismo Y Afines</option>
                                                <option value='Contaduria Publica'>Contaduria Publica</option>
                                                <option value='Deportes, Educacion Fisica Y Recreacion'>Deportes, Educacion Fisica Y Recreacion</option>
                                                <option value='Derecho Y Afines'>Derecho Y Afines</option>
                                                <option value='Disenio'>Disenio</option>
                                                <option value='Economia'>Economia</option>
                                                <option value='Educacion'>Educacion</option>
                                                <option value='Enfermeria'>Enfermeria</option>
                                                <option value='Filosofia, Teologia Y Afines'>Filosofia, Teologia Y Afines</option>
                                                <option value='Fisica'>Fisica</option>
                                                <option value='Formacion Relacionada Con El Campo Militar O '>Formacion Relacionada Con El Campo Militar O </option>
                                                <option value='Geografia, Historia'>Geografia, Historia</option>
                                                <option value='Geologia, Otros Programas De Ciencias Natural'>Geologia, Otros Programas De Ciencias Natural</option>
                                                <option value='Ingenieria Admnistrativa Y Afines'>Ingenieria Admnistrativa Y Afines</option>
                                                <option value='Ingenieria Agricola, Forestal Y Afines'>Ingenieria Agricola, Forestal Y Afines</option>
                                                <option value='Ingenieria Agroindustrial, Alimentos Y Afines'>Ingenieria Agroindustrial, Alimentos Y Afines</option>
                                                <option value='Ingenieria Agronomica, Pecuaria Y Afines'>Ingenieria Agronomica, Pecuaria Y Afines</option>
                                                <option value='Ingenieria Ambiental, Sanitaria Y Afines'>Ingenieria Ambiental, Sanitaria Y Afines</option>
                                                <option value='Ingenieria Biomedica Y Afines'>Ingenieria Biomedica Y Afines</option>
                                                <option value='Ingenieria Civil Y Afines'>Ingenieria Civil Y Afines</option>
                                                <option value='Ingenieria De Minas, Metalurgia Y Afines'>Ingenieria De Minas, Metalurgia Y Afines</option>
                                                <option value='Ingenieria De Sistemas, Telematica Y Afines'>Ingenieria De Sistemas, Telematica Y Afines</option>
                                                <option value='Ingenieria Electrica Y Afines'>Ingenieria Electrica Y Afines</option>
                                                <option value='Ingenieria Electronica, Telecomunicaciones Y '>Ingenieria Electronica, Telecomunicaciones Y </option>
                                                <option value='Ingenieria Industrial Y Afines'>Ingenieria Industrial Y Afines</option>
                                                <option value='Ingenieria Mecanica Y Afines'>Ingenieria Mecanica Y Afines</option>
                                                <option value='Ingenieria Quimica Y Afines'>Ingenieria Quimica Y Afines</option>
                                                <option value='Instrumentacion Quirurgica'>Instrumentacion Quirurgica</option>
                                                <option value='Lenguas Modernas, Literatura, Linguistica Y A'>Lenguas Modernas, Literatura, Linguistica Y A</option>
                                                <option value='Matematicas, Estadistica Y Afines'>Matematicas, Estadistica Y Afines</option>
                                                <option value='Medicina'>Medicina</option>
                                                <option value='Medicina Veterinaria'>Medicina Veterinaria</option>
                                                <option value='Musica'>Musica</option>
                                                <option value='Nutricion Y Dietetica'>Nutricion Y Dietetica</option>
                                                <option value='Odontologia'>Odontologia</option>
                                                <option value='Optometria, Otros Programas De Ciencias De La'>Optometria, Otros Programas De Ciencias De La</option>
                                                <option value='Otras Ingenierias'>Otras Ingenierias</option>
                                                <option value='Otros Programas Asociados A Bellas Artes'>Otros Programas Asociados A Bellas Artes</option>
                                                <option value='Psicologia'>Psicologia</option>
                                                <option value='Publicidad Y Afines'>Publicidad Y Afines</option>
                                                <option value='Quimica Y Afines'>Quimica Y Afines</option>
                                                <option value='Salud Publica'>Salud Publica</option>
                                                <option value='Sin Clasificar'>Sin Clasificar</option>
                                                <option value='Sociologia, Trabajo Social Y Afines'>Sociologia, Trabajo Social Y Afines</option>
                                                <option value='Terapias'>Terapias</option>
                                                <option value='Zootecnia'>Zootecnia</option>
                                                <option value='Sin registro'>Sin registro</option>
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
                                                <option value="Diplomado">Diplomado</option>
                                                <option value="Curso">Curso</option>
                                                <option value="Seminario">Seminario</option>
                                                <option value="Congresos">Congresos</option>
                                                <option value="Foros">Foros</option>
                                                <option value="Simposios">Simposios</option>
                                                <option value="Jornadas">Jornadas</option>
                                                <option value="Encuentros">Encuentros</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="conformreq_nbc" id="conformreq_nbc" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value='Administracion'>Administracion</option>
                                                <option value='Agronomia'>Agronomia</option>
                                                <option value='Antropologia, Artes Liberales'>Antropologia, Artes Liberales</option>
                                                <option value='Arquitectura'>Arquitectura</option>
                                                <option value='Artes Representativas'>Artes Representativas</option>
                                                <option value='Ates Plasticas, Visuales Y Afines'>Artes Plasticas, Visuales Y Afines</option>
                                                <option value='Bacteriologia'>Bacteriologia</option>
                                                <option value='Bibliotecologia, Otros De Ciencias Sociales Y'>Bibliotecologia, Otros De Ciencias Sociales Y</option>
                                                <option value='Biologia, Microbiologia Y Afines'>Biologia, Microbiologia Y Afines</option>
                                                <option value='Ciencia Politica, Relaciones Internacionales'>Ciencia Politica, Relaciones Internacionales</option>
                                                <option value='Comunicación Social, Periodismo Y Afines'>Comunicación Social, Periodismo Y Afines</option>
                                                <option value='Contaduria Publica'>Contaduria Publica</option>
                                                <option value='Deportes, Educacion Fisica Y Recreacion'>Deportes, Educacion Fisica Y Recreacion</option>
                                                <option value='Derecho Y Afines'>Derecho Y Afines</option>
                                                <option value='Disenio'>Disenio</option>
                                                <option value='Economia'>Economia</option>
                                                <option value='Educacion'>Educacion</option>
                                                <option value='Enfermeria'>Enfermeria</option>
                                                <option value='Filosofia, Teologia Y Afines'>Filosofia, Teologia Y Afines</option>
                                                <option value='Fisica'>Fisica</option>
                                                <option value='Formacion Relacionada Con El Campo Militar O '>Formacion Relacionada Con El Campo Militar O </option>
                                                <option value='Geografia, Historia'>Geografia, Historia</option>
                                                <option value='Geologia, Otros Programas De Ciencias Natural'>Geologia, Otros Programas De Ciencias Natural</option>
                                                <option value='Ingenieria Admnistrativa Y Afines'>Ingenieria Admnistrativa Y Afines</option>
                                                <option value='Ingenieria Agricola, Forestal Y Afines'>Ingenieria Agricola, Forestal Y Afines</option>
                                                <option value='Ingenieria Agroindustrial, Alimentos Y Afines'>Ingenieria Agroindustrial, Alimentos Y Afines</option>
                                                <option value='Ingenieria Agronomica, Pecuaria Y Afines'>Ingenieria Agronomica, Pecuaria Y Afines</option>
                                                <option value='Ingenieria Ambiental, Sanitaria Y Afines'>Ingenieria Ambiental, Sanitaria Y Afines</option>
                                                <option value='Ingenieria Biomedica Y Afines'>Ingenieria Biomedica Y Afines</option>
                                                <option value='Ingenieria Civil Y Afines'>Ingenieria Civil Y Afines</option>
                                                <option value='Ingenieria De Minas, Metalurgia Y Afines'>Ingenieria De Minas, Metalurgia Y Afines</option>
                                                <option value='Ingenieria De Sistemas, Telematica Y Afines'>Ingenieria De Sistemas, Telematica Y Afines</option>
                                                <option value='Ingenieria Electrica Y Afines'>Ingenieria Electrica Y Afines</option>
                                                <option value='Ingenieria Electronica, Telecomunicaciones Y '>Ingenieria Electronica, Telecomunicaciones Y </option>
                                                <option value='Ingenieria Industrial Y Afines'>Ingenieria Industrial Y Afines</option>
                                                <option value='Ingenieria Mecanica Y Afines'>Ingenieria Mecanica Y Afines</option>
                                                <option value='Ingenieria Quimica Y Afines'>Ingenieria Quimica Y Afines</option>
                                                <option value='Instrumentacion Quirurgica'>Instrumentacion Quirurgica</option>
                                                <option value='Lenguas Modernas, Literatura, Linguistica Y A'>Lenguas Modernas, Literatura, Linguistica Y A</option>
                                                <option value='Matematicas, Estadistica Y Afines'>Matematicas, Estadistica Y Afines</option>
                                                <option value='Medicina'>Medicina</option>
                                                <option value='Medicina Veterinaria'>Medicina Veterinaria</option>
                                                <option value='Musica'>Musica</option>
                                                <option value='Nutricion Y Dietetica'>Nutricion Y Dietetica</option>
                                                <option value='Odontologia'>Odontologia</option>
                                                <option value='Optometria, Otros Programas De Ciencias De La'>Optometria, Otros Programas De Ciencias De La</option>
                                                <option value='Otras Ingenierias'>Otras Ingenierias</option>
                                                <option value='Otros Programas Asociados A Bellas Artes'>Otros Programas Asociados A Bellas Artes</option>
                                                <option value='Psicologia'>Psicologia</option>
                                                <option value='Publicidad Y Afines'>Publicidad Y Afines</option>
                                                <option value='Quimica Y Afines'>Quimica Y Afines</option>
                                                <option value='Salud Publica'>Salud Publica</option>
                                                <option value='Sin Clasificar'>Sin Clasificar</option>
                                                <option value='Sociologia, Trabajo Social Y Afines'>Sociologia, Trabajo Social Y Afines</option>
                                                <option value='Terapias'>Terapias</option>
                                                <option value='Zootecnia'>Zootecnia</option>
                                                <option value='Sin registro'>Sin registro</option>
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
                <div class="modal fade" role="dialog" id="md_formidiom">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Idioma requerido</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id_idioma">Idioma</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <select style="width: 100%;" name="con_idioma" id="con_idioma" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="Ingles">Ingl&eacute;s</option>
                                                <option value="Portugues">Portugu&eacute;s</option>
                                                <option value="Mandarin">Mandar&iacute;n</option>
                                                <option value="Franc&eacute;s">Franc&eacute;s</option>
                                                <option value="Italiano">Italiano</option>
                                            </select>
                                        </div>
                                    </div>  
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Tipo de certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                            <select style="width: 100%;" name="con_tipo_cert" id="con_tipo_cert" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="TOEFL">TOEFL</option>
                                                <option value="IELTS">IELTS</option>
                                                <option value="Cambridge English Key">Cambridge English Key</option>
                                                <option value="Cambridge English Preliminary">Cambridge English Preliminary</option>
                                                <option value="Cambridge English Advanced">Cambridge English Advanced</option>
                                                <option value="Cambridge English Proficiency">Cambridge English Proficiency</option>
                                                <option value="Aptis">Aptis</option>
                                                <option value="Otro">Otro</option>
                                            </select>
                                        </div>  
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-6" id="formotro" style="display: none;">
                                        <div class="form-group">
                                            <label for="">Cual?</label>
                                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cuando eliga el tipo otro cual?">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <input type="text" name="txtotro" id="txtotro" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Puntaje minimo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje minimo de estudio idioma">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <input type="text" name="txtpuntaje" id="txtpuntaje" class="form-control" style="width: 70px;">
                                        </div>
                                    </div> 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addconidiom">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="md_estidioma">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4>Estudios idioma</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Tipo de certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                            <select style="width: 100%;" name="con_tipo_cert" id="con_tipo_cert" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="TOEFL">TOEFL</option>
                                                <option value="IELTS">IELTS</option>
                                                <option value="Cambridge English Key">Cambridge English Key</option>
                                                <option value="Cambridge English Preliminary">Cambridge English Preliminary</option>
                                                <option value="Cambridge English Advanced">Cambridge English Advanced</option>
                                                <option value="Cambridge English Proficiency">Cambridge English Proficiency</option>
                                                <option value="Aptis">Aptis</option>
                                                <option value="Otro">Otro</option>
                                            </select>
                                        </div>  
                                    </div>
                                </div>
                                <div class="row" id="formotro" style="display: none;">
                                    <div class="col-md-12" >
                                        <div class="form-group">
                                            <label for="">Cual?</label>
                                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cuando eliga el tipo otro cual?">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <input type="text" name="txtotro" id="txtotro" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Puntaje</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje de estudio idioma">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <input type="text" name="txtpuntaje" id="txtpuntaje" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-success" id="addestidiom">Agregar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="formcriteva" style="display: none;">
                <div class="row">   
                    <div class="col-md-12">
                        <legend>Criterios evaluaci&oacute;n</legend>
                        <div class="col-md-5"  style="margin-top: -15px;">
                            <div class="form-group">
                                <label>Agregar criterio evaluaci&oacute;n</label>
                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_crieva" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                            </div>
                            <div class="form-group">
                                <label>Agregar subcriterio evaluaci&oacute;n</label>
                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_subcrieva" data-toggle="modal" id="click2"><span class="glyphicon glyphicon-plus"></span></button>
                            </div>
                            <div class="modal fade" role="dialog" id="md_crieva">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header mhsuccess">
                                            <button class="close" data-dismiss="modal">&times;</button>
                                            <h4>Criterio evaluaci&oacute;n</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label>Nombre de criterio evaluaci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                    <input type="text"  id="txtcrieva" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button"  class="btn btn-success" id="addcrieva">Agregar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" role="dialog" id="md_subcrieva">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header mhsuccess">
                                            <button class="close" data-dismiss="modal">&times;</button>
                                            <h4>Subcriterio evaluaci&oacute;n</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Criterio evaluaci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                    <select style="width: 100%;" id="sel_criterio" class="form-control">
                                                    </select>

                                                </div>
                                                <div class="col-md-6">
                                                    <label>Subcriterio evaluaci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de criterio habilitante">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                    <input type="text" id="txtsubcriteva" class="form-control">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button"  class="btn btn-success" id="subaddcrieva">Agregar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <select name=criteriosEvaluacionPorAsignar" id="criteriosEvaluacionPorAsignar" class="form-control" multiple>
                                    <c:forEach var="criterioEvaluacion" items="${criteriosEvaluacion}">
                                        <option value="${criterioEvaluacion.getId()}">${criterioEvaluacion.getNombre()}</option>
                                    </c:forEach>   
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <center><button class="btn btn-success btn-xs" type="button" id="asignarCriterioEvaluacion" style="margin-top: 80px;"><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center><br>
                        </div>
                        <div class="col-md-5" style="margin-top: 65px;">
                            <div class="form-group">
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo2" id="tbcrieva">
                                        <thead>
                                            <tr>
                                                <th>Criterio</th>
                                                <th>Subcriterio</th>
                                                <th>Peso</th>
                                                <th>Opcion</th>
                                            </tr>
                                        </thead>
                                        <tbody data-bind="foreach: { data: criteriosEvaluacion }">
                                            <tr class="table-row">
                                                <td style="width: 60%">
                                                    <span data-bind="text: nombre" ></span>
                                                    <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'criteriosEvaluacion[' + $index() + '].nombre'  }">
                                                </td>
                                                <td style="width: 60%">
                                                    <span data-bind="text: nombreSubcriterio" ></span>
                                                    <input type="hidden" data-bind="value: id, attr: { 'name': 'criteriosEvaluacion[' + $index() + '].idSubcriterio'  }" />
                                                    <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'criteriosEvaluacion[' + $index() + '].nombreSubcriterio'  }">
                                                </td>
                                                <td style="width: 30%" align="center">
                                                    <input type="hidden" data-bind="value: id, attr: { 'name': 'criteriosEvaluacion[' + $index() + '].id'  }" />
                                                    <input type="text" class="form-control input-sm numbersOnly" style="width:100px;" data-bind="value: peso, attr: { 'name': 'criteriosEvaluacion[' + $index() + '].peso'  }">
                                                </td>
                                                <td style="width: 10%" align="center">
                                                    <button class='btn btn-danger btn-xs' type='button' data-bind="click: $root.eliminarCriterioEvaluacion"><span class='glyphicon glyphicon-remove'></span></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                        
            <div id="formcrithab" style="display: none;">
                <div class="row">   
                    <div class="col-md-12">
                        <center><legend>Criterios Habilitantes</legend></center>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Agregar formaci&oacute;n</label> 
                                    <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formacion"><span class="glyphicon glyphicon-plus"></span></button><br>
                                    <table class="table table-hover tableestilo2" id="tbform">
                                        <thead>
                                        <th>Programa</th>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Agregar formaci&oacute;n complementaria requerida</label> 
                                    <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_formcomreq"><span class="glyphicon glyphicon-plus"></span></button><br>
                                    <table class="table table-hover tableestilo2" id="tbformcomreq">
                                        <thead>
                                        <th>Nombre de la capacitación o certificaci&oacute;n</th>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Agregar idioma requerido</label> 
                                    <button  type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_estidioma"><span class="glyphicon glyphicon-plus"></span></button><br>
                                    <table class="table table-hover tableestilo2" id="tbformidiom">
                                        <thead>
                                        <th>Idioma</th>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>                    
                        <div class="modal fade" role="dialog" id="md_formacion">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header mhsuccess">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4>Formaci&oacute;n</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="con_descripcion">Nivel de formaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe describir el perfil requerido con el cargo y la experiencia requerida">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                    <select name="conv_nivel_form" id="conv_nivel_form" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                                        <option value=""></option>
                                                        <option value="T&eacute;cnico">T&eacute;cnico</option>
                                                        <option value="Tecnol&oacute;go">Tecnol&oacute;go</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <select style="width: 100%;" name="conv_nucleo" id="conv_nucleo" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <option value='Administracion'>Administracion</option>
                                                        <option value='Agronomia'>Agronomia</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="est_programa_cursado">Programa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <select style="width: 100%;" name="conv_programa_cursado" id="conv_programa_cursado" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <option value="Matem&aacute;ticas puras">Matem&aacute;ticas puras</option>
                                                        <option value="Ingenieria de sistemas">Ingenieria de sistemas</option>
                                                    </select>
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
                            <div class="modal-dialog">
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
                                                        <option value="Diplomado">Diplomado</option>
                                                        <option value="Curso">Curso</option>
                                                        <option value="Seminario">Seminario</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <select style="width: 100%;" name="conformreq_nbc" id="conformreq_nbc" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <option value='Administracion'>Administracion</option>
                                                        <option value='Agronomia'>Agronomia</option>
                                                        <option value='Antropologia, Artes Liberales'>Antropologia, Artes Liberales</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-9">
                                                <div class="form-group">
                                                    <label for="est_programa_cursado">Nombre de la capacitaci&oacute;n o certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                    <input type="text" name="con_capaci_certi" id="con_capaci_certi" class="form-control">
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
                        <div class="modal fade" role="dialog" id="md_estidioma">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header mhsuccess">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4>Estudios idioma</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="">Tipo de certificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                                    <select style="width: 100%;" name="con_tipo_cert" id="con_tipo_cert" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <option value="TOEFL">TOEFL</option>
                                                        <option value="IELTS">IELTS</option>
                                                        <option value="Cambridge English Key">Cambridge English Key</option>
                                                        <option value="Cambridge English Preliminary">Cambridge English Preliminary</option>
                                                        <option value="Cambridge English Advanced">Cambridge English Advanced</option>
                                                        <option value="Cambridge English Proficiency">Cambridge English Proficiency</option>
                                                        <option value="Aptis">Aptis</option>
                                                        <option value="Otro">Otro</option>
                                                    </select>
                                                </div>  
                                            </div>

                                        </div>
                                        <div class="row" id="formotro" style="display: none;">
                                            <div class="col-md-12" >
                                                <div class="form-group">
                                                    <label for="">Cual?</label>
                                                    <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cuando eliga el tipo otro cual?">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                    <input type="text" name="txtotro" id="txtotro" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="">Puntaje</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje de estudio idioma">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                    <input type="text" name="txtpuntaje" id="txtpuntaje" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button"  class="btn btn-success" id="addestidiom">Agregar</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5"  style="margin-top: -15px;">
                            <div class="form-group">
                                <select name="criteriosHabilitantesPorAsignar" id="criteriosHabilitantesPorAsignar" class="form-control" multiple>
                                    <c:forEach var="criterioHabilitante" items="${criteriosHabilitantes}">
                                        <option value="${criterioHabilitante.getId()}">${criterioHabilitante.getNombre()}</option>
                                    </c:forEach>                            
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <center><button class="btn btn-success btn-xs" type="button" id="asignarCriterioHabilitante" style="margin-top: 20px;"><i class="fa fa-arrow-right" aria-hidden="true"></i></button></center>
                        </div>
                        <div class="col-md-5" style="margin-top: -25px;">
                            <div class="form-group">
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo2">
                                        <thead>
                                            <tr>
                                                <th>Criterio</th>
                                                <th>Valor</th>
                                                <th>Opcion</th>
                                            </tr>
                                        </thead>
                                        <tbody data-bind="foreach: { data: criteriosHabilitantes }">
                                            <tr class="table-row">
                                                <td style="width: 60%">
                                                    <span data-bind="text: nombre" ></span>
                                                    <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].nombre'  }">
                                                </td>
                                                <td style="width: 30%" align="center">
                                                    <input type="text" class="form-control input-sm numbersOnly" style="width:100px;" data-bind="value: nombre, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].valor'  }">
                                                </td>
                                                <td style="width: 10%" align="center">
                                                    <input type="hidden" data-bind="value: id, attr: { 'name': 'criteriosHabilitantes[' + $index() + '].id'  }" />
                                                    <button class='btn btn-danger btn-xs' type='button' data-bind="click: $root.eliminarCriterioHabilitante"><span class='glyphicon glyphicon-remove'></span></button>
                                                </td>
                                            </tr>
                                        </tbody>                                    
                                    </table>
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
            if (valor === "3" || valor === "4") {
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
        if ($('#tipoConvocatoria').val() === "3" ||
                $('#tipoConvocatoria').val() === "4") {
            $('#formcurso').show();
        } else {
            $('#formcurso').hide();
        }

        $('#asignarCriterioHabilitante').click(function () {
            $('#criteriosHabilitantesPorAsignar option:selected').each(function () {
                convocatoriaModel.criteriosHabilitantes.push(
                        {
                            id: ko.observable($(this).val()),
                            nombre: ko.observable($(this).text())
                        });
                $(this).remove();
            });
        });

        $('#asignarCriterioEvaluacion').click(function () {
            $('#criteriosEvaluacionPorAsignar option:selected').each(function () {
                convocatoriaModel.criteriosEvaluacion.push(
                        {
                            id: ko.observable($(this).val()),
                            nombre: ko.observable($(this).text())
                        });
                $(this).remove();
            });
        });
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

    var ConvocatoriaModel = function (adendas, criteriosHabilitantes, criteriosEvaluacion) {
        self = this;
        self.adendas = ko.observableArray(adendas);
        self.criteriosHabilitantes = ko.observableArray(criteriosHabilitantes);
        self.criteriosEvaluacion = ko.observableArray(criteriosEvaluacion);
        self.adicionarAdenda = function () {
            var tipoAdenda = $('#tipoAdenda').val();
            var nombreTipoAdenda = $('#tipoAdenda option:selected').text();
            var descripcionAdenda = $('#descripcionAdenda').val();
            var fechaAdenda = $('#fechaAdenda').val();
            if ($('#consecutivo').val() === "") {
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

        self.eliminarCriterioHabilitante = function (criterioHabilitante) {
            self.criteriosHabilitantes.remove(criterioHabilitante);
            $('#criteriosHabilitantesPorAsignar').append("<option value='" + criterioHabilitante.id() + "'>" + criterioHabilitante.nombre() + "</option>");
            ordenarOpciones($('#criteriosHabilitantesPorAsignar option'));
        };

        self.eliminarCriterioEvaluacion = function (criterioEvaluacion) {
            self.criteriosEvaluacion.remove(criterioEvaluacion);
            $('#criteriosEvaluacionPorAsignar').append("<option value='" + criterioEvaluacion.id() + "'>" + criterioEvaluacion.nombre() + "</option>");
            ordenarOpciones($('#criteriosEvaluacionPorAsignar option'));
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

    function cerrarVentanaAndenda() {
        if($('input:file[name="adendas[' + self.documentosSoporte().length + '].documento"]')) {
           $('input:file[name="adendas[' + self.documentosSoporte().length + '].documento"]').remove(); 
        }
        $('#md_adenda').modal('hide');
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
    var criteriosHabilitantes = [];
    var criteriosEvaluacion = [];
    <c:if test = "${adendasJSON != null}">
    adendas = ${adendasJSON};
    for (var i = 0; i < adendas.length; i++) {
        var fileInput = $('<input type="file" class="form-control" id="adendas[' + i + '].documento" name="adendas[' + i + '].documento" />');
        $('#documentosAdenda').append(fileInput);
        $('input:file[name="adendas[' + i + '].documento"]').hide();
    }
    </c:if>
    <c:if test = "${criteriosHabilitantesJSON != null}">
    criteriosHabilitantes = ${criteriosHabilitantesJSON};
    </c:if>
    <c:if test = "${criteriosHabilitantesJSON != null}">
    criteriosEvaluacion = ${criteriosEvaluacionJSON};
    </c:if>
    var convocatoriaModel = new ConvocatoriaModel(adendas, criteriosHabilitantes, criteriosEvaluacion);
    ko.applyBindings(convocatoriaModel);
</script>
