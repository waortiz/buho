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
            <div class="form-group">
                    <ul class="nav nav-tabs">
                        <li class="active" id="liinfper"><a data-toggle="tab" href="#tabinfper" >
                        <i  class="fa fa-address-book"></i>
                            Informacion personal</a></li>
                         <li class="active" style="display: none;" id="liperfil"><a data-toggle="tab" href="#tabperfil" >
                        <i  class="fa fa-address-book-o"></i>
                            Perfil y soportes</a></li>
                         <li class="active" style="display: none;" id="liaspacad"><a data-toggle="tab" href="#tabaspacad" >
                        <i  class="fa fa-mortar-board"></i>
                            Aspectos acad&eacute;micos</a></li>
                        <li class="active" style="display: none;" id="liedunoform"><a data-toggle="tab" href="#tabedunoform" >
                        <i  class="fa fa-address-card-o"></i> 
                            Educación no formal</a></li>
                        <li class="active" style="display: none;" id="liexplab"><a data-toggle="tab" href="#tabexplab" >
                        <i  class="fa fa-list"></i>
                            Experiencia laboral</a></li>
                        <li class="active" style="display: none;" id="liinves"><a data-toggle="tab" href="#tabinves" >
                        <i  class="fa fa-lightbulb-o"></i>
                            Investigacion / innovaci&oacute;n</a></li>
                        <li class="active" style="display: none;" id="lidist"><a data-toggle="tab" href="#tabdist" >
                        <i  class="fa fa-trophy"></i>
                            Distinciones</a></li>
                    </ul>
            </div>
            <div id="formpersonal">
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
                                <c:if test = "${hojaVida.isTieneCopiaDocumentoIdentificacion() && hojaVida.isTieneCopiaDocumentoIdentificacion() && !hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                </c:if>    
                                <c:if test = "${hojaVida.isTieneCopiaDocumentoIdentificacion() && hojaVida.isTieneCopiaDocumentoIdentificacion() && hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                                <c:if test = "${!hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                                <c:if test = "${!hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                    <button id="btnCopiaDocumentoIdentificacionValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                    <button id="btnCopiaDocumentoIdentificacionNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                </c:if>                              
                                <c:if test = "${hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                <button id="btnVerCopiaDocumentoIdentificacion" class="btn btn-success btn-xs" type="button" onclick="verCopiaDocumentoIdentificacion()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarCopiaDocumentoIdentificacion" class="btn btn-danger btn-xs" type="button" onclick="eliminarCopiaDocumentoIdentificacion()" data-toggle="tooltip" data-placement="top" title="Eliminar"><span class="glyphicon glyphicon-remove"></span></button>
                                </c:if>
                                <c:if test = "${!hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                <button id="btnVerCopiaDocumentoIdentificacion" class="btn btn-success btn-xs" type="button" onclick="verCopiaDocumentoIdentificacion()" data-toggle="tooltip" data-placement="top" title="Descargar" style="display: none;"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarCopiaDocumentoIdentificacion" class="btn btn-danger btn-xs" type="button" onclick="eliminarCopiaDocumentoIdentificacion()" data-toggle="tooltip" data-placement="top" title="Eliminar" style="display: none;"><span class="glyphicon glyphicon-remove"></span></button>
                                </c:if>
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
                            <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar() && !hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button id="btnCopiaLibretaMilitarNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnCopiaLibretaMilitarValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar() && hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button id="btnCopiaLibretaMilitarValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                <button id="btnCopiaLibretaMilitarNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                            </c:if>                            
                            <c:if test = "${!hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button id="btnCopiaLibretaMilitarValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                                <button id="btnCopiaLibretaMilitarNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                            </c:if>                            
                            <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button id="btnVerCopiaLibretaMilitar" class="btn btn-success btn-xs" type="button" onclick="verCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarCopiaLibretaMilitar" class="btn btn-danger btn-xs" type="button" onclick="eliminarCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Eliminar"><span class="glyphicon glyphicon-remove"></span></button>
                            </c:if> 
                            <c:if test = "${!hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button id="btnVerCopiaLibretaMilitar" class="btn btn-success btn-xs" type="button" onclick="verCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Descargar" style="display: none;"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarCopiaLibretaMilitar" class="btn btn-danger btn-xs" type="button" onclick="eliminarCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Eliminar" style="display: none;"><span class="glyphicon glyphicon-remove"></span></button>
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
                            <c:if test = "${hojaVida.isTieneDocumentoRUT() && !hojaVida.isDocumentoRUTValidado()}">
                                <button id="btnDocumentoRUTNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnDocumentoRUTValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isTieneDocumentoRUT() && hojaVida.isDocumentoRUTValidado()}">
                                <button id="btnDocumentoRUTNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnDocumentoRUTValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" ><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>
                            <c:if test = "${!hojaVida.isTieneDocumentoRUT()}">
                                <button id="btnDocumentoRUTNoValidado" class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado" style="display: none;"><span class='fa fa-question-circle-o'></span></button>
                                <button id="btnDocumentoRUTValidado" class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado" style="display: none;"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>
                            <c:if test = "${hojaVida.isTieneDocumentoRUT()}">
                                <button id="btnVerDocumentoRUT" class="btn btn-success btn-xs" type="button" onclick="verCopiaRUT()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarDocumentoRUT" class="btn btn-danger btn-xs" type="button" onclick="eliminarDocumentoRUT()" data-toggle="tooltip" data-placement="top" title="Eliminar"><span class="glyphicon glyphicon-remove"></span></button>
                            </c:if>                              
                            <c:if test = "${!hojaVida.isTieneDocumentoRUT()}">
                                <button id="btnVerDocumentoRUT" class="btn btn-success btn-xs" type="button" onclick="verDocumentoRUT()" data-toggle="tooltip" data-placement="top" title="Descargar" style="display: none;"><span class="glyphicon glyphicon-download"></span></button>
                                <button id="btnEliminarDocumentoRUT" class="btn btn-danger btn-xs" type="button" onclick="eliminarDocumentoRUT()" data-toggle="tooltip" data-placement="top" title="Eliminar" style="display: none;"><span class="glyphicon glyphicon-remove"></span></button>
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
                            <div style="overflow-y: auto; max-height:200px;">
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
                    </div>
                    <div class="col-md-3">
                        <label>Agregar correo electr&oacute;nico</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevoCorreoElectronico()">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 
                        <div class="table-responsive">
                            <br>
                            <div id="alert_correos_electronicos"></div>
                            <div style="overflow-y: auto; max-height:200px;">
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
                    </div>
                    <div class="col-md-5">
                        <label>Agregar cuenta bancaria</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevaCuentaBancaria()" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 
                        <div class="table-responsive">
                            <br>
                            <div id="alert_cuentas_bancarias"></div>
                            <div style="overflow-y: auto; max-height:200px;">
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
                            <table class="table tabla table-hover tableestilo" id="tblDocumentosSoporte">
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
                    <div class="col-md-12">
                        <label>Agregar estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionBasica();" >
                            <span class="glyphicon glyphicon-plus"></span>   
                        </button>
                        <div class="table-responsive">
                            <br>
                            <div id="alert_educaciones_basicas"></div>
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table tabla table-hover tableestilo" id="tblEducacionesBasicas">
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
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table tabla table-hover tableestilo" id="tblEducacionesSuperiores">
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
                                                                <select style="width: 80%;" name="nombreInstitucionEducativaProgramaExterior" id="nombreInstitucionEducativaProgramaExterior" class="js-select-basic-single js-states form-control">
                                                                    <option value=""></option>
                                                                    <c:forEach var="institucionEducativa" items="${institucionesEducativasExterior}">
                                                                        <option value="${institucionEducativa.getId()}">${institucionEducativa.getNombre()}</option>
                                                                    </c:forEach>                                                                  
                                                                </select>
                                                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevaInstitucionEducativaProgramaExterior" onclick="nuevaInstitucionExterior();"><span class="glyphicon glyphicon-plus"></span></button>
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
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><br>
                                                    <input type="text" style="border:0;font-style: italic;" class="form-control" readonly id="nombreNucleoBasicoConocimientoEducacionSuperior">
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
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table tabla table-hover tableestilo" id="tblIdiomas">
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
                        <label>Estudios educación no formal</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionContinua();" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>               
                        <div class="table-responsive">
                            <br>
                            <div id="alert_educaciones_continuas"></div>
                            <div style="overflow-y: auto; max-height:600px;">
                            <table class="table tabla table-hover tableestilo" id="tblEducacionesContinuas">
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
                                                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevaInstitucionExteriorEducacionContinua" onclick="nuevaInstitucionExterior();"><span class="glyphicon glyphicon-plus"></span></button>
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
                <label>Agregar experiencia laboral</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaExperienciaLaboral();" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>	
                <div class="table-responsive">
                    <br>
                    <div id="alert_experiencias_laborales"></div>
		    <div style="overflow-y: auto; max-height:300px;">
                        <table class="table tabla table-hover tableestilo" id="tblExperienciasLaborales">
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
		    <div style="overflow-y: auto; max-height:300px;">
                    <table class="table tabla table-hover tableestilo" id="tblExperienciasDocencia">
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
                                            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" id="btnNuevaInstitucionExteriorExperienciaDocencia" onclick="nuevaInstitucionExterior();"><span class="glyphicon glyphicon-plus"></span></button>
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
					    <div style="overflow-y: auto; max-height:200px;">
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
			    <div style="overflow-y: auto; max-height:200px;">
                            <table class="table tabla table-hover tableestilo" id="tblArticulos">
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
			<div style="overflow-y: auto; max-height:200px;">
                         <table class="table tabla table-hover tableestilo" id="tblPatentes">
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
			     <div style="overflow-y: auto; max-height:200px;">
                             <table class="table tabla table-hover tableestilo" id="tblProductosConocimiento">
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
                <div class="col-md-12">
                    <legend>Distinciones, premios y reconocimientos</legend>  
                    <label>Agregar distinci&oacute;n</label>
                    <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaDistincion();" ><span class="glyphicon glyphicon-plus"></span></button>
                    <br>
                    <div class="table-responsive">
                        <br>
                        <div id="alert_distinciones"></div>
			<div style="overflow-y: auto; max-height:600px;">
                        <table class="table tabla table-hover tableestilo" id="tblDistinciones" style="width: 100%;">
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
            <div class="modal fade" id="ubicacionModal">
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
    var contextPath = "${pageContext.request.contextPath}";
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
</script>
<script type="text/javascript" src='<c:url value="/resources/js/hojaVida.js" />'></script> 