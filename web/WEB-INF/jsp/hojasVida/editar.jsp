<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">         
    <div class="contenido-nav2">
        <ul class="navbar-nav navbar-sidenav">
            <li class="nav-item" id="personal" data-toggle="tooltip" data-placement="right" title="" data-original-title="Información personal">
                <a class="nav-link" >
                    <i  class="fa fa-address-book" style="font-size:36px;"></i>
                    <span class="nav-link-text">Información personal</span>
                </a>
            </li>
            <li class="nav-item" id="perfillaboral" data-toggle="tooltip" data-placement="right" title="" data-original-title="Perfil">
                <a class="nav-link" >
                    <i  class="fa fa-address-book-o" style="font-size:36px;"></i>
                    <span class="nav-link-text">Perfil</span>
                </a>
            </li>
            <li class="nav-item" id="academico" data-toggle="tooltip" data-placement="right" title="" data-original-title="Aspectos Acádemicos" style="margin-right: 5px !important;">
                <a class="nav-link" >
                    <i  class="fa fa-mortar-board" style="font-size:36px;"></i>
                    <span class="nav-link-text">Aspectos Acádemicos</span>
                </a>
            </li>
            <li class="nav-item" id="educacioncontinua" data-toggle="tooltip" data-placement="right" title="" data-original-title="Educación no formal">
                <a class="nav-link" >          
                    <i  class="fa fa-address-card-o" style="font-size:36px;"></i> 
                    <span class="nav-link-text">Educación no formal </span>
                </a>
            </li>
            <li class="nav-item" id="experiencia" data-toggle="tooltip" data-placement="right" title="" data-original-title="Experiencia laboral">
                <a class="nav-link" >
                    <i  class="fa fa-list" style="font-size:36px;"></i> 
                    <span class="nav-link-text">Experiencia laboral</span>
                </a>
            </li>
            <li class="nav-item" id="investigacion" data-toggle="tooltip" data-placement="right" title="" data-original-title="Investigación e Innovación">
                <a class="nav-link" style="margin-left: 8px;" >
                    <i  class="fa fa-lightbulb-o" style="font-size:36px;"></i></center>
                    <span class="nav-link-text">Investigación e Innovación</span>
                </a>
            </li>
            <li class="nav-item" id="distinciones" data-toggle="tooltip" data-placement="right" title="" data-original-title="Distinciones">
                <a class="nav-link" >
                    <i  class="fa fa-trophy" style="font-size:36px;"></i> 
                    <span class="nav-link-text">Distinciones</span>
                </a>
            </li>     
        </ul>
    </div>
    <div class="container">
        <div id="alert_hoja_vida"></div>
        <form:form method="POST" modelAttribute="hojaVida">
            <div id="formpersonal">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button class="btn btn-success">Informaci&oacute;n personal</button>
                    </div>
                </div>                    
                <!-- FILA 1 FORMULARIO-->
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="tipoIdentificacion">Tipo de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de identificación">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="tipoIdentificacion" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de identificación">
                                    <form:option value=""></form:option>
                                    <form:options items="${tiposIdentificacion}" itemLabel="nombre" itemValue="id"/>                                    
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="numeroIdentificacion">N&deg; de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el número de identificación">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                <form:input class="form-control" path="numeroIdentificacion" maxlength="20" data-validation="required" data-validation-error-msg="Debe indicar el numero de identificación"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="fechaExpedicion">Fecha de expedici&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de expedición">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date'>
                                <form:input class="form-control fecha" path="fechaExpedicion" data-validation="required" data-validation-error-msg="Debe indicar la fecha de expedición" maxlength="10"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group form-inline">
                            <label for="lugarExpedicion">Lugar de expedici&oacute;n</label>
                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el lugar de expedición">
                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                            </a> 
                            <br />
                            <form:input path="nombreLugarExpedicion" class="form-control" style="width: 90%" readonly="true" required="true" />
                            <form:hidden path="lugarExpedicion"  />
                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarUbicacionModal('nombreLugarExpedicion', 'lugarExpedicion');">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form group">
                            <label for="">Copia c&eacute;dula</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe cargar la copia de cedula">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class="form-inline">
                                <span class="btn btn-success btn-file">Seleccionar archivo<input type="file" accept=".pdf,.png,.jpg,.jpeg" name="copiaDocumentoIdentificacion" id="copiaDocumentoIdentificacion" class="form-control" style="width: 80%"></span><label class="lblnombre" id="nombreCopiaDocumentoIdentificacion">${hojaVida.getNombreCopiaDocumentoIdentificacion()}</label>
                                <c:if test = "${!hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                </c:if>    
                                <c:if test = "${hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                                <c:if test = "${hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                <button class="btn btn-success btn-xs" type="button" onclick="verCopiaCedula()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                </c:if>                              
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
                                    <select style="width: 80%" id="ciudad" name="ciudad" class="js-select-basic-single js-states form-control"></select>
                                    <button id="btnNuevaCiudadExtranjera" style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaCiudadExtranjera();"><span class="glyphicon glyphicon-plus"></span></button>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" onclick="seleccionarUbicacion()">Aceptar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="md_ciudad_extranjera" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Ciudad</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_ciudad_extranjera"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ciudadExtranjera">País</label>
                                            <input name="paisCiudad" id="paisCiudad" readonly type="text" class="form-control">
                                        </div>
                                    </div>                  
                                </div> 
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ciudadExtranjera">Ciudad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar la ciudad">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <input name="ciudadExtranjera" id="ciudadExtranjera" type="text" class="form-control" maxlength="100">
                                        </div>
                                    </div>                  
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" id="btnAdicionarCiudadExtranjera">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 1 FORMULARIO-->
                <!-- FILA 2 FORMULARIO-->
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="nombres">Nombres</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su nombre completo ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input class="form-control" path="nombres" data-validation="required" data-validation-error-msg="Debe indicar su nombre completo" maxlength="45"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="apellidos">Apellidos</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el apellido completo">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input class="form-control" path="apellidos" data-validation="required" data-validation-error-msg="Debe indicar el apellido completo" maxlength="45"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="sexo">Sexo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger el sexo que perteneces">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.getSexo() == 1}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="sexo" data-title="1">M</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="2">F</a>
                                </c:if>
                                <c:if test = "${hojaVida.getSexo() == 2}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="1">M</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="sexo" data-title="2">F</a>
                                </c:if>
                                <c:if test = "${hojaVida.getSexo() != 1 && hojaVida.getSexo() != 2}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="1">M</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="sexo" data-title="2">F</a>
                                </c:if>
                            </div>
                            <form:hidden path="sexo" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="nacionalidad">País/Nacionalidad</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la nacionalidad">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="nacionalidad" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar la nacionalidad">
                                    <form:option value=""></form:option>
                                    <form:options items="${paises}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>                            
                </div>
                <!-- FIN FILA 2 FORMULARIO-->
                <!-- FILA 3 FORMULARIO-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha de nacimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de nacimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date' data-validation="required" data-validation-error-msg="Debe indicar la fecha de nacimiento">
                                <form:input class="form-control fecha" path="fechaNacimiento" maxlength="10"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group form-inline">
                            <label for="lugarNacimiento">Lugar de nacimiento</label> 
                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el lugar de nacimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                            </a> 
                            <br />
                            <form:input path="nombreLugarNacimiento" class="form-control" style="width: 80%" readonly="true" requerided="true" />
                            <form:hidden path="lugarNacimiento" />
                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarUbicacionModal('nombreLugarNacimiento', 'lugarNacimiento');">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>N&deg; libreta militar</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el número de libreta militar ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input type="text" class="form-control" path="libretaMilitar" maxlength="15"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Distrito -- clase</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el número de distrito y su clase de la libreta militar">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input type="text" class="form-control" path="distritoClase" maxlength="15"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <div class="form-group">
                            <label>Copia libreta militar</label>
                            <div class="form-inline">
                            <span class="btn btn-success btn-file">Seleccionar archivo<input type="file" accept=".pdf,.png,.jpg,.jpeg" name="copiaLibretaMilitar" id="copiaLibretaMilitar" class="form-control" style="width: 80%"></span><label class="lblnombre" id="nombreCopiaLibretaMilitar">${hojaVida.getNombreCopiaLibretaMilitar()}</label>
                            <c:if test = "${!hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button id="btnCopiaLibretaMilitarNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnCopiaLibretaMilitarValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button id="btnCopiaLibretaMilitarValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                <button id="btnCopiaLibretaMilitarNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                            </c:if>                            
                                <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button class="btn btn-success btn-xs" type="button" onclick="verCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                            </c:if>                              
                            </div>            
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group form-inline">
                            <label for="ciudadResidencia">Ciudad de residencia</label>
                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la ciudad de residencia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                            </a>
                            <br /> 
                            <form:input path="nombreCiudadResidencia" style="width: 90%" class="form-control" readonly="true" requerided="true" />
                            <form:hidden path="ciudadResidencia" />
                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarUbicacionModal('nombreCiudadResidencia', 'ciudadResidencia');">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 3 FORMULARIO-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group form-inline">
                            <label for="direccion">Direcci&oacute;n</label>
                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la dirección">
                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                            </a>
                            <br>     
                            <form:input class="form-control" path="direccion" style="width: 90%" readonly="true" data-validation="required" data-validation-error-msg="Debe indicar la dirección"/>
                            <button type="button" class="btn btn-success btn-sm" data-target="#md_direccion" data-toggle="modal" data-backdrop="static" data-keyboard="false">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- FILA 4 FORMULARIO-->
                <div class="modal fade" id="md_direccion" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Direcci&oacute;n</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row" >
                                    <div class="col-md-12">
                                        <div class="form-group form-inline">
                                            <label >Tipo de direcci&oacute;n</label>
                                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de dirección"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <div class="radio">
                                                <label><input type="radio" name="radrural" id="radrural" value="rural" style="margin-left: 10px;margin-right: 5px;">Rural o extranjera</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" name="radurbano" id="radurbano" value="urbano" style="margin-right: 5px;margin-left: 10px;">Urbana en Colombia</label>
                                            </div>
                                        </div>
                                    </div>                  
                                </div>
                                <div id="formurbana" style="display: none;">
                                    <div class="row" >
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select  name="dircalle" id="dircalle" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                                    <option></option>
                                                    <option value="Avenida">Avenida</option>
                                                    <option value="Calle">Calle</option>
                                                    <option value="Carrera">Carrera</option>
                                                    <option value="Circunvalar">Circunvalar</option>
                                                    <option value="Diagonal">Diagonal</option>
                                                    <option value="Transversal">Transversal</option>
                                                </select>
                                                <p>Ejemplo: Calle</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="numdir" id="numdir" class="form-control" maxlength="5">
                                                <p>Ejemplo: 65</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="letdir" id="letdir" class="form-control" maxlength="4">
                                                <p>Ejemplo: AA</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select  name="dirsur" id="dirsur" class="js-select-basic-single js-states form-control">
                                                    <option value="">&nbsp;</option>
                                                    <option value="Sur">Sur</option>
                                                    <option value="Norte">Norte</option>
                                                    <option value="Este">Este</option>
                                                    <option value="Oeste">Oeste</option>
                                                </select>
                                                <p>Ejemplo: sur</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="num2dir" id="num2dir" class="form-control" maxlength="5">
                                                <p>Ejemplo: 45</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="let2dir" id="let2dir" class="form-control" maxlength="5">
                                                <p>Ejemplo: B</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select  name="direst" id="direst" class="js-select-basic-single js-states form-control">
                                                    <option value="">&nbsp;</option>
                                                    <option value="Sur">Sur</option>
                                                    <option value="Norte">Norte</option>
                                                    <option value="Este">Este</option>
                                                    <option value="Oeste">Oeste</option>
                                                </select>
                                                <p>Ejemplo: este</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="num3dir" id="num3dir" class="form-control" maxlength="5">
                                                <p>Ejemplo: 45</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="dirurb">(urb,bloque.etc)</label> 
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe diligenciar el nombre de urbanización y el número de bloque y apartamento"><i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" class="form-control" name="dirurb" id="dirurb" maxlength="100">
                                                <p>Ejemplo: Urbanizaci&oacute;n manzanares bloque 23 Apto 250</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="">Vista previa</label>
                                            <input type="text" class="form-control" id="vistaprevia" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div id="formrural" style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="cid_certificado">Direcci&oacute;n</label> 
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe diligenciar el nombre de urbanizacion y el numero de bloque y apto"><i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" class="form-control" name="dirrural" id="dirrural" maxlength="300">
                                                <p>Ejemplo: Vereda villa, 1412 Westside fl 33144</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success"  id="adddireccion">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!-- FIN FILA 4 FORMULARIO-->
                <!-- FILA 5 FORMULARIO-->

                <!-- FIN FILA 5 FORMULARIO-->
                <!-- FILA 6 FORMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="grupoEtnico">Grupo &eacute;tnico </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el grupo étnico que pertenece">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                <form:select path="grupoEtnico" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el grupo étnico que pertenece">
                                    <form:option value=""></form:option>
                                    <form:options items="${gruposEtnicos}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="discapacidad">Posee alguna de las siguientes discapacidades</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de discapacidad">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="discapacidad" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${discapacidades}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 5 FORMULARIO-->
                <!-- FILA 6 FORMULARIO-->
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group form-inline">
                            <label for="disponeRUT">Tiene RUT</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger tienes RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.isDisponeRUT()}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="disponeRUT"  data-title="true"  id="btnrutsi">Si</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="disponeRUT"  data-title="false" id="btnrutno">No</a>
                                </c:if>    
                                <c:if test = "${!hojaVida.isDisponeRUT()}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="disponeRUT"  data-title="true"  id="btnrutsi">Si</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="disponeRUT"  data-title="false" id="btnrutno">No</a>
                                </c:if>    
                            </div>
                            <form:hidden path="disponeRUT" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="actividadEconomica">Actividad económica principal registrada en el RUT</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad económica del RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="actividadEconomica" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${actividadesEconomicas}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Documento de soporte RUT</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe cargar el documento de RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <div class="form-inline">
                            <span class="btn btn-success btn-file">Seleccionar archivo<input type="file" accept=".pdf,.png,.jpg,.jpeg" name="documentoRUT" id="documentoRUT" class="form-control" style="width: 80%"></span><label class="lblnombre" id="nombreDocumentoRUT">${hojaVida.getNombreDocumentoRUT()}</label>
                            <c:if test = "${!hojaVida.isDocumentoRUTValidado()}">
                                <button id="btnDocumentoRUTNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnDocumentoRUTValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isDocumentoRUTValidado()}">
                                <button id="btnDocumentoRUTNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnDocumentoRUTValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" ><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>
                            <c:if test = "${hojaVida.isTieneDocumentoRUT()}">
                                <button class="btn btn-success btn-xs" type="button" onclick="verCopiaRUT()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                </c:if>                              
                            </div>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 6 FORMULARIO-->
                <!-- FILA 7 FORMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="disponibilidadViajar">¿Tiene disponibilidad para trabajar por fuera de Medellín?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas en disponible para trabajar por fuera de medellin">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.isDisponibilidadViajar()}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="disponibilidadViajar" data-title="true">Si</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="disponibilidadViajar" data-title="false">No</a>
                                </c:if>
                                <c:if test = "${!hojaVida.isDisponibilidadViajar()}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="disponibilidadViajar" data-title="true">Si</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="disponibilidadViajar" data-title="false">No</a>
                                </c:if>
                            </div>
                            <form:hidden path="disponibilidadViajar" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">¿Egresado de la Universidad de Antioquia?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que usted es egresado de la universidad de Antioquia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <div id="radioBtn1" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.isEgresadoUDEA()}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="egresadoUDEA" data-title="true" id="btnEgresadoUdeASi" disabled>Si</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="egresadoUDEA" data-title="false" id="btnEgresadoUdeANo" disabled>No</a>
                                </c:if>
                                <c:if test = "${!hojaVida.isEgresadoUDEA()}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="egresadoUDEA" data-title="true" id="btnEgresadoUdeASi" disabled>Si</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="egresadoUDEA" data-title="false" id="btnEgresadoUdeANo" disabled>No</a>
                                </c:if>
                            </div>
                            <form:hidden path="egresadoUDEA" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">¿Usted es empleado de la Universidad de Antioquia?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que usted es egresado de la universidad de Antioquia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.isEmpleadoUDEA()}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="empleadoUDEA"  data-title="true"  id="btnempleadosi">Si</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="empleadoUDEA"  data-title="false" id="btnempleadono">No</a>
                                </c:if>
                                <c:if test = "${!hojaVida.isEmpleadoUDEA()}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="empleadoUDEA"  data-title="true"  id="btnempleadosi">Si</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="empleadoUDEA"  data-title="false" id="btnempleadono">No</a>
                                </c:if>
                            </div>
                            <form:hidden path="empleadoUDEA" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="tipoVinculacion">Tipo de vinculación</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de vinculaci&oacute;n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="tipoVinculacion" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${tiposVinculacion}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label>Agregar Telef&oacute;no</label>
                        <button type="button" class="btn btn-success btn-sm" onclick="nuevoTelefono()">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <br>
                            <div id="alert_telefonos"></div>
                            <table class="table tabla table-hover tableestilo" id="tbtel">
                                <thead>
                                    <tr>
                                        <th>Tipo</th>
                                        <th>N&uacute;mero</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: telefonos }">
                                    <tr class="table-row">
                                        <td style="width: 30%">
                                            <span data-bind="text: nombreTipo" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numero" ></span>
                                        </td>
                                        <td style='white-space: nowrap' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarTelefono"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' data-bind="click: $root.eliminarTelefono"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                                                             
                            </table>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label>Agregar correo electr&oacute;nico</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevoCorreoElectronico()">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 
                        <div class="table-responsive">
                            <br>
                            <div id="alert_correos_electronicos"></div>
                            <table class="table tabla table-hover tableestilo" id="tbemail">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th></th>                                         
                                    </tr>        
                                </thead>
                                <tbody data-bind="foreach: { data: correosElectronicos }">
                                    <tr class="table-row">
                                        <td style="width: 80%">
                                            <span data-bind="text: correoElectronico" ></span>
                                        </td>
                                        <td style='white-space: nowrap' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCorreoElectronico"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarCorreoElectronico"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                      
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label>Agregar cuenta bancaria</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevaCuentaBancaria()" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 
                        <div class="table-responsive">
                            <br>
                            <div id="alert_cuentas_bancarias"></div>
                            <table class="table tabla table-hover tableestilo" id="tbcuentabanca">
                                <thead>
                                    <tr>
                                        <th>Tipo</th>
                                        <th>N&uacute;mero</th>
                                        <th>Entidad</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: cuentasBancarias }">
                                    <tr class="table-row">
                                        <td style="width: 30%">
                                            <span data-bind="text: nombreTipo" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numero" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: entidad" ></span>
                                        </td>
                                        <td style='white-space: nowrap' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCuentaBancaria"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarCuentaBancaria"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                              
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Fin Cuerpo-->
                <!--  CONTENIDOS MODALES -->
                <!--  MODAL EMAIL -->
                <div class="modal fade" id="md_correo_electronico" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Correo electr&oacute;nico</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_correo_electronico"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="correoElectronico">Nombre del correo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su correo">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <input name="correoElectronico" id="correoElectronico" type="text" class="form-control" maxlength="200">
                                        </div>
                                    </div>                  
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarCorreoElectronico">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  MODAL telefono -->
                <div class="modal fade" id="md_telefono" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Telef&oacute;no</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_telefono"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="tel_tipo">Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de número telefónico">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <select name="tipoTelefono" id="tipoTelefono" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                                <option></option>
                                                <c:forEach var="tipoTelefono" items="${tiposTelefono}">
                                                    <option value="${tipoTelefono.getId()}">${tipoTelefono.getNombre()}</option>
                                                </c:forEach>                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="numeroTelefono">N&uacute;mero</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su número">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br> 
                                            <input type="text" name="numeroTelefono" id="numeroTelefono" class="form-control" maxlength="15">
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarTelefono">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <div class="modal fade" id="md_cuenta_bancaria" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Cuenta bancaria</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_cuenta_bancaria"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Tipo de cuenta bancaria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el tipo de cuenta bancaria ">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select name="tipoCuentaBancaria" id="tipoCuentaBancaria" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                                <option></option>
                                                <option value="CA">Cuenta de ahorro</option>
                                                <option value="CC">Cuenta de corriente</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>N&uacute;mero de cuenta</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el n&uacute;mero de cuenta bancaria ">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" name="numeroCuentaBancaria" id="numeroCuentaBancaria" class="form-control" maxlength="50">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Entidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la entidad de su cuenta bancaria">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" name="entidadCuentaBancaria" id="entidadCuentaBancaria" class="form-control" maxlength="200">
                                        </div>
                                    </div> 
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarCuentaBancaria">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-success" style="float: right; margin-bottom:20px;" type="submit">Guardar</button>

            </div>
            <div id="formperfilsopor" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" class="btn btn-success">Perfil y soportes</button></li>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="pe_perfil">Perfil laboral y profesional</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el perfil laboral y profesional ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:textarea class="form-control" path="perfil" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Agregar documentos de soporte(Foto, propuesta de investigación, certificados EPS, ARL, AFP, bancarios y otros documentos requeridos)</label>
                        <button type="button" class="btn btn-success btn-sm" onclick="nuevoDocumentoSoporte()">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <br>
                            <div id="alert_documentos_soporte"></div>
                            <table class="table tabla table-hover tableestilo" id="tbdocad">
                                <thead>
                                    <tr>
                                        <th>Tipo de documento</th>
                                        <th align="center">Documento de soporte</th>
                                        <th></th>
                                    </tr>        
                                </thead>
                                <tbody data-bind="foreach: { data: documentosSoporte }">
                                    <tr class="table-row">
                                        <td style="width: 40%">
                                            <span data-bind="text: nombreTipoDocumento" ></span>
                                        </td>
                                        <td style="width: 50%" align="center">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: validado"><i class="glyphicon glyphicon-ok"></i></a>                                            
                                        </td>
                                        <td style='white-space: nowrap' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarDocumentoSoporte"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarDocumentoSoporte"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                           
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="md_documento_soporte" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaDocumentoSoporte()">&times;</button>
                                <h4 class="modal-title">Adjuntar documentos de soporte</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div id="alert_documento_soporte"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Tipo de documento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de documento">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select name="tipoDocumento" id="tipoDocumento" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                                <option></option>
                                                <c:forEach var="tipoDocumento" items="${tiposDocumento}">
                                                    <option value="${tipoDocumento.getId()}">${tipoDocumento.getNombre()}</option>
                                                </c:forEach>                                                
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Documento de soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar un archivo de soporte ">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="documentoSoporte" id="documentoSoporte" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarDocumentoSoporte">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaDocumentoSoporte();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-success" style="float: right; margin-bottom:20px;" type="submit">Guardar</button>
            </div>
            <div id="formacademico" style="display: none;"> 
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" class="btn btn-success">Aspectos acad&eacute;micos</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Agregar estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionBasica();" >
                            <span class="glyphicon glyphicon-plus"></span>   
                        </button>
                        <div class="table-responsive">
                            <br>
                            <div id="alert_educaciones_basicas"></div>
                            <table class="table tabla table-hover tableestilo">
                                <thead>
                                    <tr>
                                        <th>Nivel de estudio</th>
                                        <th>Instituci&oacute;n</th>
                                        <th>T&iacute;tulo</th>
                                        <th>A&ntilde;o de t&iacute;tulo</th>
                                        <th class="cer" align="center">Certificado</th>
                                        <th class="opc" align="center">Opciones</th>
                                    </tr> 
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesBasicas }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreNivel" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: institucion" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: titulo" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: anyoFinalizacion" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionBasica" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>                                            
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionBasica"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionBasica"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                           
                            </table>
                        </div>
                    </div>
                    <!--MODAL ASPECTOS academicos modal estudio educacion basica-->
                    <div class="modal fade" id="md_educacion_basica" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button type="button" class="close" onclick="cerrarVentanaEducacionBasica();">&times;</button>
                                    <h4 class="modal-title">Estudios Educaci&oacute;n B&aacute;sica</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_educacion_basica"></div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select name="nivelEstudioEducacionBasica" id="nivelEstudioEducacionBasica" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="nivelFormacion" items="${nivelesFormacion}">
                                                    <c:if test = "${nivelFormacion.getId() == 1 || nivelFormacion.getId() == 2}">
                                                        <option value="${nivelFormacion.getId()}">${nivelFormacion.getNombre()}</option>
                                                    </c:if>
                                                </c:forEach>                                             
                                            </select>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="institucionEducacionBasica">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la institucion que estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                <input name="institucionEducacionBasica" id="institucionEducacionBasica" class="form-control" maxlength="150" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="tituloEducacionBasica">T&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del t&iacute;tulo">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="tituloEducacionBasica" id="tituloEducacionBasica" class="form-control" maxlength="150" >
                                        </div>
                                        <div class="col-md-2">
                                            <label for="graduadoEducacionBasica">Graduado?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar que si estan graduado?">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="graduadoEducacionBasica"  data-title="true"  id="btnGraduadoSiEducacionBasica">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="graduadoEducacionBasica"  data-title="false" id="btnGraduadoNoEducacionBasica">No</a>
                                            </div>
                                            <input type="hidden" name="graduadoEducacionBasica" id="graduadoEducacionBasica" value="false">
                                        </div>
                                        <div class="col-md-2" style="width: 180px;">
                                            <div class="form-group">
                                                <label for="anyoInicioEducacionBasica">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el año de inicio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoInicioEducacionBasica" id="anyoInicioEducacionBasica" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="width: 180px;">
                                            <div class="form-group">
                                                <label for="anyoFinalizacionEducacionBasica">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar año de finalización">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoFinalizacionEducacionBasica" id="anyoFinalizacionEducacionBasica" class="form-control"></select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group form-inline">
                                                <label for="certificadoEducacionBasica">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoEducacionBasica" id="certificadoEducacionBasica" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success" data-bind="click: adicionarEducacionBasica">Agregar</button>
                                        <button type="button" class="btn btn-success" onclick="cerrarVentanaEducacionBasica();">Cancelar</button>
                                    </div>
                                </div>              
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Agregar estudios educaci&oacute;n superior</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionSuperior();" >
                            <span class="glyphicon glyphicon-plus"></span>   
                        </button>
                        <div class="table-responsive">
                            <br>
                            <div id="alert_educaciones_superiores"></div>
                            <table class="table tabla table-hover tableestilo">
                                <thead>
                                    <tr>
                                        <th>Nivel de estudio</th>
                                        <th>Instituci&oacute;n</th>
                                        <th>Programa cursado</th>
                                        <th class="cer" align="center">Certificado homologación</th>
                                        <th class="cer" align="center">Certificado</th>
                                        <th class="opc" align="center">Opciones</th>
                                    </tr> 
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesSuperiores }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreNivel" ></span>
                                        </td>
                                        <td style="width: 25%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                        </td>
                                        <td style="width: 25%">
                                            <span data-bind="text: nombrePrograma" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado homologado' data-bind="click: $root.verCertificadoHomologadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoHomologadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionSuperior"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionSuperior"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                           
                            </table>
                        </div>
                    </div>
                    <!--MODAL ASPECTOS academicos modal estudio tspectos academicos-->
                    <div class="modal fade" id="md_educacion_superior" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button type="button" class="close" onclick="cerrarVentanaEducacionSuperior();">&times;</button>
                                    <h4 class="modal-title">Estudios Educaci&oacute;n Superior</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_educacion_superior"></div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Título extranjero?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="tituloExteriorEducacionSuperior"  data-title="true"  id="btnTituloExteriorSiEducacionSuperior">Si</a>
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="tituloExteriorEducacionSuperior"  data-title="false" id="btnTituloExteriorNoEducacionSuperior">No</a>
                                                </div>
                                                <input type="hidden" name="tituloExteriorEducacionSuperior" id="tituloExteriorEducacionSuperior">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group" id="paistit" style="display: none;">
                                                <label for="">Pa&iacute;s de titulaci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el pa&iacute; de titulaci&oacute;n">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <select name="paisTituloExteriorEducacionSuperior" id="paisTituloExteriorEducacionSuperior" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                                    <option></option>
                                                     <c:forEach var="pais" items="${paises}">
                                                         <c:if test = "${pais.getId() != 343}">
                                                        <option value="${pais.getId()}">${pais.getNombre()}</option>
                                                        </c:if>
                                                    </c:forEach>    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-inline" id="certhomo" style="display: none;">
                                                <label>Certificado de homologaci&oacute;n del t&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado de homologaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoHomologadoEducacionSuperior" id="certificadoHomologadoEducacionSuperior" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="nivelEstudioEducacionSuperior" id="nivelEstudioEducacionSuperior" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                                    <option value=""></option>
                                                    <c:forEach var="nivelFormacion" items="${nivelesFormacion}">
                                                        <c:if test = "${nivelFormacion.getId() != 1 && nivelFormacion.getId() != 2}">
                                                        <option value="${nivelFormacion.getId()}">${nivelFormacion.getNombre()}</option>
                                                        </c:if>     
                                                    </c:forEach>                                                 
                                                </select> 
                                            </div>
                                        </div>               
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Programa</label>
                                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoPrograma();"><span class="glyphicon glyphicon-plus"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="md_programa" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header mhsuccess">
                                                    <button type="button" class="close" onclick="cerrarVentanaPrograma();">&times;</button>
                                                    <h4 class="modal-title">Programa</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="alert alert-success" role="alert" id="divProgramaExterior">
                                                       <strong>Nuevo programa,</strong> si su programa no esta disponible en la lista y desea agregarlo debe presionar  clic sobre el botón 
                                                                           <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#">
                                                            <span class="glyphicon glyphicon-plus"></span>   
                                                       </button>
                                                    </div>                                                    
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="institucionEducativaProgramaColombiana">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institución que estudio">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <select style="width: 100%;" name="institucionEducativaProgramaColombiana" id="institucionEducativaProgramaColombiana" class="js-select-basic-single js-states form-control">
                                                                    <option value=""></option>
                                                                    <c:forEach var="institucionEducativa" items="${institucionesEducativasColombianas}">
                                                                        <option value="${institucionEducativa.getId()}">${institucionEducativa.getNombre()}</option>
                                                                    </c:forEach>                                                                  
                                                                </select>
                                                                <select style="width: 100%;" name="institucionEducativaProgramaExterior" id="institucionEducativaProgramaExterior" class="js-select-basic-single js-states form-control">
                                                                    <option value=""></option>
                                                                    <c:forEach var="institucionEducativa" items="${institucionesEducativasExterior}">
                                                                        <option value="${institucionEducativa.getId()}">${institucionEducativa.getNombre()}</option>
                                                                    </c:forEach>                                                                  
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="programaCursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <select style="width: 88%;" name="programaCursado" id="programaCursado" class="js-select-basic-single js-states form-control">
                                                                <option value=""></option>
                                                                </select>
                                                                <button id="btnNuevoProgramaExterior" style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoProgramaExterior();"><span class="glyphicon glyphicon-plus"></span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="tituloPrograma">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de título obtenido">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" class="form-control" name="tituloPrograma" id="tituloPrograma" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcleo básico de conocimiento">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" class="form-control" name="nombreNucleoBasicoConocimientoPrograma" id="nombreNucleoBasicoConocimientoPrograma" readonly>
                                                                <input type="hidden" name="nucleoBasicoConocimientoPrograma" id="nucleoBasicoConocimientoPrograma">
                                                            </div>
                                                        </div>                                                       
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success" id="btnAdicionarPrograma">Agregar</button>
                                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaPrograma();">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="md_programa_exterior" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header mhsuccess">
                                                    <button type="button" class="close" onclick="cerrarVentanaProgramaExterior();">&times;</button>
                                                    <h4 class="modal-title">Nuevo Programa</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="alert_programa_exterior"></div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="nombreInstitucionEducativaProgramaExterior">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institución que estudio">
                                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" name="nombreInstitucionEducativaProgramaExterior" id="nombreInstitucionEducativaProgramaExterior" class="form-control" maxlength="150" >
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group form-inline">
                                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcleo básico de conocimiento">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                    <input type="text" name="nombreNucleoBasicoConocimientoProgramaExterior" id="nombreNucleoBasicoConocimientoProgramaExterior" class="form-control" style="width: 85%;" readonly>
                                                                    <input type="hidden" name="nucleoBasicoConocimientoProgramaExterior" id="nucleoBasicoConocimientoProgramaExterior" />
                                                                    <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoProgramaExterior','nombreNucleoBasicoConocimientoProgramaExterior')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="programaCursadoExterior">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" name="programaCursadoExterior" id="programaCursadoExterior" class="form-control" maxlength="250" >
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="tituloProgramaExterior">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de título obtenido">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" class="form-control" name="tituloProgramaExterior" id="tituloProgramaExterior" maxlength="250" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success" id="btnAdicionarProgramaExterior">Agregar</button>
                                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaProgramaExterior();">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <div id="formprograma" style="display: none;">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Instituci&oacute;n</label><br>
                                                    <input type="text" style="border:0;font-style: italic;" class="form-control"  readonly id="nombreInstitucionEducacionSuperior">
                                                    <input type="hidden" id="institucionEducacionSuperior">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><br>
                                                    <input type="text" style="border:0;font-style: italic;" class="form-control" readonly id="nombreNucleoBasicoConocimientoEducacionSuperior">
                                                    <input type="hidden" id="nucleoBasicoConocimientoEducacionSuperior">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="programaCursadoEducacionSuperior">Programa</label><br>
                                                    <input type="text" style="border:0;font-style: italic;" class="form-control" readonly id="nombreProgramaCursadoEducacionSuperior">
                                                    <input type="hidden" id="programaCursadoEducacionSuperior">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="tituloEducacionSuperior">T&iacute;tulo obtenido</label><br>
                                                    <input type="text" style="border:0;font-style: italic;" class="form-control" readonly id="tituloEducacionSuperior">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="graduadoEducacionSuperior">¿Graduado?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="graduadoEducacionSuperior"  data-title="true"  id="btnGraduadoSiEducacionSuperior">Si</a>
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="graduadoEducacionSuperior"  data-title="false" id="btnGraduadoNoEducacionSuperior">No</a>
                                                </div>
                                                <input type="hidden" name="graduadoEducacionSuperior" id="graduadoEducacionSuperior">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="anyoInicioEducacionSuperior">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el años de inicio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoInicioEducacionSuperior" id="anyoInicioEducacionSuperior" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="anyoFinalizacionEducacionSuperior">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el años de finalización">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoFinalizacionEducacionSuperior" id="anyoFinalizacionEducacionSuperior" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group" >
                                                <label for="fechaTituloEducacionSuperior">Fecha de titulaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de título obtenido">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type='text' class="form-control fecha input-sm" name="fechaTituloEducacionSuperior" id="fechaTituloEducacionSuperior" style="display: inline;width: 80%;margin-right: -5px;"/>
                                                <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group form-inline">
                                                <label for="certificado">Certificado de acta de grado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>  
                                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoEducacionSuperior" id="certificadoEducacionSuperior" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success" data-bind="click: adicionarEducacionSuperior">Aceptar</button>
                                        <button type="button" class="btn btn-success" onclick="cerrarVentanaEducacionSuperior();">Cancelar</button>
                                    </div>
                                </div>              
                            </div>
                        </div>
                    </div><!--fin modal aspectos academicos modal estudios aspectos academicos-->
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Agregar estudios idiomas</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoIdioma();" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <br />
                            <div id="alert_idiomas"></div>
                            <table class="table tabla table-hover tableestilo">
                            <thead>
                                <tr>
                                    <th>Idioma</th>
                                    <th>Escucha</th>
                                    <th>Conversación</th>
                                    <th>Lectura</th>
                                    <th>Escritura</th>
                                    <th class="cer" align="center">Certificado</th>
                                    <th class="opc" align="center">Opciones</th>
                                </tr>        
                            </thead>
                            <tbody data-bind="foreach: { data: idiomas }">
                                <tr class="table-row">
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreIdioma" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelEscucha" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelConversacion" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelLectura" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelEscritura" ></span>
                                    </td>
                                    <td style="width: 15%" align="center">
                                        <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoIdioma" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                    </td>
                                    <td style='white-space: nowrap' align="center">
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarIdioma"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarIdioma"><span class='glyphicon glyphicon-remove'></span></button>
                                    </td>
                                </tr>
                            </tbody>                                   
                        </table>
                        </div>
                    </div>
                    <!--  MODAL IDIOMA -->
                    <div class="modal fade" id="md_idioma" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header mhsuccess ">
                                    <button type="button" class="close" onclick="cerrarVentanaIdioma();">&times;</button>
                                        <h4 class="modal-title">Idiomas</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_idioma"></div>
                                    <table class="table table-bordered" style="border:1px;border-color: black;">
                                        <thead>
                                            <tr>
                                                <th rowspan="2" style="width: 253px;">
                                                    <label for="idioma">Idioma</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                    <select style="width: 100%;" name="idioma" id="idioma" class="js-select-basic-single js-states form-control">
                                                        <option></option>
                                                        <c:forEach var="idioma" items="${idiomas}">
                                                            <option value="${idioma.getId()}">${idioma.getNombre()}</option>
                                                        </c:forEach>     
                                                    </select>
                                                </th>
                                                <th colspan="3">Nivel</th>
                                            </tr>
                                            <tr>
                                                <th>Alto</th>
                                                <th>Medio</th>
                                                <th>Bajo</th>
                                            </tr>
                                        </thead> 
                                        <tbody>
                                            <tr>
                                                <th>Escucha</th>
                                                <td><input type="radio" name="nivelEscuchaIdioma" id="nivelEscuchaIdiomaA" value="A"></td>
                                                <td><input type="radio" name="nivelEscuchaIdioma" id="nivelEscuchaIdiomaM" value="M"></td>
                                                <td><input type="radio" name="nivelEscuchaIdioma" id="nivelEscuchaIdiomaB" value="B"></td>
                                            </tr>
                                            <tr>
                                                <th>Conversaci&oacute;n</th>
                                                <td><input type="radio" name="nivelConversacionIdioma" id="nivelConversacionIdiomaA" value="A"></td>
                                                <td><input type="radio" name="nivelConversacionIdioma" id="nivelConversacionIdiomaM" value="M"></td>
                                                <td><input type="radio" name="nivelConversacionIdioma" id="nivelConversacionIdiomaB" value="B"></td>
                                            </tr>
                                            <tr>
                                                <th>Lectura</th>
                                                <td><input type="radio" name="nivelLecturaIdioma" id="nivelLecturaIdiomaA" value="A"></td>
                                                <td><input type="radio" name="nivelLecturaIdioma" id="nivelLecturaIdiomaM" value="M"></td>
                                                <td><input type="radio" name="nivelLecturaIdioma" id="nivelLecturaIdiomaB" value="B"></td>   
                                            </tr>
                                            <tr>
                                                <th>Escritura</th>
                                                <td><input type="radio" name="nivelEscrituraIdioma" id="nivelEscrituraIdiomaA" value="A"></td>
                                                <td><input type="radio" name="nivelEscrituraIdioma" id="nivelEscrituraIdiomaM" value="M"></td>
                                                <td><input type="radio" name="nivelEscrituraIdioma" id="nivelEscrituraIdiomaB" value="B"></td>   
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="row">
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
                                        <div class="col-md-6" id="divOtroCertificacionIdioma" style="display: none;">
                                            <div class="form-group">
                                                <label for="">Cual?</label>
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el otro tipo de certificación">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="otraCertificacionIdioma" id="otraCertificacionIdioma" class="form-control" maxlength="100" >
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="">Puntaje</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje de estudio idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="puntajeCertificacionIdioma" id="puntajeCertificacionIdioma" class="form-control" maxlength="5">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group form-inline">
                                                <label for="certificadoIdioma">Certificado</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado que pertenece">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoIdioma" id="certificadoIdioma" />
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
            </div>            
            <div id="formeducontinua" style="display: none;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">   
                            <div class="col-md-1" style="margin-bottom: 20px;">
                                <button class="btn btn-success">Educaci&oacute;n no formal</button>
                            </div>
                        </div>
                        <label>Estudios educación no formal</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionContinua();" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>               
                        <div class="table-responsive">
                            <br>
                            <div id="alert_educaciones_continuas"></div>
                            <table class="table tabla table-hover tableestilo" id="tbcapaci">
                                <thead>
                                    <tr>
                                        <th>Tipo de capacitaci&oacute;n</th>
                                        <th>Nombre de capacitaci&oacute;n</th>
                                        <th>Instituci&oacute;n</th>
                                        <th>N&uacute;mero de horas</th>
                                        <th>Certificado</th>
                                        <th>Opciones</th>
                                    </tr> 
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesContinuas }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreTipoCapacitacion" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreCapacitacion" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numeroHoras" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionContinua" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionContinua"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionContinua"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                           
                            </table>
                        </div>
                    </div>
                </div>
                <!--MODAL ASPECTOS academicos modal estudio capacitacion-->
                <div class="modal fade" id="md_educacion_continua" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaEducacionContinua();">&times;</button>
                                <h4 class="modal-title">Estudios Educaci&oacute;n Continua</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_educacion_continua"></div>
                                <div class="alert alert-success" role="alert" id="divMensajeInstitucionExteriorEducacionContinua">
                                    <strong>Nueva Institución,</strong> si su institución educativa no esta disponible en la lista y desea agregarla debe presionar clic sobre el botón 
                                                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#">
                                         <span class="glyphicon glyphicon-plus"></span>   
                                    </button>
                                </div>                                
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="tipoCapacitacionEducacionContinua">Tipo de capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cuál es el tipo de capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="tipoCapacitacionEducacionContinua" id="tipoCapacitacionEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="tipoCapacitacion" items="${tiposCapacitacion}">
                                                <option value="${tipoCapacitacion.getId()}">${tipoCapacitacion.getNombre()}</option>
                                                </c:forEach>                                                 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="estudioExteriorEducacionContinua">¿Certificado extranjero?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger si el certificado es extranjero">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="estudioExteriorEducacionContinua"  data-title="true"  id="btnEstudioExteriorSiEducacionContinua">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="estudioExteriorEducacionContinua"  data-title="false" id="btnEstudioExteriorNoEducacionContinua">No</a>
                                            </div>
                                            <input type="hidden" name="estudioExteriorEducacionContinua" id="estudioExteriorEducacionContinua">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="institucionEducacionContinua">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institución que estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <div class="form-inline">
                                                <select style="width: 80%;" name="institucionEducacionContinuaColombiana" id="institucionEducacionContinuaColombiana" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="institucion" items="${institucionesEducativasColombianas}">
                                                    <option value="${institucion.getId()}">${institucion.getNombre()}</option>
                                                    </c:forEach>                                                     
                                                </select>
                                                <select style="width: 80%;" name="institucionEducacionContinuaExterior" id="institucionEducacionContinuaExterior" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="institucion" items="${institucionesEducativasExterior}">
                                                    <option value="${institucion.getId()}">${institucion.getNombre()}</option>
                                                    </c:forEach>                                                     
                                                </select>
                                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevaInstitucionExteriorEducacionContinua" onclick="nuevaInstitucionExteriorEducacionContinua();"><span class="glyphicon glyphicon-plus"></span></button>
                                            </div>
                                        </div>
                                    </div>
				</div>
				<div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group form-inline">
                                            <label for="nucleoBasicoConocimientoEducacionContinua">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" name="nombreNucleoBasicoConocimientoEducacionContinua" id="nombreNucleoBasicoConocimientoEducacionContinua" class="form-control" style="width: 90%;" readonly>
                                            <input type="hidden" name="nucleoBasicoConocimientoEducacionContinua" id="nucleoBasicoConocimientoEducacionContinua" />
                                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoEducacionContinua','nombreNucleoBasicoConocimientoEducacionContinua')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                        </div> 
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="nombreCapacitacionEducacionContinua">Nombre del capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de la capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="nombreCapacitacionEducacionContinua" id="nombreCapacitacionEducacionContinua">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="numeroHorasEducacionContinua">N&deg; de horas  </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el número de horas de la capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="numeroHorasEducacionContinua" id="numeroHorasEducacionContinua" maxlength="5" >                                     
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="anyoEducacionContinua">A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el año de terminación de la capacitación">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select class="form-control input-sm" name="anyoEducacionContinua" id="anyoEducacionContinua"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="certificadoEducacionContinua">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoEducacionContinua" id="certificadoEducacionContinua" />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-bind="click: adicionarEducacionContinua">Agregar</button>
                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaEducacionContinua();">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div><!--fin modal aspectos academicos modal estudios educacion continua -->
                </div>
            </div>
            <div id="formexperiencia" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button  type="button" class="btn btn-success">Experiencia laboral</button>
                    </div>
                </div>		
                <label>Agregar experiencia laboral</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaExperienciaLaboral();" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>	
                <div class="table-responsive">
                    <br>
                    <div id="alert_experiencias_laborales"></div>
                    <table class="table tabla table-hover tableestilo">
                        <thead>
                            <tr>
                                <th>&Aacute;rea</th>
                                <th>Empresa/Instituci&oacute;n</th>
                                <th>Cargo</th>
                                <th>Certificado</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: experienciasLaborales }">
                            <tr class="table-row">
                                <td style="width: 30%">
                                    <span data-bind="text: nombreNucleoBasicoConocimiento" ></span>
                                </td>
                                <td style="width: 30%">
                                    <span data-bind="text: nombreEmpresa" ></span>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: cargo" ></span>
                                </td>
                                <td style="width: 10%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoExperienciaLaboral" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                    <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarExperienciaLaboral"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                    <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarExperienciaLaboral"><span class='glyphicon glyphicon-remove'></span></button>
                                </td>
                            </tr>
                        </tbody>                          
                    </table>
                </div>
                <!--MODAL Experiencia laboral-->
                <div class="modal fade" id="md_experiencia_laboral" role="dialog">
                    <div class="modal-dialog modal-lg" style="width: 1200px">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaExperienciaLaboral();">&times;</button>
                                <h4 class="modal-title">Experiencia laboral</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div id="alert_experiencia_laboral"></div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">Tipo de experiencia</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de adenda">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                                            <select style="width: 100%;" name="tipoExperienciaLaboral" id="tipoExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="tipoExperiencia" items="${tiposExperiencia}">
                                                <option value="${tipoExperiencia.getId()}">${tipoExperiencia.getNombre()}</option>
                                                </c:forEach>  
                                            </select>
                                        </div>  
                                    </div>                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="trabajoActualExperienciaLaboral">¿Es su trabajo actual?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que si estas trabajando actual">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <div id="radioBtn" class="btn-group">
                                               <a class="btn btn-primary btn-sm notActive" data-toggle="trabajoActualExperienciaLaboral" data-title="true" id="btnTrabajoActualExperienciaLaboralSi">Si</a>
                                               <a class="btn btn-primary btn-sm notActive" data-toggle="trabajoActualExperienciaLaboral" data-title="false" id="btnTrabajoActualExperienciaLaboralNo">No</a>
                                            </div>
                                            <input type="hidden" name="trabajoActualExperienciaLaboral" id="trabajoActualExperienciaLaboral" value="false"> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="experienciaLaboralFNSP">¿En la Facultad Nacional Salud p&uacute;blica?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas trabajando en la Facultad nacional salud pública">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group">
                                               <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaLaboralFNSP"  data-title="true" id="btnExperienciaLaboralFNSPSi" >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaLaboralFNSP"  data-title="false" id="btnExperienciaLaboralFNSPNo" >No</a>
                                            </div>
                                            <input type="hidden" name="experienciaLaboralFNSP" id="experienciaLaboralFNSP">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="fechaIngresoExperienciaLaboral">Fecha Ingreso/Inicio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de ingreso">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="fechaIngresoExperienciaLaboral" id="fechaIngresoExperienciaLaboral" maxlength="10" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="fechaRetiroExperienciaLaboral">Fecha Retiro/Fin</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de retiro">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="fechaRetiroExperienciaLaboral" id="fechaRetiroExperienciaLaboral" maxlength="10" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-inline">
                                            <label for="nucleoBasicoConocimientoExperienciaLaboral">Núcleo básico del conocimiento de desempeño</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el N&uacute;cleo b&aacute;sico del conocimiento">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="nombreNucleoBasicoConocimientoExperienciaLaboral" id="nombreNucleoBasicoConocimientoExperienciaLaboral" class="form-control" style="width: 80%;" readonly>
                                            <input type="hidden" name="nucleoBasicoConocimientoExperienciaLaboral" id="nucleoBasicoConocimientoExperienciaLaboral" />
                                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoExperienciaLaboral','nombreNucleoBasicoConocimientoExperienciaLaboral')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="tipoEmpresaExperienciaLaboral">Tipo de empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de empresa">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="tipoEmpresaExperienciaLaboral" id="tipoEmpresaExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="tipoInstitucion" items="${tiposInstitucion}">
                                                <option value="${tipoInstitucion.getId()}">${tipoInstitucion.getNombre()}</option>
                                                </c:forEach>  
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="nombreEmpresaExperienciaLaboral">Empresa/Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de empresa">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" class="form-control" name="nombreEmpresaExperienciaLaboral" id="nombreEmpresaExperienciaLaboral" maxlength="250" >
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="actividadEconomicaExperienciaLaboral">Actividad económica principal de la empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad económica">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%;" name="actividadEconomicaExperienciaLaboral" id="actividadEconomicaExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="actividadEconomica" items="${actividadesEconomicas}">
                                                <option value="${actividadEconomica.getId()}">${actividadEconomica.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="tipoContratoExperienciaLaboral">Tipo de contrato</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de contrato">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%;" name="tipoContratoExperienciaLaboral" id="tipoContratoExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                 <c:forEach var="tipoContrato" items="${tiposContrato}">
                                                <option value="${tipoContrato.getId()}">${tipoContrato.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="cargoExperienciaLaboral">Cargo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cual es su cargo">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" class="form-control" name="cargoExperienciaLaboral" id="cargoExperienciaLaboral" maxlength="250">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="naturalezaCargoExperienciaLaboral">Naturaleza del cargo o labor</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar naturaleza del cargo">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%;" name="naturalezaCargoExperienciaLaboral" id="naturalezaCargoExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                 <c:forEach var="naturalezaCargo" items="${naturalezasCargo}">
                                                <option value="${naturalezaCargo.getId()}">${naturalezaCargo.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="certificadoExperienciaLaboral">Certificado de soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoExperienciaLaboral" id="certificadoExperienciaLaboral" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarExperienciaLaboral">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaExperienciaLaboral();">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--Fin modal experiencia laboral-->
                <!--MODAL Experiencia docencia -->
                <label>Agregar experiencia docencia</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaExperienciaDocencia();" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>
                <div class="table-responsive">
                    <br>
                    <div id="alert_experiencias_docencia"></div>
                    <table class="table tabla table-hover tableestilo">
                        <thead>
                            <tr>
                                <th>Instituci&oacute;n</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: experienciasDocencia }">
                            <tr class="table-row">
                                <td style="width: 90%">
                                    <span data-bind="text: nombreInstitucion" ></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarExperienciaDocencia"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                    <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarExperienciaDocencia"><span class='glyphicon glyphicon-remove'></span></button>
                                </td>
                            </tr>
                        </tbody>                          
                    </table>
                </div>
                <div class="modal fade" id="md_experiencia_docencia" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaExperienciaDocencia();">&times;</button>
                                <h4 class="modal-title">Experiencia docencia </h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div class="row">
                                    <div id="alert_experiencia_docencia"></div>
                                    <div class="alert alert-success" role="alert" id="divMensajeInstitucionExteriorExperienciaDocencia">
                                        <strong>Nueva Institución,</strong> si su institución educativa no esta disponible en la lista y desea agregarla debe presionar clic sobre el botón 
                                                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#">
                                             <span class="glyphicon glyphicon-plus"></span>   
                                        </button>
                                    </div>                                
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="trabajoActualDocencia">¿En su trabajo actual?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que si estas trabajando actual">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="trabajoActualDocencia"  data-title="true" id="btnTrabajoActualExperienciaDocenciaSi">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="trabajoActualDocencia"  data-title="false" id="btnTrabajoActualExperienciaDocenciaNo">No</a>
                                            </div>
                                            <input type="hidden" name="trabajoActualDocencia" id="trabajoActualDocencia" value="false">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="experienciaDocenciaFNSP">¿En la Facultad Nacional Salud p&uacute;blica?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas trabajando en la Facultad nacional salud pública">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaDocenciaFNSP"  data-title="true" id="btnExperienciaDocenciaFNSPSi" >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaDocenciaFNSP"  data-title="false" id="btnExperienciaDocenciaFNSPNo" >No</a>
                                            </div>
                                            <input type="hidden" name="experienciaDocenciaFNSP" id="experienciaDocenciaFNSP" value="false">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="experienciaDocenciaExterior">¿En exterior?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar si la experiencia es en el exterior">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaDocenciaExterior"  data-title="true" id="btnExperienciaDocenciaExteriorSi" >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaDocenciaExterior"  data-title="false" id="btnExperienciaDocenciaExteriorNo" >No</a>
                                            </div>
                                            <input type="hidden" name="experienciaDocenciaExterior" id="experienciaDocenciaExterior" value="false">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de su institución">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <div class="form-inline">
                                            <select style="width: 80%;" name="institucionExperienciaDocenciaColombiana" id="institucionExperienciaDocenciaColombiana" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="institucion" items="${institucionesEducativasColombianas}">
                                                <option value="${institucion.getId()}">${institucion.getNombre()}</option>
                                                </c:forEach>                                            
                                            </select>
                                            <select style="width: 80%;" name="institucionExperienciaDocenciaExterior" id="institucionExperienciaDocenciaExterior" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="institucion" items="${institucionesEducativasExterior}">
                                                <option value="${institucion.getId()}">${institucion.getNombre()}</option>
                                                </c:forEach>                                            
                                            </select>
                                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevaInstitucionExteriorExperienciaDocencia" onclick="nuevaInstitucionExteriorExperienciaDocencia();"><span class="glyphicon glyphicon-plus"></span></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <legend>Cursos ofrecidos</legend>
                                        <label>Agregar curso</label>
                                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoCursoExperienciaDocencia();" ><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">                                           
                                        <div class="table-responsive">
                                            <br>
                                            <div id="alert_cursos_experiencia_docencia"></div>
                                            <table class="table tabla table-hover tableestilo">
                                                <thead>
                                                    <tr>
                                                        <th>Curso</th>
                                                        <th>N&uacute;cleo b&aacute;sico del conocimiento</th>
                                                        <th>Nivel</th>
                                                        <th>Modalidad</th>
                                                        <th>N° de horas</th>
                                                        <th>Certificado</th>
                                                        <th style="width: 180px;">Opciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: { data: cursosExperienciaDocencia }">
                                                    <tr class="table-row">
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombreCurso" ></span>
                                                        </td>
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombreNucleoBasicoConocimiento" ></span>
                                                        </td>
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombreNivelEstudio"></span>
                                                        </td>
                                                        <td style="width: 10%">
                                                            <span data-bind="text: nombreModalidad" ></span>
                                                        </td>
                                                        <td style="width: 10%">
                                                            <span data-bind="text: numeroHoras" ></span>
                                                        </td>
                                                        <td style="width: 10%" align="center">
                                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoCursoExperienciaDocencia" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                                        </td>
                                                        <td style='white-space: nowrap; width: 10%' align="center">
                                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCursoExperienciaDocencia"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarCursoExperienciaDocencia"><span class='glyphicon glyphicon-remove'></span></button>
                                                        </td>
                                                    </tr>
                                                </tbody>                                                        
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarExperienciaDocencia">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaExperienciaDocencia();">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--Fin modal experiencia docencia en salud-->
                <div class="modal fade" id="md_curso_experiencia_docencia" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaCursoExperienciaDocencia();">&times;</button>
                                <h4 class="modal-title">Curso</h4>
                            </div>
                            <div class="modal-body">
                                <div id="alert_curso_experiencia_docencia"></div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        <label>Nombre del curso</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del curso que han enseñado">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="text" name="nombreCursoExperienciaDocencia" id="nombreCursoExperienciaDocencia" class="form-control" maxlength="250" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-inline">
                                            <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcloe básico del conocimiento">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" name="nombreNucleoBasicoConocimientoCursoExperienciaDocencia" id="nombreNucleoBasicoConocimientoCursoExperienciaDocencia" class="form-control" style="width: 80%;" readonly>
                                            <input type="hidden" name="nucleoBasicoConocimientoCursoExperienciaDocencia" id="nucleoBasicoConocimientoCursoExperienciaDocencia" />
                                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoCursoExperienciaDocencia','nombreNucleoBasicoConocimientoCursoExperienciaDocencia')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Modalidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la modalidad del curso">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="modalidadCursoExperienciaDocencia" id="modalidadCursoExperienciaDocencia">
                                                <option></option>
                                                <c:forEach var="modalidad" items="${modalidadesCurso}">
                                                <option value="${modalidad.getId()}">${modalidad.getNombre()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select name="nivelEstudioCursoExperienciaDocencia" id="nivelEstudioCursoExperienciaDocencia" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                            <option value=""></option>
                                            <c:forEach var="nivelFormacion" items="${nivelesFormacion}">
                                            <option value="${nivelFormacion.getId()}">${nivelFormacion.getNombre()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>N&uacute;mero de horas</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de horas del curso">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="numeroHorasCursoExperienciaDocencia" id="numeroHorasCursoExperienciaDocencia" class="form-control" maxlength="5" >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="">A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el año del curso">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select name="anyoCursoExperienciaDocencia" id="anyoCursoExperienciaDocencia" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group form-inline">
                                            <label>Documento de soporte/Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del curso">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoCursoExperienciaDocencia" id="certificadoCursoExperienciaDocencia" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarCursoExperienciaDocencia">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaCursoExperienciaDocencia();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>
            <div id="forminves" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" class="btn btn-success">Investigaci&oacute;n/Innovaci&oacute;n</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>¿Es investigador reconocido por Colciencias?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el investigador reconocido colciencia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                            <div id="radioBtn" class="btn-group" style="margin-left: 50px;">
                                <c:if test = "${hojaVida.isInvestigadorReconocidoColciencias()}">
                                <a class="btn btn-primary btn-sm active" data-toggle="investigadorReconocidoColciencias" data-title="true" id="btnInvestigadorReconocidoColcienciasSi">Si</a>
                                <a class="btn btn-primary btn-sm notActive" data-toggle="investigadorReconocidoColciencias" data-title="false" id="btnInvestigadorReconocidoColcienciasNo">No</a>
                                </c:if>
                                <c:if test = "${!hojaVida.isInvestigadorReconocidoColciencias()}">
                                <a class="btn btn-primary btn-sm notActive" data-toggle="investigadorReconocidoColciencias" data-title="true" id="btnInvestigadorReconocidoColcienciasSi">Si</a>
                                <a class="btn btn-primary btn-sm active" data-toggle="investigadorReconocidoColciencias" data-title="false" id="btnInvestigadorReconocidoColcienciasNo">No</a>
                                </c:if>
                            </div>
                            <form:hidden path="investigadorReconocidoColciencias" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">    
                            <label>Curr&iacute;culum vitae de latinoamerica y el caribe (CVLAC)</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el Curr&iacute;culum vitae de latinoamerica y el caribe (CVLAC) ">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <div class="form-inline">    
                                <form:input path="urlCVLAC" class="form-control" maxlength="500" style="width:90%"/>
                                <c:if test = "${hojaVida.isUrlCVLACValidada()}">
                                <button id="btnUrlCVLACValidada" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                <button id="btnUrlCVLACNoValidada" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                                <c:if test = "${!hojaVida.isUrlCVLACValidada()}">
                                <button id="btnUrlCVLACValidada" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                <button id="btnUrlCVLACNoValidada" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Tipo de investigador</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de investigador">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <form:select style="width: 100%;" path="tipoInvestigador" class="js-select-basic-single js-states form-control">
                                <form:option value=""></form:option>
                                <form:options items="${tiposInvestigador}" itemLabel="nombre" itemValue="id"/>                                    
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Código ORCID</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el código del sistema Open Researcher and Contributor ID">
                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <form:input path="codigoORCID" maxlength="16" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Identificador Scopus</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el código de Identificación de autor Scopus">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <form:input path="identificadorScopus" class="form-control" maxlength="10"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Researcher Id</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el numero de id Researcher">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <form:input path="researcherId" class="form-control" maxlength="12"/>
                        </div>
                    </div>
                </div>
                <div class="row">

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <legend>Articulos y publicaciones relevantes</legend><br>
                        <label>Agregar artículo</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoArticulo();"><span class="glyphicon glyphicon-plus"></span></button>
                        <br />
                        <div class="table-responsive">
                            <br>
                            <div id="alert_articulos"></div>
                            <table class="table tabla table-hover tableestilo" id="tbearticulo">
                                <thead>
                                    <tr>
                                        <th>T&iacute;tulo</th>
                                        <th>Revista</th>
                                        <th>Enlace</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: articulos }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombre" ></span>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreRevista" ></span>
                                        </td>
                                        <td style="width: 50%">
                                            <span data-bind="text: url" ></span>
                                            <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: validado"><i class="glyphicon glyphicon-ok"></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarArticulo"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarArticulo"><span class='glyphicon glyphicon-remove'></span></button>
                                        </td>
                                    </tr>
                                </tbody>                                     
                            </table>
                        </div>
                    </div>
                    <!-- modal articulo-->
                    <div class="modal fade" id="md_articulo" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button type="button" class="close" onclick="cerrarVentanaArticulo();">&times;</button>
                                    <h4 class="modal-title">Artículo</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_articulo"></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombre</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del artículo que han hecho">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="nombreArticulo" id="nombreArticulo" class="form-control" maxlength="250">
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tipo de autor</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de autor">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="tipoAutorArticulo" id="tipoAutorArticulo">
                                                    <option></option>
                                                    <c:forEach var="tipoAutorArticulo" items="${tiposAutorArticulo}">
                                                    <option value="${tipoAutorArticulo.getId()}">${tipoAutorArticulo.getNombre()}</option>
                                                    </c:forEach>                                                    
                                                </select>
                                                </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>Nombre de la revista</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del articulo que han hecho">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="nombreRevistaArticulo" id="nombreRevistaArticulo" class="form-control" maxlength="250">
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el a&ntilde;o del articulo">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoArticulo" id="anyoArticulo" class="form-control"></select>
                                            </div> 
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group form-inline">
                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de título obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                <input type="text" name="nombreNucleoBasicoConocimientoArticulo" id="nombreNucleoBasicoConocimientoArticulo" class="form-control" style="width: 80%;" readonly>
                                                <input type="hidden" name="nucleoBasicoConocimientoArticulo" id="nucleoBasicoConocimientoArticulo" />
                                                <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoConocimientoArticulo','nombreNucleoBasicoConocimientoArticulo')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Dirección electrónica (URL)</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el URL del articulo ">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="urlArticulo" id="urlArticulo" class="form-control" maxlength="500">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-bind="click: adicionarArticulo">Agregar</button>
                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaArticulo();">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin de modal articulo-->
                </div>
                <div class="row">
                   <div class="col-md-12">
                    <legend>Patentes</legend>
                    <label>Agregar patente</label>
                    <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaPatente();" ><span class="glyphicon glyphicon-plus"></span></button>
                    <br>
                    <div class="table-responsive">
                        <br>
                        <div id="alert_patentes"></div>
                         <table class="table tabla table-hover tableestilo" id="tbpatente">
                             <thead>
                                 <tr>
                                     <th>Fecha</th>
                                     <th>Tipo</th>
                                     <th>Propiedad compartida</th>
                                     <th>Descripci&oacute;n</th>
                                     <th>Certificado</th>
                                     <th class="opc">Opciones</th>
                                 </tr>
                             </thead>
                            <tbody data-bind="foreach: { data: patentes }">
                                <tr class="table-row">
                                    <td style="width: 10%">
                                        <span data-bind="text: fecha" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreTipo" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: nombrePropiedadCompartida" ></span>
                                    </td>
                                    <td style="width: 35%">
                                        <span data-bind="text: descripcion" ></span>
                                    </td>
                                    <td style="width: 10%" align="center">
                                        <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoPatente" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: documentoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                    </td>
                                    <td style='white-space: nowrap; width: 10%' align="center">
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarPatente"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarPatente"><span class='glyphicon glyphicon-remove'></span></button>
                                    </td>
                                </tr>
                            </tbody>                                     
                         </table>
                     </div>
                    </div>
                </div>
                <div class="modal fade" id="md_patente" role="dialog">
                       <div class="modal-dialog modal-lg">
                           <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button type="button" class="close" onclick="cerrarVentanaPatente();">&times;</button>
                                    <h4 class="modal-title">Patente</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="alert_patente"></div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Fecha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de la patente">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="fechaPatente" id="fechaPatente" class="form-control fecha" maxlength="10">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de patente">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="tipoPatente" id="tipoPatente">
                                                    <option value=""></option>
                                                    <c:forEach var="tipoPatente" items="${tiposPatente}">
                                                    <option value="${tipoPatente.getId()}">${tipoPatente.getNombre()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Propiedad compartida?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del propietario del patente">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="propiedadCompartidaPatente" data-title="true" id="btnPropiedadCompartidaPatenteSi">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="propiedadCompartidaPatente" data-title="false" id="btnPropiedadCompartidaPatenteNo">No</a>
                                                </div>
                                                <input type="hidden" name="propiedadCompartidaPatente" id="propiedadCompartidaPatente">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Clase</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la clase de patente">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="clasePatente" id="clasePatente">
                                                    <option value=""></option>
                                                    <c:forEach var="clasePatente" items="${clasesPatente}">
                                                    <option value="${clasePatente.getId()}">${clasePatente.getNombre()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la descripción de la patente">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <textarea class="form-control" name="descripcionPatente" id="descripcionPatente" maxlength="500"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group form-inline">
                                                <label>Documento del soporte</label>
                                                <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="documentoPatente" id="documentoPatente" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-bind="click: adicionarPatente">Agregar</button>
                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaPatente();">Cancelar</button>
                                </div>
                           </div>
                       </div>
                   </div>
                <div class="row">
                    <div class="col-md-12">
                         <legend>Productos conocimiento</legend>
                         <label>Agregar producto del conocimiento</label>
                         <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevoProductoConocimiento();" ><span class="glyphicon glyphicon-plus"></span></button>
                         <br>
                         <div class="table-responsive">
                             <br>
                             <div id="alert_productos_conocimiento"></div>
                             <table class="table tabla table-hover tableestilo" id="tbprodcono">
                                 <thead>
                                     <tr>
                                         <th>Tipo</th>
                                         <th>Cita</th>
                                         <th>Descripci&oacute;n</th>
                                         <th class="cer">Documento</th>
                                         <th class="opc">Opciones</th>
                                     </tr>
                                 </thead>
                                 <tbody data-bind="foreach: { data: productosConocimiento }">
                                     <tr class="table-row">
                                         <td style="width: 30%">
                                             <span data-bind="text: nombreTipo" ></span>
                                         </td>
                                         <td style="width: 30%">
                                             <span data-bind="text: url" ></span>
                                         </td>
                                         <td style="width: 20%">
                                             <span data-bind="text: descripcion" ></span>
                                         </td>
                                         <td style="width: 10%" align="center">
                                             <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoProductoConocimiento" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                             <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: documentoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                         </td>
                                         <td style='white-space: nowrap; width: 10%' align="center">
                                             <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarProductoConocimiento"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                             <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarProductoConocimiento"><span class='glyphicon glyphicon-remove'></span></button>
                                         </td>
                                     </tr>
                                 </tbody>                                     
                             </table>
                         </div>
                    </div>
                </div>
                <div class="modal fade" id="md_producto_conocimiento" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                             <div class="modal-header mhsuccess">
                                 <button type="button" class="close" onclick="cerrarVentanaProductoConocimiento();">&times;</button>
                                 <h4 class="modal-title">Producto del conocimiento</h4>
                             </div>
                             <div class="modal-body">
                                 <div id="alert_producto_conocimiento"></div>
                                 <div class="row">
                                     <div class="col-md-4">
                                         <div class="form-group">
                                             <label>Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo del producto del conocimiento">
                                             <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                             <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="tipoProductoConocimiento" id="tipoProductoConocimiento">
                                                 <option></option>
                                                 <c:forEach var="tipoProductoConocimiento" items="${tiposProductosConocimiento}">
                                                 <option value="${tipoProductoConocimiento.getId()}">${tipoProductoConocimiento.getNombre()}</option>
                                                 </c:forEach>
                                             </select>
                                         </div>
                                     </div>
                                     <div class="col-md-8">
                                         <div class="form-group form-inline">
                                             <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                             <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" name="nombreNucleoBasicoProductoConocimiento" id="nombreNucleoBasicoProductoConocimiento" class="form-control" style="width: 80%;" readonly>
                                            <input type="hidden" name="nucleoBasicoProductoConocimiento" id="nucleoBasicoProductoConocimiento" />
                                            <button type="button" class="btn btn-success btn-sm" onclick="mostrarNucleoBasicoConocimiento('nucleoBasicoProductoConocimiento','nombreNucleoBasicoProductoConocimiento')"  style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                                         </div>
                                     </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-12">
                                         <div class="form-group">
                                             <label>Direcci&oacute;n electr&oacute;nica URL</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la cita">
                                             <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                             <input type="text" name="urlProductoConocimiento" id="urlProductoConocimiento" class="form-control">
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="col-md-12">
                                         <div class="form-group">
                                             <label>Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la descripción del producto del conocimiento">
                                             <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                             <textarea class="form-control" name="descripcionProductoConocimiento" id="descripcionProductoConocimiento" maxlength="500"></textarea>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="col-md-8">
                                         <div class="form-group form-inline">
                                             <label>Documento del soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el documento de soporte del producto del conocimiento">
                                             <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                             <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="documentoProductoConocimiento" id="documentoProductoConocimiento" />
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="modal-footer">
                                 <button type="button" class="btn btn-success" data-bind="click: adicionarProductoConocimiento">Agregar</button>
                                 <button type="button" class="btn btn-success" onclick="cerrarVentanaProductoConocimiento();">Cancelar</button>
                             </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-success" style="float: right; margin-bottom:20px;" type="submit">Guardar</button>        
            </div>                        
            <div id="formdistin" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button class="btn btn-success">Distinciones</button>
                    </div>
                </div>
                <div class="col-md-12">
                    <legend>Distinciones, premios y reconocimientos</legend>  
                    <label>Agregar distinci&oacute;n</label>
                    <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaDistincion();" ><span class="glyphicon glyphicon-plus"></span></button>
                    <br>
                    <div class="table-responsive">
                        <br>
                        <div id="alert_distinciones"></div>
                        <table class="table tabla table-hover tableestilo" id="tbdistin" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th>Instituci&oacute;n otorga</th>
                                    <th>Descripci&oacute;n</th>
                                    <th>Fecha de distinci&oacute;n</th>
                                    <th>Certificado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: { data: distinciones }">
                                <tr class="table-row">
                                    <td style="width: 25%">
                                        <span data-bind="text: institucionOtorga" ></span>
                                    </td>
                                    <td style="width: 25%">
                                        <span data-bind="text: descripcion" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaDistincion" ></span>
                                    </td>
                                    <td style="width: 20%" align="center">
                                        <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoDistincion" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        <a href='#' class="btn btn-success btn-xs" data-toggle="tooltip" title="Validado" data-bind="visible: certificadoValidado"><i class="glyphicon glyphicon-ok"></i></a>
                                    </td>
                                    <td style='white-space: nowrap; width: 10%' align="center">
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarDistincion"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarDistincion"><span class='glyphicon glyphicon-remove'></span></button>
                                    </td>
                                </tr>
                            </tbody>                               
                        </table>
                    </div>
                </div>
                <br>                
                <!--modal distincion-->
                <div class="modal fade" id="md_distincion" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" onclick="cerrarVentanaDistincion();">&times;</button>
                                <h4 class="modal-title">Distinci&oacute;n</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div id="alert_distincion"></div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Fecha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de distinci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 80%;margin-right: -5px;" name="fechaDistincion" id="fechaDistincion" maxlength="10" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="institucionOtorgaDistincion">Instituci&oacute;n otorga</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el nombre de instituci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input  name="institucionOtorgaDistincion" id="institucionOtorgaDistincion" class="form-control" maxlength="250">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="descripcionDistincion">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar la descripción">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <textarea class="form-control" id="descripcionDistincion" name="descripcionDistincion" maxlength="250"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="certificadoDistincion">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el certificado">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <div id="certificadosDistinciones"></div>
                                            <input type="file" accept=".pdf,.png,.jpg,.jpeg" class="form-control" name="certificadoDistincion" id="certificadoDistincion" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bind="click: adicionarDistincion">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaDistincion();">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--fin de modal distincion-->
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
            <div class="modal fade" id="md_institucion_exterior" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header mhsuccess">
                            <button type="button" class="close" onclick="cerrarVentanaInstitucionExterior();">&times;</button>
                            <h4 class="modal-title">Institución</h4>
                        </div>
                        <div class="modal-body">
                            <div id="alert_institucion_exterior"></div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="institucionEducativaExterior">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institución que estudió">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                        <input type="text" name="institucionEducativaExterior" id="institucionEducativaExterior" class="form-control" maxlength="150" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" id="btnAdicionarInstitucionExterior">Agregar</button>
                            <button type="button" class="btn btn-success" onclick="cerrarVentanaInstitucionExterior();">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>                                    
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="idPersona" />
            <input type="hidden" id="tab" name="tab" />
            <input type="hidden" id="consecutivo" name="consecutivo" />
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
                        Actualización Hoja de Vida</h4>
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
<script type="text/javascript">
    var ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN = 1201;
    var ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL = 1219;
    var ID_UNIVERSIDAD_ANTIOQUIA_ANDES = 1220;
    var ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA = 1221;
    var ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO = 1222;
    var ID_UNIVERSIDAD_ANTIOQUIA_TURBO = 1223;
    var ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA = 9125;

    var UNIVERSIDAD_ANTIOQUIA = 'Universidad de Antioquia';
    var TIPO_CERTIFICACION_OTRO = 8;
    var MAXIMO_TAMANYO_ARCHIVO = 2097152;
    var ID_COLOMBIA = 343;
    var ACTVIDAD_ECONOMICA_EDUCACION_SUPERIOR = "8030";
    var TIPO_EMPRESA_PUBLICA = "1";
    var programas = [];
    var nombreCampoCiudad;
    var campoCiudad;
    var campoNucleoBasicoConocimiento;
    var campoNombreNucleoBasicoConocimiento;
    
    var copiaDocumentoIdentificacionCambiado = false;
    var copiaLibretaMilitarCambiado = false;
    var documentoRUTCambiado = false;
    var urlCVLACCambiada = false;
    
    $('.fecha').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true
    });
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });
    
    $(document).ready(function () {
        $('#personal').click(function () {
            $('#formpersonal').css("display", "block");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("personal");
        });
        
        $('#perfillaboral').click(function () {
            $('#formperfilsopor').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("perfillaboral");
        });
        
        $('#academico').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "block");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("academico");
        });
        
        $('#educacioncontinua').click(function () {
            $('#formeducontinua').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("educacioncontinua");
        });
        
        $('#experiencia').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "block");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("experiencia");
        });
        
        $('#investigacion').click(function () {
            $('#forminves').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#tab').val("investigacion");
        });
        
        $('#distinciones').click(function () {
            $('#formdistin').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#tab').val("distinciones");
        });
        
        $('#btnrutsi').click(function () {
            $('#actividadEconomica').prop('disabled', false);
        });
        
        if ($('#disponeRUT').val() === "false") {
            $('#actividadEconomica').prop('disabled', true);
        }
        $('#btnrutno').click(function () {
            $('#actividadEconomica').val("").trigger("change.select2");
            $('#actividadEconomica').prop('disabled', 'disabled');
        });
        
        if ($('#empleadoUDEA').val() === "false") {
            $('#tipoVinculacion').prop('disabled', true);
        }
        $('#btnempleadosi').click(function () {
            $("#tipoVinculacion").prop('disabled', false);
        });
        
        $('#btnempleadono').click(function () {
            $("#tipoVinculacion").prop('disabled', 'disabled');
            $('#tipoVinculacion').val("").trigger("change.select2");
        });
        
        $('#tipoCertificacionIdioma').change(function(){
            var valor = $(this).val();
            if(valor === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }
        });   
        
        $('#btnGraduadoSiEducacionBasica').click(function(){
          $('#anyoFinalizacionEducacionBasica').prop('disabled', false);
        });
        
        $('#btnGraduadoNoEducacionBasica').click(function(){
          $('#anyoFinalizacionEducacionBasica').prop('disabled', 'disabled');
          $('#anyoFinalizacionEducacionBasica').val("");
        });
        
        $('#btnTituloExteriorSiEducacionSuperior').click(function(){
          $('#paistit').css("display","block");
          $('#certhomo').css('display','block');
          $('#btnNuevoProgramaExterior').show();
          $('#divProgramaExterior').show();
          $('#institucionEducativaProgramaExterior').next(".select2-container").show();
          $('#institucionEducativaProgramaColombiana').next(".select2-container").hide();
        });
        
        $('#btnTituloExteriorNoEducacionSuperior').click(function(){
          $('#paistit').css("display", "none");
          $('#certhomo').css('display', 'none');
          $('#btnNuevoProgramaExterior').hide();
          $('#divProgramaExterior').hide();
          $('#paisTituloExteriorEducacionSuperior').val('').trigger("change.select2");
          $('#institucionEducativaProgramaExterior').next(".select2-container").hide();
          $('#institucionEducativaProgramaColombiana').next(".select2-container").show();
        });  
        
        $('#btnGraduadoSiEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', false);
          $('#fechaTituloEducacionSuperior').prop('disabled', false);
        });
        
        $('#btnGraduadoNoEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', 'disabled');
          $('#anyoFinalizacionEducacionSuperior').val("");
          $('#fechaTituloEducacionSuperior').prop('disabled', 'disabled');
          $('#fechaTituloEducacionSuperior').val("");
        });
        
        $('#btnAdicionarPrograma').click(function(){
          var institucion = $('#institucionEducativaProgramaColombiana').val();
          var nombreInstitucion = $('#institucionEducativaProgramaColombiana option:selected').text();
          if(strToBool($('#tituloExteriorEducacionSuperior').val())) {
            institucion = $('#institucionEducativaProgramaExterior').val();
            nombreInstitucion = $('#institucionEducativaProgramaExterior option:selected').text();
          }
          var programaCursado = $('#programaCursado').val();
          var nombreProgramaCursado = $('#programaCursado option:selected').text();
          var nucleoBasicoConocimientoPrograma = $('#nucleoBasicoConocimientoPrograma').val();
          var nombreNucleoBasicoConocimientoPrograma = $('#nombreNucleoBasicoConocimientoPrograma').val();
          var tituloPrograma = $('#tituloPrograma').val();

          $('#formprograma').show();
          
          $('#institucionEducacionSuperior').val(institucion);
          $('#nombreInstitucionEducacionSuperior').val(nombreInstitucion);
          $('#programaCursadoEducacionSuperior').val(programaCursado);
          $('#nombreProgramaCursadoEducacionSuperior').val(nombreProgramaCursado);
          $('#nucleoBasicoConocimientoEducacionSuperior').val(nucleoBasicoConocimientoPrograma);
          $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(nombreNucleoBasicoConocimientoPrograma);
          $('#tituloEducacionSuperior').val(tituloPrograma);

          $('#nucleoBasicoConocimientoPrograma').val("");
          $('#nombreNucleoBasicoConocimientoPrograma').val("");
          $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
          $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
          $('#programaCursado').val("").trigger("change.select2");
          $('#tituloPrograma').val("");
          
          $('#md_programa').modal('hide');
        });
        
        $('#btnAdicionarProgramaExterior').click(function(){
          var institucion = $('#nombreInstitucionEducativaProgramaExterior').val();
          var programaCursado = $('#programaCursadoExterior').val();
          var nucleoBasicoConocimientoPrograma = $('#nucleoBasicoConocimientoProgramaExterior').val();
          var nombreNucleoBasicoConocimientoPrograma = $('#nombreNucleoBasicoConocimientoProgramaExterior').val();
          var tituloPrograma = $('#tituloProgramaExterior').val();
          var nivel = $('#nivelEstudioEducacionSuperior').val();

        if (institucion === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar la institución');
            return false;
        }
        
        if (programaCursado === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar el programa cursado');
            return false;
        }

        if (nucleoBasicoConocimientoPrograma === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar núcleo básico de conocimiento');
            return false;
        }

        if (tituloPrograma === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar el título');
            return false;
        }

        var formData = new FormData();
        formData.append("nombre", programaCursado);
        formData.append("institucion", institucion);
        formData.append("nivel", nivel);
        formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoPrograma);
        formData.append("titulo", tituloPrograma);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/programa",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response !== "") {
                    var respuesta = JSON.parse(response);
                    
                    $('#institucionEducacionSuperior').val("");
                    $('#nombreInstitucionEducacionSuperior').val(institucion);
                    $('#programaCursadoEducacionSuperior').val(respuesta.id);
                    $('#nombreProgramaCursadoEducacionSuperior').val(programaCursado);
                    $('#nucleoBasicoConocimientoEducacionSuperior').val("");
                    $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(nombreNucleoBasicoConocimientoPrograma);
                    $('#tituloEducacionSuperior').val(tituloPrograma);
                    $('#formprograma').show();
                    $('#md_programa_exterior').modal('hide');
                    $('#md_programa').modal('hide');
                } else {
                    bootstrap_alert_programa_exterior.warning("Error al almacenar el programa.");
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_programa_exterior.warning("Error al almacenar el programa.");
            }});
        });

        $('#btnEstudioExteriorSiEducacionContinua').click(function(){
          $('#institucionEducacionContinuaExterior').next(".select2-container").show();
          $('#institucionEducacionContinuaColombiana').next(".select2-container").hide();
          $('#btnNuevaInstitucionExteriorEducacionContinua').show();
          $('#divMensajeInstitucionExteriorEducacionContinua').show();
        });
        
        $('#btnEstudioExteriorNoEducacionContinua').click(function(){
          $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
          $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
          $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
          $('#divMensajeInstitucionExteriorEducacionContinua').hide();
        }); 

        $('#btnAdicionarInstitucionExterior').click(function(){
            var institucion = $('#institucionEducativaExterior').val();
            if (institucion === "") {
                bootstrap_alert_institucion_exterior.warning('Debe ingresar la institución');
                return false;
            }
        
            var formData = new FormData();
            formData.append("nombre", institucion);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/institucion",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response !== "") {
                        var respuesta = JSON.parse(response);
                        $('#' + institucionEducacionExterior).append('<option value=' + respuesta.id + '>' + institucion + '</option>');
                        $('#' + institucionEducacionExterior).val(respuesta.id).trigger("change.select2");
                        $('#md_institucion_exterior').modal('hide');
                    } else {
                        bootstrap_alert_institucion_exterior.warning("Error al almacenar la institución.");
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_institucion_exterior.warning("Error al almacenar la institución.");
                }});
        });

        $('#btnAdicionarCiudadExtranjera').click(function(){
          var pais = $('#pais').val();
          var departamento = $('#departamento').val();
          var nombreCiudad = $('#ciudadExtranjera').val();

          if (nombreCiudad === "") {
             bootstrap_alert_ciudad_extranjera.warning('Debe ingresar la ciudad');
            return false;
          }
        
        var formData = new FormData();
        formData.append("pais", pais);
        formData.append("departamento", departamento);
        formData.append("nombre", nombreCiudad);
        
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/ciudad",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response !== "") {
                    var ciudad = JSON.parse(response);
                    $('#departamento').find('option').remove();
                    $('#departamento').append('<option></option>');
                    $('#departamento').append('<option value=' + ciudad.departamento + '>SIN ESPECIFICAR</option>');
                    $('#departamento').val(ciudad.departamento).trigger("change.select2");

                    $('#ciudad').find('option').remove();
                    $('#ciudad').append('<option></option>');
                    $('#ciudad').append('<option value=' + ciudad.id + '>' + nombreCiudad + '</option>');
                    $('#ciudad').val(ciudad.id).trigger("change.select2");
                    
                    $('#md_ciudad_extranjera').modal('hide');
                    seleccionarUbicacion();
                } else {
                    bootstrap_alert_ciudad_extranjera.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_ciudad_extranjera.warning("Error al almacenar la ciudad.");
            }});
        });
        
        $('#btnExperienciaDocenciaFNSPSi').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
            $('#institucionExperienciaDocenciaColombiana').val(ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN).trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', 'disabled');
        });
        $('#btnExperienciaDocenciaFNSPNo').click(function () {
            $('#institucionExperienciaDocenciaColombiana').val("").trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
        });
        $('#btnExperienciaDocenciaExteriorSi').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").show();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").hide();
            $('#btnNuevaInstitucionExperienciaDocenciaExterior').show();
            $('#institucionExperienciaDocenciaColombiana').val("").trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
            $('#btnExperienciaDocenciaFNSPNo').removeClass('notActive').addClass('active');  
            $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive'); 
            $('#experienciaDocenciaFNSP').val("false");
            $('#btnNuevaInstitucionExteriorExperienciaDocencia').show();
            $('#divMensajeInstitucionExteriorExperienciaDocencia').show();
        });
        $('#btnExperienciaDocenciaExteriorNo').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
            $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
            $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
        });
        $('#btnTrabajoActualExperienciaLaboralSi').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
            $('#fechaRetiroExperienciaLaboral').val('');
        });
        $('#btnTrabajoActualExperienciaLaboralNo').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
        });
        $('#btnExperienciaLaboralFNSPSi').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val(UNIVERSIDAD_ANTIOQUIA);
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
            $('#tipoEmpresaExperienciaLaboral').val(TIPO_EMPRESA_PUBLICA).trigger('change.select2');
            $('#tipoEmpresaExperienciaLaboral').prop('disabled', 'disabled');
            $('#actividadEconomicaExperienciaLaboral').val(ACTVIDAD_ECONOMICA_EDUCACION_SUPERIOR).trigger('change.select2');
            $('#actividadEconomicaExperienciaLaboral').prop('disabled', 'disabled');
        });
        $('#btnExperienciaLaboralFNSPNo').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val("");
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
            $('#tipoEmpresaExperienciaLaboral').val("").trigger('change.select2');
            $('#tipoEmpresaExperienciaLaboral').prop('disabled', false);
            $('#actividadEconomicaExperienciaLaboral').val("").trigger('change.select2');
            $('#actividadEconomicaExperienciaLaboral').prop('disabled', false);
        });
        $('#radrural').change(function () {
            var valor = $(this).val();
            if (valor === "rural")
            {
                $('#formrural').css("display", "block");
                $('#formurbana').css("display", "none");
                $('#radurbano').prop('checked', false);
            }
        });
        $('#radurbano').change(function () {
            var valor = $(this).val();
            if (valor === "urbano")
            {
                $('#formurbana').css("display", "block");
                $('#formrural').css("display", "none");
                $('#radrural').prop('checked', false);
            }
        });
        $('#fechaNacimiento').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaExpedicion').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaTituloEducacionSuperior').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaIngresoExperienciaLaboral').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaRetiroExperienciaLaboral').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaPatente').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaDistincion').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
       
        $('#numeroCuentaBancaria').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroHorasEducacionContinua').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroHorasCursoExperienciaDocencia').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#pin_scopus').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroIdentificacion').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#libretaMilitar').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroTelefono').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numdir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#num2dir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#num3dir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#puntajeCertificacionIdioma').change(function () {
            var decimalOnly = /^\s*[0-9]\d*(\.\d+)?\s*$/;
            if(!decimalOnly.test(this.value)) {
                this.value = '';
            }
        });
        
        $('#dircalle').change(function () {
            actualizarDireccion();
        });
        $('#numdir').change(function () {
            actualizarDireccion();
        });
        $('#letdir').change(function () {
            actualizarDireccion();
        });
        $('#dirsur').change(function () {
            actualizarDireccion();
        });
        $('#num2dir').change(function () {
            actualizarDireccion();
        });
        $('#let2dir').change(function () {
            actualizarDireccion();
        });
        $('#direst').change(function () {
            actualizarDireccion();
        });
        $('#num3dir').change(function () {
            actualizarDireccion();
        });
        $('#dirurb').change(function () {
            actualizarDireccion();
        });
        $('#anyoInicioEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoInicioEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoEducacionContinua').append($('<option/>').val('').html(''));
        $('#anyoCursoExperienciaDocencia').append($('<option/>').val('').html(''));
        $('#anyoArticulo').append($('<option/>').val('').html(''));
        for (i = new Date().getFullYear(); i > 1800; i--) {
            $('#anyoInicioEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoInicioEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoEducacionContinua').append($('<option/>').val(i).html(i));
            $('#anyoCursoExperienciaDocencia').append($('<option/>').val(i).html(i));
            $('#anyoArticulo').append($('<option/>').val(i).html(i));
        }
        $('#adddireccion').click(function () {
            if ($('#radrural').is(':checked')) {
                var dirrural = $('#dirrural').val();
                $('#direccion').val(dirrural);
                $('#md_direccion').modal('hide');
                $('#radurbano').prop('checked', false);
            }
            if ($('#radurbano').is(':checked')) {
                var direccion = $('#vistaprevia').val();
                $('#direccion').val(direccion);
                $('#md_direccion').modal('hide');
                $('#radrural').prop('checked', false);
            }
        });
        $('#institucionEducativaProgramaColombiana').change(function () {
           obtenerProgramasCursados($('#institucionEducativaProgramaColombiana').val());
        });
        $('#institucionEducativaProgramaExterior').change(function () {
           obtenerProgramasCursados($('#institucionEducativaProgramaExterior').val());
        });
        
        $('#programaCursado').change(function () {
            var programa = programas.find(function(element) {
                return element.id == $('#programaCursado').val();
            });
            $('#tituloPrograma').val(programa.titulo);
            $('#nucleoBasicoConocimientoPrograma').val(programa.nucleoBasicoConocimiento);
            $('#nombreNucleoBasicoConocimientoPrograma').val(programa.nombreNucleoBasicoConocimiento);
        });
        
        $('#btnInvestigadorReconocidoColcienciasSi').click(function () {
            $("#tipoInvestigador").prop('disabled', false);
        });
        
        $('#btnInvestigadorReconocidoColcienciasNo').click(function () {
            $("#tipoInvestigador").prop('disabled', 'disabled');
            $('#tipoInvestigador').val("").trigger("change.select2");
        });
        
        if ($('#investigadorReconocidoColciencias').val() === "false") {
           $('#tipoInvestigador').prop('disabled', true);
        }
        
        $('#copiaDocumentoIdentificacion').change(function () {
           copiaDocumentoIdentificacionCambiado = true;
           $('#nombreCopiaDocumentoIdentificacion').text($("#copiaDocumentoIdentificacion")[0].files[0].name); 
        });
        
        $('#copiaLibretaMilitar').change(function () {
           copiaLibretaMilitarCambiado = true;
           $('#nombreCopiaLibretaMilitar').text($("#copiaLibretaMilitar")[0].files[0].name); 
        });

        $('#documentoRUT').change(function () {
           documentoRUTCambiado = true;
           $('#nombreDocumentoRUT').text($("#documentoRUT")[0].files[0].name); 
        });

        $('#urlCVLAC').change(function () {
           urlCVLACCambiada = true;
        });

        <c:if test = "${tab != null}">
        $('#${tab}').click();
        </c:if>
    });

    function actualizarDireccion() {
      var direccion = $('#dircalle').val() + ' ' + $('#numdir').val() + ' ' + $('#letdir').val() + ' ' +  $('#dirsur').val();
      if($('#num2dir').val() !== '' || $('#let2dir').val() !== '' || $('#direst').val() !== '' || $('#num3dir').val() !== '') {
        direccion = direccion + ' # ';  
      }
      direccion = direccion + $('#num2dir').val() + ' ' + $('#let2dir').val() + ' ' + $('#direst').val();
      if($('#num3dir').val() !== '') {
        direccion = direccion + ' - ' +  $('#num3dir').val();
      }
      direccion = direccion + ' ' +  $('#dirurb').val();
      $("#vistaprevia").val(direccion);
    }

    function mostrarUbicacionModal(nombreCampo, campo) {
        nombreCampoCiudad = nombreCampo;
        campoCiudad = campo;
        if($('#pais').val() != "" && $('#pais').val() != ID_COLOMBIA) {
          $('#btnNuevaCiudadExtranjera').show();   
        } else {
          $('#btnNuevaCiudadExtranjera').hide();   
        }
        $('#ubicacionModal').modal({backdrop: 'static', keyboard: false})  ;
    }

    function seleccionarUbicacion() {
        var pais = $('#pais option:selected').text().toUpperCase();
        var dep = $('#departamento option:selected').text().toUpperCase();
        var ciu = $('#ciudad option:selected').text().toUpperCase();
        $('#' + campoCiudad).val($('#ciudad').val());
        if(dep != "SIN ESPECIFICAR") {
           $('#' + nombreCampoCiudad).val(pais + " - " + dep + " - " + ciu);
        }
        else {
           $('#' + nombreCampoCiudad).val(pais + " - " + ciu); 
        }
        $('#ubicacionModal').modal('hide');
    }

    function mostrarNucleoBasicoConocimiento(campo, nombreCampo) {
        campoNucleoBasicoConocimiento = campo;
        nombreCampoNucleoBasicoConocimiento = nombreCampo;
        $('#nucleoBasicoConocimiento').val('');
        $('#md_nucleo_basico_conocimiento').modal({backdrop: 'static', keyboard: false});
    }

    function seleccionarNucleoBasicoConocimiento() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimiento').val();
        var nombreNucleoBasicoConocimiento = $('#nucleoBasicoConocimiento option:selected').text();
        $('#' + campoNucleoBasicoConocimiento).val(nucleoBasicoConocimiento); 
        $('#' + nombreCampoNucleoBasicoConocimiento).val(nombreNucleoBasicoConocimiento); 
         
        $('#md_nucleo_basico_conocimiento').modal('hide');
    }

    function buscarDepartamentos(idPais) {
        if(idPais != ID_COLOMBIA) {
          $('#btnNuevaCiudadExtranjera').show();   
          $('#divDepartamento').hide();   
        } else {
          $('#btnNuevaCiudadExtranjera').hide();   
          $('#divDepartamento').show();
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/departamentosPais/" + idPais,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#departamento').find('option').remove();
                    $('#ciudad').find('option').remove();
                    $('#departamento').append('<option></option>');
                    var departamentos = JSON.parse(response);
                    for (var i = 0; i < departamentos.length; i++) {
                        $('#departamento').append('<option value=' + departamentos[i].id + '>' + departamentos[i].nombre + '</option>');
                    }
                    
                    if(departamentos.length == 1) {
                        $('#departamento').val(departamentos[0].id).trigger('change.select2');
                    }
                }
            }});
    }

    function buscarCiudades(codigoDepartamento) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/ciudadesDepartamento/" + codigoDepartamento,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#ciudad').find('option').remove();
                    $('#ciudad').append('<option></option>');
                    var ciudades = JSON.parse(response);
                    for (var i = 0; i < ciudades.length; i++) {
                        $('#ciudad').append('<option value=' + ciudades[i].id + '>' + ciudades[i].nombre + '</option>');
                    }
                    if(ciudades.length == 1) {
                        $('#ciudad').val(ciudades[0].id).trigger('change.select2');
                    }                    
                }
            }});
    }

    var HojaVidaModel = function (correosElectronicos, 
                                  cuentasBancarias, 
                                  telefonos,
                                  documentosSoporte,
                                  idiomas,
                                  educacionesBasicas,
                                  educacionesSuperiores,
                                  educacionesContinuas,
                                  distinciones,
                                  experienciasLaborales,
                                  experienciasDocencia,
                                  articulos,
                                  patentes,
                                  productosConocimiento) {
        self = this;
        self.correosElectronicos = ko.observableArray(correosElectronicos);
        self.cuentasBancarias = ko.observableArray(cuentasBancarias);
        self.telefonos = ko.observableArray(telefonos);
        self.documentosSoporte = ko.observableArray(documentosSoporte);
        self.idiomas = ko.observableArray(idiomas);
        self.educacionesBasicas = ko.observableArray(educacionesBasicas);
        self.educacionesSuperiores = ko.observableArray(educacionesSuperiores);
        self.educacionesContinuas = ko.observableArray(educacionesContinuas);
        self.distinciones = ko.observableArray(distinciones);
        self.experienciasLaborales = ko.observableArray(experienciasLaborales);
        self.experienciasDocencia = ko.observableArray(experienciasDocencia);
        self.consecutivoExperienciaDocencia = ko.observable(0);
        self.cursosExperienciaDocencia = ko.computed(function() {
           var cursos = [];
           if(self.experienciasDocencia().length > 0 && self.experienciasDocencia().length > self.consecutivoExperienciaDocencia()) {
             for(i = 0; i < self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length; i++) {
               cursos[i] = self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia()[i]; 
             }
           }
           return cursos;
        });
        self.articulos = ko.observableArray(articulos);
        self.patentes = ko.observableArray(patentes);
        self.productosConocimiento = ko.observableArray(productosConocimiento);

        self.adicionarCorreoElectronico = function () {
            var correoElectronico = $('#correoElectronico').val();
            if (correoElectronico === "") {
                bootstrap_alert_correo_electronico.warning('Debe ingresar el correo electrónico');
                return false;
            }
            if (!validarCorreoElectronico(correoElectronico)) {
                bootstrap_alert_correo_electronico.warning('Debe ingresar un correo electrónico válido');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.correosElectronicos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.correosElectronicos().length; i++) {
                    if (self.correosElectronicos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.correosElectronicos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("correoElectronico", correoElectronico);
            
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/correoElectronico",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_correo_electronico').modal('hide');
                    bootstrap_alert_correos_electronicos.success('Correo electrónico almacenado correctamente.');
                    if (response !== "") {
                        self.correosElectronicos.removeAll();
                        var correosElectronicos = JSON.parse(response);
                        for (var i = 0; i < correosElectronicos.length; i++) {
                            self.correosElectronicos.push(
                                {
                                    id: ko.observable(correosElectronicos[i].id),
                                    consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                                    correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_correos_electronicos.warning("Error al almacenar el correo electrónico.");
                }});
        };

        self.eliminarCorreoElectronico = function (correoElectronico) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarCorreoElectronico/" + correoElectronico.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_correos_electronicos.success("Correo electrónico eliminado exitosamente.");
                    self.correosElectronicos.removeAll();
                    var correosElectronicos = JSON.parse(response);
                    for (var i = 0; i < correosElectronicos.length; i++) {
                        self.correosElectronicos.push(
                            {
                                id: ko.observable(correosElectronicos[i].id),
                                consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                                correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
                            }
                         );
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_correos_electronicos.warning("Error al eliminar el correo electrónico.");
                }});
        };

        self.editarCorreoElectronico = function (correoElectronico) {
            $('#correoElectronico').val(correoElectronico.correoElectronico());
            $('#consecutivo').val(correoElectronico.consecutivo());
            bootstrap_alert_correo_electronico.removeWarning();
            bootstrap_alert_correos_electronicos.removeWarning();
            $('#md_correo_electronico').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarCuentaBancaria = function () {
            var tipoCuentaBancaria = $('#tipoCuentaBancaria').val();
            var nombreTipoCuentaBancaria = $('#tipoCuentaBancaria option:selected').text();
            var numeroCuentaBancaria = $('#numeroCuentaBancaria').val();
            var entidadCuentaBancaria = $('#entidadCuentaBancaria').val();

            if (tipoCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar el tipo de cuenta bancaria');
                return false;
            }
            if (numeroCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar el número de cuenta bancaria');
                return false;
            }
            if (entidadCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar la entidad cuenta bancaria');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.cuentasBancarias().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.cuentasBancarias().length; i++) {
                    if (self.cuentasBancarias()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.cuentasBancarias()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipo", tipoCuentaBancaria);
            formData.append("numero", numeroCuentaBancaria);
            formData.append("entidad", entidadCuentaBancaria);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/cuentaBancaria",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_cuenta_bancaria').modal('hide');
                    bootstrap_alert_cuentas_bancarias.success('Cuenta bancaria almacenada correctamente.');
                    if (response !== "") {
                        self.cuentasBancarias.removeAll();
                        var cuentasBancarias = JSON.parse(response);
                        for (var i = 0; i < cuentasBancarias.length; i++) {
                            self.cuentasBancarias.push(
                                {
                                    id: ko.observable(cuentasBancarias[i].id),
                                    consecutivo: ko.observable(cuentasBancarias[i].consecutivo),
                                    tipo: ko.observable(cuentasBancarias[i].tipo),
                                    nombreTipo: ko.observable(cuentasBancarias[i].nombreTipo),
                                    numero: ko.observable(cuentasBancarias[i].numero),
                                    entidad: ko.observable(cuentasBancarias[i].entidad)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cuentas_bancarias.warning("Error al almacenar la cuenta bancaria.");
                }});
        };

        self.eliminarCuentaBancaria = function (cuentaBancaria) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarCuentaBancaria/" + cuentaBancaria.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_cuentas_bancarias.success('Cuenta bancaria eliminada correctamente.');
                    if (response !== "") {
                        self.cuentasBancarias.removeAll();
                        var cuentasBancarias = JSON.parse(response);
                        for (var i = 0; i < cuentasBancarias.length; i++) {
                            self.cuentasBancarias.push(
                                {
                                    id: ko.observable(cuentasBancarias[i].id),
                                    consecutivo: ko.observable(cuentasBancarias[i].consecutivo),
                                    tipo: ko.observable(cuentasBancarias[i].tipo),
                                    nombreTipo: ko.observable(cuentasBancarias[i].nombreTipo),
                                    numero: ko.observable(cuentasBancarias[i].numero),
                                    entidad: ko.observable(cuentasBancarias[i].entidad)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cuentas_bancarias.warning("Error al eliminar el cuenta bancaria.");
                }});
        };

        self.editarCuentaBancaria = function (cuentaBancaria) {
            $('#tipoCuentaBancaria').val(cuentaBancaria.tipo()).trigger('change');
            $('#nombreTipoCuentaBancaria').val(cuentaBancaria.nombreTipo());
            $('#numeroCuentaBancaria').val(cuentaBancaria.numero());
            $('#entidadCuentaBancaria').val(cuentaBancaria.entidad());
            $('#consecutivo').val(cuentaBancaria.consecutivo());
            bootstrap_alert_cuenta_bancaria.removeWarning();
            bootstrap_alert_cuentas_bancarias.removeWarning();
            $('#md_cuenta_bancaria').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarTelefono = function () {
            var tipoTelefono = $('#tipoTelefono').val();
            var nombreTipoTelefono = $('#tipoTelefono option:selected').text();
            var numeroTelefono = $('#numeroTelefono').val();

            if (tipoTelefono === "") {
                bootstrap_alert_telefono.warning('Debe ingresar el tipo de teléfono');
                return false;
            }
            if (numeroTelefono === "") {
                bootstrap_alert_telefono.warning('Debe ingresar el número de teléfono');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.telefonos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.telefonos().length; i++) {
                    if (self.telefonos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.telefonos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipo", tipoTelefono);
            formData.append("numero", numeroTelefono);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/telefono",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_telefono').modal('hide');
                    bootstrap_alert_telefonos.success('Teléfono almacenado correctamente.');
                    if (response !== "") {
                        self.telefonos.removeAll();
                        var telefonos = JSON.parse(response);
                        for (var i = 0; i < telefonos.length; i++) {
                            self.telefonos.push(
                                {
                                    id: ko.observable(telefonos[i].id),
                                    consecutivo: ko.observable(telefonos[i].consecutivo),
                                    tipo: ko.observable(telefonos[i].tipo),
                                    nombreTipo: ko.observable(telefonos[i].nombreTipo),
                                    numero: ko.observable(telefonos[i].numero)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_telefonos.warning("Error al almacenar teléfono.");
                }});
        };

        self.eliminarTelefono = function (telefono) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarTelefono/" + telefono.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_telefonos.success('Teléfono eliminado correctamente.');
                    if (response !== "") {
                        self.telefonos.removeAll();
                        var telefonos = JSON.parse(response);
                        for (var i = 0; i < telefonos.length; i++) {
                            self.telefonos.push(
                                {
                                    id: ko.observable(telefonos[i].id),
                                    consecutivo: ko.observable(telefonos[i].consecutivo),
                                    tipo: ko.observable(telefonos[i].tipo),
                                    nombreTipo: ko.observable(telefonos[i].nombreTipo),
                                    numero: ko.observable(telefonos[i].numero)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_telefonos.warning("Error al eliminar el teléfono.");
                }});
        };

        self.editarTelefono = function (telefono) {
            $('#tipoTelefono').val(telefono.tipo()).trigger('change');
            $('#nombreTipoTelefono').val(telefono.nombreTipo());
            $('#numeroTelefono').val(telefono.numero());
            $('#consecutivo').val(telefono.consecutivo());
            bootstrap_alert_telefono.removeWarning();
            $('#md_telefono').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarDocumentoSoporte = function () {
            var tipoDocumento = $('#tipoDocumento').val();
            var nombreTipoDocumento = $('#tipoDocumento option:selected').text();

            if (tipoDocumento === "") {
                bootstrap_alert_documento_soporte.warning('Debe ingresar el tipo de documento');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoSoporte').val() === "") {
                    bootstrap_alert_documento_soporte.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoSoporte')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_documento_soporte.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                
                formData.append("id", 0);
                formData.append("consecutivo", self.documentosSoporte().length);
        
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.documentosSoporte().length; i++) {
                    if (self.documentosSoporte()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoSoporte').val() !== "" &&
                    $('#documentoSoporte')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_documento_soporte.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.documentosSoporte()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipoDocumento", tipoDocumento);
            if ($('#documentoSoporte').val() !== "") {
                formData.append("documento", $('#documentoSoporte')[0].files[0]);
            }

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/documentoSoporte",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_documento_soporte').modal('hide');
                    bootstrap_alert_documentos_soporte.success('Documento almacenado correctamente');
                    if (response !== "") {
                        self.documentosSoporte.removeAll();
                        var documentosSoporte = JSON.parse(response);
                        for (var i = 0; i < documentosSoporte.length; i++) {
                            self.documentosSoporte.push(
                                {
                                    id: ko.observable(documentosSoporte[i].id),
                                    consecutivo: ko.observable(documentosSoporte[i].consecutivo),
                                    tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                                    nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                                    validado: ko.observable(documentosSoporte[i].validado),
                                    nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_documento_soporte.warning("Error al almacenar el documento.");
                }});
        };

        self.eliminarDocumentoSoporte = function (documentoSoporte) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarDocumentoSoporte/" + documentoSoporte.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_documentos_soporte.success("Documento eliminado exitosamente.");
                    if (response !== "") {
                        self.documentosSoporte.removeAll();
                        var documentosSoporte = JSON.parse(response);
                        for (var i = 0; i < documentosSoporte.length; i++) {
                            self.documentosSoporte.push(
                                {
                                    id: ko.observable(documentosSoporte[i].id),
                                    consecutivo: ko.observable(documentosSoporte[i].consecutivo),
                                    tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                                    nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                                    validado: ko.observable(documentosSoporte[i].validado),
                                    nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_documentos_soporte.warning("Error al eliminar el documento.");
                }});
        };

        self.editarDocumentoSoporte = function (documentoSoporte) {
            $('#tipoDocumento').val(documentoSoporte.tipoDocumento()).trigger('change');
            $('#consecutivo').val(documentoSoporte.consecutivo());
            $('#documentoSoporte').val('');
            bootstrap_alert_documentos_soporte.removeWarning();
            bootstrap_alert_documento_soporte.removeWarning();
            $('#md_documento_soporte').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoSoporte = function (documentoSoporte) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoSoporte/" + documentoSoporte.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoSoporte/" + documentoSoporte.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };

        self.adicionarIdioma = function () {
            var idioma = $('#idioma').val();
            var nombreIdioma = $('#idioma option:selected').text();
            var nivelConversacion = "";
            var nombreNivelConversacion = "";
            var nivelEscritura = "";
            var nombreNivelEscritura = "";
            var nivelEscucha = "";
            var nombreNivelEscucha = "";
            var nivelLectura = "";
            var nombreNivelLectura = "";
            if($('#nivelConversacionIdiomaA').is(":checked")) {
              nivelConversacion = "A";
              nombreNivelConversacion = "Alto";
            }
            else if($('#nivelConversacionIdiomaB').is(":checked")) {
              nivelConversacion = "B";
              nombreNivelConversacion = "Bajo";
            }
            else if($('#nivelConversacionIdiomaM').is(":checked")) {
              nivelConversacion = "M";
              nombreNivelConversacion = "Medio";
            }
            if($('#nivelEscrituraIdiomaA').is(":checked")) {
              nivelEscritura = "A";
              nombreNivelEscritura = "Alto";
            }
            else if($('#nivelEscrituraIdiomaB').is(":checked")) {
              nivelEscritura = "B";
              nombreNivelEscritura = "Bajo";
            }
            else if($('#nivelEscrituraIdiomaM').is(":checked")) {
              nivelEscritura = "M";
              nombreNivelEscritura = "Medio";
            }
            if($('#nivelEscuchaIdiomaA').is(":checked")) {
              nivelEscucha = "A";
              nombreNivelEscucha = "Alto";
            }
            else if($('#nivelEscuchaIdiomaB').is(":checked")) {
              nivelEscucha = "B";
              nombreNivelEscucha = "Bajo";
            }
            else if($('#nivelEscuchaIdiomaM').is(":checked")) {
              nivelEscucha = "M";
              nombreNivelEscucha = "Medio";
            }
            if($('#nivelLecturaIdiomaA').is(":checked")) {
              nivelLectura = "A";
              nombreNivelLectura = "Alto";
            }
            else if($('#nivelLecturaIdiomaB').is(":checked")) {
              nivelLectura = "B";
              nombreNivelLectura = "Bajo";
            }
            else if($('#nivelLecturaIdiomaM').is(":checked")) {
              nivelLectura = "M";
              nombreNivelLectura = "Medio";
            }
            var otraCertificacion = $('#otraCertificacionIdioma').val();
            var tipoCertificacion = $('#tipoCertificacionIdioma').val();
            var nombreTipoCertificacion = $('#tipoCertificacionIdioma option:selected').text();
            var puntajeCertificacion = $('#puntajeCertificacionIdioma').val();

            if (idioma === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el idioma');
                return false;
            }
            if (nivelEscucha === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de escucha');
                return false;
            }
            if (nivelConversacion === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de conversación');
                return false;
            }
            if (nivelLectura === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de lectura');
                return false;
            }
            if (nivelEscritura === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de escritura');
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
            if (puntajeCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar el puntaje de certificación');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoIdioma').val() === "") {
                    bootstrap_alert_idioma.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoIdioma')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_idioma.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", 0);
                formData.append("consecutivo", self.idiomas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.idiomas().length; i++) {
                    if (self.idiomas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoIdioma').val() != "" && 
                    $('#certificadoIdioma')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_idioma.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.idiomas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#certificadoIdioma').val() !== "") {
                formData.append("certificado", $('#certificadoIdioma')[0].files[0]);
            }
            formData.append("idioma",idioma);
            formData.append("nivelConversacion",nivelConversacion);
            formData.append("nivelEscritura",nivelEscritura);
            formData.append("nivelEscucha",nivelEscucha);
            formData.append("nivelLectura",nivelLectura);
            formData.append("otraCertificacion",otraCertificacion);
            formData.append("tipoCertificacion",tipoCertificacion);
            formData.append("puntajeCertificacion",puntajeCertificacion);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/idioma",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_idioma').modal('hide');
                    bootstrap_alert_idiomas.success('Idioma almacenado correctamente');
                    if (response !== "") {
                        self.idiomas.removeAll();
                        var idiomas = JSON.parse(response);
                        for (var i = 0; i < idiomas.length; i++) {
                            self.idiomas.push(
                                {
                                    id: ko.observable(idiomas[i].id),
                                    consecutivo: ko.observable(idiomas[i].consecutivo),
                                    idioma: ko.observable(idiomas[i].idioma),
                                    nombreIdioma: ko.observable(idiomas[i].nombreIdioma),
                                    nivelConversacion: ko.observable(idiomas[i].nivelConversacion),
                                    nombreNivelConversacion: ko.observable(idiomas[i].nombreNivelConversacion),
                                    nivelEscritura: ko.observable(idiomas[i].nivelEscritura),
                                    nombreNivelEscritura: ko.observable(idiomas[i].nombreNivelEscritura),
                                    nivelEscucha: ko.observable(idiomas[i].nivelEscucha),
                                    nombreNivelEscucha: ko.observable(idiomas[i].nombreNivelEscucha),
                                    nivelLectura: ko.observable(idiomas[i].nivelLectura),
                                    nombreNivelLectura: ko.observable(idiomas[i].nombreNivelLectura),
                                    otraCertificacion: ko.observable(idiomas[i].otraCertificacion),
                                    tipoCertificacion: ko.observable(idiomas[i].tipoCertificacion),
                                    nombreTipoCertificacion: ko.observable(idiomas[i].nombreTipoCertificacion),
                                    puntajeCertificacion: ko.observable(idiomas[i].puntajeCertificacion),
                                    certificadoValidado: ko.observable(idiomas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(idiomas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_idiomas.warning("Error al almacenar el idioma.");
                }});
        };

        self.eliminarIdioma = function (idioma) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarIdioma/" + idioma.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_idiomas.success("Idioma eliminado exitosamente.");
                    if (response !== "") {
                        self.idiomas.removeAll();
                        var idiomas = JSON.parse(response);
                        for (var i = 0; i < idiomas.length; i++) {
                            self.idiomas.push(
                                {
                                    id: ko.observable(idiomas[i].id),
                                    consecutivo: ko.observable(idiomas[i].consecutivo),
                                    idioma: ko.observable(idiomas[i].idioma),
                                    nombreIdioma: ko.observable(idiomas[i].nombreIdioma),
                                    nivelConversacion: ko.observable(idiomas[i].nivelConversacion),
                                    nombreNivelConversacion: ko.observable(idiomas[i].nombreNivelConversacion),
                                    nivelEscritura: ko.observable(idiomas[i].nivelEscritura),
                                    nombreNivelEscritura: ko.observable(idiomas[i].nombreNivelEscritura),
                                    nivelEscucha: ko.observable(idiomas[i].nivelEscucha),
                                    nombreNivelEscucha: ko.observable(idiomas[i].nombreNivelEscucha),
                                    nivelLectura: ko.observable(idiomas[i].nivelLectura),
                                    nombreNivelLectura: ko.observable(idiomas[i].nombreNivelLectura),
                                    otraCertificacion: ko.observable(idiomas[i].otraCertificacion),
                                    tipoCertificacion: ko.observable(idiomas[i].tipoCertificacion),
                                    nombreTipoCertificacion: ko.observable(idiomas[i].nombreTipoCertificacion),
                                    puntajeCertificacion: ko.observable(idiomas[i].puntajeCertificacion),                   
                                    certificadoValidado: ko.observable(idiomas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(idiomas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_idiomas.warning("Error al eliminar el idioma.");
                }});
        };

        self.editarIdioma = function (idioma) {
            $('#idioma').val(idioma.idioma()).trigger('change');
            $('#nivelConversacionIdioma' + idioma.nivelConversacion()).prop("checked", true); 
            $('#nivelEscrituraIdioma' + idioma.nivelEscritura()).prop("checked", true); 
            $('#nivelEscuchaIdioma' + idioma.nivelEscucha()).prop("checked", true); 
            $('#nivelLecturaIdioma' + idioma.nivelLectura()).prop("checked", true); 
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if($('#tipoCertificacionIdioma').val() === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#puntajeCertificacionIdioma').val(idioma.puntajeCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            $('#certificadoIdioma').show();
            bootstrap_alert_idioma.removeWarning();
            bootstrap_alert_idiomas.removeWarning();
            $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoIdioma = function (idioma) {
           $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoIdioma/" + idioma.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                  if(response != "") {
                      window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoIdioma/" + idioma.id();
                  }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });            
        };
        
        self.adicionarEducacionBasica = function () {
            var nivelEstudioEducacionBasica = $('#nivelEstudioEducacionBasica').val();
            var nombreNivelEducacionBasica = $('#nivelEstudioEducacionBasica option:selected').text();
            var institucionEducacionBasica = $('#institucionEducacionBasica').val();
            var anyoInicioEducacionBasica = $('#anyoInicioEducacionBasica').val();
            var anyoFinalizacionEducacionBasica = $('#anyoFinalizacionEducacionBasica').val();
            var tituloEducacionBasica = $('#tituloEducacionBasica').val();
            var graduadoEducacionBasica = strToBool($('#graduadoEducacionBasica').val());
        
            if (nivelEstudioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if (institucionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar la institución');
                return false;
            }
            if (anyoInicioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionBasica && anyoFinalizacionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de finalización');
                return false;
            }
            
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionBasica').val() === "") {
                    bootstrap_alert_educacion_basica.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionBasica')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_basica.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesBasicas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesBasicas().length; i++) {
                    if (self.educacionesBasicas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoEducacionBasica').val() != "" && 
                    $('#certificadoEducacionBasica')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_basica.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", self.educacionesBasicas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("institucion", institucionEducacionBasica);
            formData.append("nivel", nivelEstudioEducacionBasica);
            formData.append("anyoInicio", anyoInicioEducacionBasica);
            formData.append("anyoFinalizacion", anyoFinalizacionEducacionBasica);
            formData.append("titulo", tituloEducacionBasica);
            formData.append("graduado", graduadoEducacionBasica);
            if ($('#certificadoEducacionBasica').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionBasica')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/educacionBasica",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_basica').modal('hide');
                    bootstrap_alert_educaciones_basicas.success('Educación básica almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesBasicas.removeAll();
                        var educacionesBasicas = JSON.parse(response);
                        for (var i = 0; i < educacionesBasicas.length; i++) {
                            self.educacionesBasicas.push(
                                {
                                    id: ko.observable(educacionesBasicas[i].id),
                                    consecutivo: ko.observable(educacionesBasicas[i].consecutivo),
                                    institucion: ko.observable(educacionesBasicas[i].institucion),
                                    nivel: ko.observable(educacionesBasicas[i].nivel),
                                    nombreNivel: ko.observable(educacionesBasicas[i].nombreNivel),
                                    anyoInicio: ko.observable(educacionesBasicas[i].anyoInicio),
                                    anyoFinalizacion: ko.observable(educacionesBasicas[i].anyoFinalizacion),
                                    titulo: ko.observable(educacionesBasicas[i].titulo),
                                    graduado: ko.observable(educacionesBasicas[i].graduado),
                                    certificadoValidado: ko.observable(educacionesBasicas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesBasicas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_basicas.warning("Error al almacenar la educación básica.");
                }});
        };

        self.eliminarEducacionBasica = function (educacionBasica) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarEducacionBasica/" + educacionBasica.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_basicas.success('Educación básica eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesBasicas.removeAll();
                        var educacionesBasicas = JSON.parse(response);
                        for (var i = 0; i < educacionesBasicas.length; i++) {
                            self.educacionesBasicas.push(
                                {
                                    id: ko.observable(educacionesBasicas[i].id),
                                    consecutivo: ko.observable(educacionesBasicas[i].consecutivo),
                                    institucion: ko.observable(educacionesBasicas[i].institucion),
                                    nivel: ko.observable(educacionesBasicas[i].nivel),
                                    nombreNivel: ko.observable(educacionesBasicas[i].nombreNivel),
                                    anyoInicio: ko.observable(educacionesBasicas[i].anyoInicio),
                                    anyoFinalizacion: ko.observable(educacionesBasicas[i].anyoFinalizacion),
                                    titulo: ko.observable(educacionesBasicas[i].titulo),
                                    graduado: ko.observable(educacionesBasicas[i].graduado),
                                    certificadoValidado: ko.observable(educacionesBasicas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesBasicas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_basicas.warning("Error al eliminar la educación básica.");
                }});
        };

        self.editarEducacionBasica = function (educacionBasica) {
            $('#nivelEstudioEducacionBasica').val(educacionBasica.nivel()).trigger('change');
            $('#institucionEducacionBasica').val(educacionBasica.institucion());
            $('#anyoInicioEducacionBasica').val(educacionBasica.anyoInicio());
            $('#anyoFinalizacionEducacionBasica').val(educacionBasica.anyoFinalizacion()).trigger('change');
            $('#tituloEducacionBasica').val(educacionBasica.titulo());
            $('#graduadoEducacionBasica').val(educacionBasica.graduado());            
            if(educacionBasica.graduado()) {
              $('#btnGraduadoSiEducacionBasica').removeClass('notActive').addClass('active');  
              $('#btnGraduadoNoEducacionBasica').removeClass('active').addClass('notActive');
              $('#anyoFinalizacionEducacionBasica').prop('disabled',false);
            } else {
              $('#btnGraduadoNoEducacionBasica').removeClass('notActive').addClass('active');  
              $('#btnGraduadoSiEducacionBasica').removeClass('active').addClass('notActive');  
              $('#anyoFinalizacionEducacionBasica').prop('disabled','disabled');
            }
            if($('#tipoCertificacionEducacionBasica').val() === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#consecutivo').val(educacionBasica.consecutivo());
            $('#certificadoEducacionBasica').val('');
            bootstrap_alert_educacion_basica.removeWarning();
            bootstrap_alert_educaciones_basicas.removeWarning();
            $('#md_educacion_basica').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoEducacionBasica = function (educacionBasica) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasica/" + educacionBasica.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasica/" + educacionBasica.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarEducacionSuperior = function () {
            var nivelEstudioEducacionSuperior = $('#nivelEstudioEducacionSuperior').val();
            var nombreNivelEducacionSuperior = $('#nivelEstudioEducacionSuperior option:selected').text();
            var tituloExteriorEducacionSuperior = strToBool($('#tituloExteriorEducacionSuperior').val());
            var paisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior').val();
            var nombrePaisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior option:selected').text();
            var programaCursadoEducacionSuperior = $('#programaCursadoEducacionSuperior').val();
            var nombreProgramaCursadoEducacionSuperior = $('#nombreProgramaCursadoEducacionSuperior').val();
            var institucionEducacionSuperior = $('#institucionEducacionSuperior').val();
            var nombreInstitucionEducacionSuperior = $('#nombreInstitucionEducacionSuperior').val();
            var nucleoBasicoConocimientoEducacionSuperior = $('#nucleoBasicoConocimientoEducacionSuperior').val();
            var nombreNucleoBasicoConocimientoEducacionSuperior = $('#nombreNucleoBasicoConocimientoEducacionSuperior').val();
            var anyoInicioEducacionSuperior = $('#anyoInicioEducacionSuperior').val();
            var anyoFinalizacionEducacionSuperior = $('#anyoFinalizacionEducacionSuperior').val();
            var tituloEducacionSuperior = $('#tituloEducacionSuperior').val();
            var graduadoEducacionSuperior = strToBool($('#graduadoEducacionSuperior').val());
            var fechaTituloEducacionSuperior = $('#fechaTituloEducacionSuperior').val();
        
            if (nivelEstudioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if(tituloExteriorEducacionSuperior) {
                if(paisTituloExteriorEducacionSuperior === "") {
                    bootstrap_alert_educacion_superior.warning('Debe seleccionar el país');
                    return false;
                }
                if ($('#consecutivo').val() === "") {    
                    if ($('#certificadoHomologadoEducacionSuperior').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                    if ($('#certificadoHomologadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                        bootstrap_alert_educacion_superior.warning('El certificado homologado no debe ser mayor a 2MB');
                        return false;
                    }                
                } 
            }
            if (programaCursadoEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el programa');
                return false;
            }
            if (anyoInicioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionSuperior && anyoFinalizacionEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de finalización');
                return false;
            }
            if (tituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el título');
                return false;
            }
            if (graduadoEducacionSuperior && fechaTituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar la fecha del título');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionSuperior').val() === "") {
                    bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_superior.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesSuperiores().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesSuperiores().length; i++) {
                    if (self.educacionesSuperiores()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if(tituloExteriorEducacionSuperior && self.educacionesSuperiores()[indice].tituloExterior() === false) {
                    if($('#certificadoHomologadoEducacionSuperior').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                    if ($('#certificadoHomologadoEducacionSuperior').val() != "" && 
                        $('#certificadoHomologadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                        bootstrap_alert_educacion_superior.warning('El certificado homologado no debe ser mayor a 2MB');
                        return false;
                    }                    
                }
                if ($('#certificadoEducacionSuperior').val() != "" && 
                    $('#certificadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_superior.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.educacionesSuperiores()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("institucion",institucionEducacionSuperior);
            formData.append("tituloExterior",tituloExteriorEducacionSuperior);
            formData.append("paisTituloExterior",paisTituloExteriorEducacionSuperior);
            formData.append("nivel",nivelEstudioEducacionSuperior);
            formData.append("programa",programaCursadoEducacionSuperior);
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimientoEducacionSuperior);
            formData.append("anyoInicio",anyoInicioEducacionSuperior);
            formData.append("anyoFinalizacion",anyoFinalizacionEducacionSuperior);
            formData.append("titulo",tituloEducacionSuperior);
            formData.append("graduado",graduadoEducacionSuperior);
            formData.append("fechaTitulo",fechaTituloEducacionSuperior);
            if ($('#certificadoHomologadoEducacionSuperior').val() != "") {
                formData.append("certificadoHomologado", $('#certificadoHomologadoEducacionSuperior')[0].files[0]);
            }
            if ($('#certificadoEducacionSuperior').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionSuperior')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/educacionSuperior",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_superior').modal('hide');
                    bootstrap_alert_educaciones_superiores.success('Educación superior almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesSuperiores.removeAll();
                        var educacionesSuperiores = JSON.parse(response);
                        for (var i = 0; i < educacionesSuperiores.length; i++) {
                            self.educacionesSuperiores.push(
                                {
                                    id: ko.observable(educacionesSuperiores[i].id),
                                    consecutivo: ko.observable(educacionesSuperiores[i].consecutivo),
                                    paisTituloExterior: ko.observable(educacionesSuperiores[i].paisTituloExterior),
                                    nombrePaisTituloExterior: ko.observable(educacionesSuperiores[i].nombrePaisTituloExterior),
                                    institucion: ko.observable(educacionesSuperiores[i].institucion),
                                    nombreInstitucion: ko.observable(educacionesSuperiores[i].nombreInstitucion),
                                    tituloExterior: ko.observable(educacionesSuperiores[i].tituloExterior),
                                    programa: ko.observable(educacionesSuperiores[i].programa),
                                    nombrePrograma: ko.observable(educacionesSuperiores[i].nombrePrograma),
                                    nucleoBasicoConocimiento: ko.observable(educacionesSuperiores[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesSuperiores[i].nombreNucleoBasicoConocimiento),
                                    nivel: ko.observable(educacionesSuperiores[i].nivel),
                                    nombreNivel: ko.observable(educacionesSuperiores[i].nombreNivel),
                                    anyoInicio: ko.observable(educacionesSuperiores[i].anyoInicio),
                                    anyoFinalizacion: ko.observable(educacionesSuperiores[i].anyoFinalizacion),
                                    titulo: ko.observable(educacionesSuperiores[i].titulo),
                                    graduado: ko.observable(educacionesSuperiores[i].graduado),
                                    fechaTitulo: ko.observable(educacionesSuperiores[i].fechaTituloFormateada),
                                    tieneCertificadoHomologado: ko.observable(educacionesSuperiores[i].tieneCertificadoHomologado),
                                    certificadoValidado: ko.observable(educacionesSuperiores[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesSuperiores[i].nombreCertificadoValidado),
                                    certificadoHomologadoValidado: ko.observable(educacionesSuperiores[i].certificadoHomologadoValidado),
                                    nombreCertificadoHomologadoValidado: ko.observable(educacionesSuperiores[i].nombreCertificadoHomologadoValidado)
                                }
                             );
                        }
                    }
                    establecerEgresadoUdeA();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_superiores.warning("Error al almacenar la educación superior.");
                }});            
        };

        self.eliminarEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarEducacionSuperior/" + educacionSuperior.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_superiores.success('Educación superior eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesSuperiores.removeAll();
                        var educacionesSuperiores = JSON.parse(response);
                        for (var i = 0; i < educacionesSuperiores.length; i++) {
                            self.educacionesSuperiores.push(
                                {
                                    id: ko.observable(educacionesSuperiores[i].id),
                                    consecutivo: ko.observable(educacionesSuperiores[i].consecutivo),
                                    paisTituloExterior: ko.observable(educacionesSuperiores[i].paisTituloExterior),
                                    nombrePaisTituloExterior: ko.observable(educacionesSuperiores[i].nombrePaisTituloExterior),
                                    institucion: ko.observable(educacionesSuperiores[i].institucion),
                                    nombreInstitucion: ko.observable(educacionesSuperiores[i].nombreInstitucion),
                                    tituloExterior: ko.observable(educacionesSuperiores[i].tituloExterior),
                                    programa: ko.observable(educacionesSuperiores[i].programa),
                                    nombrePrograma: ko.observable(educacionesSuperiores[i].nombrePrograma),
                                    nucleoBasicoConocimiento: ko.observable(educacionesSuperiores[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesSuperiores[i].nombreNucleoBasicoConocimiento),
                                    nivel: ko.observable(educacionesSuperiores[i].nivel),
                                    nombreNivel: ko.observable(educacionesSuperiores[i].nombreNivel),
                                    anyoInicio: ko.observable(educacionesSuperiores[i].anyoInicio),
                                    anyoFinalizacion: ko.observable(educacionesSuperiores[i].anyoFinalizacion),
                                    titulo: ko.observable(educacionesSuperiores[i].titulo),
                                    graduado: ko.observable(educacionesSuperiores[i].graduado),
                                    fechaTitulo: ko.observable(educacionesSuperiores[i].fechaTituloFormateada),
                                    tieneCertificadoHomologado: ko.observable(educacionesSuperiores[i].tieneCertificadoHomologado),
                                    certificadoValidado: ko.observable(educacionesSuperiores[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesSuperiores[i].nombreCertificadoValidado),
                                    certificadoHomologadoValidado: ko.observable(educacionesSuperiores[i].certificadoHomologadoValidado),
                                    nombreCertificadoHomologadoValidado: ko.observable(educacionesSuperiores[i].nombreCertificadoHomologadoValidado)
                                }
                             );
                        }
                    }
                    establecerEgresadoUdeA();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_superiores.warning("Error al eliminar la educación superior.");
                }});
        };

        self.editarEducacionSuperior = function (educacionSuperior) {
            $('#nivelEstudioEducacionSuperior').val(educacionSuperior.nivel()).trigger('change');
            $('#tituloExteriorEducacionSuperior').val(educacionSuperior.tituloExterior());
            $('#paisTituloExteriorEducacionSuperior').val(educacionSuperior.paisTituloExterior()).trigger('change');
            
            if(educacionSuperior.tituloExterior()) {
                $('#paistit').css("display","block");
                $('#certhomo').css('display','block');
                $('#btnNuevoProgramaExterior').show();
                $('#divProgramaExterior').show();
            } else {
                $('#paistit').css("display","none");
                $('#certhomo').css('display','none');
                $('#btnNuevoProgramaExterior').hide();
                $('#divProgramaExterior').hide();
            }
            
            $('#formprograma').css("display","block");
            
            $('#institucionEducacionSuperior').val(educacionSuperior.institucion());
            $('#nombreInstitucionEducacionSuperior').val(educacionSuperior.nombreInstitucion());
            $('#programaCursadoEducacionSuperior').val(educacionSuperior.programa());
            $('#nombreProgramaCursadoEducacionSuperior').val(educacionSuperior.nombrePrograma());
            $('#nucleoBasicoConocimientoEducacionSuperior').val(educacionSuperior.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(educacionSuperior.nombreNucleoBasicoConocimiento());
            $('#tituloEducacionSuperior').val(educacionSuperior.titulo());
    
            $('#anyoInicioEducacionSuperior').val(educacionSuperior.anyoInicio());
            $('#anyoFinalizacionEducacionSuperior').val(educacionSuperior.anyoFinalizacion()).trigger('change');
            $('#graduadoEducacionSuperior').val(educacionSuperior.graduado());            
            $('#fechaTituloEducacionSuperior').val(educacionSuperior.fechaTitulo());
            if(educacionSuperior.graduado()) {
              $('#btnGraduadoSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#anyoFinalizacionEducacionSuperior').prop('disabled',false);
              $('#fechaTituloEducacionSuperior').prop('disabled',false);
            } else {
              $('#btnGraduadoNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
              $('#fechaTituloEducacionSuperior').prop('disabled','disabled');
            }
            if(educacionSuperior.tituloExterior()) {
              $('#btnTituloExteriorSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExteriorNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#paisTituloExteriorEducacionSuperior').css("display","block");
            } else {
              $('#btnTituloExteriorNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExteriorSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#paisTituloExteriorEducacionSuperior').css("display","none");
            }
            $('#consecutivo').val(educacionSuperior.consecutivo());
            $('#certificadoEducacionSuperior').val("");
            $('#certificadoHomologadoEducacionSuperior').val("");
            bootstrap_alert_educacion_superior.removeWarning();
            bootstrap_alert_educaciones_superiores.removeWarning();
            $('#md_educacion_superior').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.verCertificadoEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarEducacionContinua = function () {
            var tipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua').val();
            var nombreTipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua option:selected').text();
            var institucionEducacionContinua = $('#institucionEducacionContinuaColombiana').val();
            var nombreInstitucionEducacionContinua = $('#institucionEducacionContinuaColombiana option:selected').text();
            var nucleoBasicoConocimientoEducacionContinua = $('#nucleoBasicoConocimientoEducacionContinua').val();
            var nombreNucleoBasicoConocimientoEducacionContinua = $('#nombreNucleoBasicoConocimientoEducacionContinua').val();
            var nombreCapacitacionEducacionContinua = $('#nombreCapacitacionEducacionContinua').val();
            var numeroHorasEducacionContinua = $('#numeroHorasEducacionContinua').val();
            var anyoEducacionContinua = $('#anyoEducacionContinua').val();
            var estudioExteriorEducacionContinua = strToBool($('#estudioExteriorEducacionContinua').val());

            if (tipoCapacitacionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el tipo de capacitación');
                return false;
            }
            if(estudioExteriorEducacionContinua) {
                institucionEducacionContinua = $('#institucionEducacionContinuaExterior').val();
                nombreInstitucionEducacionContinua = $('#institucionEducacionContinuaExterior option:selected').text();
                if (institucionEducacionContinua === "") {
                    bootstrap_alert_educacion_continua.warning('Debe seleccionar la institución');
                    return false;
                }
            } else {
                if (institucionEducacionContinua === "") {
                    bootstrap_alert_educacion_continua.warning('Debe seleccionar la institución');
                    return false;
                }
            }
            if (nucleoBasicoConocimientoEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el área de saber');
                return false;
            }
            if (nombreCapacitacionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el nombre de la capacitación');
                return false;
            }
            if (numeroHorasEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el número de horas');
                return false;
            }
            if (anyoEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el año');
                return false;
            }
            var formData = new FormData();
            
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionContinua').val() === "") {
                    bootstrap_alert_educacion_continua.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionContinua')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_continua.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesContinuas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesContinuas().length; i++) {
                    if (self.educacionesContinuas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoEducacionContinua').val() != "" && 
                    $('#certificadoEducacionContinua')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_continua.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.educacionesContinuas()[i].id());
                formData.append("consecutivo", consecutivo);
            }

            formData.append("tipoCapacitacion", tipoCapacitacionEducacionContinua);
            formData.append("institucion", institucionEducacionContinua);
            formData.append("nombreCapacitacion", nombreCapacitacionEducacionContinua);
            formData.append("numeroHoras", numeroHorasEducacionContinua);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoEducacionContinua);
            formData.append("anyo", anyoEducacionContinua);
            formData.append("estudioExterior", estudioExteriorEducacionContinua);
            if ($('#certificadoEducacionContinua').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionContinua')[0].files[0]);
            }
        
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/educacionContinua",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_continua').modal('hide');
                    bootstrap_alert_educaciones_continuas.success('Educación no formal almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesContinuas.removeAll();
                        var educacionesContinuas = JSON.parse(response);
                        for (var i = 0; i < educacionesContinuas.length; i++) {
                            self.educacionesContinuas.push(
                                {
                                    id: ko.observable(educacionesContinuas[i].id),
                                    consecutivo: ko.observable(educacionesContinuas[i].consecutivo),
                                    tipoCapacitacion: ko.observable(educacionesContinuas[i].tipoCapacitacion),
                                    nombreTipoCapacitacion: ko.observable(educacionesContinuas[i].nombreTipoCapacitacion),
                                    institucion: ko.observable(educacionesContinuas[i].institucion),
                                    nombreInstitucion: ko.observable(educacionesContinuas[i].nombreInstitucion),
                                    nombreCapacitacion: ko.observable(educacionesContinuas[i].nombreCapacitacion),
                                    nucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nombreNucleoBasicoConocimiento),
                                    numeroHoras: ko.observable(educacionesContinuas[i].numeroHoras),
                                    estudioExterior: ko.observable(educacionesContinuas[i].estudioExterior),
                                    anyo: ko.observable(educacionesContinuas[i].anyo),
                                    certificadoValidado: ko.observable(educacionesContinuas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesContinuas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_continuas.warning("Error al almacenar la educación no formal.");
                }});            
        };

        self.eliminarEducacionContinua = function (educacionContinua) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarEducacionContinua/" + educacionContinua.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_continuas.success('Educación no formal eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesContinuas.removeAll();
                        var educacionesContinuas = JSON.parse(response);
                        for (var i = 0; i < educacionesContinuas.length; i++) {
                            self.educacionesContinuas.push(
                                {
                                    id: ko.observable(educacionesContinuas[i].id),
                                    consecutivo: ko.observable(educacionesContinuas[i].consecutivo),
                                    tipoCapacitacion: ko.observable(educacionesContinuas[i].tipoCapacitacion),
                                    nombreTipoCapacitacion: ko.observable(educacionesContinuas[i].nombreTipoCapacitacion),
                                    institucion: ko.observable(educacionesContinuas[i].institucion),
                                    nombreInstitucion: ko.observable(educacionesContinuas[i].nombreInstitucion),
                                    nombreCapacitacion: ko.observable(educacionesContinuas[i].nombreCapacitacion),
                                    nucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nombreNucleoBasicoConocimiento),
                                    numeroHoras: ko.observable(educacionesContinuas[i].numeroHoras),
                                    estudioExterior: ko.observable(educacionesContinuas[i].estudioExterior),
                                    anyo: ko.observable(educacionesContinuas[i].anyo),
                                    certificadoValidado: ko.observable(educacionesContinuas[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(educacionesContinuas[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_continuas.warning("Error al eliminar la educación no formal.");
                }});
        };

        self.editarEducacionContinua = function (educacionContinua) {
            $('#tipoCapacitacionEducacionContinua').val(educacionContinua.tipoCapacitacion()).trigger('change');
            $('#nombreCapacitacionEducacionContinua').val(educacionContinua.nombreCapacitacion());
            $('#numeroHorasEducacionContinua').val(educacionContinua.numeroHoras());
            $('#nucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nombreNucleoBasicoConocimiento());
            $('#anyoEducacionContinua').val(educacionContinua.anyo()).trigger('change');
            $('#consecutivo').val(educacionContinua.consecutivo());
            $('#certificadoEducacionContinua').show();
            if(educacionContinua.estudioExterior()) {
              $('#institucionEducacionContinuaExterior').val(educacionContinua.institucion()).trigger('change');
              $('#btnEstudioExteriorSiEducacionContinua').removeClass('notActive').addClass('active');  
              $('#btnEstudioExteriorNoEducacionContinua').removeClass('active').addClass('notActive');
              $('#institucionEducacionContinuaExterior').next(".select2-container").show();
              $('#institucionEducacionContinuaColombiana').next(".select2-container").hide();
              $('#btnNuevaInstitucionExteriorEducacionContinua').show();
              $('#divMensajeInstitucionExteriorEducacionContinua').show();
            } else {
              $('#institucionEducacionContinuaColombiana').val(educacionContinua.institucion()).trigger('change');
              $('#btnEstudioExteriorSiEducacionContinua').removeClass('active').addClass('notActive');  
              $('#btnEstudioExteriorNoEducacionContinua').removeClass('notActive').addClass('active');
              $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
              $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
              $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
              $('#divMensajeInstitucionExteriorEducacionContinua').hide();
            }
            bootstrap_alert_educacion_continua.removeWarning();
            bootstrap_alert_educaciones_continuas.removeWarning();
            $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoEducacionContinua = function (educacionContinua) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinua/" + educacionContinua.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinua/" + educacionContinua.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarDistincion = function () {
            var fechaDistincion = $('#fechaDistincion').val();
            var institucionOtorgaDistincion = $('#institucionOtorgaDistincion').val();
            var descripcionDistincion = $('#descripcionDistincion').val();

            if (fechaDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la fecha');
                return false;
            }
            if (institucionOtorgaDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la institución');
                return false;
            }
            if (descripcionDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la descripción');
                return false;
            }
            var formData = new FormData();
            
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoDistincion').val() === "") {
                    bootstrap_alert_distincion.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoDistincion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_distincion.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.distinciones().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.distinciones().length; i++) {
                    if (self.distinciones()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoDistincion').val() != "" && 
                    $('#certificadoDistincion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_distincion.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.distinciones()[i].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("fechaDistincion",fechaDistincion);
            formData.append("institucionOtorga",institucionOtorgaDistincion);
            formData.append("descripcion",descripcionDistincion);
            if ($('#certificadoDistincion').val() !== "") {
                formData.append("certificado", $('#certificadoDistincion')[0].files[0]);
            }

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/distincion",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_distincion').modal('hide');
                    bootstrap_alert_distinciones.success('Distinción almacenada correctamente.');
                    if (response !== "") {
                        self.distinciones.removeAll();
                        var distinciones = JSON.parse(response);
                        for (var i = 0; i < distinciones.length; i++) {
                            self.distinciones.push(
                                {
                                    id: ko.observable(distinciones[i].id),
                                    consecutivo: ko.observable(distinciones[i].consecutivo),
                                    fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                                    institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                                    descripcion: ko.observable(distinciones[i].descripcion),
                                    certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_distinciones.warning("Error al almacenar la distinción.");
                }});            
        };

        self.eliminarDistincion = function (distincion) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarDistincion/" + distincion.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_distinciones.success('Distinción eliminada correctamente.');
                    if (response !== "") {
                        self.distinciones.removeAll();
                        var distinciones = JSON.parse(response);
                        for (var i = 0; i < distinciones.length; i++) {
                            self.distinciones.push(
                                {
                                    id: ko.observable(distinciones[i].id),
                                    consecutivo: ko.observable(distinciones[i].consecutivo),
                                    fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                                    institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                                    descripcion: ko.observable(distinciones[i].descripcion),
                                    certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_distinciones.warning("Error al eliminar la distinción.");
                }});
        };

        self.editarDistincion = function (distincion) {
            $('#fechaDistincion').val(distincion.fechaDistincion());
            $('#institucionOtorgaDistincion').val(distincion.institucionOtorga());
            $('#descripcionDistincion').val(distincion.descripcion());
            $('#consecutivo').val(distincion.consecutivo());
            $('#certificadoDistincion').val('');
            bootstrap_alert_distincion.removeWarning();
            bootstrap_alert_distinciones.removeWarning();
            $('#md_distincion').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoDistincion = function (distincion) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoDistincion/" + distincion.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoDistincion/" + distincion.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };
        
       self.adicionarExperienciaLaboral = function () {
            var tipoExperienciaLaboral = $('#tipoExperienciaLaboral').val();
            var nombreTipoExperienciaLaboral = $('#tipoExperienciaLaboral option:selected').text();
            var trabajoActualExperienciaLaboral = strToBool($('#trabajoActualExperienciaLaboral').val());
            var experienciaLaboralFNSP = strToBool($('#experienciaLaboralFNSP').val());
            var fechaIngresoExperienciaLaboral = $('#fechaIngresoExperienciaLaboral').val();
            var fechaRetiroExperienciaLaboral = $('#fechaRetiroExperienciaLaboral').val();
            var nucleoBasicoConocimientoExperienciaLaboral = $('#nucleoBasicoConocimientoExperienciaLaboral').val();
            var nombreNucleoBasicoConocimientoExperienciaLaboral = $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val();
            var tipoEmpresaExperienciaLaboral = $('#tipoEmpresaExperienciaLaboral').val();
            var nombreTipoEmpresaExperienciaLaboral = $('#tipoEmpresaExperienciaLaboral option:selected').text();
            var nombreEmpresaExperienciaLaboral = $('#nombreEmpresaExperienciaLaboral').val();
            var actividadEconomicaExperienciaLaboral = $('#actividadEconomicaExperienciaLaboral').val();
            var nombreActividadEconomicaExperienciaLaboral = $('#actividadEconomicaExperienciaLaboral option:selected').text();
            var tipoContratoExperienciaLaboral = $('#tipoContratoExperienciaLaboral').val();
            var nombreTipoContratoExperienciaLaboral = $('#tipoContratoExperienciaLaboral option:selected').text();
            var cargoExperienciaLaboral = $('#cargoExperienciaLaboral').val();
            var naturalezaCargoExperienciaLaboral = $('#naturalezaCargoExperienciaLaboral').val();
            var nombreNaturalezaCargoExperienciaLaboral = $('#naturalezaCargoExperienciaLaboral option:selected').text();
            if (tipoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de experiencia laboral');
                return false;
            }
            if (fechaIngresoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar la la fecha de ingreso');
                return false;
            }
            if (!trabajoActualExperienciaLaboral && fechaRetiroExperienciaLaboral === "" ) {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar la la fecha de retiro');
                return false;
            }
            if (nucleoBasicoConocimientoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el núcleo de conocimiento');
                return false;
            }
            if (tipoEmpresaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de empresa');
                return false;
            }
            if (nombreEmpresaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar el nombre de la empresa');
                return false;
            }
            if (actividadEconomicaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar la actividad económica');
                return false;
            }
            if (tipoContratoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de contrato');
                return false;
            }
            if (cargoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar el cargo');
                return false;
            }
            if (naturalezaCargoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar la naturaleza del cargo');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoExperienciaLaboral').val() === "") {
                    bootstrap_alert_experiencia_laboral.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoExperienciaLaboral')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_experiencia_laboral.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasLaborales().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.experienciasLaborales().length; i++) {
                    if (self.experienciasLaborales()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoExperienciaLaboral').val() != "" && 
                    $('#certificadoExperienciaLaboral')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_experiencia_laboral.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.experienciasLaborales()[i].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipoExperiencia",tipoExperienciaLaboral);
            formData.append("trabajoActual",trabajoActualExperienciaLaboral);
            formData.append("fnsp",experienciaLaboralFNSP);
            formData.append("fechaIngreso",fechaIngresoExperienciaLaboral);
            formData.append("fechaRetiro",fechaRetiroExperienciaLaboral);
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimientoExperienciaLaboral);
            formData.append("tipoEmpresa",tipoEmpresaExperienciaLaboral);
            formData.append("nombreEmpresa",nombreEmpresaExperienciaLaboral);
            formData.append("actividadEconomica",actividadEconomicaExperienciaLaboral);
            formData.append("tipoContrato",tipoContratoExperienciaLaboral);
            formData.append("cargo",cargoExperienciaLaboral);
            formData.append("naturalezaCargo",naturalezaCargoExperienciaLaboral);
            if ($('#certificadoExperienciaLaboral').val() !== "") {
                formData.append("certificado", $('#certificadoExperienciaLaboral')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/experienciaLaboral",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_experiencia_laboral').modal('hide');
                    bootstrap_alert_experiencias_laborales.success('Experiencia laboral almacenada correctamente.');
                    if (response !== "") {
                        self.experienciasLaborales.removeAll();
                        var experienciasLaborales = JSON.parse(response);
                        for (var i = 0; i < experienciasLaborales.length; i++) {
                            self.experienciasLaborales.push(
                                {
                                    id: ko.observable(experienciasLaborales[i].id),
                                    consecutivo: ko.observable(experienciasLaborales[i].consecutivo),
                                    tipoExperiencia: ko.observable(experienciasLaborales[i].tipoExperiencia),
                                    nombreTipoExperiencia: ko.observable(experienciasLaborales[i].nombreTipoExperiencia),
                                    trabajoActual: ko.observable(experienciasLaborales[i].trabajoActual),
                                    fnsp: ko.observable(experienciasLaborales[i].fnsp),
                                    fechaIngreso: ko.observable(experienciasLaborales[i].fechaIngresoFormateada),
                                    fechaRetiro: ko.observable(experienciasLaborales[i].fechaRetiroFormateada),
                                    nucleoBasicoConocimiento: ko.observable(experienciasLaborales[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasLaborales[i].nombreNucleoBasicoConocimiento),
                                    tipoEmpresa: ko.observable(experienciasLaborales[i].tipoEmpresa),
                                    nombreTipoEmpresa: ko.observable(experienciasLaborales[i].nombreTipoEmpresa),
                                    nombreEmpresa: ko.observable(experienciasLaborales[i].nombreEmpresa),
                                    actividadEconomica: ko.observable(experienciasLaborales[i].actividadEconomica),
                                    nombreActividadEconomica: ko.observable(experienciasLaborales[i].nombreActividadEconomica),
                                    tipoContrato: ko.observable(experienciasLaborales[i].tipoContrato),
                                    nombreTipoContrato: ko.observable(experienciasLaborales[i].nombreTipoContrato),
                                    cargo: ko.observable(experienciasLaborales[i].cargo),
                                    naturalezaCargo: ko.observable(experienciasLaborales[i].naturalezaCargo),
                                    nombreNaturalezaCargo: ko.observable(experienciasLaborales[i].nombreNaturalezaCargo),
                                    certificadoValidado: ko.observable(experienciasLaborales[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_laborales.warning("Error al almacenar la experiencia laboral.");
                }});
        };

        self.eliminarExperienciaLaboral = function (experienciaLaboral) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarExperienciaLaboral/" + experienciaLaboral.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_experiencias_laborales.success('Experiencia laboral eliminada correctamente.');
                    if (response !== "") {
                        self.experienciasLaborales.removeAll();
                        var experienciasLaborales = JSON.parse(response);
                        for (var i = 0; i < experienciasLaborales.length; i++) {
                            self.experienciasLaborales.push(
                                {
                                    id: ko.observable(experienciasLaborales[i].id),
                                    consecutivo: ko.observable(experienciasLaborales[i].consecutivo),
                                    tipoExperiencia: ko.observable(experienciasLaborales[i].tipoExperiencia),
                                    nombreTipoExperiencia: ko.observable(experienciasLaborales[i].nombreTipoExperiencia),
                                    trabajoActual: ko.observable(experienciasLaborales[i].trabajoActual),
                                    fnsp: ko.observable(experienciasLaborales[i].fnsp),
                                    fechaIngreso: ko.observable(experienciasLaborales[i].fechaIngresoFormateada),
                                    fechaRetiro: ko.observable(experienciasLaborales[i].fechaRetiroFormateada),
                                    nucleoBasicoConocimiento: ko.observable(experienciasLaborales[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasLaborales[i].nombreNucleoBasicoConocimiento),
                                    tipoEmpresa: ko.observable(experienciasLaborales[i].tipoEmpresa),
                                    nombreTipoEmpresa: ko.observable(experienciasLaborales[i].nombreTipoEmpresa),
                                    nombreEmpresa: ko.observable(experienciasLaborales[i].nombreEmpresa),
                                    actividadEconomica: ko.observable(experienciasLaborales[i].actividadEconomica),
                                    nombreActividadEconomica: ko.observable(experienciasLaborales[i].nombreActividadEconomica),
                                    tipoContrato: ko.observable(experienciasLaborales[i].tipoContrato),
                                    nombreTipoContrato: ko.observable(experienciasLaborales[i].nombreTipoContrato),
                                    cargo: ko.observable(experienciasLaborales[i].cargo),
                                    naturalezaCargo: ko.observable(experienciasLaborales[i].naturalezaCargo),
                                    nombreNaturalezaCargo: ko.observable(experienciasLaborales[i].nombreNaturalezaCargo),
                                    certificadoValidado: ko.observable(experienciasLaborales[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_laborales.warning("Error al eliminar la experiencia laboral.");
                }});
        };

        self.editarExperienciaLaboral = function (experienciaLaboral) {
            $('#tipoExperienciaLaboral').val(experienciaLaboral.tipoExperiencia()).trigger('change');
            $('#trabajoActualExperienciaLaboral').val(experienciaLaboral.trabajoActual());
            if(experienciaLaboral.trabajoActual()) {
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');
              $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
              $('#fechaRetiroExperienciaLaboral').val('');
            } else {
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('active').addClass('notActive');  
              $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
            }
            $('#experienciaLaboralFNSP').val(experienciaLaboral.fnsp());
            if(experienciaLaboral.fnsp()) {
              $('#btnExperienciaLaboralFNSPSi').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPNo').removeClass('active').addClass('notActive');
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
              $('#tipoEmpresaExperienciaLaboral').prop('disabled', 'disabled');
              $('#actividadEconomicaExperienciaLaboral').prop('disabled', 'disabled');
            } else {
              $('#btnExperienciaLaboralFNSPNo').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPSi').removeClass('active').addClass('notActive');  
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
              $('#tipoEmpresaExperienciaLaboral').prop('disabled', false);
              $('#actividadEconomicaExperienciaLaboral').prop('disabled', false);
            }
            $('#fechaIngresoExperienciaLaboral').val(experienciaLaboral.fechaIngreso());
            $('#fechaRetiroExperienciaLaboral').val(experienciaLaboral.fechaRetiro());
            $('#nucleoBasicoConocimientoExperienciaLaboral').val(experienciaLaboral.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val(experienciaLaboral.nombreNucleoBasicoConocimiento());
            $('#tipoEmpresaExperienciaLaboral').val(experienciaLaboral.tipoEmpresa()).trigger('change');
            $('#nombreEmpresaExperienciaLaboral').val(experienciaLaboral.nombreEmpresa());
            $('#actividadEconomicaExperienciaLaboral').val(experienciaLaboral.actividadEconomica()).trigger('change');
            $('#tipoContratoExperienciaLaboral').val(experienciaLaboral.tipoContrato()).trigger('change');
            $('#cargoExperienciaLaboral').val(experienciaLaboral.cargo());
            $('#naturalezaCargoExperienciaLaboral').val(experienciaLaboral.naturalezaCargo()).trigger('change');
            $('#consecutivo').val(experienciaLaboral.consecutivo());
            $('#certificadoExperienciaLaboral').val('');
            bootstrap_alert_experiencia_laboral.removeWarning();
            bootstrap_alert_experiencias_laborales.removeWarning();
            $('#md_experiencia_laboral').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoExperienciaLaboral = function (experienciaLaboral) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });            
        };        
       
        self.adicionarExperienciaDocencia = function () {
            var trabajoActualDocencia = strToBool($('#trabajoActualDocencia').val());
            var experienciaDocenciaFNSP = strToBool($('#experienciaDocenciaFNSP').val());
            var experienciaDocenciaExterior = strToBool($('#experienciaDocenciaExterior').val());
            var institucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana').val();
            var nombreInstitucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana option:selected').text();
            if(experienciaDocenciaExterior) {
                institucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior').val();
                nombreInstitucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior option:selected').text();
            }
            if (institucionExperienciaDocencia === "") {
                bootstrap_alert_experiencia_docencia.warning('Debe seleccionar la institución');
                return false;
            }
            var formData = new FormData();
            if (self.consecutivoExperienciaDocencia() === self.experienciasDocencia().length) {
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasDocencia().length);
            } else {
                var indice = 0;
                for (i = 0; i < self.experienciasDocencia().length; i++) {
                    if (self.experienciasDocencia()[i].consecutivo() === self.consecutivoExperienciaDocencia()) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.experienciasDocencia()[i].id());
                formData.append("consecutivo", self.consecutivoExperienciaDocencia());
            }

            formData.append("trabajoActual", trabajoActualDocencia);
            formData.append("fnsp", experienciaDocenciaFNSP);
            formData.append("exterior", experienciaDocenciaExterior);
            formData.append("institucion", institucionExperienciaDocencia);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/experienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_experiencia_docencia').modal('hide');
                    bootstrap_alert_experiencias_docencia.success('Experiencia en docencia almacenada correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var datos = JSON.parse(response);
                        var idExperienciaDocencia = datos.id;
                        var experienciasDocencia = datos.experienciasDocencia;
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            if(idExperienciaDocencia == experienciasDocencia[i].id) {
                              self.consecutivoExperienciaDocencia(experienciasDocencia[i].consecutivo);
                            }
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al almacenar la experiencia en docencia.");
                }});
        };

        self.eliminarExperienciaDocencia = function (experienciaDocencia) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarExperienciaDocencia/" + experienciaDocencia.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_experiencias_docencia.success('Experiencia en docencia eliminada correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al eliminar la experiencia en docencia.");
                }});
        };

        self.editarExperienciaDocencia = function (experienciaDocencia) {
            $('#trabajoActualDocencia').val(experienciaDocencia.trabajoActual());
            if(experienciaDocencia.trabajoActual()) {
              $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('active').addClass('notActive');
            } else {
              $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('active').addClass('notActive');  
            }
            $('#experienciaDocenciaFNSP').val(experienciaDocencia.fnsp());
            if(experienciaDocencia.fnsp()) {
              $('#btnExperienciaDocenciaFNSPSi').removeClass('notActive').addClass('active');  
              $('#btnExperienciaDocenciaFNSPNo').removeClass('active').addClass('notActive');
              $('#institucionExperienciaDocenciaColombiana').prop('disabled', 'disabled');
            } else {
              $('#btnExperienciaDocenciaFNSPNo').removeClass('notActive').addClass('active');  
              $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive');  
              $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
            }
            if(experienciaDocencia.exterior()) {
                $('#btnExperienciaDocenciaExteriorSi').removeClass('notActive').addClass('active');  
                $('#btnExperienciaDocenciaExteriorNo').removeClass('active').addClass('notActive');
                $('#institucionExperienciaDocenciaExterior').val(experienciaDocencia.institucion()).trigger('change');
                $('#institucionExperienciaDocenciaExterior').next(".select2-container").show();
                $('#institucionExperienciaDocenciaColombiana').next(".select2-container").hide();
                $('#btnNuevaInstitucionExteriorExperienciaDocencia').show();
                $('#divMensajeInstitucionExteriorExperienciaDocencia').show();
            } else {
                $('#btnExperienciaDocenciaExteriorNo').removeClass('notActive').addClass('active');  
                $('#btnExperienciaDocenciaExteriorSi').removeClass('active').addClass('notActive');  
                $('#institucionExperienciaDocenciaColombiana').val(experienciaDocencia.institucion()).trigger('change');
                $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
                $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
                $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
                $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
            }
            $('#certificadoCursoExperienciaDocencia').val('');
            self.consecutivoExperienciaDocencia(experienciaDocencia.consecutivo());
            bootstrap_alert_experiencia_docencia.removeWarning();
            bootstrap_alert_experiencias_docencia.removeWarning();
            bootstrap_alert_cursos_experiencia_docencia.removeWarning();
            bootstrap_alert_curso_experiencia_docencia.removeWarning();
            $('#md_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        };

       self.adicionarCursoExperienciaDocencia = function () {
            var nombreCursoExperienciaDocencia = $('#nombreCursoExperienciaDocencia').val();
            var nucleoBasicoConocimientoCursoExperienciaDocencia = $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val();
            var nombreNucleoBasicoConocimientoCursoExperienciaDocencia = $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val();
            var modalidadCursoExperienciaDocencia = $('#modalidadCursoExperienciaDocencia').val();
            var nombreModalidadCursoExperienciaDocencia = $('#modalidadCursoExperienciaDocencia option:selected').text();
            var nivelEstudioCursoExperienciaDocencia = $('#nivelEstudioCursoExperienciaDocencia').val();
            var nombreNivelEstudioCursoExperienciaDocencia = $('#nivelEstudioCursoExperienciaDocencia option:selected').text();
            var numeroHorasCursoExperienciaDocencia = $('#numeroHorasCursoExperienciaDocencia').val();
            var anyoCursoExperienciaDocencia = $('#anyoCursoExperienciaDocencia').val();
            if (nombreCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar el nombre del curso');
                return false;
            }
            if (nucleoBasicoConocimientoCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el núcleo de conocimiento');
                return false;
            }
            if (modalidadCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar la modalidad del curso');
                return false;
            }
            if (nivelEstudioCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el nivel del curso');
                return false;
            }
            if (numeroHorasCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar número de horas');
                return false;
            }
            if (anyoCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el año del curso');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                var consecutivo = self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length;  
                if ($('#certificadoCursoExperienciaDocencia').val() === "") {
                    bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoCursoExperienciaDocencia')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_curso_experiencia_docencia.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.experienciasLaborales().length; i++) {
                    if (self.experienciasLaborales()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoCursoExperienciaDocencia').val() != "" &&
                    $('#certificadoCursoExperienciaDocencia')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_curso_experiencia_docencia.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#certificadoCursoExperienciaDocencia').val() != "") {
               formData.append("certificado", $('#certificadoCursoExperienciaDocencia')[0].files[0]); 
            }
            formData.append("idExperienciaDocencia", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].id());
            formData.append("nombreCurso", nombreCursoExperienciaDocencia);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoCursoExperienciaDocencia);
            formData.append("modalidad", modalidadCursoExperienciaDocencia);
            formData.append("nivelEstudio",nivelEstudioCursoExperienciaDocencia);
            formData.append("numeroHoras",numeroHorasCursoExperienciaDocencia);
            formData.append("anyo", anyoCursoExperienciaDocencia);
                        
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/cursoExperienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_curso_experiencia_docencia').modal('hide');
                    bootstrap_alert_cursos_experiencia_docencia.success('Curso almacenado correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cursos_experiencia_docencia.warning("Error al almacenar el curso.");
                }});
        };

        self.eliminarCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_cursos_experiencia_docencia.success('Curso eliminado correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cursos_experiencia_docencia.warning("Error al eliminar el curso.");
                }});
        };

        self.editarCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $('#nombreCursoExperienciaDocencia').val(cursoExperienciaDocencia.nombreCurso());
            $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val(cursoExperienciaDocencia.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val(cursoExperienciaDocencia.nombreNucleoBasicoConocimiento());
            $('#modalidadCursoExperienciaDocencia').val(cursoExperienciaDocencia.modalidad()).trigger('change');
            $('#nivelEstudioCursoExperienciaDocencia').val(cursoExperienciaDocencia.nivelEstudio()).trigger('change');
            $('#numeroHorasCursoExperienciaDocencia').val(cursoExperienciaDocencia.numeroHoras());
            $('#anyoCursoExperienciaDocencia').val(cursoExperienciaDocencia.anyo());
            $('#consecutivo').val(cursoExperienciaDocencia.consecutivo());
            $('#certificadoCursoExperienciaDocencia').val('');
            bootstrap_alert_curso_experiencia_docencia.removeWarning();
            bootstrap_alert_cursos_experiencia_docencia.removeWarning();
            $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });                
        };        

        self.adicionarArticulo = function () {
            var nombreArticulo = $('#nombreArticulo').val();
            var tipoAutorArticulo = $('#tipoAutorArticulo').val();
            var nombreRevistaArticulo = $('#nombreRevistaArticulo').val();
            var anyoArticulo = $('#anyoArticulo').val();
            var nucleoBasicoConocimientoArticulo = $('#nucleoBasicoConocimientoArticulo').val();
            var urlArticulo = $('#urlArticulo').val();

            if (nombreArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar el título del artículo');
                return false;
            }
            if (tipoAutorArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el tipo de autor del artículo');
                return false;
            }
            if (nombreRevistaArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar el nombre de la revista');
                return false;
            }
            if (anyoArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el año del artículo');
                return false;
            }
            if (nucleoBasicoConocimientoArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el núcleo básico del conocimiento');
                return false;
            }
            if (urlArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar la URL del artículo');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.articulos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.articulos().length; i++) {
                    if (self.articulos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.articulos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("nombre", nombreArticulo);
            formData.append("tipoAutor", tipoAutorArticulo);
            formData.append("nombreRevista", nombreRevistaArticulo);
            formData.append("anyo", anyoArticulo);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoArticulo);
            formData.append("url", urlArticulo);
            
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/articulo",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_articulo').modal('hide');
                    bootstrap_alert_articulos.success('Artículo almacenado correctamente.');
                    if (response !== "") {
                        self.articulos.removeAll();
                        var articulos = JSON.parse(response);
                        for (var i = 0; i < articulos.length; i++) {
                            self.articulos.push(
                                {
                                    id: ko.observable(articulos[i].id),
                                    consecutivo: ko.observable(articulos[i].consecutivo),
                                    nombre: ko.observable(articulos[i].nombre),
                                    tipoAutor: ko.observable(articulos[i].tipoAutor),
                                    nombreRevista: ko.observable(articulos[i].nombreRevista),
                                    anyo: ko.observable(articulos[i].anyo),
                                    nucleoBasicoConocimiento: ko.observable(articulos[i].nucleoBasicoConocimiento),
                                    url: ko.observable(articulos[i].url),
                                    validado: ko.observable(articulos[i].validado),
                                    nombreValidado: ko.observable(articulos[i].nombreValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_articulos.warning("Error al almacenar el artículo.");
                }});
        };

        self.eliminarArticulo = function (articulo) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarArticulo/" + articulo.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_articulos.success('Artículo eliminado correctamente.');
                    if (response !== "") {
                        self.articulos.removeAll();
                        var articulos = JSON.parse(response);
                        for (var i = 0; i < articulos.length; i++) {
                            self.articulos.push(
                                {
                                    id: ko.observable(articulos[i].id),
                                    consecutivo: ko.observable(articulos[i].consecutivo),
                                    nombre: ko.observable(articulos[i].nombre),
                                    tipoAutor: ko.observable(articulos[i].tipoAutor),
                                    nombreRevista: ko.observable(articulos[i].nombreRevista),
                                    anyo: ko.observable(articulos[i].anyo),
                                    nucleoBasicoConocimiento: ko.observable(articulos[i].nucleoBasicoConocimiento),
                                    url: ko.observable(articulos[i].url),
                                    validado: ko.observable(articulos[i].validado),
                                    nombreValidado: ko.observable(articulos[i].nombreValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_articulos.warning("Error al eliminar el artículo.");
                }});
        };

        self.editarArticulo = function (articulo) {
            $('#nombreArticulo').val(articulo.nombre());
            $('#nombreRevistaArticulo').val(articulo.nombreRevista());
            $('#tipoAutorArticulo').val(articulo.tipoAutor()).trigger('change');
            $('#urlArticulo').val(articulo.url());
            $('#anyoArticulo').val(articulo.anyo()).trigger('change');
            $('#nucleoBasicoConocimientoArticulo').val(articulo.nucleoBasicoConocimiento()).trigger('change');
            $('#consecutivo').val(articulo.consecutivo());
            bootstrap_alert_articulo.removeWarning();
            bootstrap_alert_articulos.removeWarning();
            $('#md_articulo').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarPatente = function () {
            var fechaPatente = $('#fechaPatente').val();
            var tipoPatente = $('#tipoPatente').val();
            var nombreTipoPatente = $('#tipoPatente option:selected').text();
            var propiedadCompartidaPatente = strToBool($('#propiedadCompartidaPatente').val());
            var clasePatente = $('#clasePatente').val();
            var descripcionPatente = $('#descripcionPatente').val();
        
            if (fechaPatente === "") {
                bootstrap_alert_patente.warning('Debe ingresar la fecha de la patente');
                return false;
            }
            if (tipoPatente === "") {
                bootstrap_alert_patente.warning('Debe seleccionar el tipo de pantente');
                return false;
            }
            if (clasePatente === "") {
                bootstrap_alert_patente.warning('Debe seleccionar la clase de patente');
                return false;
            }
            if (descripcionPatente === "") {
                bootstrap_alert_patente.warning('Debe ingresar la descripción de la patente');
                return false;
            }
            var nombrePropiedadCompartidaPatente = "No";
            if(propiedadCompartidaPatente) {
               nombrePropiedadCompartidaPatente = "Si";  
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoPatente').val() === "") {
                    bootstrap_alert_patente.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoPatente')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_patente.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", 0);
                formData.append("consecutivo", self.patentes().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.patentes().length; i++) {
                    if (self.patentes()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoPatente').val() != "" && 
                    $('#documentoPatente')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_patente.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.patentes()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#documentoPatente').val() != "") {
               formData.append("documento", $('#documentoPatente')[0].files[0]); 
            }
            formData.append("fecha", fechaPatente);
            formData.append("tipo", tipoPatente);
            formData.append("propiedadCompartida", propiedadCompartidaPatente);
            formData.append("clase", clasePatente);
            formData.append("descripcion", descripcionPatente);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/patente",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_patente').modal('hide');
                    bootstrap_alert_patentes.success('Patente almacenada correctamente.');
                    if (response !== "") {
                        self.patentes.removeAll();
                        var patentes = JSON.parse(response);
                        for (var i = 0; i < patentes.length; i++) {
                            self.patentes.push(
                                {
                                    id: ko.observable(patentes[i].id),
                                    consecutivo: ko.observable(patentes[i].consecutivo),
                                    fecha: ko.observable(patentes[i].fechaFormateada),
                                    tipo: ko.observable(patentes[i].tipo),
                                    nombreTipo: ko.observable(patentes[i].nombreTipo),
                                    propiedadCompartida: ko.observable(patentes[i].propiedadCompartida),
                                    nombrePropiedadCompartida: ko.observable(patentes[i].nombrePropiedadCompartida), 
                                    clase: ko.observable(patentes[i].clase),
                                    nombreClase: ko.observable(patentes[i].nombreClase),
                                    descripcion: ko.observable(patentes[i].descripcion),
                                    documentoValidado: ko.observable(patentes[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(patentes[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_patentes.warning("Error al almacenar la patente.");
                }});
        
        };

        self.eliminarPatente = function (patente) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarPatente/" + patente.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_patentes.success('Patente eliminada correctamente.');
                    if (response !== "") {
                        self.patentes.removeAll();
                        var patentes = JSON.parse(response);
                        for (var i = 0; i < patentes.length; i++) {
                            self.patentes.push(
                                {
                                    id: ko.observable(patentes[i].id),
                                    consecutivo: ko.observable(patentes[i].consecutivo),
                                    fecha: ko.observable(patentes[i].fechaFormateada),
                                    tipo: ko.observable(patentes[i].tipo),
                                    nombreTipo: ko.observable(patentes[i].nombreTipo),
                                    propiedadCompartida: ko.observable(patentes[i].propiedadCompartida),
                                    nombrePropiedadCompartida: ko.observable(patentes[i].nombrePropiedadCompartida), 
                                    clase: ko.observable(patentes[i].clase),
                                    nombreClase: ko.observable(patentes[i].nombreClase),
                                    descripcion: ko.observable(patentes[i].descripcion),
                                    documentoValidado: ko.observable(patentes[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(patentes[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_patentes.warning("Error al eliminar el patente.");
                }});
        };

        self.editarPatente = function (patente) {
            $('#fechaPatente').val(patente.fecha());
            $('#tipoPatente').val(patente.tipo()).trigger('change');
            $('#propiedadCompartidaPatente').val(patente.propiedadCompartida());
            $('#clasePatente').val(patente.clase()).trigger('change');
            $('#descripcionPatente').val(patente.descripcion());            
            if(patente.propiedadCompartida()) {
              $('#btnPropiedadCompartidaPatenteSi').removeClass('notActive').addClass('active');  
              $('#btnPropiedadCompartidaPatenteNo').removeClass('active').addClass('notActive');
            } else {
              $('#btnPropiedadCompartidaPatenteNo').removeClass('notActive').addClass('active');  
              $('#btnPropiedadCompartidaPatenteSi').removeClass('active').addClass('notActive');  
            }
            $('#consecutivo').val(patente.consecutivo());
            $('#documentoPatente').val('');
            bootstrap_alert_patente.removeWarning();
            bootstrap_alert_patentes.removeWarning();
            $('#md_patente').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoPatente = function (patente) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoPatente/" + patente.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoPatente/" + patente.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });  
        };        

        self.adicionarProductoConocimiento = function () {
            var tipoProductoConocimiento = $('#tipoProductoConocimiento').val();
            var nombreTipoProductoConocimiento = $('#tipoProductoConocimiento option:selected').text();
            var nucleoBasicoProductoConocimiento = $('#nucleoBasicoProductoConocimiento').val();
            var urlProductoConocimiento = $('#urlProductoConocimiento').val();
            var descripcionProductoConocimiento = $('#descripcionProductoConocimiento').val();
        
            if (tipoProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe seleccionar el tipo de producto');
                return false;
            }
            if (nucleoBasicoProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe seleccionar el núcleo básico de conocimiento');
                return false;
            }
            if (urlProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe ingresar la URL');
                return false;
            }
            if (descripcionProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe ingresar la descripción');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoProductoConocimiento').val() === "") {
                    bootstrap_alert_producto_conocimiento.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoProductoConocimiento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_producto_conocimiento.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", 0);
                formData.append("consecutivo", self.productosConocimiento().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.productosConocimiento().length; i++) {
                    if (self.productosConocimiento()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoProductoConocimiento').val() != "" && 
                    $('#documentoProductoConocimiento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_producto_conocimiento.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.productosConocimiento()[indice].id());
                formData.append("consecutivo", consecutivo);
            }

            if ($('#documentoProductoConocimiento').val() != "") {
               formData.append("documento", $('#documentoProductoConocimiento')[0].files[0]); 
            }
            formData.append("tipo", tipoProductoConocimiento);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoProductoConocimiento);
            formData.append("url", urlProductoConocimiento);
            formData.append("descripcion", descripcionProductoConocimiento);
        
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/productoConocimiento",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_producto_conocimiento').modal('hide');
                    bootstrap_alert_productos_conocimiento.success('Producto de conocimiento almacenado correctamente.');
                    if (response !== "") {
                        self.productosConocimiento.removeAll();
                        var productosConocimiento = JSON.parse(response);
                        for (var i = 0; i < productosConocimiento.length; i++) {
                            self.productosConocimiento.push(
                                {
                                    id: ko.observable(productosConocimiento[i].id),
                                    consecutivo: ko.observable(productosConocimiento[i].consecutivo),
                                    tipo: ko.observable(productosConocimiento[i].tipo),
                                    nombreTipo: ko.observable(productosConocimiento[i].nombreTipo),
                                    nucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nucleoBasicoConocimiento),
                                    url: ko.observable(productosConocimiento[i].url),
                                    descripcion: ko.observable(productosConocimiento[i].descripcion),
                                    documentoValidado: ko.observable(productosConocimiento[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(productosConocimiento[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_productos_conocimiento.warning("Error al almacenar el producto de conocimiento.");
                }});
        };

        self.eliminarProductoConocimiento = function (productoConocimiento) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/eliminarProductoConocimiento/" + productoConocimiento.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_productos_conocimiento.success('Producto de conocimiento eliminada correctamente.');
                    if (response !== "") {
                        self.productosConocimiento.removeAll();
                        var productosConocimiento = JSON.parse(response);
                        for (var i = 0; i < productosConocimiento.length; i++) {
                            self.productosConocimiento.push(
                                {
                                    id: ko.observable(productosConocimiento[i].id),
                                    consecutivo: ko.observable(productosConocimiento[i].consecutivo),
                                    tipo: ko.observable(productosConocimiento[i].tipo),
                                    nombreTipo: ko.observable(productosConocimiento[i].nombreTipo),
                                    nucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nucleoBasicoConocimiento),
                                    url: ko.observable(productosConocimiento[i].url),
                                    descripcion: ko.observable(productosConocimiento[i].descripcion),
                                    documentoValidado: ko.observable(productosConocimiento[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(productosConocimiento[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_productos_conocimiento.warning("Error al eliminar el producto de conocimiento.");
                }});
        };

        self.editarProductoConocimiento = function (productoConocimiento) {
            $('#tipoProductoConocimiento').val(productoConocimiento.tipo()).trigger('change');
            $('#nucleoBasicoProductoConocimiento').val(productoConocimiento.nucleoBasicoConocimiento()).trigger('change');
            $('#urlProductoConocimiento').val(productoConocimiento.url());
            $('#descripcionProductoConocimiento').val(productoConocimiento.descripcion());    
            $('#consecutivo').val(productoConocimiento.consecutivo());
            $('#documentoProductoConocimiento').val('');
            bootstrap_alert_producto_conocimiento.removeWarning();
            bootstrap_alert_productos_conocimiento.removeWarning();
            $('#md_producto_conocimiento').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoProductoConocimiento = function (productoConocimiento) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });  
        };        
    };

    function nuevaCiudadExtranjera() {
    
        $('#paisCiudad').val($('#pais option:selected').text().toUpperCase());
        $('#ciudadExtranjera').val("");

        $('#md_ciudad_extranjera').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoCorreoElectronico() {
        $('#correoElectronico').val("");
        $('#consecutivo').val("");
        bootstrap_alert_correo_electronico.removeWarning();
        bootstrap_alert_correos_electronicos.removeWarning();
        $('#md_correo_electronico').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoTelefono() {
        $('#tipoTelefono').val("").trigger("change.select2");
        $('#numeroTelefono').val("");
        $('#consecutivo').val("");
        bootstrap_alert_telefono.removeWarning();
        bootstrap_alert_telefonos.removeWarning();
        $('#md_telefono').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevaCuentaBancaria() {
        $('#tipoCuentaBancaria').val("").trigger("change.select2");
        $('#numeroCuentaBancaria').val("");
        $('#entidadCuentaBancaria').val("");
        $('#consecutivo').val("");
        bootstrap_alert_cuenta_bancaria.removeWarning();
        bootstrap_alert_cuentas_bancarias.removeWarning();
        $('#md_cuenta_bancaria').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoDocumentoSoporte() {
        $('#tipoDocumento').val("").trigger('change');
        $('#consecutivo').val("");
        $('#documentoSoporte').val("");
        bootstrap_alert_documento_soporte.removeWarning();
        bootstrap_alert_documentos_soporte.removeWarning();
        $('#md_documento_soporte').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#nivelConversacionIdiomaA').prop("checked", false); 
        $('#nivelEscrituraIdiomaA').prop("checked", false); 
        $('#nivelEscuchaIdiomaA').prop("checked", false); 
        $('#nivelLecturaIdiomaA').prop("checked", false); 
        $('#nivelConversacionIdiomaM').prop("checked", false); 
        $('#nivelEscrituraIdiomaM').prop("checked", false); 
        $('#nivelEscuchaIdiomaM').prop("checked", false); 
        $('#nivelLecturaIdiomaM').prop("checked", false); 
        $('#nivelConversacionIdiomaB').prop("checked", false); 
        $('#nivelEscrituraIdiomaB').prop("checked", false); 
        $('#nivelEscuchaIdiomaB').prop("checked", false); 
        $('#nivelLecturaIdiomaB').prop("checked", false); 
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeCertificacionIdioma').val("");
        $('#consecutivo').val("");
        $('#certificadoIdioma').val('');
        bootstrap_alert_idioma.removeWarning();
        bootstrap_alert_idiomas.removeWarning();
        $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
    }
        
    function nuevaEducacionBasica() {
        $('#nivelEstudioEducacionBasica').val("").trigger('change');
        $('#institucionEducacionBasica').val("");
        $('#anyoInicioEducacionBasica').val("").trigger('change');
        $('#anyoFinalizacionEducacionBasica').val("").trigger('change');
        $('#tituloEducacionBasica').val("");
        $('#graduadoEducacionBasica').val("false");
        $('#btnGraduadoSiEducacionBasica').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionBasica').removeClass('active').addClass('notActive');  
        $('#consecutivo').val("");
        $('#certificadoEducacionBasica').val('');
        bootstrap_alert_educacion_basica.removeWarning();
        bootstrap_alert_educaciones_basicas.removeWarning();
        $('#md_educacion_basica').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaEducacionSuperior() {
        $('#nivelEstudioEducacionSuperior').val("").trigger('change');
        $('#tituloExteriorEducacionSuperior').val('false');
        $('#paisEducacionSuperior').val("").trigger('change');
        $('#institucionEducacionSuperior').val("");
        $('#nombreInstitucionEducacionSuperior').val("");
        $('#programaCursadoEducacionSuperior').val('');
        $('#nombreProgramaCursadoEducacionSuperior').val('');
        $('#nucleoBasicoConocimientoEducacionSuperior').val('');
        $('#nombreNucleoBasicoConocimientoEducacionSuperior').val('');
        $('#anyoInicioEducacionSuperior').val("").trigger('change');
        $('#anyoFinalizacionEducacionSuperior').val("").trigger('change');
        $('#tituloEducacionSuperior').val("");
        $('#graduadoEducacionSuperior').val("false");
        $('#fechaTituloEducacionSuperior').val("");
        
        $('#nucleoBasicoConocimientoPrograma').val("");
        $('#nombreNucleoBasicoConocimientoPrograma').val("");
        $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
        $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
        $('#programaCursado').val("");
        $('#tituloPrograma').val("");        
        $('#btnNuevoProgramaExterior').hide();
        $('#divProgramaExterior').hide();
        
        $('#btnTituloExteriorSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnTituloExteriorNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#paisTituloExteriorEducacionSuperior').css("display","none");
         
        $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
        $('#fechaTituloEducacionSuperior').prop('disabled','disabled');
                
        $('#consecutivo').val("");
        $('#certificadoEducacionSuperior').val("");
        $('#certificadosHomologadoEducacionSuperior').val("");
        bootstrap_alert_educacion_superior.removeWarning();
        bootstrap_alert_educaciones_superiores.removeWarning();
        $('#md_educacion_superior').modal({backdrop: 'static', keyboard: false})  ;
    }    

    function nuevoPrograma() {
        bootstrap_alert_educacion_superior.removeWarning();
        var nivelEstudioEducacionSuperior = $('#nivelEstudioEducacionSuperior').val();
        if (nivelEstudioEducacionSuperior === "") {
            bootstrap_alert_educacion_superior.warning('Debe seleccionar el nivel de estudio');
            return false;
        }            
        
        $('#nucleoBasicoConocimientoPrograma').val("");
        $('#nombreNucleoBasicoConocimientoPrograma').val("");
        $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
        $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
        $('#programaCursado').val("").trigger("change.select2");
        $('#tituloPrograma').val("");
        $('#btnProgramaActivo').removeClass('active').addClass('notActive');  
        $('#btnProgramaActivo').removeClass('active').addClass('notActive');

        $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevoProgramaExterior() {
        $('#nombreInstitucionEducativaProgramaExterior').val("");
        $('#programaCursadoExterior').val("");
        $('#nucleoBasicoConocimientoProgramaExterior').val("");
        $('#nombreNucleoBasicoConocimientoProgramaExterior').val("");
        $('#tituloProgramaExterior').val("");                    
        $('#md_programa_exterior').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaInstitucionExteriorExperienciaDocencia() {
        institucionEducacionExterior = "institucionExperienciaDocenciaExterior"
        $('#institucionEducativaExterior').val("");
        $('#md_institucion_exterior').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaInstitucionExteriorEducacionContinua() {
        institucionEducacionExterior = "institucionEducacionContinuaExterior"
        $('#institucionEducativaExterior').val("");
        $('#md_institucion_exterior').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevaEducacionContinua() {
        $('#tipoCapacitacionEducacionContinua').val("").trigger('change');
        $('#institucionEducacionContinuaExterior').val("").trigger('change');
        $('#institucionEducacionContinuaColombiana').val("").trigger('change');
        $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
        $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
        $('#nombreCapacitacionEducacionContinua').val("");
        $('#numeroHorasEducacionContinua').val("");
        $('#nucleoBasicoConocimientoEducacionContinua').val("");
        $('#nombreNucleoBasicoConocimientoEducacionContinua').val("");
        $('#anyoEducacionContinua').val("");
        $('#consecutivo').val("");
        $('#certificadoEducacionContinua').val('');
        $('#btnEstudioExteriorSiEducacionContinua').removeClass('active').addClass('notActive');  
        $('#btnEstudioExteriorNoEducacionContinua').removeClass('active').addClass('notActive');
        $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
        $('#divMensajeInstitucionExteriorEducacionContinua').hide();
        
        bootstrap_alert_educacion_continua.removeWarning();
        bootstrap_alert_educaciones_continuas.removeWarning();
        $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
    }    

    function nuevaDistincion() {
        $('#descripcionDistincion').val("");
        $('#institucionOtorgaDistincion').val("");
        $('#fechaDistincion').val("");
        $('#consecutivo').val("");
        $('#certificadoDistincion').val('');
        bootstrap_alert_distincion.removeWarning();
        bootstrap_alert_distinciones.removeWarning();
        $('#md_distincion').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaExperienciaLaboral() {
        $('#tipoExperienciaLaboral').val("").trigger('change');
        $('#trabajoActualExperienciaLaboral').val("false");
        $('#btnTrabajoActualExperienciaLaboralSi').removeClass('active').addClass('notActive');  
        $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');  
        $('#experienciaLaboralFNSP').val("false");
        $('#btnExperienciaLaboralFNSPSi').removeClass('active').addClass('notActive');  
        $('#btnExperienciaLaboralFNSPNo').removeClass('active').addClass('notActive');
        $('#fechaIngresoExperienciaLaboral').val("");
        $('#fechaRetiroExperienciaLaboral').val("");
        $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val("");
        $('#nucleoBasicoConocimientoExperienciaLaboral').val("");
        $('#areaSaberExperienciaLaboral').val("").trigger('change');
        $('#tipoEmpresaExperienciaLaboral').val("").trigger('change');
        $('#nombreEmpresaExperienciaLaboral').val("");
        $('#actividadEconomicaExperienciaLaboral').val("").trigger('change');
        $('#tipoContratoExperienciaLaboral').val("").trigger('change');
        $('#cargoExperienciaLaboral').val("");
        $('#naturalezaCargoExperienciaLaboral').val("").trigger('change');
        $('#consecutivo').val("");
        $('#certificadoExperienciaLaboral').val('');
        bootstrap_alert_experiencia_laboral.removeWarning();
        bootstrap_alert_experiencias_laborales.removeWarning();
        $('#md_experiencia_laboral').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaExperienciaDocencia() {
        $('#trabajoActualDocencia').val("false");
        $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('active').addClass('notActive');
        $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('active').addClass('notActive');
        $('#experienciaDocenciaFNSP').val("false");
        $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive');
        $('#btnExperienciaDocenciaFNSPNo').removeClass('active').addClass('notActive');
        $('#btnExperienciaDocenciaExteriorSi').removeClass('active').addClass('notActive');  
        $('#btnExperienciaDocenciaExteriorNo').removeClass('active').addClass('notActive');
        $('#institucionExperienciaDocenciaColombiana').val("").trigger('change');
        $('#institucionExperienciaDocenciaExterior').val("").trigger('change');
        $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
        $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
        $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
        $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
        
        hojaVidaModel.consecutivoExperienciaDocencia(hojaVidaModel.experienciasDocencia().length);
        bootstrap_alert_experiencia_docencia.removeWarning();
        bootstrap_alert_experiencias_docencia.removeWarning();
        bootstrap_alert_cursos_experiencia_docencia.removeWarning();
        bootstrap_alert_curso_experiencia_docencia.removeWarning();

        $('#md_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevoCursoExperienciaDocencia() {
        $('#nombreCursoExperienciaDocencia').val("");
        $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val("");
        $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val("");
        $('#modalidadCursoExperienciaDocencia').val("").trigger('change');
        $('#nivelEstudioCursoExperienciaDocencia').val("").trigger('change');
        $('#numeroHorasCursoExperienciaDocencia').val("");
        $('#anyoCursoExperienciaDocencia').val("");
        $('#certificadoCursoExperienciaDocencia').val('');
        $('#consecutivo').val("");
        bootstrap_alert_curso_experiencia_docencia.removeWarning();
        bootstrap_alert_cursos_experiencia_docencia.removeWarning();

        if (hojaVidaModel.consecutivoExperienciaDocencia() === hojaVidaModel.experienciasDocencia().length) {
            var trabajoActualDocencia = strToBool($('#trabajoActualDocencia').val());
            var experienciaDocenciaFNSP = strToBool($('#experienciaDocenciaFNSP').val());
            var institucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana').val();
            var experienciaDocenciaExterior = strToBool($('#experienciaDocenciaExterior').val());
            if(experienciaDocenciaExterior) {
                institucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior').val();
            }
            if (institucionExperienciaDocencia === "") {
                bootstrap_alert_experiencia_docencia.warning('Debe seleccionar la institución');
                return false;
            }
            var formData = new FormData();
            formData.append("id", 0);
            formData.append("consecutivo", self.experienciasDocencia().length);
            formData.append("trabajoActual",trabajoActualDocencia);
            formData.append("fnsp",experienciaDocenciaFNSP);
            formData.append("exterior",experienciaDocenciaExterior);
            formData.append("institucion",institucionExperienciaDocencia);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/hojasVida/experienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response !== "") {
                        hojaVidaModel.experienciasDocencia.removeAll();
                        var datos = JSON.parse(response);
                        var idExperienciaDocencia = datos.id;
                        var experienciasDocencia = datos.experienciasDocencia;
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            if(idExperienciaDocencia == experienciasDocencia[i].id) {
                              hojaVidaModel.consecutivoExperienciaDocencia(experienciasDocencia[i].consecutivo);
                            }
                            hojaVidaModel.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                hojaVidaModel.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo)
                                });
                            }
                        }
                    }
                    $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al almacenar la experiencia en docencia.");
                }});
        } else {
            $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        }
    } 

    function nuevoArticulo() {
        $('#nombreArticulo').val("");
        $('#nombreRevistaArticulo').val("");
        $('#tipoAutorArticulo').val("").trigger('change');
        $('#urlArticulo').val("");
        $('#anyoArticulo').val("").trigger('change');
        $('#nucleoBasicoConocimientoArticulo').val("");
        $('#nombreNucleoBasicoConocimientoArticulo').val("");
        $('#consecutivo').val("");
        bootstrap_alert_articulo.removeWarning();
        bootstrap_alert_articulos.removeWarning();
        $('#md_articulo').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaPatente() {
        $('#fechaPatente').val("");
        $('#tipoPatente').val("").trigger('change');
        $('#propiedadCompartidaPatente').val("false");
        $('#clasePatente').val("").trigger('change');
        $('#descripcionPatente').val("");            
        $('#btnPropiedadCompartidaPatenteSi').removeClass('active').addClass('notActive');  
        $('#btnPropiedadCompartidaPatenteNo').removeClass('active').addClass('notActive');
        $('#consecutivo').val("");
        $('#documentoPatente').val('');
        bootstrap_alert_patente.removeWarning();
        bootstrap_alert_patentes.removeWarning();
        $('#md_patente').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoProductoConocimiento() {
        $('#tipoProductoConocimiento').val("").trigger('change');
        $('#nucleoBasicoProductoConocimiento').val("");
        $('#nombreNucleoBasicoProductoConocimiento').val("");
        $('#urlProductoConocimiento').val("");
        $('#descripcionProductoConocimiento').val("");            
        $('#consecutivo').val("");
        $('#documentoProductosConocimiento').val('');
        bootstrap_alert_producto_conocimiento.removeWarning();
        bootstrap_alert_productos_conocimiento.removeWarning();
        $('#md_producto_conocimiento').modal({backdrop: 'static', keyboard: false})  ;
    }

    function cerrarVentanaDocumentoSoporte() {
        $('#md_documento_soporte').modal('hide');
    }
    
    function cerrarVentanaIdioma() {
        $('#md_idioma').modal('hide');
    }
        
    function cerrarVentanaEducacionBasica() {
        $('#md_educacion_basica').modal('hide');
    }

    function cerrarVentanaEducacionSuperior() {
        $('#md_educacion_superior').modal('hide');
    }
    
    function cerrarVentanaPrograma() {
        $('#md_programa').modal('hide');
    }
    
    function cerrarVentanaProgramaExterior() {
        $('#md_programa_exterior').modal('hide');
    }

    function cerrarVentanaInstitucionExterior() {
        $('#md_institucion_exterior').modal('hide');
    }
    
    function cerrarVentanaEducacionContinua() {
        $('#md_educacion_continua').modal('hide');
    }
    
    function cerrarVentanaDistincion() {
        $('#md_distincion').modal('hide');
    }
   
    function cerrarVentanaExperienciaLaboral() {
        $('#md_experiencia_laboral').modal('hide');
    }
    
    function cerrarVentanaExperienciaDocencia() {
        $('#md_experiencia_docencia').modal('hide');
    }

    function cerrarVentanaCursoExperienciaDocencia() {
        $('#md_curso_experiencia_docencia').modal('hide');
    }

    function cerrarVentanaArticulo() {
        $('#md_articulo').modal('hide');
    }
    
    function cerrarVentanaPatente() {
        $('#md_patente').modal('hide');
    }
    
    function cerrarVentanaProductoConocimiento() {
        $('#md_producto_conocimiento').modal('hide');
    }

    $('#hojaVida').submit(function (evt) {
        evt.preventDefault();
        
        if ($('#copiaDocumentoIdentificacion').val() !== "" &&
            $('#copiaDocumentoIdentificacion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia del documento no debe ser mayor a 2MB');
            return false;
        }
        
        if ($('#copiaLibretaMilitar').val() !== "" &&
            $('#copiaLibretaMilitar')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia de la libreta militar no debe ser mayor a 2MB');
            return false;
        }

        if ($('#documentoRUT').val() !== "" &&
            $('#documentoRUT')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia del RUT no debe ser mayor a 2MB');
            return false;
        }

        if (strToBool($('#disponeRUT').val()) && $('#actividadEconomica').val() === "") {
            bootstrap_alert_hoja_vida.warning("Debe ingresar la actividad económica");
            return;
        }
        if (strToBool($('#empleadoUDEA').val()) && $('#tipoVinculacion').val() === '') {
            bootstrap_alert_hoja_vida.warning("Debe ingresar el tipo de vinculación con la U de A");
            return;
        }
        $('#md_guardar').modal({backdrop: 'static', keyboard: false})  ;
        current_progress = 0;
        var interval = setInterval(function() {
            current_progress += 10;
            $(".dynamic")
             .css("width", current_progress + "%")
             .attr("aria-valuenow", current_progress)
             .text(current_progress + "% Completado");
            if (current_progress >= 100){
               clearInterval(interval);
            }
            if(current_progress === 100) {
               $('#md_guardar').modal('hide');
            }
            }, 1000);
        var formData = new FormData();
        formData.append("idPersona", $("#idPersona").val());
        formData.append("actividadEconomica", $("#actividadEconomica").val());
        formData.append("apellidos", $("#apellidos").val());
        formData.append("ciudadResidencia", $("#ciudadResidencia").val());
        formData.append("direccion", $("#direccion").val());
        formData.append("discapacidad", $("#discapacidad").val());
        formData.append("disponeRUT", $("#disponeRUT").val());
        formData.append("empleadoUDEA", $("#empleadoUDEA").val());
        formData.append("disponibilidadViajar", $("#disponibilidadViajar").val());
        formData.append("distritoClase", $("#distritoClase").val());
        formData.append("egresadoUDEA", $("#egresadoUDEA").val());
        formData.append("fechaExpedicion", $("#fechaExpedicion").val());
        formData.append("fechaNacimiento", $("#fechaNacimiento").val());
        formData.append("grupoEtnico", $("#grupoEtnico").val());
        formData.append("libretaMilitar", $("#libretaMilitar").val());
        formData.append("lugarExpedicion", $("#lugarExpedicion").val());
        formData.append("lugarNacimiento", $("#lugarNacimiento").val());
        formData.append("nacionalidad", $("#nacionalidad").val());
        formData.append("nombres", $("#nombres").val());
        formData.append("numeroIdentificacion", $("#numeroIdentificacion").val());
        formData.append("sexo", $("#sexo").val());
        formData.append("tipoIdentificacion", $("#tipoIdentificacion").val());
        formData.append("tipoVinculacion", $("#tipoVinculacion").val());
        formData.append("perfil", $("#perfil").val());
        formData.append("investigadorReconocidoColciencias", $("#investigadorReconocidoColciencias").val());
        formData.append("urlCVLAC", $("#urlCVLAC").val());
        formData.append("tipoInvestigador", $("#tipoInvestigador").val());
        formData.append("codigoORCID", $("#codigoORCID").val());
        formData.append("identificadorScopus", $("#identificadorScopus").val());
        formData.append("researcherId", $("#researcherId").val());
        if ($('#copiaDocumentoIdentificacion').val() !== "") {
           formData.append("copiaDocumentoIdentificacion", $('#copiaDocumentoIdentificacion')[0].files[0]);
        }
        if ($('#copiaLibretaMilitar').val() !== "") {
            formData.append("copiaLibretaMilitar", $('#copiaLibretaMilitar')[0].files[0]);
        }
        if ($('#documentoRUT').val() !== "") {
            formData.append("documentoRUT", $('#documentoRUT')[0].files[0]);
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/editar",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                $('#md_guardar').modal('hide');
                if(response != "") {
                    $('#mensaje').val(response);
                } else {
                    if(copiaDocumentoIdentificacionCambiado) {
                      $('#btnCopiaDocumentoIdentificacionValidado').hide();  
                      $('#btnCopiaDocumentoIdentificacionNoValidado').show();  
                    }
                    if(copiaLibretaMilitarCambiado) {
                      $('#btnCopiaLibretaMilitarValidado').hide();  
                      $('#btnCopiaLibretaMilitarNoValidado').show();  
                    }
                    if(documentoRUTCambiado) {
                      $('#btnDocumentoRUTValidado').hide();  
                      $('#btnDocumentoRUTNoValidado').show();  
                    }
                    if(urlCVLACCambiada) {
                      $('#btnUrlCVLACValidada').hide();  
                      $('#btnUrlCVLACNoValidada').show();  
                    }
                    $('#mensaje').text('Información de la hoja de vida actualizada exitosamente');
                }
                $('#md_guardado_exitoso').modal({backdrop: 'static', keyboard: false});
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_hoja_vida.warning("Error al almacenar la hoja de vida.");
                $('#md_guardar').modal('hide');
            }});
    });

    function obtenerProgramasCursados(institucion) {
        $('#tituloPrograma').val('');
        var nivel = $('#nivelEstudioEducacionSuperior').val();
        if(institucion != "") {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/programasInstitucion?institucion=" + institucion + "&nivel=" + nivel,
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
                }
            }});
        } else {
          $('#programaCursado').find('option').remove();  
        }
    }

    function verCopiaCedula() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/copiaCedula/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaCedula/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verCopiaRUT() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/copiaRUT/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaRUT/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verCopiaLibretaMilitar() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/copiaLibretaMilitar/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaLibretaMilitar/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function establecerEgresadoUdeA() {
        var egresadoUDEA = false;
        for (var i = 0; i < hojaVidaModel.educacionesSuperiores().length; i++) {
            if(hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_ANDES ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_TURBO ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA) {

              egresadoUDEA = true;

               break;
            }
        }
        if(egresadoUDEA) {
            $('#btnEgresadoUdeASi').removeClass('notActive').addClass('active');  
            $('#btnEgresadoUdeANo').removeClass('active').addClass('notActive');
            $('#egresadoUDEA').val('true');
        } else {
            $('#btnEgresadoUdeANo').removeClass('notActive').addClass('active');  
            $('#btnEgresadoUdeASi').removeClass('active').addClass('notActive');
            $('#egresadoUDEA').val('false');
        }
    }

    bootstrap_alert_institucion_exterior = {};
    bootstrap_alert_institucion_exterior.warning = function (message) {
        $('#alert_institucion_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_institucion_exterior.removeWarning = function () {
        $('#alert_institucion_exterior').html('');
    };

    bootstrap_alert_ciudad_extranjera = {};
    bootstrap_alert_ciudad_extranjera.warning = function (message) {
        $('#alert_ciudad_extranjera').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_ciudad_extranjera.removeWarning = function () {
        $('#alert_ciudad_extranjera').html('');
    };
    
    bootstrap_alert_hoja_vida = {};
    bootstrap_alert_hoja_vida.warning = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.success = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.removeWarning = function () {
        $('#alert_hoja_vida').html('');
    };

    bootstrap_alert_telefono = {};
    bootstrap_alert_telefono.warning = function (message) {
        $('#alert_telefono').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_telefono.removeWarning = function () {
        $('#alert_telefono').html('');
    };

    bootstrap_alert_telefonos = {};
    bootstrap_alert_telefonos.warning = function (message) {
        $('#alert_telefonos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_telefonos.removeWarning = function () {
        $('#alert_telefonos').html('');
    };
    bootstrap_alert_telefonos.success = function (message) {
        $('#alert_telefonos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_cuenta_bancaria = {};
    bootstrap_alert_cuenta_bancaria.warning = function (message) {
        $('#alert_cuenta_bancaria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cuenta_bancaria.removeWarning = function () {
        $('#alert_cuenta_bancaria').html('');
    };

    bootstrap_alert_cuentas_bancarias = {};
    bootstrap_alert_cuentas_bancarias.warning = function (message) {
        $('#alert_cuentas_bancarias').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cuentas_bancarias.removeWarning = function () {
        $('#alert_cuentas_bancarias').html('');
    };
    bootstrap_alert_cuentas_bancarias.success = function (message) {
        $('#alert_cuentas_bancarias').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_correo_electronico = {};
    bootstrap_alert_correo_electronico.warning = function (message) {
        $('#alert_correo_electronico').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_correo_electronico.removeWarning = function () {
        $('#alert_correo_electronico').html('');
    };

    bootstrap_alert_correos_electronicos = {};
    bootstrap_alert_correos_electronicos.warning = function (message) {
        $('#alert_correos_electronicos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_correos_electronicos.removeWarning = function () {
        $('#alert_correos_electronicos').html('');
    };
    bootstrap_alert_correos_electronicos.success = function (message) {
        $('#alert_correos_electronicos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_documento_soporte = {};
    bootstrap_alert_documento_soporte.warning = function (message) {
        $('#alert_documento_soporte').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_documento_soporte.removeWarning = function () {
        $('#alert_documento_soporte').html('');
    };

    bootstrap_alert_documentos_soporte = {};
    bootstrap_alert_documentos_soporte.warning = function (message) {
        $('#alert_documentos_soporte').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_documentos_soporte.removeWarning = function () {
        $('#alert_documentos_soporte').html('');
    };
    bootstrap_alert_documentos_soporte.success = function (message) {
        $('#alert_documentos_soporte').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_idioma = {};
    bootstrap_alert_idioma.warning = function (message) {
        $('#alert_idioma').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idioma.removeWarning = function () {
        $('#alert_idioma').html('');
    };

    bootstrap_alert_idiomas = {};
    bootstrap_alert_idiomas.warning = function (message) {
        $('#alert_idiomas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idiomas.removeWarning = function () {
        $('#alert_idiomas').html('');
    };
    bootstrap_alert_idiomas.success = function (message) {
        $('#alert_idiomas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_basica = {};
    bootstrap_alert_educacion_basica.warning = function (message) {
        $('#alert_educacion_basica').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_basica.removeWarning = function () {
        $('#alert_educacion_basica').html('');
    };

    bootstrap_alert_educaciones_basicas = {};
    bootstrap_alert_educaciones_basicas.warning = function (message) {
        $('#alert_educaciones_basicas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_basicas.removeWarning = function () {
        $('#alert_educaciones_basicas').html('');
    };
    bootstrap_alert_educaciones_basicas.success = function (message) {
        $('#alert_educaciones_basicas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_superior = {};
    bootstrap_alert_educacion_superior.warning = function (message) {
        $('#alert_educacion_superior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_superior.removeWarning = function () {
        $('#alert_educacion_superior').html('');
    };

    bootstrap_alert_educaciones_superiores = {};
    bootstrap_alert_educaciones_superiores.warning = function (message) {
        $('#alert_educaciones_superiores').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_superiores.removeWarning = function () {
        $('#alert_educaciones_superiores').html('');
    };
    bootstrap_alert_educaciones_superiores.success = function (message) {
        $('#alert_educaciones_superiores').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_programa_exterior = {};
    bootstrap_alert_programa_exterior.warning = function (message) {
        $('#alert_programa_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programa_exterior.removeWarning = function () {
        $('#alert_programa_exterior').html('');
    };

    bootstrap_alert_programas_exterior = {};
    bootstrap_alert_programas_exterior.warning = function (message) {
        $('#alert_programas_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programas_exterior.removeWarning = function () {
        $('#alert_programas_exterior').html('');
    };
    bootstrap_alert_programas_exterior.success = function (message) {
        $('#alert_programas_exterior').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_continua = {};
    bootstrap_alert_educacion_continua.warning = function (message) {
        $('#alert_educacion_continua').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_continua.removeWarning = function () {
        $('#alert_educacion_continua').html('');
    };

    bootstrap_alert_educaciones_continuas = {};
    bootstrap_alert_educaciones_continuas.warning = function (message) {
        $('#alert_educaciones_continuas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_continuas.removeWarning = function () {
        $('#alert_educaciones_continuas').html('');
    };
    bootstrap_alert_educaciones_continuas.success = function (message) {
        $('#alert_educaciones_continuas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_distincion = {};
    bootstrap_alert_distincion.warning = function (message) {
        $('#alert_distincion').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_distincion.removeWarning = function () {
        $('#alert_distincion').html('');
    };
    
    bootstrap_alert_distinciones = {};
    bootstrap_alert_distinciones.warning = function (message) {
        $('#alert_distinciones').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_distinciones.removeWarning = function () {
        $('#alert_distinciones').html('');
    };
    bootstrap_alert_distinciones.success = function (message) {
        $('#alert_distinciones').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_experiencia_laboral = {};
    bootstrap_alert_experiencia_laboral.warning = function (message) {
        $('#alert_experiencia_laboral').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencia_laboral.removeWarning = function () {
        $('#alert_experiencia_laboral').html('');
    };

    bootstrap_alert_experiencias_laborales = {};
    bootstrap_alert_experiencias_laborales.warning = function (message) {
        $('#alert_experiencias_laborales').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencias_laborales.removeWarning = function () {
        $('#alert_experiencias_laborales').html('');
    };
    bootstrap_alert_experiencias_laborales.success = function (message) {
        $('#alert_experiencias_laborales').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_experiencia_docencia = {};
    bootstrap_alert_experiencia_docencia.warning = function (message) {
        $('#alert_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencia_docencia.removeWarning = function () {
        $('#alert_experiencia_docencia').html('');
    };
    
    bootstrap_alert_experiencias_docencia = {};
    bootstrap_alert_experiencias_docencia.warning = function (message) {
        $('#alert_experiencias_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencias_docencia.removeWarning = function () {
        $('#alert_experiencias_docencia').html('');
    };
    bootstrap_alert_experiencias_docencia.success = function (message) {
        $('#alert_experiencias_docencia').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_curso_experiencia_docencia = {};
    bootstrap_alert_curso_experiencia_docencia.warning = function (message) {
        $('#alert_curso_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_curso_experiencia_docencia.removeWarning = function () {
        $('#alert_curso_experiencia_docencia').html('');
    };

    bootstrap_alert_cursos_experiencia_docencia = {};
    bootstrap_alert_cursos_experiencia_docencia.warning = function (message) {
        $('#alert_cursos_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cursos_experiencia_docencia.removeWarning = function () {
        $('#alert_cursos_experiencia_docencia').html('');
    };
    bootstrap_alert_cursos_experiencia_docencia.success = function (message) {
        $('#alert_cursos_experiencia_docencia').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_articulo = {};
    bootstrap_alert_articulo.warning = function (message) {
        $('#alert_articulo').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_articulo.removeWarning = function () {
        $('#alert_articulo').html('');
    };

    bootstrap_alert_articulos = {};
    bootstrap_alert_articulos.warning = function (message) {
        $('#alert_articulos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_articulos.removeWarning = function () {
        $('#alert_articulos').html('');
    };
    bootstrap_alert_articulos.success = function (message) {
        $('#alert_articulos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_patente = {};
    bootstrap_alert_patente.warning = function (message) {
        $('#alert_patente').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_patente.removeWarning = function () {
        $('#alert_patente').html('');
    };

    bootstrap_alert_patentes = {};
    bootstrap_alert_patentes.warning = function (message) {
        $('#alert_patentes').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_patentes.removeWarning = function () {
        $('#alert_patentes').html('');
    };
    bootstrap_alert_patentes.success = function (message) {
        $('#alert_patentes').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_producto_conocimiento = {};
    bootstrap_alert_producto_conocimiento.warning = function (message) {
        $('#alert_producto_conocimiento').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_producto_conocimiento.removeWarning = function () {
        $('#alert_producto_conocimiento').html('');
    };
    
    bootstrap_alert_productos_conocimiento = {};
    bootstrap_alert_productos_conocimiento.warning = function (message) {
        $('#alert_productos_conocimiento').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_productos_conocimiento.removeWarning = function () {
        $('#alert_productos_conocimiento').html('');
    };
    bootstrap_alert_productos_conocimiento.success = function (message) {
        $('#alert_productos_conocimiento').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    var correosElectronicos = [];
    var cuentasBancarias = [];
    var telefonos = [];
    var documentosSoporte = [];
    var idiomas = [];
    var educacionesBasicas = [];
    var educacionesSuperiores = [];
    var educacionesContinuas = [];
    var distinciones = [];
    var experienciasLaborales = [];
    var experienciasDocencia = [];
    var articulos = [];
    var patentes = [];
    var productosConocimiento = [];
    
    <c:if test = "${correosElectronicosJSON != null}">
    correosElectronicos = ${correosElectronicosJSON};
    </c:if>
    <c:if test = "${cuentasBancariasJSON != null}">
    cuentasBancarias = ${cuentasBancariasJSON};
    </c:if>
    <c:if test = "${telefonosJSON != null}">
    telefonos = ${telefonosJSON};
    </c:if>
    <c:if test = "${documentosSoporteJSON != null}">
    documentosSoporte = ${documentosSoporteJSON};
    </c:if>
    <c:if test = "${idiomasJSON != null}">
    idiomas = ${idiomasJSON};
    </c:if>
    <c:if test = "${educacionesBasicasJSON != null}">
    educacionesBasicas = ${educacionesBasicasJSON};
    </c:if>
    <c:if test = "${educacionesSuperioresJSON != null}">
    educacionesSuperiores = ${educacionesSuperioresJSON};
    </c:if>
    <c:if test = "${educacionesContinuasJSON != null}">
    educacionesContinuas = ${educacionesContinuasJSON};
    </c:if>        
    <c:if test = "${distincionesJSON != null}">
    distinciones = ${distincionesJSON};
    </c:if>
    <c:if test = "${experienciasLaboralesJSON != null}">
    experienciasLaborales = ${experienciasLaboralesJSON};
    </c:if>
    <c:if test = "${experienciasDocenciaJSON != null}">
    experienciasDocencia = ${experienciasDocenciaJSON};
    </c:if>
    <c:if test = "${articulosJSON != null}">
    articulos = ${articulosJSON};
    </c:if>        
    <c:if test = "${patentesJSON != null}">
    patentes = ${patentesJSON};
    </c:if>
    <c:if test = "${productosConocimientoJSON != null}">
    productosConocimiento = ${productosConocimientoJSON};
    </c:if>
    var hojaVidaModel = new HojaVidaModel(correosElectronicos, 
        cuentasBancarias, 
        telefonos, 
        documentosSoporte, 
        idiomas, 
        educacionesBasicas, 
        educacionesSuperiores, 
        educacionesContinuas, 
        distinciones,
        experienciasLaborales,
        experienciasDocencia,
        articulos,
        patentes,
        productosConocimiento);
    ko.applyBindings(hojaVidaModel);

    establecerEgresadoUdeA();
</script>