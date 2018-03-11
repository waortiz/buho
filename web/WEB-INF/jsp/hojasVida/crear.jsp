<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">         
    <div class="contenido-nav2">
        <ul class="navbar-nav navbar-sidenav">
            <li class="nav-item" id="btnpersonal" data-toggle="tooltip" data-placement="right" title="" data-original-title="Información personal">
                <a class="nav-link" >
                    <i  class="fa fa-address-book" style="font-size:36px;"></i>
                    <span class="nav-link-text">Información personal</span>
                </a>
            </li>
            <li class="nav-item" id="btnpersopor" data-toggle="tooltip" data-placement="right" title="" data-original-title="Perfil">
                <a class="nav-link" >
                    <i  class="fa fa-address-book-o" style="font-size:36px;"></i>
                    <span class="nav-link-text">Perfil</span>
                </a>
            </li>
            <li class="nav-item" id="btnacademico" data-toggle="tooltip" data-placement="right" title="" data-original-title="Aspectos Acádemicos">
                <a class="nav-link" >
                    <i  class="fa fa-mortar-board" style="font-size:36px;"></i>
                    <span class="nav-link-text">Aspectos Acádemicos</span>
                </a>
            </li>
            <li class="nav-item" id="btneducontinua" data-toggle="tooltip" data-placement="right" title="" data-original-title="Educación continúa">
                <a class="nav-link" >          
                    <i  class="fa fa-address-card-o" style="font-size:36px;"></i> 
                    <span class="nav-link-text">Educación continúa </span>
                </a>
            </li>
            <li class="nav-item" id="btnexperiencia" data-toggle="tooltip" data-placement="right" title="" data-original-title="Experiencia laboral">
                <a class="nav-link" >
                    <i  class="fa fa-list" style="font-size:36px;"></i> 
                    <span class="nav-link-text">Experiencia laboral</span>
                </a>
            </li>
            <li class="nav-item" id="btninvestigacion" data-toggle="tooltip" data-placement="right" title="" data-original-title="Investigación e Innovación">
                <a class="nav-link" style="margin-left: 8px;" >
                    <i  class="fa fa-lightbulb-o" style="font-size:36px;"></i></center>
                    <span class="nav-link-text">Investigación e Innovación</span>
                </a>
            </li>
            <li class="nav-item" id="btndist" data-toggle="tooltip" data-placement="right" title="" data-original-title="Distinciones">
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
                        <button  id="btnpersonal" class="btn btn-success">Informaci&oacute;n personal</button>
                    </div>
                </div>                    
                <!-- FILA 1 FROMULARIO-->
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
                                <form:input class="form-control" path="numeroIdentificacion" maxlength="12" data-validation="required" data-validation-error-msg="Debe indicar el numero de identificación"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="fechaExpedicion">Fecha de expedici&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de expedición">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date'>
                                <form:input class="form-control fecha2" path="fechaExpedicion" data-validation="required" data-validation-error-msg="Debe indicar la fecha de expedición"/>
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
                        <div class="form group form-inline">
                            <label for="">Copia c&eacute;dula</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe cargar la copia de cedula">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <input type="file" name="copiaDocumentoIdentificacion" id="copiaDocumentoIdentificacion" class="form-control" style="width: 90%">
                            <c:if test = "${!hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>                              
                            <c:if test = "${hojaVida.isTieneCopiaDocumentoIdentificacion()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                            </c:if>                              
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
                                <div class="form-group">
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
                <!-- FIN FILA 1 FROMULARIO-->
                <!-- FILA 2 FROMULARIO-->
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="nombres">Nombres</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su nombre completo ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input class="form-control" path="nombres" data-validation="required" data-validation-error-msg="Debe indicar su nombre completo"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="apellidos">Apellidos</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el apellido completo">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input class="form-control" path="apellidos" data-validation="required" data-validation-error-msg="Debe indicar el apellido completo"/>
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
                            </div>
                            <form:hidden path="sexo" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="nacionalidad">Nacionalidad</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la nacionalidad">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="nacionalidad" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar la nacionalidad">
                                    <form:option value=""></form:option>
                                    <form:options items="${paises}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>                            
                </div>
                <!-- FIN FILA 2 FROMULARIO-->
                <!-- FILA 3 FROMULARIO-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha de nacimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de nacimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date' data-validation="required" data-validation-error-msg="Debe indicar la fecha de nacimiento">
                                <form:input class="form-control fecha2" path="fechaNacimiento"/>
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
                            <label>N&deg; libreta militar</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de libreta militar ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input type="text" class="form-control" path="libretaMilitar" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Distrito -- clase</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de distrito y su clase de la libreta militar">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:input type="text" class="form-control" path="distritoClase" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <div class="form-group form-inline">
                            <label>Copia Libreta militar</label>
                            <input type="file" name="documentoLibretaMilitar" id="documentoLibretaMilitar" class="form-control" style="width: 90%">
                            <c:if test = "${!hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>                            
                            <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                            </c:if>                              
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
                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la direccion">
                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                            </a>
                            <br>     
                            <form:input class="form-control" path="direccion" style="width: 90%" readonly="true" data-validation="required" data-validation-error-msg="Debe indicar la direccion"/>
                            <button type="button" class="btn btn-success btn-sm" data-target="#md_direccion" data-toggle="modal">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- FILA 4 FROMULARIO-->
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
                                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de direccion"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
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
                                                <input type="text" id="rescalle" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="numdir" id="numdir" class="form-control">
                                                <p>Ejemplo: 65</p>
                                                <input type="text" id="resnumdir" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="letdir" id="letdir" class="form-control">
                                                <p>Ejemplo: AA</p>
                                                <input type="text" id="resletdir" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select  name="dirsur" id="dirsur" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <option value="-">--</option>
                                                    <option value="Sur">Sur</option>
                                                    <option value="Norte">Norte</option>
                                                    <option value="Este">Este</option>
                                                    <option value="Oeste">Oeste</option>
                                                </select>
                                                <input type="text" id="resdisur" style="display:none;">
                                                <p>Ejemplo: sur</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="num2dir" id="num2dir" class="form-control">
                                                <input type="text" id="resnum2dir" style="display:none;">
                                                <p>Ejemplo: 45</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="let2dir" id="let2dir" class="form-control">
                                                <input type="text" id="reslet2dir" style="display:none;">
                                                <p>Ejemplo: B</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select  name="direst" id="direst" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <option>-</option>
                                                    <option value="Sur">Sur</option>
                                                    <option value="Norte">Norte</option>
                                                    <option value="Este">Este</option>
                                                    <option value="Oeste">Oeste</option>
                                                </select>
                                                <input type="text" id="resdirest" style="display:none;">
                                                <p>Ejemplo: este</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <input type="text" name="num3dir" id="num3dir" class="form-control">
                                                <input type="text" id="resnum3dir" style="display:none;">
                                                <p>Ejemplo: 45</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="cid_certificado">(urb,bloque.etc)</label> 
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe diligenciar el nombre de urbanizacion y el numero de bloque y apto"><i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" class="form-control" name="dirurb" id="dirurb">
                                                <input type="text" id="resdirub" style="display:none;">
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
                                                <input type="text" class="form-control" name="dirrural" id="dirrural">
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
                <!-- FIN FILA 4 FROMULARIO-->
                <!-- FILA 5 FROMULARIO-->

                <!-- FIN FILA 5 FROMULARIO-->
                <!-- FILA 6 FROMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="grupoEtnico">Grupo &eacute;tnico </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el grupo etnico que pertenece">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                <form:select path="grupoEtnico" class="js-select-basic-single js-states form-control" data-validation="required" data-validation-error-msg="Debe seleccionar el grupo etnico que pertenece">
                                    <form:option value=""></form:option>
                                    <form:options items="${gruposEtnico}" itemLabel="nombre" itemValue="id"/>
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
                <!-- FIN FILA 5 FROMULARIO-->
                <!-- FILA 6 FROMULARIO-->
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
                            <label for="actividadEconomica">Actividad econ&oacute;mica del RUT</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad económica del RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <form:select path="actividadEconomica" class="js-select-basic-single js-states form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${actividadesEconomicas}" itemLabel="nombre" itemValue="id"/>
                                </form:select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group form-inline">
                            <label for="">Documento de soporte RUT</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe cargar el documento de RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <input type="file" name="documentoRUT" id="documentoRUT" class="form-control" style="width: 90%">
                            <c:if test = "${!hojaVida.isDocumentoRUTValidado()}">
                                <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                            </c:if>    
                            <c:if test = "${hojaVida.isDocumentoRUTValidado()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                            </c:if>
                            <c:if test = "${hojaVida.isTieneDocumentoRUT()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
                            </c:if>                              
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
                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                <c:if test = "${hojaVida.isEgresadoUDEA()}">
                                    <a class="btn btn-primary btn-sm active" data-toggle="egresadoUDEA" data-title="true">Si</a>
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="egresadoUDEA" data-title="false">No</a>
                                </c:if>
                                <c:if test = "${!hojaVida.isEgresadoUDEA()}">
                                    <a class="btn btn-primary btn-sm notActive" data-toggle="egresadoUDEA" data-title="true">Si</a>
                                    <a class="btn btn-primary btn-sm active" data-toggle="egresadoUDEA" data-title="false">No</a>
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
                            <label for="tipoVinculacion">Tipo de vinculacion</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de vinculaci&oacute;n">
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
                        <button type="button" class="btn btn-success btn-sm" onclick="nuevoTelefono()" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbtel">
                                <thead>
                                <th>Tipo</th>
                                <th>N&uacute;mero</th>
                                <th></th>
                                </thead>
                                <tbody data-bind="foreach: { data: telefonos }">
                                    <tr class="table-row">
                                        <td style="width: 30%">
                                            <span data-bind="text: nombreTipo" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: tipo, attr: { 'name': 'telefonos[' + $index() + '].tipo'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numero" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: numero, attr: { 'name': 'telefonos[' + $index() + '].numero'  }">
                                        </td>
                                        <td style='white-space: nowrap'>
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarTelefono"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' data-bind="click: $root.eliminarTelefono"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'telefonos[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'telefonos[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>                                                                             
                            </table>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label>Agregar correo electr&oacute;nico</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevoCorreoElectronico()" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 

                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbemail">
                                <thead>
                                <th>Email</th>
                                <th></th>                                         
                                </thead>
                                <tbody data-bind="foreach: { data: correosElectronicos }">
                                    <tr class="table-row">
                                        <td style="width: 80%">
                                            <span data-bind="text: correoElectronico" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: correoElectronico, attr: { 'name': 'correosElectronicos[' + $index() + '].correoElectronico'  }">
                                        </td>
                                        <td style='white-space: nowrap'>
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCorreoElectronico"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarCorreoElectronico"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'correosElectronicos[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'correosElectronicos[' + $index() + '].id'  }" />
                                        </td>
                                    </tr>
                                </tbody>                                      
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label>Agregar cuenta bancaria</label>
                        <button  type="button" class="btn btn-success btn-sm" onclick="nuevaCuentaBancaria()" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbcuentabanca">
                                <thead>
                                <th>Tipo</th>
                                <th>N&uacute;mero</th>
                                <th>Entidad</th>
                                <th></th>
                                </thead>
                                <tbody data-bind="foreach: { data: cuentasBancarias }">
                                    <tr class="table-row">
                                        <td style="width: 30%">
                                            <span data-bind="text: nombreTipo" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: tipo, attr: { 'name': 'cuentasBancarias[' + $index() + '].tipo'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numero" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: numero, attr: { 'name': 'cuentasBancarias[' + $index() + '].numero'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: entidad" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: entidad, attr: { 'name': 'cuentasBancarias[' + $index() + '].entidad'  }">
                                        </td>
                                        <td style='white-space: nowrap'>
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarCuentaBancaria"><span class='glyphicon glyphicon-edit'></span></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarCuentaBancaria"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'cuentasBancarias[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'cuentasBancarias[' + $index() + '].id'  }" />
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
                                            <input name="correoElectronico" id="correoElectronico" type="text" class="form-control">
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
                                            <input type="text" name="numeroTelefono" id="numeroTelefono" class="form-control">
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
                                            <input type="text" name="numeroCuentaBancaria" id="numeroCuentaBancaria" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Entidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la entidad de su cuenta bancaria">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" name="entidadCuentaBancaria" id="entidadCuentaBancaria" class="form-control">
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
            </div>
            <div id="formperfilsopor" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" id="btnpersopor" class="btn btn-success">Perfil y soportes</button></li>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="pe_perfil">Perfil laboral y profesional</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el perfil laboral y profesional ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <textarea class="form-control" name="pe_perfil"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Agregar documentos de soporte(Foto,certificados bancarios, EPS, ARL, AFP...)</label>
                        <button type="button" class="btn btn-success btn-sm" data-target="#md_docadj" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbdocad">
                                <thead>
                                <th>Tipo de documento</th>
                                <th>Documento de soporte</th>
                                <th></th>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="md_docadj" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Documentos adjuntos</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Tipo de documento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de documento">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select name="docp_tipo_doc" id="docp_tipo_doc" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Documento de soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar un archivo de soporte ">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" class="form-control" name="docp_documento" id="docp_documento">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success"  id="adddocadj">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="formacademico" style="display: none;"> 
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" id="btnacademico" class="btn btn-success">Aspectos acad&eacute;micos</button>
                    </div>
                </div>
                <label>Agregar estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_aspestedbasica" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>   
                </button>
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbestedbas">
                        <thead>
                            <tr>
                                <th>Nivel de estudio</th>
                                <th>Instituci&oacute;n</th>
                                <th>T&iacute;tulo</th>
                                <th>A&ntilde;o de t&iacute;tulo</th>
                                <th>Certificado</th>
                                <th>Opciones</th>
                            </tr> 
                        </thead>
                    </table>
                </div>
                <label>Agregar estudios educaci&oacute;n superior</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_aspesttecnicos" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>   
                </button>

                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbestecnico">
                        <thead>
                            <tr>
                                <th>Nivel de estudio</th>
                                <th>Instituci&oacute;n</th>
                                <th>Programa cursado</th>
                                <th>Fecha de titulo</th>
                                <th>Certificado</th>
                                <th>Opciones</th>
                            </tr> 
                        </thead>
                    </table>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Agregar estudios idiomas</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_idioma" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>                  

                        <table class="table table-hover tableestilo" id="tbidiomas">
                            <thead>
                            <th>Idioma</th>
                            <th>Lectura</th>
                            <th>Escritura</th>
                            <th>Habla</th>
                            <th>Certificado</th>
                            <th>Opciones</th>
                            </thead>
                        </table>
                    </div>
                    <!--  MODAL IDIOMA -->
                    <div class="modal fade" id="md_idioma" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header mhsuccess ">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Idiomas</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row" >
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="id_idioma">Idioma</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="id_idioma" id="id_idioma" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>                  
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="id_escucha">Nivel de escucha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de escritura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="id_escucha" id="id_escucha" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="id_habla">Nivel de habla</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de habla">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br> 
                                                <select style="width: 100%;" name="id_habla" id="id_habla" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="id_lectura">Nivel de lectura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cial es el nivel de lectura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="id_lectura" id="id_lectura" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="id_escritura">Nivel de escritura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de escritura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="id_escritura" id="id_escritura" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="cid_certificado">Certificado</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado que pertenece">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="file" class="form-control" name="cid_certificado" id="cid_certificado">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success"  id="addidioma">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div>
                <!--MODAL ASPECTOS academicos modal estudio educacion basica-->
                <div class="modal fade" id="md_aspestedbasica" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Estudios Educaci&oacute;n B&aacute;sica</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">

                                    <div class="col-md-4">
                                        <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select name="eb_nivel" id="eb_nivel" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                            <option value=""></option>
                                            <option value="Primaria">Primaria</option>
                                            <option value="Bachiller">Bachiller</option>
                                        </select>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="eb_institucion">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input name="eb_institucion" id="eb_institucion" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <label for="eb_institucion">T&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del t&iacute;tulo">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="text" name="eb_nombre_titulo" id="eb_nombre_titulo" class="form-control">
                                    </div>
                                    <div class="col-md-2" style="width: 180px;">
                                        <div class="form-group">
                                            <label for="eb_anio_inicio">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="eb_year_inicio" id="eb_year_inicio"  maxlength="4" />

                                        </div>
                                    </div>
                                    <div class="col-md-2" style="width: 180px;">
                                        <div class="form-group">
                                            <label for="eb_anio_fin">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalización">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="eb_year_fin" id="eb_year_fin" maxlength="4" />

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="eb_certificado">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="file" class="form-control" name="ceb_certificado" id="ceb_certificado">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addestedbas">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div>
                <!--MODAL ASPECTOS academicos modal estudio tspectos academicos-->
                <div class="modal fade" id="md_aspesttecnicos" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Estudios Educaci&oacute;n Superior</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">

                                    <div class="col-md-6">
                                        <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select name="est_nivel" id="est_nivel" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">¿Estudia actualmente?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="est_estudiando"  data-title="true"  id="btnestudsi">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="est_estudiando"  data-title="false" id="btnestudno">No</a>
                                            </div>
                                            <input type="hidden" name="est_estudiando" id="est_estudiando">

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="est_year_inicio" id="est_year_inicio" maxlength="4"/>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_anio_fin">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalización">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="est_year_fin" id="est_year_fin" maxlength="4"/>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de títutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de titulaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 

                                            <input type='text' class="form-control fecha input-sm" name="est_fecha_titulo" id="est_fecha_titulo" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_certificado">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="file" class="form-control" name="es_certificado" id="es_certificado">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addesttecnicos">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios aspectos academicos-->
            </div> 
            <div id="formeducontinua" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button id="btneducontinua" class="btn btn-success">Educaci&oacute;n no formal</button>
                    </div>
                </div>
                <label>Estudios educaci&oacute;n continua</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_capacitacion" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                </button>               
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbcapaci">
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
                    </table>
                </div>
                <!--MODAL ASPECTOS academicos modal estudio capacitacion-->
                <div class="modal fade" id="md_capacitacion" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Estudios Educaci&oacute;n Continua</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="ec_id" id="ec_id" value="125">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_area_saber">Tipo de capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el tipo de capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="es_tipo_capacitacion" id="es_tipo_capacitacion" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="ec_institucion" id="ec_institucion" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Nombre del capacitaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="ec_nombre_capacitacion" id="ec_nombre_capacitacion">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">N&deg; de horas  </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de horas del capacitaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="ec_numero_horas" id="ec_numero_horas" >                                     
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="est_anio_fin">A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el año de terminación del capacitación">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control input-sm" name="ec_year" id="ec_year" maxlength="4"  />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_certificado">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="file" class="form-control" name="cec_certificado" id="cec_certificado">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addcapacitacion">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios educacion continua -->
            </div>
            <div id="formexperiencia" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button  type="button" id="btnexperiencia" class="btn btn-success">Experiencia laboral</button>
                    </div>
                </div>		
                <label>Agregar experiencia laboral</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_explab" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>	
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbexplab">
                        <thead>
                            <tr>
                                <th>&Aacute;rea</th>
                                <th>Empresa/Instituci&oacute;n</th>
                                <th>Cargo</th>
                                <th>Certificado</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <label>Agregar experiencia docencia</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_expdoc" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>
                <div class="table-responsive">
                    <table class="table table-hover" id="tbexpdoc">
                        <thead>
                            <tr>
                                <th>Instituci&oacute;n</th>
                                <th>Dedicaci&oacute;n</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!--MODAL Experiencia laboral-->
                <div class="modal fade" id="md_explab" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Experiencia laboral</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_actual">¿En su trabajo actual?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que si estas trabajando actual">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_actual"  data-title="true"  id="btntrasi">Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_actual"  data-title="false" id="btntrano">No</a>
                                            </div>
                                            <input type="hidden" name="ep_actual" id="ep_actual"> 
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_exp_fnsp">¿En la Facultad Nacional Salud p&uacute;blica?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas trabajando en la Facultad nacional salud pública">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_exp_fnsp"  data-title="true" id="btnfnspsi" >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_exp_fnsp"  data-title="false" id="btnfnspno" >No</a>
                                            </div>
                                            <input type="hidden" name="ep_exp_fnsp" id="ep_exp_fnsp">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ep_fechaingreso">Fecha de ingreso</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de ingreso">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="ep_fechaingreso" id="ep_fechaingreso" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ep_fecharetiro">Fecha de retiro</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de retiro">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="ep_fecharetiro" id="ep_fecharetiro" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_tipo_exp">&Aacute;rea</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el area">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="ep_area_exp" id="ep_area_exp" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <input type="hidden" name="ep_tipoexperiencia" id="ep_tipoexperiencia" value="Laboral">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ep_tipo_contrato">Tipo de contrato</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de contrato">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <select style="width: 100%;" name="ep_tipo_contrato" id="ep_tipo_contrato" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="ep_tipo_empresa">Tipo de empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de empresa">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="ep_tipo_empresa" id="ep_tipo_empresa" class="js-select-basic-single js-states form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_nombre_empresa">Empresa/Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de empresa">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" class="form-control" name="ep_nombre_empresa" id="ep_nombre_empresa">
                                        </div>
                                    </div>
                                </div>
                                <div id="formempres">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ep_actividad_economica">Actividad econ&oacute;mica</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad económica">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                                <select style="width: 100%;" name="ep_actividad_economica" id="ep_actividad_economica" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ep_dedicacion">Dedicaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la dedicación">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select style="width: 100%;" name="ep_dedicacion" id="ep_dedicacion" class="js-select-basic-single js-states form-control">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_cargo">Cargo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cual es su cargo">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <input type="text" class="form-control" name="ep_cargo" id="ep_cargo">
                                            <input type="hidden" name="ep_cargo_equivalente" id="ep_cargo_equivalente">
                                        </div>
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ep_certificado">Certificado de soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" class="form-control" name="cel_certificado" id="cel_certificado">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id_persona">
                                <button type="button" class="btn btn-success" id="addexplab">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--Fin modal experiencia laboral-->
                <!--MODAL Experiencia docencia -->
                <div class="modal fade" id="md_expdoc" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Experiencia docencia </h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_actual">¿En su trabajo actual?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que si estas trabajando actual">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_actual"  data-title="true"  >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_actual"  data-title="false" >No</a>
                                            </div>
                                            <input type="hidden" name="ep_actual" id="ep_actual">


                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ep_exp_fnsp">En la Facultad Nacional Salud p&uacute;blica?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas trabajando en la Facultad nacional salud pública">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                            <div id="radioBtn" class="btn-group">
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_exp_fnsp"  data-title="true" id="btnfnspdocsi" >Si</a>
                                                <a class="btn btn-primary btn-sm notActive" data-toggle="ep_exp_fnsp"  data-title="false" id="btnfnspdocno" >No</a>
                                            </div>
                                            <input type="hidden" name="ep_exp_fnsp" id="ep_exp_fnsp">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <input type="hidden" name="ep_tipoexperiencia" id="ep_tipoexperiencia" value="Docencia">

                                    <div class="col-md-8">
                                        <label>Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de su institución">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ped_institucion" id="ped_institucion" class="js-select-basic-single js-states form-control">
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ep_dedicacion">Dedicaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la dedicación">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="ped_dedicacion" id="ped_dedicacion" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="Tiempo completo">Tiempo completo</option>
                                                <option value="Medio tiempo">Medio tiempo</option>
                                                <option value="Tiempo parcial">Tiempo parcial</option>
                                                <option value="Por horas">Por horas</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <legend>Cursos ofrecidos</legend>
                                        <label>Agregar curso</label>
                                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_curso" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">                                           
                                        <div class="table-responsive">
                                            <table class="table table-hover tableestilo" id="tbcur">
                                                <thead>
                                                    <tr>
                                                        <th>Curso</th>
                                                        <th>Nivel</th>
                                                        <th>Modalidad</th>
                                                        <th>N° de horas</th>
                                                        <th>opciones</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id_persona">
                                <button type="button" class="btn btn-success" id="addexpdoc">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--Fin modal experiencia docencia en salud-->

                <!--MODAL DE CURSO-->
                <div class="modal fade" id="md_curso" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header mhsuccess">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Curso</h4>
                            </div>
                            <div class="modal-body">

                                <div class="row">

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Nombre del curso</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del curso que han enseñado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="edc_nombre_curso" id="edc_nombre_curso" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Modalidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la modalidad del curso">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="edc_modalidad" id="edc_modalidad">
                                                <option></option>
                                                <option value="Presencial">Presencial</option>
                                                <option value="Virtual">Virtual</option>
                                                <option value="Semipresencial">Semipresencial</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="">Nivel de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nivel de estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select name="edc_nivel_form" id="edc_nivel_form" style="width: 100%;" class="js-select-basic-single js-states form-control">
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>N&uacute;mero de horas</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de horas del curso">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="edc_num_horas" id="edc_num_horas" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="">A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el año del curso">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="text" name="edc_year" id="edc_year" maxlength="4" class="form-control">
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Documento de soporte/Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado del curso">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" name="edc_certificado" id="edc_certificado" class="form-control">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" id="addcur">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--FIN DE MODAL DE CURSO-->
            </div>
            <div id="forminves" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" id="btninvestigacion" class="btn btn-success">Investigaci&oacute;n/Innovaci&oacute;n</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>¿Es investigador reconocido por Colciencias?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el investigador reconocido colciencia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                            <div id="radioBtn" class="btn-group" style="margin-left: 50px;">
                                <a class="btn btn-primary btn-sm notActive" data-toggle="pin_rec_colciencias"  data-title="true"  >Si</a>
                                <a class="btn btn-primary btn-sm notActive" data-toggle="pin_rec_colciencias"  data-title="false" >No</a>
                            </div>
                            <input type="hidden" name="pin_rec_colciencias" id="pin_rec_colciencias">

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">    
                            <label>Curr&iacute;culum vitae de latinoamerica y el caribe (CVLAC)</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el Curr&iacute;culum vitae de latinoamerica y el caribe (CVLAC) ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <input type="text" name="pin_cvlac_url" id="pin_cvlac_url" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Tipo de investigador</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de investigador">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="pin_tipo_inc" id="pin_tipo_inc">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Código ORCID</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el código del sistema Open Researcher and Contributor ID">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <input type="text" name="pin_orcid" id="pin_orcid" maxlength="16" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Identificador Scopus</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el código de Identificación de autor Scopus">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <input type="text" name="pin_scopus" id="pin_scopus"  class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Researcher Id</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el numero de id Researcher">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                            <input type="text" name="pin_researcherid" id="pin_researcherid" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <legend>Articulos y publicaciones relevantes</legend><br>
                        <label>Agregar articulo</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_articulo" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                        <br>

                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbearticulo">
                                <thead>
                                    <tr>
                                        <th>T&iacute;tulo</th>
                                        <th>Revista</th>
                                        <th>Enlace</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <!-- modal articulo-->
                    <div class="modal fade" id="md_articulo" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header mhsuccess">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Articulo</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>T&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del articulo que han hecho">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="art_nombre" id="art_nombre" class="form-control">

                                            </div> 
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tipo de autor</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de autor">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select style="width: 100%;" class="js-select-basic-single js-states form-control" name="art_tipo_autor" id="art_tipo_autor">
                                                    <option value=""></option>
                                                    <option value="Principal">Principal</option>
                                                    <option value="Co-autor">Co-autor</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>Nombre de la revista</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el nombre del articulo que han hecho">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <input type="text" name="art_nom_revista" id="art_nom_revista" class="form-control">

                                            </div> 
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>A&ntilde;o</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el a&ntilde;o del articulo">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="art_year" id="art_year" class="form-control"></select>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Dirección electrónica (URL)</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe inidicar el URL del articulo ">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="art_url" id="art_url" class="form-control">
                                            <input type="hidden" name="art_fec_update" id="fechaactual">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" id="addart">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin de modal articulo-->
                </div>

            </div>
            <div id="formdistin" style="display: none;">
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button id="btndist" class="btn btn-success">Distinciones</button>
                    </div>
                </div>
                <div class="col-md-12">
                    <legend>Distinciones, premios y reconocimientos</legend>  
                    <label>Agregar distinci&oacute;n</label>
                    <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_distincion" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                    <br>

                    <div class="table-responsive">
                        <table class="table table-hover tableestilo" id="tbdistin" style="width: 100%;">
                            <thead>
                                <tr>

                                    <th>C&oacute;digo</th>
                                    <th>Instituci&oacute;n otorga</th>
                                    <th>Descripci&oacute;n</th>
                                    <th>Fecha de distinci&oacute;n</th>
                                    <th>Certificado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
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
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Distinci&oacute;n</h4>
                            </div>
                            <div class="modal-body" style="font-size: 16px;">
                                <div class="row">
                                    <input type="hidden" name="iddistincion" id="iddistincion" value="253">

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="hidden" name="dist_persona" id="dist_persona" class="form-control" value="Juan Fernando">
                                            <label>Fecha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de distinci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 80%;margin-right: -5px;" name="dist_fecha_distincion" id="dist_fecha_distincion" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="dist_institucion_otorga">Instituci&oacute;n otorga</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nombre de instituci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input  name="dist_institucion_otorga" id="dist_institucion_otorga" class="form-control">

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ep_tipo_contrato">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de contrato">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <textarea class="form-control" id="dist_descripcion" name="dist_descripcion" ></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_tipo_empresa">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de empresa">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" name="pdc_certiifcado" id="pdc_certiifcado" class="form-control">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id_persona">
                                <button type="button" class="btn btn-success" id="adddistinpubli">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <!--fin de modal distincion-->
            </div>
            <button class="btn btn-success" style="float: right; margin-bottom:20px;" type="submit">Guardar</button>
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="idPersona" />
            <input type="hidden" id="consecutivo" name="consecutivo" />
        </form:form>
        <div class="modal fade" id="confirmacionAlmacenamientoHojaVida" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header mhsuccess">
                        <c:if test = "${hojaVida.getIdPersona() == 0}">
                            <button type="button" class="close" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/hojasVida/crear'">&times;</button>
                        </c:if>
                        <c:if test = "${hojaVida.getIdPersona() > 0}">
                            <button type="button" class="close" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/hojasVida/editar/${hojaVida.getIdPersona()}'">&times;</button>
                        </c:if>
                        <h4 class="modal-title">
                            <c:if test = "${hojaVida.getIdPersona() == 0}">
                                Registro Hoja de Vida
                            </c:if>
                            <c:if test = "${hojaVida.getIdPersona() > 0}">
                                Actualización Hoja de Vida
                            </c:if>
                        </h4>   
                    </div>
                    <div class="modal-body">
                        <c:if test = "${hojaVida.getIdPersona() == 0}">
                            La hoja vida se ha registrado exitosamente
                        </c:if>
                        <c:if test = "${hojaVida.getIdPersona() > 0}">
                            La hoja vida se ha actualizado exitosamente
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <c:if test = "${hojaVida.getIdPersona() == 0}">
                            <button type="button" class="btn btn-success" data-dismiss="modal" onclick="window.location.href = '${pageContext.request.contextPath}/hojasVida/crear'">Cerrar</button>
                        </c:if>
                        <c:if test = "${hojaVida.getIdPersona() > 0}">
                            <button type="button" class="btn btn-success" onclick="window.location.href = '${pageContext.request.contextPath}/hojasVida/editar/${hojaVida.getIdPersona()}'">Cerrar</button>
                        </c:if>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.fecha2').datepicker({
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
        $('#tbdistin').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            },
            "columnDefs": [
                {
                    "targets": [0],
                    "visible": false,
                    "searchable": false
                }]
        });
        var tbexplab = $('#tbexplab').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbexpdoc = $('#tbexpdoc').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbearticulo = $('#tbearticulo').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbcapaci = $('#tbcapaci').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbestedbas = $('#tbestedbas').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbestecnico = $('#tbestecnico').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        var tbidiomas = $('#tbidiomas').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
        $('#btnpersonal').click(function () {
            $('#formpersonal').css("display", "block");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btnpersopor').click(function () {
            $('#formperfilsopor').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btnacademico').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "block");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btneducontinua').click(function () {
            $('#formeducontinua').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btnexperiencia').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "block");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btninvestigacion').click(function () {
            $('#forminves').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btndist').click(function () {
            $('#formdistin').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formexperiencia').css("display", "none");
        });

        $('#addidioma').click(function () {
            var idioma = $('#id_idioma').val();
            var escucha = $('#id_escucha').val();
            var habla = $('#id_habla').val();
            var escritura = $('#id_escritura').val();
            var lectura = $('#id_lectura').val();
            var certifidioma = $('#cid_certificado').val();
            tbidiomas.row.add([idioma, lectura, escritura, habla, "<a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>", "<button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button>"]).draw(false);

            $('#md_idioma').modal('hide');
            $('#id_idioma').val("").trigger("change.select2");
            $('#id_escucha').val("").trigger("change.select2");
            $('#id_habla').val("").trigger("change.select2");
            $('#id_escritura').val("").trigger("change.select2");
            $('#id_lectura').val("").trigger("change.select2");
            $('#cid_certificado').val("");
        });
        $('#btnrutsi').click(function () {
            $('#actividadEconomica').prop('disabled', false);
        });
        if($('#disponeRUT').val() === "false") {
           $('#actividadEconomica').prop('disabled', true);
        }
        $('#btnrutno').click(function () {
            $('#actividadEconomica').val("").trigger("change.select2");
            $('#actividadEconomica').prop('disabled', 'disabled');
        });
        if($('#empleadoUDEA').val() === "false") {
           $('#tipoVinculacion').prop('disabled', true);
        }
        $('#btnempleadosi').click(function () {
            $("#tipoVinculacion").prop('disabled', false);
        });
        $('#btnempleadono').click(function () {
            $("#tipoVinculacion").prop('disabled', 'disabled');
            $('#tipoVinculacion').val("").trigger("change.select2");
        });

        $('#addestedbas').click(function ()
        {
            var nivel = $('#eb_nivel').val();
            var inst = $('#eb_institucion').val();
            var tit = $('#eb_nombre_titulo').val();
            var anofin = $('#eb_year_fin').val();

            var cert = $('#eb_certificado').val();
            tbestedbas.row.add(
                    [nivel, inst, tit, anofin, "<a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>", "<button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;'><span class='glyphicon glyphicon-remove'></span></button>"]
                    ).draw(false);

            $('#eb_nivel').val("").trigger('change.select2');
            $('#eb_institucion').val("");
            $('#eb_year_inicio').val("");
            $('#eb_year_fin').val("");

            $('#md_aspestedbasica').modal('hide');
        });
        $('#addesttecnicos').click(function () {
            var nivel = $('#est_nivel').val();
            var area = $('#est_area_saber').val();
            var inst = $('#est_institucion_educativa').val();
            var programa = $('#est_programa_cursado').val();
            var fectit = $('#est_fecha_titulo').val();
            var certificado = $('#es_certificado').val();

            tbestecnico.row.add(
                    [nivel, inst, programa, fectit, "<a href='#' target='_black' title='Ver documento' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>", "<button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button>"]).draw(false);

            $('#md_aspesttecnicos').modal('hide');
            $('#est_nivel').val("").trigger("change.select2");
            $('#est_area_saber').val().trigger("change.select2");
            $('#est_institucion_educativa').val().trigger("change.select2");
            $('#est_year_inicio').val("");
            $('#est_year_fin').val("");
            $('#est_programa_cursado').val(" ");
            $('#est_titulo_obtenido').val("");
            $('#est_fecha_titulo').val(" ");
            $('#es_certificado').val("");
        });
        $('#btnestudsi').click(function () {
            $('#est_year_fin').prop('disabled', false);
        });
        $('#btnestudno').click(function () {
            $('#est_year_fin').prop('disabled', 'disabled');
        });
        $('#addcur').click(function () {
            var inst = $('#ped_institucion').val();
            var nivel = $('#edc_nivel_form').val();
            var nomcur = $('#edc_nombre_curso').val();
            var modalidad = $('#edc_modalidad').val();
            var nhoras = $('#edc_num_horas').val();
            var certcur = $('#edc_certificado').val();

            fila = "<tr><td>" + nomcur + "</td><td>" + nivel + "</td><td>" + modalidad + "</td><td>" + nhoras + "</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
            $('#tbcur').append(fila);
            $('#md_curso').modal('hide');
            $('#ped_institucion').val("");
            $('#ped_dedicacion').val("");
            $('#edc_nombre_curso').val("");
            $('#edc_nivel_form').val("").trigger("change.select2");
            $('#edc_modalidad').val("").trigger("change.select2");
            $('#edc_num_horas').val("");
            $('#edc_certificado').val("");
        });
        $('#adddocadj').click(function () {
            var tipodoc = $('#docp_tipo_doc').val();

            fila = "<tr><td>" + tipodoc + "</td><td><a href='#' target='_black' title='Ver documento' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
            $('#tbdocad').append(fila);
            $('#md_docadj').modal('hide');
            $('#docp_tipo_doc').val("").trigger("change.select2");
        });
        $('#addcapacitacion').click(function () {
            var edid = $('#ec_id').val();
            var tipcap = $('#es_tipo_capacitacion').val();
            var inscap = $('#ec_institucion').val();
            var nomcap = $('#ec_nombre_capacitacion').val();
            var numhorcap = $('#ec_numero_horas').val();
            var aniocap = $('#ec_year').val();
            var certcap = $('#cec_certificado').val();

            tbcapaci.row.add([tipcap, nomcap, inscap, numhorcap, "<a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>", "<button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button>"]).draw(false);
            $('#es_tipo_capacitacion').val("").trigger("change.select2");
            $('#ec_institucion').val("").trigger("change.select2");
            $('#ec_nombre_capacitacion').val("");
            $('#ec_year').val("");
            $('#md_capacitacion').modal('hide');
        });
        $('#addexpdoc').click(function () {

            var inst = $('#ped_institucion').val();
            var ded = $('#ped_dedicacion').val();

            tbexpdoc.row.add([inst, ded, "<button class='btn btn-success btn-xs'style='margin-right:10px' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button>"]).draw(false);

            $('#md_expdoc').modal('hide');
            $('#ped_institucion').val("").trigger("change.select2");
            $('#ped_dedicacion').val("").trigger("change.select2");
        });
        $('#btnfnspdocsi').click(function () {

            $('#ped_institucion').val('Universidad de Antioquia').trigger('change.select2');
            $('#ped_institucion').prop('disabled', 'disabled');
        });
        $('#btnfnspdocno').click(function () {

            $('#ped_institucion').val("").trigger('change.select2');
            $('#ped_institucion').prop('disabled', false);

        });
        $('#addexplab').click(function () {

            var tipoexpe = $('#ep_tipoexperiencia').val();
            var area = $('#ep_area_exp').val();
            var tipocon = $('#ep_tipo_contrato').val();
            var nomemp = $('#ep_nombre_empresa').val();
            var dedic = $('#ep_dedicacion').val();
            var cargo = $('#ep_cargo').val();
            var carequi = $('#ep_cargo_equivalente').val();
            var fecharet = $('#ep_fecharetiro').val();
            var certifi = $('#ep_certificado').val();
            var trafnsp = $('#ep_exp_fnsp').val();

            tbexplab.row.add([area, nomemp, cargo, "<a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>", "<button class='btn btn-success btn-xs'style='margin-right:10px' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button>"]).draw(false);

            $('#md_explab').modal('hide');

            $('#ep_tipoexperiencia').val("");
            $('#ep_tipo_exp').val("");
            $('#ep_area_exp').val("").trigger("change.select2");
            $('#ep_tipo_contrato').val("").trigger("change.select2");
            $('#ep_tipo_empresa').val("").trigger("change.select2");
            $('#ep_nombre_empresa').val("");
            $('#ep_actividad_economica').val("").trigger("change.select2");
            $('#ep_dedicacion').val("").trigger("change.select2");
            $('#ep_cargo').val("");
            $('#ep_cargo_equivalente').val("").trigger("change.select2");
            $('#ep_fecharetiro').val("");
            $('#ep_certificado').val("");

        });
        $('#btntrasi').click(function () {
            $('#ep_fecharetiro').prop('disabled', 'disabled');
        });
        $('#btntrano').click(function () {
            $('#ep_fecharetiro').prop('disabled', false);
        });
        $('#btnfnspsi').click(function () {
            $('#ep_nombre_empresa').val("Universidad de Antioquia");
            $('#ep_nombre_empresa').prop('disabled', 'disabled');
        });
        $('#btnfnspno').click(function () {
            $('#ep_nombre_empresa').val("");
            $('#ep_nombre_empresa').prop('disabled', false);
        });
        $('#addart').click(function () {

            var artnom = $('#art_nombre').val();
            var tipoau = $('#art_tipo_autor').val();
            var artnomrev = $('#art_nom_revista').val();
            var artyear = $('#art_year').val();
            var arturl = $('#art_url').val();

            $('#md_articulo').modal('hide');
            $('#art_nombre').val("");
            $('#art_tipo_autor').val("").trigger("change.select2");
            $('#art_nom_revista').val("");
            $('#art_year').val("");
            $('#art_url').val("");

        });

        $('#adddistinpubli').click(function () {
            var fecha = $('#fechaactual').val();

            var instit = $('#dist_institucion_otorga').val();
            var descrip = $('#dist_descripcion').val();
            var certif = $('#pdc_certiifcado').val();

            $('#md_distincion').modal('hide');
        });

        $('#addpubli').click(function () {
            var fechaac = $('#fechaactual2').val();
            var personpubli = $('#publi_persona').val();
            var url = $('#publi_cvlac_url').val();

            $('#md_publicacion').modal('hide');
        });

        $('#radrural').change(function ()
        {
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
        $('#pin_scopus').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#cb_numero_cuenta').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#est_year_inicio').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#est_year_fin').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#eb_year_inicio').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#eb_year_fin').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#art_year').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#edc_num_horas').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#ec_numero_horas').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#ec_year').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#edc_year').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#pe_numero_id').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#pe_libretamilitar').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#tel_numero').keyup(function () {
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

        $('#dircalle').change(function () {
            var valor = $(this).val();
            $("#rescalle").val(valor);
            $("#vistaprevia").val(valor);
        });
        $('#numdir').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            $('#resnumdir').val(valor);
            $("#vistaprevia").val(rescalle + " " + valor);

        });
        $('#letdir').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            $('#resletdir').val(valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + valor);
        });
        $('#dirsur').change(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            $("#resdisur").val(valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + valor);
        });
        $('#num2dir').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            var resdisur = $("#resdisur").val();
            $('#resnum2dir').val(valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + resdisur + " # " + valor);
        });
        $('#let2dir').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            var resdisur = $("#resdisur").val();
            var resnum2dir = $('#resnum2dir').val();
            $('#reslet2dir').val(valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + resdisur + " # " + resnum2dir + valor);
        });
        $('#direst').change(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            var resdisur = $("#resdisur").val();
            var resnum2dir = $('#resnum2dir').val();
            var reslet2dir = $('#reslet2dir').val();
            $("#resdirest").val(' ' + valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + resdisur + " # " + resnum2dir + reslet2dir + " " + valor);
        });
        $('#num3dir').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            var resdisur = $("#resdisur").val();
            var resnum2dir = $('#resnum2dir').val();
            var reslet2dir = $('#reslet2dir').val();
            var resdirest = $("#resdirest").val();
            $('#resnum3dir').val(valor);
            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + resdisur + " # " + resnum2dir + reslet2dir + resdirest + "-" + valor);
        });
        $('#dirurb').keyup(function () {
            var valor = $(this).val();
            var rescalle = $("#rescalle").val();
            var resnumdir = $('#resnumdir').val();
            var resletdir = $('#resletdir').val();
            var resdisur = $("#resdisur").val();
            var resnum2dir = $('#resnum2dir').val();
            var reslet2dir = $('#reslet2dir').val();
            var resdirest = $("#resdirest").val();
            var resnum3dir = $('#resnum3dir').val();

            $("#vistaprevia").val(rescalle + " " + resnumdir + resletdir + " " + resdisur + " # " + resnum2dir + reslet2dir + resdirest + "-" + resnum3dir + " " + valor);
        });

        for (i = new Date().getFullYear(); i > 1800; i--)
        {
            $('#art_year').append($('<option/>').val(i).html(i));
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
        $('#ep_tipoexperiencia').change(function () {
            var valor = $(this).val();
            if (valor === "Proyectos de investigacion")
            {
                $('#forminves').css("display", "block");
            } else
            {
                $('#forminves').css("display", "none");
            }
            if (valor === "Docencia")
            {
                $('#formdoc').css("display", "block");
                $('#formempres').css("display", "none");
            } else
            {
                $('#formdoc').css("display", "none");
                $('#formempres').css("display", "block");
            }
        });
    });

    var nombreCampoCiudad;
    var campoCiudad;

    function mostrarUbicacionModal(nombreCampo, campo) {
        nombreCampoCiudad = nombreCampo;
        campoCiudad = campo;
        $('#ubicacionModal').modal('show');
    }

    function seleccionarUbicacion() {
        var pais = $('#pais option:selected').text().toUpperCase();
        var dep = $('#departamento option:selected').text().toUpperCase();
        var ciu = $('#ciudad option:selected').text().toUpperCase();
        $('#' + campoCiudad).val($('#ciudad').val());
        $('#' + nombreCampoCiudad).val(pais + " - " + dep + " - " + ciu);
        $('#ubicacionModal').modal('hide');
    }

    function buscarDepartamentos(idPais) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/departamentosPais/" + idPais,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#departamento').find('option').remove();
                    $('#departamento').append('<option></option>');
                    var departamentos = JSON.parse(response);
                    for (var i = 0; i < departamentos.length; i++) {
                        $('#departamento').append('<option value=' + departamentos[i].id + '>' + departamentos[i].nombre + '</option>');
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
                }
            }});
    }

    var HojaVidaModel = function (correosElectronicos, cuentasBancarias, telefonos) {
        self = this;
        self.correosElectronicos = ko.observableArray(correosElectronicos);
        self.cuentasBancarias = ko.observableArray(cuentasBancarias);
        self.telefonos = ko.observableArray(telefonos);

        self.adicionarCorreoElectronico = function () {
            var correoElectronico = $('#correoElectronico').val();
            if (correoElectronico === "") {
                bootstrap_alert_correo_electronico.warning('Debe ingresar el correo electrónico');
                return false;
            }
            if(!validarCorreoElectronico(correoElectronico)) {
                bootstrap_alert_correo_electronico.warning('Debe ingresar un correo electrónico válido');
                return false;
            }    
            if ($('#consecutivo').val() === "") {
                self.correosElectronicos.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.correosElectronicos().length),
                    correoElectronico: ko.observable(correoElectronico)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.correosElectronicos().length; i++) {
                    if (self.correosElectronicos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.correosElectronicos()[indice].correoElectronico(correoElectronico);
            }
            $('#md_correo_electronico').modal('hide');
            $('#tipoCorreoElectronico').val("").trigger('change');
            $('#nombreTipoCorreoElectronico').val("");
            $('#numeroCorreoElectronico').val("");
            $('#consecutivo').val("");
        };

        self.eliminarCorreoElectronico = function (correoElectronico) {
            self.correosElectronicos.remove(correoElectronico);
        };

        self.editarCorreoElectronico = function (correoElectronico) {
            $('#correoElectronico').val(correoElectronico.correoElectronico());
            $('#consecutivo').val(correoElectronico.consecutivo());
            $('#md_correo_electronico').modal('show');
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
            
            if ($('#consecutivo').val() === "") {
                self.cuentasBancarias.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.cuentasBancarias().length),
                    tipo: ko.observable(tipoCuentaBancaria),
                    nombreTipo: ko.observable(nombreTipoCuentaBancaria),
                    numero: ko.observable(numeroCuentaBancaria),
                    entidad: ko.observable(entidadCuentaBancaria)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.cuentasBancarias().length; i++) {
                    if (self.cuentasBancarias()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.cuentasBancarias()[indice].tipo(tipoCuentaBancaria);
                self.cuentasBancarias()[indice].nombreTipo(nombreTipoCuentaBancaria);
                self.cuentasBancarias()[indice].numero(numeroCuentaBancaria);
                self.cuentasBancarias()[indice].entidad(entidadCuentaBancaria);
            }
            $('#md_cuenta_bancaria').modal('hide');
            $('#tipoCuentaBancaria').val("").trigger('change');
            $('#nombreTipoCuentaBancaria').val("");
            $('#numeroCuentaBancaria').val("");
            $('#consecutivo').val("");
        };

        self.eliminarCuentaBancaria = function (cuentaBancaria) {
            self.cuentasBancarias.remove(cuentaBancaria);
        };

        self.editarCuentaBancaria = function (cuentaBancaria) {
            $('#tipoCuentaBancaria').val(cuentaBancaria.tipo()).trigger('change');
            $('#nombreTipoCuentaBancaria').val(cuentaBancaria.nombreTipo());
            $('#numeroCuentaBancaria').val(cuentaBancaria.numero());
            $('#entidadCuentaBancaria').val(cuentaBancaria.entidad());
            $('#consecutivo').val(cuentaBancaria.consecutivo());
            $('#md_cuenta_bancaria').modal('show');
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
            
            if ($('#consecutivo').val() === "") {
                self.telefonos.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.telefonos().length),
                    tipo: ko.observable(tipoTelefono),
                    nombreTipo: ko.observable(nombreTipoTelefono),
                    numero: ko.observable(numeroTelefono)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.telefonos().length; i++) {
                    if (self.telefonos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.telefonos()[indice].tipo(tipoTelefono);
                self.telefonos()[indice].nombreTipo(nombreTipoTelefono);
                self.telefonos()[indice].numero(numeroTelefono);
            }
            $('#md_telefono').modal('hide');
            $('#tipoTelefono').val("").trigger('change');
            $('#nombreTipoTelefono').val("");
            $('#numeroTelefono').val("");
            $('#consecutivo').val("");
        };

        self.eliminarTelefono = function (telefono) {
            self.telefonos.remove(telefono);
        };

        self.editarTelefono = function (telefono) {
            $('#tipoTelefono').val(telefono.tipo()).trigger('change');
            $('#nombreTipoTelefono').val(telefono.nombreTipo());
            $('#numeroTelefono').val(telefono.numero());
            $('#consecutivo').val(telefono.consecutivo());
            $('#md_telefono').modal('show');
        };
    };

    function nuevoCorreoElectronico() {
        $('#correoElectronico').val("");
        $('#consecutivo').val("");
        $('#md_correo_electronico').modal('show');
    }

    function nuevoTelefono() {
        $('#tipoTelefono').val("").trigger("change.select2");
        $('#numeroTelefono').val("");
        $('#consecutivo').val("");
        $('#md_telefono').modal('show');
    }

    function nuevaCuentaBancaria() {
        $('#tipoCuentaBancaria').val("").trigger("change.select2");
        $('#numeroCuentaBancaria').val("");
        $('#entidadCuentaBancaria').val("");
        $('#consecutivo').val("");
        $('#md_cuenta_bancaria').modal('show');
    }

    $('#hojaVida').submit(function (evt) {
        evt.preventDefault();
        if($('#disponeRUT').val() === 'true' && $('#actividadEconomica').val() === "") {
          bootstrap_alert_hoja_vida.warning("Debe ingresar la actividad económica");
          return;
        }
        if($('#empleadoUDEA').val() === "true" && $('#tipoVinculacion').val() === '') {
          bootstrap_alert_hoja_vida.warning("Debe ingresar el tipo de vinculación con la U de A");
          return;
        }    
        
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/crear",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response === "") {
                    $('#confirmacionAlmacenamientoHojaVida').modal('show');
                } else {
                    bootstrap_alert_hoja_vida.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_hoja_vida.warning("Error al almacenar la hoja de vida.");
            }});
    });

    bootstrap_alert_hoja_vida = function () { };
    bootstrap_alert_hoja_vida.warning = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.success = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.removeWarning = function () {
        $('#alert_hoja_vida').html('');
    };

    bootstrap_alert_telefono = function () { };
    bootstrap_alert_telefono.warning = function (message) {
        $('#alert_telefono').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_telefono.removeWarning = function () {
        $('#alert_telefono').html('');
    };

    bootstrap_alert_cuenta_bancaria = function () { };
    bootstrap_alert_cuenta_bancaria.warning = function (message) {
        $('#alert_cuenta_bancaria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cuenta_bancaria.removeWarning = function () {
        $('#alert_cuenta_bancaria').html('');
    };

    bootstrap_alert_correo_electronico = function () { };
    bootstrap_alert_correo_electronico.warning = function (message) {
        $('#alert_correo_electronico').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_correo_electronico.removeWarning = function () {
        $('#alert_correo_electronico').html('');
    };

    var correosElectronicos = [];
    var cuentasBancarias = [];
    var telefonos = [];
    <c:if test = "${correosElectronicosJSON != null}">
    correosElectronicos = ${correosElectronicosJSON};
    </c:if>
    <c:if test = "${cuentasBancariasJSON != null}">
    cuentasBancarias = ${cuentasBancariasJSON};
    </c:if>
    <c:if test = "${telefonosJSON != null}">
    telefonos = ${telefonosJSON};
    </c:if>
    var hojaVidaModel = new HojaVidaModel(correosElectronicos, cuentasBancarias, telefonos);
    ko.applyBindings(hojaVidaModel);
</script>