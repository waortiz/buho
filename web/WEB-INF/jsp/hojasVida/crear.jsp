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
            <li class="nav-item" id="btnacademico" data-toggle="tooltip" data-placement="right" title="" data-original-title="Aspectos Acádemicos" style="margin-right: 5px !important;">
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
                                <form:input class="form-control fecha" path="fechaExpedicion" data-validation="required" data-validation-error-msg="Debe indicar la fecha de expedición"/>
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
                                <input type="file" name="copiaDocumentoIdentificacion" id="copiaDocumentoIdentificacion" class="form-control" style="width: 80%">
                                <c:if test = "${!hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                                    </c:if>    
                                    <c:if test = "${hojaVida.isCopiaDocumentoIdentificacionValidado()}">
                                    <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
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
                                <form:input class="form-control fecha" path="fechaNacimiento"/>
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
                            <label>Copia libreta militar</label>
                            <input type="file" name="copiaLibretaMilitar" id="copiaLibretaMilitar" class="form-control" style="width: 80%">
                            <c:if test = "${!hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                                </c:if>    
                                <c:if test = "${hojaVida.isCopiaLibretaMilitarValidado()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                </c:if>                            
                                <c:if test = "${hojaVida.isTieneCopiaLibretaMilitar()}">
                                <button class="btn btn-success btn-xs" type="button" onclick="verCopiaLibretaMilitar()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
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
                            <input type="file" name="documentoRUT" id="documentoRUT" class="form-control" style="width: 80%">
                            <c:if test = "${!hojaVida.isDocumentoRUTValidado()}">
                                <button class='btn btn-danger btn-xs' type='button' data-toggle="tooltip" data-placement="top" title="No validado"><span class='glyphicon glyphicon-remove'></span></button>
                                </c:if>    
                                <c:if test = "${hojaVida.isDocumentoRUTValidado()}">
                                <button class="btn btn-success btn-xs" type="button" data-toggle="tooltip" data-placement="top" title="Validado"><span class="glyphicon glyphicon-ok"></span></button>
                                </c:if>
                                <c:if test = "${hojaVida.isTieneDocumentoRUT()}">
                                <button class="btn btn-success btn-xs" type="button" onclick="verCopiaRUT()" data-toggle="tooltip" data-placement="top" title="Descargar"><span class="glyphicon glyphicon-download"></span></button>
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
                                            <input type="hidden" class="form-control" data-bind="value: tipo, attr: { 'name': 'telefonos[' + $index() + '].tipo'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numero" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: numero, attr: { 'name': 'telefonos[' + $index() + '].numero'  }">
                                        </td>
                                        <td style='white-space: nowrap' align="center">
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
                                    <tr>
                                        <th>Email</th>
                                        <th></th>                                         
                                    </tr>        
                                </thead>
                                <tbody data-bind="foreach: { data: correosElectronicos }">
                                    <tr class="table-row">
                                        <td style="width: 80%">
                                            <span data-bind="text: correoElectronico" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: correoElectronico, attr: { 'name': 'correosElectronicos[' + $index() + '].correoElectronico'  }">
                                        </td>
                                        <td style='white-space: nowrap' align="center">
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
                                        <td style='white-space: nowrap' align="center">
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
                                <form:textarea class="form-control" path="perfil" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Agregar documentos de soporte(Foto,certificados bancarios, EPS, ARL, AFP...)</label>
                        <button type="button" class="btn btn-success btn-sm" onclick="nuevoDocumentoSoporte()">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbdocad">
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
                                            <input type="hidden" class="form-control" data-bind="value: tipoDocumento, attr: { 'name': 'documentosSoporte[' + $index() + '].tipoDocumento'  }">
                                        </td>
                                        <td style="width: 50%" align="center">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte, visible: tieneDocumento" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style='white-space: nowrap' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarDocumentoSoporte"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarDocumentoSoporte"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'documentosSoporte[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'documentosSoporte[' + $index() + '].id'  }" />
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
                                <h4 class="modal-title">Documentos adjuntos</h4>
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
                                            <div id="documentosSoporte"></div>
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
            </div>
            <div id="formacademico" style="display: none;"> 
                <div class="row">   
                    <div class="col-md-1" style="margin-bottom: 20px;">
                        <button type="button" id="btnacademico" class="btn btn-success">Aspectos acad&eacute;micos</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Agregar estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionBasica();" >
                            <span class="glyphicon glyphicon-plus"></span>   
                        </button>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo">
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
                                            <input type="hidden" class="form-control" data-bind="value: nivel, attr: { 'name': 'educacionesBasicas[' + $index() + '].nivel'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: institucion, attr: { 'name': 'educacionesBasicas[' + $index() + '].institucion'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: titulo" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: titulo, attr: { 'name': 'educacionesBasicas[' + $index() + '].titulo'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: anyoFinalizacion" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: anyoFinalizacion, attr: { 'name': 'educacionesBasicas[' + $index() + '].anyoFinalizacion'  }">
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionBasica, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionBasica"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionBasica"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: anyoInicio, attr: { 'name': 'educacionesBasicas[' + $index() + '].anyoInicio'  }" />
                                            <input type="hidden" data-bind="value: graduado, attr: { 'name': 'educacionesBasicas[' + $index() + '].graduado'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'educacionesBasicas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'educacionesBasicas[' + $index() + '].id'  }" />
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
                                                <c:forEach var="nivelEstudio" items="${nivelesEstudio}">
                                                    <option value="${nivelEstudio.getId()}">${nivelEstudio.getNombre()}</option>
                                                </c:forEach>                                             
                                            </select>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="institucionEducacionBasica">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la institucion que estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                <select style="width: 100%;" name="institucionEducacionBasica" id="institucionEducacionBasica" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="institucionEducativa" items="${institucionesEducativas}">
                                                        <option value="${institucionEducativa.getId()}">${institucionEducativa.getNombre()}</option>
                                                    </c:forEach>                                             
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="tituloEducacionBasica">T&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del t&iacute;tulo">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="text" name="tituloEducacionBasica" id="tituloEducacionBasica" class="form-control">
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
                                                <label for="anyoInicioEducacionBasica">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoInicioEducacionBasica" id="anyoInicioEducacionBasica" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="width: 180px;">
                                            <div class="form-group">
                                                <label for="anyoFinalizacionEducacionBasica">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalización">
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
                                                <div id="certificadosEducacionBasica"></div>
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
                            <table class="table table-hover tableestilo">
                                <thead>
                                    <tr>
                                        <th>Nivel de estudio</th>
                                        <th>Instituci&oacute;n</th>
                                        <th>Programa cursado</th>
                                        <th>Fecha de titulo</th>
                                        <th class="cer" align="center">Certificado Homologado</th>
                                        <th class="cer" align="center">Certificado</th>
                                        <th class="opc" align="center">Opciones</th>
                                    </tr> 
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesSuperiores }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreNivel" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: nivel, attr: { 'name': 'educacionesSuperiores[' + $index() + '].nivel'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: institucion, attr: { 'name': 'educacionesSuperiores[' + $index() + '].institucion'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: programa" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: programa, attr: { 'name': 'educacionesSuperiores[' + $index() + '].programa'  }">
                                            <input type="hidden" class="form-control" data-bind="value: titulo, attr: { 'name': 'educacionesSuperiores[' + $index() + '].titulo'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: fechaTitulo" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: anyoFinalizacion, attr: { 'name': 'educacionesSuperiores[' + $index() + '].anyoFinalizacion'  }">
                                            <input type="hidden" class="form-control" data-bind="value: fechaTitulo, attr: { 'name': 'educacionesSuperiores[' + $index() + '].fechaTitulo'  }">
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado homologado' data-bind="click: $root.verCertificadoHomologadoEducacionSuperior, visible: tieneCertificadoHomologado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionSuperior, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionSuperior"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionSuperior"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: anyoInicio, attr: { 'name': 'educacionesSuperiores[' + $index() + '].anyoInicio'  }" />
                                            <input type="hidden" data-bind="value: graduado, attr: { 'name': 'educacionesSuperiores[' + $index() + '].graduado'  }" />
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'educacionesSuperiores[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'educacionesSuperiores[' + $index() + '].id'  }" />
                                            <input type="hidden" data-bind="value: areaSaber, attr: { 'name': 'educacionesSuperiores[' + $index() + '].areaSaber'  }" />
                                            <input type="hidden" data-bind="value: tituloExterior, attr: { 'name': 'educacionesSuperiores[' + $index() + '].tituloExterior'  }" />
                                            <input type="hidden" data-bind="value: paisTituloExterior, attr: { 'name': 'educacionesSuperiores[' + $index() + '].paisTituloExterior'  }" />
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
                                                <label>Titulo extranjero?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                                <div id="radioBtn" class="btn-group" style="margin-left: 40px;">
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="tituloExteriorEducacionSuperior"  data-title="true"  id="btnTituloExtranjeroSiEducacionSuperior">Si</a>
                                                    <a class="btn btn-primary btn-sm notActive" data-toggle="tituloExteriorEducacionSuperior"  data-title="false" id="btnTituloExtranjeroNoEducacionSuperior">No</a>
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
                                                        <option value="${pais.getId()}">${pais.getNombre()}</option>
                                                    </c:forEach>    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-inline" id="certhomo" style="display: none;">
                                                <label>Certificado de homologaci&oacute;n del t&iacute;tulo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado de homologaci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <div id="certificadosHomologadosEducacionSuperior"></div>
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
                                                    <c:forEach var="nivelEstudio" items="${nivelesEstudio}">
                                                        <option value="${nivelEstudio.getId()}">${nivelEstudio.getNombre()}</option>
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
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="institucionEducativaPrograma">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <select style="width: 100%;" name="institucionEducativaPrograma" id="institucionEducativaPrograma" class="js-select-basic-single js-states form-control">
                                                                    <option value=""></option>
                                                                    <c:forEach var="institucionEducativa" items="${institucionesEducativas}">
                                                                        <option value="${institucionEducativa.getId()}">${institucionEducativa.getNombre()}</option>
                                                                    </c:forEach>                                                                  
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="programaCursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" class="form-control" name="programaCursado" id="programaCursado" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-7">
                                                            <div class="form-group">
                                                                <label for="tituloPrograma">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de título obtenido">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <input type="text" class="form-control" name="tituloPrograma" id="tituloPrograma">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="form-group">
                                                                <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcloe básico de conocimiento">
                                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                                                <select style="width: 100%;" name="areaSaberPrograma" id="areaSaberPrograma" class="js-select-basic-single js-states form-control">
                                                                    <option></option>
                                                                    <c:forEach var="areaSaber" items="${areasSaber}">
                                                                        <option value="${areaSaber.getId()}">${areaSaber.getNombre()}</option>
                                                                    </c:forEach>                                                                   
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success" id="addprograma">Agregar</button>
                                                    <button type="button" class="btn btn-success" onclick="cerrarVentanaPrograma();">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="formprograma" style="display: none;">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Instituci&oacute;n</label><br>
                                                    <textarea type="text" style="border:0;font-style: italic;width: 100%;"  readonly id="nombreInstitucionEducacionSuperior"></textarea>
                                                    <input type="hidden" id="institucionEducacionSuperior">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="programaCursadoEducacionSuperior">Programa</label><br>
                                                    <input type="text" style="border:0;font-style: italic;margin-left: 20px;" readonly id="programaCursadoEducacionSuperior">
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="">N&uacute;cleo b&aacute;sico del conocimiento</label><br>
                                                    <input type="text" style="border:0;font-style: italic;margin-left: 20px; width: 330px;" size="2" readonly id="nombreAreaSaberEducacionSuperior">
                                                    <input type="hidden" id="areaSaberEducacionSuperior">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="tituloEducacionSuperior">T&iacute;tulo obtenido</label><br>
                                                    <input type="text" style="border:0;font-style: italic;width: 300px;" readonly id="tituloEducacionSuperior">
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
                                                <label for="anyoInicioEducacionSuperior">A&ntilde;o de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoInicioEducacionSuperior" id="anyoInicioEducacionSuperior" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="anyoFinalizacionEducacionSuperior">A&ntilde;o de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalización">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                                <select name="anyoFinalizacionEducacionSuperior" id="anyoFinalizacionEducacionSuperior" class="form-control"></select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group" >
                                                <label for="fechaTituloEducacionSuperior">Fecha de titulaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
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
                                                <div id="certificadosEducacionSuperior"></div>
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
                        <table class="table table-hover tableestilo">
                            <thead>
                                <tr>
                                    <th>Idioma</th>
                                    <th>Lectura</th>
                                    <th>Escucha</th>
                                    <th>Escritura</th>
                                    <th>Conversación</th>
                                    <th class="cer" align="center">Certificado</th>
                                    <th class="opc" align="center">Opciones</th>
                                </tr>        
                            </thead>
                            <tbody data-bind="foreach: { data: idiomas }">
                                <tr class="table-row">
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreIdioma" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: idioma, attr: { 'name': 'idiomas[' + $index() + '].idioma'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelLectura" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: nivelLectura, attr: { 'name': 'idiomas[' + $index() + '].nivelLectura'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelEscucha" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: nivelEscucha, attr: { 'name': 'idiomas[' + $index() + '].nivelEscucha'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelEscritura" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: nivelEscritura, attr: { 'name': 'idiomas[' + $index() + '].nivelEscritura'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreNivelConversacion" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: nivelConversacion, attr: { 'name': 'idiomas[' + $index() + '].nivelConversacion'  }">
                                    </td>
                                    <td style="width: 15%" align="center">
                                        <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoIdioma, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                    </td>
                                    <td style='white-space: nowrap' align="center">
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarIdioma"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarIdioma"><span class='glyphicon glyphicon-remove'></span></button>
                                        <input type="hidden" data-bind="value: tipoCertificacion, attr: { 'name': 'idiomas[' + $index() + '].tipoCertificacion'  }" />
                                        <input type="hidden" data-bind="value: otraCertificacion, attr: { 'name': 'idiomas[' + $index() + '].otraCertificacion'  }" />
                                        <input type="hidden" data-bind="value: puntajeCertificacion, attr: { 'name': 'idiomas[' + $index() + '].puntajeCertificacion'  }" />
                                        <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'idiomas[' + $index() + '].consecutivo'  }" />
                                        <input type="hidden" data-bind="value: id, attr: { 'name': 'idiomas[' + $index() + '].id'  }" />
                                    </td>
                                </tr>
                            </tbody>                                   
                        </table>
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
                                    <div class="row" >
                                        <div class="col-md-12">
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
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="nivelEscuchaIdioma">Nivel de escucha</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de escritura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="nivelEscuchaIdioma" id="nivelEscuchaIdioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="nivel" items="${nivelesIdioma}">
                                                        <option value="${nivel.getId()}">${nivel.getNombre()}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="nivelConversacionIdioma">Nivel de conversación</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de habla">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br> 
                                                <select style="width: 100%;" name="nivelConversacionIdioma" id="nivelConversacionIdioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="nivel" items="${nivelesIdioma}">
                                                        <option value="${nivel.getId()}">${nivel.getNombre()}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="nivelLecturaIdioma">Nivel de lectura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cial es el nivel de lectura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="nivelLecturaIdioma" id="nivelLecturaIdioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="nivel" items="${nivelesIdioma}">
                                                        <option value="${nivel.getId()}">${nivel.getNombre()}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="nivelEscrituraIdioma">Nivel de escritura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de escritura">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                                <select style="width: 100%;" name="nivelEscrituraIdioma" id="nivelEscrituraIdioma" class="js-select-basic-single js-states form-control">
                                                    <option></option>
                                                    <c:forEach var="nivel" items="${nivelesIdioma}">
                                                        <option value="${nivel.getId()}">${nivel.getNombre()}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                    </div>
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
                                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cuando eliga el tipo otro cual?">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="otraCertificacionIdioma" id="otraCertificacionIdioma" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="">Puntaje</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el puntaje de estudio idioma">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <input type="text" name="puntajeCertificacionIdioma" id="puntajeCertificacionIdioma" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group form-inline">
                                                <label for="certificadoIdioma">Certificado</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado que pertenece">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                                <div id="certificadosIdioma"></div>
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
                                <button id="btneducontinua" class="btn btn-success">Educaci&oacute;n no formal</button>
                            </div>
                        </div>
                        <label>Estudios educaci&oacute;n continua</label>
                        <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaEducacionContinua();" >
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
                                <tbody data-bind="foreach: { data: educacionesContinuas }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreTipoCapacitacion" ></span>
                                            <input type="hidden" data-bind="value: tipoCapacitacion, attr: { 'name': 'educacionesContinuas[' + $index() + '].tipoCapacitacion'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreCapacitacion" ></span>
                                            <input type="hidden" data-bind="value: nombreCapacitacion, attr: { 'name': 'educacionesContinuas[' + $index() + '].nombreCapacitacion'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                            <input type="hidden" class="form-control" data-bind="value: institucion, attr: { 'name': 'educacionesContinuas[' + $index() + '].institucion'  }">
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: numeroHoras" ></span>
                                            <input type="hidden" data-bind="value: numeroHoras, attr: { 'name': 'educacionesContinuas[' + $index() + '].numeroHoras'  }">
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionContinua, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style='white-space: nowrap; width: 10%' align="center">
                                            <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarEducacionContinua"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                            <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarEducacionContinua"><span class='glyphicon glyphicon-remove'></span></button>
                                            <input type="hidden" data-bind="value: anyo, attr: { 'name': 'educacionesContinuas[' + $index() + '].anyo'  }">
                                            <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'educacionesContinuas[' + $index() + '].consecutivo'  }" />
                                            <input type="hidden" data-bind="value: id, attr: { 'name': 'educacionesContinuas[' + $index() + '].id'  }" />
                                            <input type="hidden" data-bind="value: areaSaber, attr: { 'name': 'educacionesContinuas[' + $index() + '].areaSaber'  }" />
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
                                <div class="row">
                                    <div class="col-md-2" style="width: 190px;">
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
                                    <div class="col-md-6" style="width: 430px;">
                                        <div class="form-group">
                                            <label for="institucionEducacionContinua">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institución que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="institucionEducacionContinua" id="institucionEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="institucion" items="${institucionesEducativas}">
                                                <option value="${institucion.getId()}">${institucion.getNombre()}</option>
                                                </c:forEach>                                                     
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4" style="width: 260px;">
                                        <div class="form-group">
                                            <label for="areaSaberEducacionContinua">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="areaSaberEducacionContinua" id="areaSaberEducacionContinua" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <c:forEach var="areaSaber" items="${areasSaber}">
                                                <option value="${areaSaber.getId()}">${areaSaber.getNombre()}</option>
                                                </c:forEach>                                                 
                                            </select></div>
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
                                            <input type='text' class="form-control input-sm" name="numeroHorasEducacionContinua" id="numeroHorasEducacionContinua" >                                     
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
                                            <div id="certificadosEducacionContinua"></div>
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
                </div><!--fin modal aspectos academicos modal estudios educacion continua -->
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
                        <tbody data-bind="foreach: { data: experienciasLaborales }">
                            <tr class="table-row">
                                <td style="width: 30%">
                                    <span data-bind="text: nombreAreaSaber" ></span>
                                </td>
                                <td style="width: 30%">
                                    <span data-bind="text: nombreEmpresa" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: nombreEmpresa, attr: { 'name': 'experienciasLaborales[' + $index() + '].nombreEmpresa'  }">
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: cargo" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: cargo, attr: { 'name': 'experienciasLaborales[' + $index() + '].cargo'  }">
                                </td>
                                <td style="width: 10%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoExperienciaLaboral, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarExperienciaLaboral"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                    <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarExperienciaLaboral"><span class='glyphicon glyphicon-remove'></span></button>
                                    <input type="hidden" data-bind="value: tipoExperiencia, attr: { 'name': 'experienciasLaborales[' + $index() + '].tipoExperiencia'  }" />
                                    <input type="hidden" data-bind="value: trabajoActual, attr: { 'name': 'experienciasLaborales[' + $index() + '].trabajoActual'  }" />
                                    <input type="hidden" data-bind="value: fnsp, attr: { 'name': 'experienciasLaborales[' + $index() + '].fnsp'  }" />
                                    <input type="hidden" data-bind="value: fechaIngreso, attr: { 'name': 'experienciasLaborales[' + $index() + '].fechaIngreso'  }" />
                                    <input type="hidden" data-bind="value: fechaRetiro, attr: { 'name': 'experienciasLaborales[' + $index() + '].fechaRetiro'  }" />
                                    <input type="hidden" data-bind="value: areaSaber, attr: { 'name': 'experienciasLaborales[' + $index() + '].areaSaber'  }" />
                                    <input type="hidden" data-bind="value: tipoEmpresa, attr: { 'name': 'experienciasLaborales[' + $index() + '].tipoEmpresa'  }" />
                                    <input type="hidden" data-bind="value: naturalezaCargo, attr: { 'name': 'experienciasLaborales[' + $index() + '].naturalezaCargo'  }" />
                                    <input type="hidden" data-bind="value: actividadEconomica, attr: { 'name': 'experienciasLaborales[' + $index() + '].actividadEconomica'  }" />
                                    <input type="hidden" data-bind="value: tipoContrato, attr: { 'name': 'experienciasLaborales[' + $index() + '].tipoContrato'  }" />
                                    <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'experienciasLaborales[' + $index() + '].consecutivo'  }" />
                                    <input type="hidden" data-bind="value: id, attr: { 'name': 'experienciasLaborales[' + $index() + '].id'  }" />
                                </td>
                            </tr>
                        </tbody>                          
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
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="fechaIngresoExperienciaLaboral" id="fechaIngresoExperienciaLaboral" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="fechaRetiroExperienciaLaboral">Fecha Retiro/Fin</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de retiro">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 75%;margin-right: -5px;" name="fechaRetiroExperienciaLaboral" id="fechaRetiroExperienciaLaboral" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="areaSaberExperienciaLaboral">N&uacute;cleo b&aacute;sico del conocimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el N&uacute;cleo b&aacute;sico del conocimiento">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="areaSaberExperienciaLaboral" id="areaSaberExperienciaLaboral" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <c:forEach var="areaSaber" items="${areasSaber}">
                                                <option value="${areaSaber.getId()}">${areaSaber.getNombre()}</option>
                                                </c:forEach>  
                                            </select>
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
                                            <input type="text" class="form-control" name="nombreEmpresaExperienciaLaboral" id="nombreEmpresaExperienciaLaboral">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="actividadEconomicaExperienciaLaboral">Actividad econ&oacute;mica de la empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad económica">
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
                                            <input type="text" class="form-control" name="cargoExperienciaLaboral" id="cargoExperienciaLaboral">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="naturalezaCargoExperienciaLaboral">Naturaleza del cargo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar naturaleza del cargo">
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
                                             <div id="certificadosExperienciaLaboral"></div>
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
                                <button type="button" class="btn btn-success" data-bind="click: adicionarExperienciaDocencia">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaExperienciaDocencia();">Cancelar</button>
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
                                <button type="button" class="btn btn-success" data-bind="click: adicionarCursoExperienciaDocencia">Agregar</button>
                                <button type="button" class="btn btn-success" onclick="cerrarVentanaCursoExperienciaDocencia();">Cancelar</button>
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
                    <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" onclick="nuevaDistincion();" ><span class="glyphicon glyphicon-plus"></span></button>
                    <br>
                    <div class="table-responsive">
                        <table class="table table-hover tableestilo" id="tbdistin" style="width: 100%;">
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
                                        <input type="hidden" data-bind="value: institucionOtorga, attr: { 'name': 'distinciones[' + $index() + '].institucionOtorga'  }">
                                    </td>
                                    <td style="width: 25%">
                                        <span data-bind="text: descripcion" ></span>
                                        <input type="hidden" data-bind="value: descripcion, attr: { 'name': 'distinciones[' + $index() + '].descripcion'  }">
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaDistincion" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: fechaDistincion, attr: { 'name': 'distinciones[' + $index() + '].fechaDistincion'  }">
                                    </td>
                                    <td style="width: 20%" align="center">
                                        <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoDistincion, visible: tieneCertificado" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                    </td>
                                    <td style='white-space: nowrap; width: 10%' align="center">
                                        <button class='btn btn-success btn-xs' type='button' data-bind="click: $root.editarDistincion"><i class='fa fa-pencil' aria-hidden='true'></i></button>
                                        <button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;' data-bind="click: $root.eliminarDistincion"><span class='glyphicon glyphicon-remove'></span></button>
                                        <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'distinciones[' + $index() + '].consecutivo'  }" />
                                        <input type="hidden" data-bind="value: id, attr: { 'name': 'distinciones[' + $index() + '].id'  }" />
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
                                            <input type='text' class="form-control fecha input-sm" style="display: inline;width: 80%;margin-right: -5px;" name="fechaDistincion" id="fechaDistincion" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="institucionOtorgaDistincion">Instituci&oacute;n otorga</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar el nombre de instituci&oacute;n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input  name="institucionOtorgaDistincion" id="institucionOtorgaDistincion" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="descripcionDistincion">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe ingresar la descripción">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                            <textarea class="form-control" id="descripcionDistincion" name="descripcionDistincion" ></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="certificadoDistincion">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el certificado">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <div id="certificadosDistincion"></div>
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
            <button class="btn btn-success" style="float: right; margin-bottom:20px;" type="submit">Guardar</button>
            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <form:hidden path="idPersona" />
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
            if(valor === "8") {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }
        });     
        $('#btnGraduadoSiEducacionBasica').click(function(){
          $('#anyoInicioEducacionBasica').prop('disabled',false);
        });
        $('#btnGraduadoNoEducacionBasica').click(function(){
          $('#anyoFinalizacionEducacionBasica').prop('disabled','disabled');
          $('#anyoFinalizacionEducacionBasica').val("");
        });
        $('#btnTituloExtranjeroSiEducacionSuperior').click(function(){
          $('#paistit').css("display","block");
          $('#certhomo').css('display','block');
        });
        $('#btnTituloExtranjeroNoEducacionSuperior').click(function(){
          $('#paistit').css("display","none");
          $('#certhomo').css('display','none');
        });  
        $('#btnGraduadoSiEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', false);
        });
        $('#btnGraduadoNoEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', 'disabled');
        });
        $('#addprograma').click(function(){
          var institucion = $('#institucionEducativaPrograma').val();
          var nombreInstitucion = $('#institucionEducativaPrograma option:selected').text().toUpperCase();
          var programaCursado = $('#programaCursado').val();
          var areaSaberPrograma = $('#areaSaberPrograma').val();
          var nombreAreaSaberPrograma = $('#areaSaberPrograma option:selected').text().toUpperCase();
          var tituloPrograma = $('#tituloPrograma').val();

          $('#formprograma').css("display","block");
          
          $('#institucionEducacionSuperior').val(institucion);
          $('#nombreInstitucionEducacionSuperior').val(nombreInstitucion);
          $('#programaCursadoEducacionSuperior').val(programaCursado);
          $('#areaSaberEducacionSuperior').val(areaSaberPrograma);
          $('#nombreAreaSaberEducacionSuperior').val(nombreAreaSaberPrograma);
          $('#tituloEducacionSuperior').val(tituloPrograma);
          
          $('#areaSaberPrograma').val("").trigger("change.select2");
          $('#institucionEducativaPrograma').val("").trigger("change.select2");
          $('#programaCursado').val("");
          $('#tituloPrograma').val("");
          
          $('#md_programa').modal('hide');
        });
      
        $('#btnfnspdocsi').click(function () {
            $('#ped_institucion').val('Universidad de Antioquia').trigger('change.select2');
            $('#ped_institucion').prop('disabled', 'disabled');
        });
        $('#btnfnspdocno').click(function () {
            $('#ped_institucion').val("").trigger('change.select2');
            $('#ped_institucion').prop('disabled', false);
        });
        $('#btnTrabajoActualExperienciaLaboralSi').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
        });
        $('#btnTrabajoActualExperienciaLaboralNo').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
        });
        $('#btnExperienciaLaboralFNSPSi').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val("Universidad de Antioquia");
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
        });
        $('#btnExperienciaLaboralFNSPNo').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val("");
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
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
        $('#numeroCuentaBancaria').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroHorasEducacionContinua').keyup(function () {
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
        $('#anyoInicioEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoInicioEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoEducacionContinua').append($('<option/>').val('').html(''));
        for (i = new Date().getFullYear(); i > 1800; i--) {
            $('#anyoInicioEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoInicioEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoEducacionContinua').append($('<option/>').val(i).html(i));
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

    var HojaVidaModel = function (correosElectronicos, 
                                  cuentasBancarias, 
                                  telefonos,
                                  documentosSoporte,
                                  idiomas,
                                  educacionesBasicas,
                                  educacionesSuperiores,
                                  educacionesContinuas,
                                  distinciones,
                                  experienciasLaborales) {
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
        };

        self.eliminarCorreoElectronico = function (correoElectronico) {
            self.correosElectronicos.remove(correoElectronico);
        };

        self.editarCorreoElectronico = function (correoElectronico) {
            $('#correoElectronico').val(correoElectronico.correoElectronico());
            $('#consecutivo').val(correoElectronico.consecutivo());
            bootstrap_alert_correo_electronico.removeWarning();
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
            bootstrap_alert_cuenta_bancaria.removeWarning();
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
        };

        self.eliminarTelefono = function (telefono) {
            self.telefonos.remove(telefono);
        };

        self.editarTelefono = function (telefono) {
            $('#tipoTelefono').val(telefono.tipo()).trigger('change');
            $('#nombreTipoTelefono').val(telefono.nombreTipo());
            $('#numeroTelefono').val(telefono.numero());
            $('#consecutivo').val(telefono.consecutivo());
            bootstrap_alert_telefono.removeWarning();
            $('#md_telefono').modal('show');
        };

        self.adicionarDocumentoSoporte = function () {
            var tipoDocumento = $('#tipoDocumento').val();
            var nombreTipoDocumento = $('#tipoDocumento option:selected').text();

            if (tipoDocumento === "") {
                bootstrap_alert_documento_soporte.warning('Debe ingresar el tipo de documento');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="documentosSoporte[' + self.documentosSoporte().length + '].documento"]').val() === "") {
                    bootstrap_alert_documento_soporte.warning('Debe ingresar el documento');
                    return false;
                }
                self.documentosSoporte.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.documentosSoporte().length),
                    tipoDocumento: ko.observable(tipoDocumento),
                    nombreTipoDocumento: ko.observable(nombreTipoDocumento),
                    documento: ko.observable(''),
                    tieneDocumento: ko.observable(false)
                });
                $('input:file[name="documentosSoporte[' + self.documentosSoporte().length + '].documento"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.documentosSoporte().length; i++) {
                    if (self.documentosSoporte()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if (self.documentosSoporte()[indice].id === 0 && 
                    $('input:file[name="documentosSoporte[' + indice + '].documento"]').val() === "") {
                    bootstrap_alert_documento_soporte.warning('Debe ingresar el documento');
                    return false;
                }

                self.documentosSoporte()[indice].tipoDocumento(tipoDocumento);
                self.documentosSoporte()[indice].nombreTipoDocumento(nombreTipoDocumento);
                self.documentosSoporte()[indice].documento('');
                if ($('input:file[name="documentosSoporte[' + indice + '].documento"]').val() !== "") {
                    self.documentosSoporte()[indice].tieneDocumento(false);
                }
                $('input:file[name="documentosSoporte[' + indice + '].documento"]').hide();
            }
            $('#md_documento_soporte').modal('hide');
        };

        self.eliminarDocumentoSoporte = function (documentoSoporte) {
            $('input:file[name="documentosSoporte[' + documentoSoporte.consecutivo() + '].documento"]').remove();
            self.documentosSoporte.remove(documentoSoporte);
            for(i = documentoSoporte.consecutivo(); i < hojaVidaModel.documentosSoporte().length; i++) {
               $('input:file[name="documentosSoporte[' + (i + 1) + '].certificado"]').attr('name', 'documentosSoporte[' + i + '].certificado'); 
                hojaVidaModel.documentosSoporte()[i].consecutivo(i);
            }
        };

        self.editarDocumentoSoporte = function (documentoSoporte) {
            ocultarDocumentosSoporte();
            $('#tipoDocumento').val(documentoSoporte.tipoDocumento()).trigger('change');
            $('#consecutivo').val(documentoSoporte.consecutivo());
            $('input:file[name="documentosSoporte[' + documentoSoporte.consecutivo() + '].documento"]').show();
            bootstrap_alert_documento_soporte.removeWarning();
            $('#md_documento_soporte').modal('show');
        };

        self.verDocumentoDocumentoSoporte = function (documentoSoporte) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoSoporte/" + documentoSoporte.id();
        };

        self.adicionarIdioma = function () {
            var idioma = $('#idioma').val();
            var nombreIdioma = $('#idioma option:selected').text();
            var nivelConversacion = $('#nivelConversacionIdioma').val();
            var nombreNivelConversacion = $('#nivelConversacionIdioma option:selected').text();
            var nivelEscritura = $('#nivelEscrituraIdioma').val();
            var nombreNivelEscritura = $('#nivelEscrituraIdioma option:selected').text();
            var nivelEscucha = $('#nivelEscuchaIdioma').val();
            var nombreNivelEscucha = $('#nivelEscuchaIdioma option:selected').text();
            var nivelLectura = $('#nivelLecturaIdioma').val();
            var nombreNivelLectura = $('#nivelLecturaIdioma option:selected').text();
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
            if (tipoCertificacion === "8" && otraCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar la certificación');
                return false;
            }
            if (puntajeCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar el puntaje de certificación');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="idiomas[' + self.idiomas().length + '].certificado"]').val() === "") {
                    bootstrap_alert_idioma.warning('Debe ingresar el certificado');
                    return false;
                }
                self.idiomas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.idiomas().length),
                    idioma: ko.observable(idioma),
                    nombreIdioma: ko.observable(nombreIdioma),
                    nivelConversacion: ko.observable(nivelConversacion),
                    nombreNivelConversacion: ko.observable(nombreNivelConversacion),
                    nivelEscritura: ko.observable(nivelEscritura),
                    nombreNivelEscritura: ko.observable(nombreNivelEscritura),
                    nivelEscucha: ko.observable(nivelEscucha),
                    nombreNivelEscucha: ko.observable(nombreNivelEscucha),
                    nivelLectura: ko.observable(nivelLectura),
                    nombreNivelLectura: ko.observable(nombreNivelLectura),
                    otraCertificacion: ko.observable(otraCertificacion),
                    tipoCertificacion: ko.observable(tipoCertificacion),
                    nombreTipoCertificacion: ko.observable(nombreTipoCertificacion),
                    puntajeCertificacion: ko.observable(puntajeCertificacion),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="idiomas[' + self.idiomas().length + '].certificado"]').hide();
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
                self.idiomas()[indice].nivelConversacion(nivelConversacion);
                self.idiomas()[indice].nombreNivelConversacion(nombreNivelConversacion);
                self.idiomas()[indice].nivelEscritura(nivelEscritura);
                self.idiomas()[indice].nombreNivelEscritura(nombreNivelEscritura);
                self.idiomas()[indice].nivelEscucha(nivelEscucha);
                self.idiomas()[indice].nombreNivelEscucha(nombreNivelEscucha);
                self.idiomas()[indice].nivelLectura(nivelLectura);
                self.idiomas()[indice].nombreNivelLectura(nombreNivelLectura);
                self.idiomas()[indice].otraCertificacion(otraCertificacion);
                self.idiomas()[indice].tipoCertificacion(tipoCertificacion);
                self.idiomas()[indice].nombreTipoCertificacion(nombreTipoCertificacion);
                self.idiomas()[indice].puntajeCertificacion(puntajeCertificacion);
                self.idiomas()[indice].certificado('');
                $('input:file[name="idiomas[' + indice + '].certificado"]').hide();
            }
            $('#md_idioma').modal('hide');
        };

        self.eliminarIdioma = function (idioma) {
            $('input:file[name="idiomas[' + idioma.consecutivo() + '].certificado"]').remove();
            self.idiomas.remove(idioma);
            for(i = idioma.consecutivo(); i < hojaVidaModel.idiomas().length; i++) {
               $('input:file[name="idiomas[' + (i + 1) + '].certificado"]').attr('name', 'idiomas[' + i + '].certificado'); 
                hojaVidaModel.idiomas()[i].consecutivo(i);
            }
        };

        self.editarIdioma = function (idioma) {
            ocultarCertificadosIdioma();
            $('#idioma').val(idioma.idioma()).trigger('change');
            $('#nivelConversacionIdioma').val(idioma.nivelConversacion()).trigger('change');
            $('#nivelEscrituraIdioma').val(idioma.nivelEscritura()).trigger('change');
            $('#nivelEscuchaIdioma').val(idioma.nivelEscucha()).trigger('change');
            $('#nivelLecturaIdioma').val(idioma.nivelLectura()).trigger('change');
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if($('#tipoCertificacionIdioma').val() === "8") {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#puntajeCertificacionIdioma').val(idioma.puntajeCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            $('input:file[name="idiomas[' + idioma.consecutivo() + '].certificado"]').show();
            bootstrap_alert_idioma.removeWarning();
            $('#md_idioma').modal('show');
        };

        self.verCertificadoIdioma = function (idioma) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoIdioma/" + idioma.id();
        };
        
        self.adicionarEducacionBasica = function () {
            var nivelEstudioEducacionBasica = $('#nivelEstudioEducacionBasica').val();
            var nombreNivelEducacionBasica = $('#nivelEstudioEducacionBasica option:selected').text();
            var institucionEducacionBasica = $('#institucionEducacionBasica').val();
            var nombreInstitucionEducacionBasica = $('#institucionEducacionBasica option:selected').text();
            var anyoInicioEducacionBasica = $('#anyoInicioEducacionBasica').val();
            var anyoFinalizacionEducacionBasica = $('#anyoFinalizacionEducacionBasica').val();
            var tituloEducacionBasica = $('#tituloEducacionBasica').val();
            var graduadoEducacionBasica = $('#graduadoEducacionBasica').val();
        
            if (nivelEstudioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if (institucionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe seleccionar la institución');
                return false;
            }
            if (anyoInicioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionBasica === "true" && anyoFinalizacionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de finalización');
                return false;
            }
            if (tituloEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el título');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="educacionesBasicas[' + self.educacionesBasicas().length + '].certificado"]').val() === "") {
                    bootstrap_alert_educacion_basica.warning('Debe ingresar el certificado');
                    return false;
                }
                self.educacionesBasicas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.educacionesBasicas().length),
                    institucion: ko.observable(institucionEducacionBasica),
                    nombreInstitucion: ko.observable(nombreInstitucionEducacionBasica),
                    nivel: ko.observable(nivelEstudioEducacionBasica),
                    nombreNivel: ko.observable(nombreNivelEducacionBasica),
                    anyoInicio: ko.observable(anyoInicioEducacionBasica),
                    anyoFinalizacion: ko.observable(anyoFinalizacionEducacionBasica),
                    titulo: ko.observable(tituloEducacionBasica),
                    graduado: ko.observable(graduadoEducacionBasica),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="educacionesBasicas[' + self.educacionesBasicas().length + '].certificado"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesBasicas().length; i++) {
                    if (self.educacionesBasicas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.educacionesBasicas()[indice].institucion(institucionEducacionBasica);
                self.educacionesBasicas()[indice].nombreInstitucion(nombreInstitucionEducacionBasica);
                self.educacionesBasicas()[indice].nivel(nivelEstudioEducacionBasica);
                self.educacionesBasicas()[indice].nombreNivel(nombreNivelEducacionBasica);
                self.educacionesBasicas()[indice].anyoInicio(anyoInicioEducacionBasica);
                self.educacionesBasicas()[indice].anyoFinalizacion(anyoFinalizacionEducacionBasica);
                self.educacionesBasicas()[indice].titulo(tituloEducacionBasica);
                self.educacionesBasicas()[indice].graduado(graduadoEducacionBasica);
                self.educacionesBasicas()[indice].certificado('');
                $('input:file[name="educacionesBasicas[' + indice + '].certificado"]').hide();
            }
            $('#md_educacion_basica').modal('hide');
        };

        self.eliminarEducacionBasica = function (educacionBasica) {
            $('input:file[name="educacionesBasicas[' + educacionBasica.consecutivo() + '].certificado"]').remove();
            self.educacionesBasicas.remove(educacionBasica);
            for(i = educacionBasica.consecutivo(); i < hojaVidaModel.educacionesBasicas().length; i++) {
               $('input:file[name="educacionesBasicas[' + (i + 1) + '].certificado"]').attr('name', 'educacionesBasicas[' + i + '].certificado'); 
                hojaVidaModel.educacionesBasicas()[i].consecutivo(i);
            }
        };

        self.editarEducacionBasica = function (educacionBasica) {
            ocultarCertificadosEducacionBasica();
            
            $('#nivelEstudioEducacionBasica').val(educacionBasica.nivel()).trigger('change');
            $('#institucionEducacionBasica').val(educacionBasica.institucion()).trigger('change');
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
            if($('#tipoCertificacionEducacionBasica').val() === "8") {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#consecutivo').val(educacionBasica.consecutivo());
            $('input:file[name="educacionesBasicas[' + educacionBasica.consecutivo() + '].certificado"]').show();
            bootstrap_alert_educacion_basica.removeWarning();
            $('#md_educacion_basica').modal('show');
        };

        self.verCertificadoEducacionBasica = function (educacionBasica) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasica/" + educacionBasica.id();
        };        

        self.adicionarEducacionSuperior = function () {
            var nivelEstudioEducacionSuperior = $('#nivelEstudioEducacionSuperior').val();
            var nombreNivelEducacionSuperior = $('#nivelEstudioEducacionSuperior option:selected').text();
            var tituloExteriorEducacionSuperior = $('#tituloExteriorEducacionSuperior').val();
            var paisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior').val();
            var nombrePaisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior option:selected').text();
            var programaCursadoEducacionSuperior = $('#programaCursadoEducacionSuperior').val();
            var institucionEducacionSuperior = $('#institucionEducacionSuperior').val();
            var nombreInstitucionEducacionSuperior = $('#nombreInstitucionEducacionSuperior').val();
            var areaSaberEducacionSuperior = $('#areaSaberEducacionSuperior').val();
            var nombreAreaSaberEducacionSuperior = $('#nombreAreaSaberEducacionSuperior').val();
            var anyoInicioEducacionSuperior = $('#anyoInicioEducacionSuperior').val();
            var anyoFinalizacionEducacionSuperior = $('#anyoFinalizacionEducacionSuperior').val();
            var tituloEducacionSuperior = $('#tituloEducacionSuperior').val();
            var graduadoEducacionSuperior = $('#graduadoEducacionSuperior').val();
            var fechaTituloEducacionSuperior = $('#fechaTituloEducacionSuperior').val();
        
            if (nivelEstudioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if(tituloExteriorEducacionSuperior === "true") {
                if(paisTituloExteriorEducacionSuperior === "") {
                    bootstrap_alert_educacion_superior.warning('Debe seleccionar el país');
                    return false;
                }
                if ($('#consecutivo').val() === "") {    
                    if ($('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificadoHomologado"]').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                } 
            }
            if (programaCursadoEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el programa');
                return false;
            }
            if (institucionEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe seleccionar la institución');
                return false;
            }
            if (areaSaberEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe seleccionar el área de saber');
                return false;
            }
            if (anyoInicioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionSuperior === "true" && anyoFinalizacionEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de finalización');
                return false;
            }
            if (tituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el título');
                return false;
            }
            if (fechaTituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar la fecha del título');
                return false;
            }
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificado"]').val() === "") {
                    bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado');
                    return false;
                }
                self.educacionesSuperiores.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.educacionesSuperiores().length),
                    tituloExterior: ko.observable(tituloExteriorEducacionSuperior),
                    paisTituloExterior: ko.observable(paisTituloExteriorEducacionSuperior),
                    nombrePais: ko.observable(nombrePaisTituloExteriorEducacionSuperior),
                    institucion: ko.observable(institucionEducacionSuperior),
                    nombreInstitucion: ko.observable(nombreInstitucionEducacionSuperior),
                    programa: ko.observable(programaCursadoEducacionSuperior),
                    areaSaber: ko.observable(areaSaberEducacionSuperior),
                    nombreAreaSaber: ko.observable(nombreAreaSaberEducacionSuperior),
                    nivel: ko.observable(nivelEstudioEducacionSuperior),
                    nombreNivel: ko.observable(nombreNivelEducacionSuperior),
                    anyoInicio: ko.observable(anyoInicioEducacionSuperior),
                    anyoFinalizacion: ko.observable(anyoFinalizacionEducacionSuperior),
                    titulo: ko.observable(tituloEducacionSuperior),
                    graduado: ko.observable(graduadoEducacionSuperior),
                    fechaTitulo: ko.observable(fechaTituloEducacionSuperior),
                    certificadoHomologado: ko.observable(''),
                    tieneCertificadoHomologado: ko.observable(false),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificado"]').hide();
                $('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificadoHomologado"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesSuperiores().length; i++) {
                    if (self.educacionesSuperiores()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if(tituloExteriorEducacionSuperior === "true" && self.educacionesSuperiores()[indice].tituloExterior() === false) {
                    if($('input:file[name="educacionesSuperiores[' + indice + '].certificadoHomologado"]').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                }
                self.educacionesSuperiores()[indice].institucion(institucionEducacionSuperior);
                self.educacionesSuperiores()[indice].nombreInstitucion(nombreInstitucionEducacionSuperior);
                self.educacionesSuperiores()[indice].tituloExterior(tituloExteriorEducacionSuperior);
                self.educacionesSuperiores()[indice].nombreInstitucion(nombreInstitucionEducacionSuperior);
                self.educacionesSuperiores()[indice].paisTituloExterior(paisTituloExteriorEducacionSuperior);
                self.educacionesSuperiores()[indice].nombrePaisTituloExterior(nombrePaisTituloExteriorEducacionSuperior);
                self.educacionesSuperiores()[indice].nivel(nivelEstudioEducacionSuperior);
                self.educacionesSuperiores()[indice].nombreNivel(nombreNivelEducacionSuperior);
                self.educacionesSuperiores()[indice].programa(programaCursadoEducacionSuperior);
                self.educacionesSuperiores()[indice].areaSaber(areaSaberEducacionSuperior);
                self.educacionesSuperiores()[indice].nombreAreaSaber(nombreAreaSaberEducacionSuperior);
                self.educacionesSuperiores()[indice].anyoInicio(anyoInicioEducacionSuperior);
                self.educacionesSuperiores()[indice].anyoFinalizacion(anyoFinalizacionEducacionSuperior);
                self.educacionesSuperiores()[indice].titulo(tituloEducacionSuperior);
                self.educacionesSuperiores()[indice].graduado(graduadoEducacionSuperior);
                self.educacionesSuperiores()[indice].fechaTitulo(fechaTituloEducacionSuperior);
                self.educacionesSuperiores()[indice].certificado('');
                self.educacionesSuperiores()[indice].certificadoHomologado('');
                $('input:file[name="educacionesSuperiores[' + indice + '].certificado"]').hide();
                $('input:file[name="educacionesSuperiores[' + indice + '].certificadoHomologado"]').hide();
            }
            $('#md_educacion_superior').modal('hide');
        };

        self.eliminarEducacionSuperior = function (educacionSuperior) {
            $('input:file[name="educacionesSuperiores[' + educacionSuperior.consecutivo() + '].certificado"]').remove();
            $('input:file[name="educacionesSuperiores[' + educacionSuperior.consecutivo() + '].certificadoHomologado"]').remove();
            self.educacionesSuperiores.remove(educacionSuperior);
            for(i = educacionSuperior.consecutivo(); i < hojaVidaModel.educacionesSuperiores().length; i++) {
               $('input:file[name="educacionesSuperiores[' + (i + 1) + '].certificado"]').attr('name', 'educacionesSuperiores[' + i + '].certificado'); 
               $('input:file[name="educacionesSuperiores[' + (i + 1) + '].certificadoHomologado"]').attr('name', 'educacionesSuperiores[' + i + '].certificadoHomologado'); 
                hojaVidaModel.educacionesSuperiores()[i].consecutivo(i);
            }
        };

        self.editarEducacionSuperior = function (educacionSuperior) {
            ocultarCertificadosEducacionSuperior();

            $('#nivelEstudioEducacionSuperior').val(educacionSuperior.nivel()).trigger('change');
            $('#tituloExteriorEducacionSuperior').val(educacionSuperior.tituloExterior());
            $('#paisTituloExteriorEducacionSuperior').val(educacionSuperior.paisTituloExterior()).trigger('change');
            
            if(educacionSuperior.tituloExterior()) {
                $('#paistit').css("display","block");
                $('#certhomo').css('display','block');
            } else {
                $('#paistit').css("display","none");
                $('#certhomo').css('display','none');
            }
            
            $('#institucionEducativaPrograma').val(educacionSuperior.institucion()).trigger('change');
            $('#programaCursado').val(educacionSuperior.programa());
            $('#areaSaberPrograma').val(educacionSuperior.areaSaber()).trigger('change');
            $('#tituloPrograma').val(educacionSuperior.titulo());
            
            $('#formprograma').css("display","block");
            
            $('#institucionEducacionSuperior').val(educacionSuperior.institucion());
            $('#nombreInstitucionEducacionSuperior').val(educacionSuperior.nombreInstitucion());
            $('#programaCursadoEducacionSuperior').val(educacionSuperior.programa());
            $('#areaSaberEducacionSuperior').val(educacionSuperior.areaSaber());
            $('#nombreAreaSaberEducacionSuperior').val(educacionSuperior.nombreAreaSaber());
            $('#tituloEducacionSuperior').val(educacionSuperior.titulo());
    
            $('#anyoInicioEducacionSuperior').val(educacionSuperior.anyoInicio());
            $('#anyoFinalizacionEducacionSuperior').val(educacionSuperior.anyoFinalizacion()).trigger('change');
            $('#graduadoEducacionSuperior').val(educacionSuperior.graduado());            
            $('#fechaTituloEducacionSuperior').val(educacionSuperior.fechaTitulo());
            if(educacionSuperior.graduado()) {
              $('#btnGraduadoSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#anyoFinalizacionEducacionSuperior').prop('disabled',false);
            } else {
              $('#btnGraduadoNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
            }
            if(educacionSuperior.tituloExterior()) {
              $('#btnTituloExtranjeroSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExtranjeroNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#paisTituloExteriorEducacionSuperior').css("display","block");
            } else {
              $('#btnTituloExtranjeroNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExtranjeroSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#paisTituloExteriorEducacionSuperior').css("display","none");
            }
            $('#consecutivo').val(educacionSuperior.consecutivo());
            $('input:file[name="educacionesSuperiores[' + educacionSuperior.consecutivo() + '].certificado"]').show();
            $('input:file[name="educacionesSuperiores[' + educacionSuperior.consecutivo() + '].certificadoHomologado"]').show();
            bootstrap_alert_educacion_superior.removeWarning();
            $('#md_educacion_superior').modal('show');
        };

        self.verCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id();
        };        

        self.verCertificadoEducacionSuperior = function (educacionSuperior) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id();
        };        

        self.adicionarEducacionContinua = function () {
            var tipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua').val();
            var nombreTipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua option:selected').text();
            var institucionEducacionContinua = $('#institucionEducacionContinua').val();
            var nombreInstitucionEducacionContinua = $('#institucionEducacionContinua option:selected').text();
            var areaSaberEducacionContinua = $('#areaSaberEducacionContinua').val();
            var nombreAreaSaberEducacionContinua = $('#areaSaberEducacionContinua option:selected').text();
            var nombreCapacitacionEducacionContinua = $('#nombreCapacitacionEducacionContinua').val();
            var numeroHorasEducacionContinua = $('#numeroHorasEducacionContinua').val();
            var anyoEducacionContinua = $('#anyoEducacionContinua').val();

            if (tipoCapacitacionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el tipo de capacitación');
                return false;
            }
            if (institucionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar la institución');
                return false;
            }
            if (areaSaberEducacionContinua === "") {
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
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="educacionesContinuas[' + self.educacionesContinuas().length + '].certificado"]').val() === "") {
                    bootstrap_alert_educacion_continua.warning('Debe ingresar el certificado');
                    return false;
                }
                self.educacionesContinuas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.educacionesContinuas().length),
                    tipoCapacitacion: ko.observable(tipoCapacitacionEducacionContinua),
                    nombreTipoCapacitacion: ko.observable(nombreTipoCapacitacionEducacionContinua),
                    institucion: ko.observable(institucionEducacionContinua),
                    nombreInstitucion: ko.observable(nombreInstitucionEducacionContinua),
                    nombreCapacitacion: ko.observable(nombreCapacitacionEducacionContinua),
                    areaSaber: ko.observable(areaSaberEducacionContinua),
                    nombreAreaSaber: ko.observable(nombreAreaSaberEducacionContinua),
                    numeroHoras: ko.observable(numeroHorasEducacionContinua),
                    anyo: ko.observable(anyoEducacionContinua),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="educacionesContinuas[' + self.educacionesContinuas().length + '].certificado"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesContinuas().length; i++) {
                    if (self.educacionesContinuas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.educacionesContinuas()[indice].tipoCapacitacion(tipoCapacitacionEducacionContinua);
                self.educacionesContinuas()[indice].nombreTipoCapacitacion(nombreTipoCapacitacionEducacionContinua);
                self.educacionesContinuas()[indice].institucion(institucionEducacionContinua);
                self.educacionesContinuas()[indice].nombreInstitucion(nombreInstitucionEducacionContinua);
                self.educacionesContinuas()[indice].nombreCapacitacion(nombreCapacitacionEducacionContinua);
                self.educacionesContinuas()[indice].numeroHoras(numeroHorasEducacionContinua);
                self.educacionesContinuas()[indice].areaSaber(areaSaberEducacionContinua);
                self.educacionesContinuas()[indice].nombreAreaSaber(nombreAreaSaberEducacionContinua);
                self.educacionesContinuas()[indice].anyo(anyoEducacionContinua);
                self.educacionesContinuas()[indice].certificado('');
                $('input:file[name="educacionesContinuas[' + indice + '].certificado"]').hide();
            }
            $('#md_educacion_continua').modal('hide');
        };

        self.eliminarEducacionContinua = function (educacionContinua) {
            $('input:file[name="educacionesContinuas[' + educacionContinua.consecutivo() + '].certificado"]').remove();
            self.educacionesContinuas.remove(educacionContinua);
            for(i = educacionContinua.consecutivo(); i < hojaVidaModel.educacionesContinuas().length; i++) {
                $('input:file[name="educacionesContinuas[' + (i + 1) + '].certificado"]').attr('name', 'educacionesContinuas[' + i + '].certificado'); 
                hojaVidaModel.educacionesContinuas()[i].consecutivo(i);
            }
        };

        self.editarEducacionContinua = function (educacionContinua) {
            ocultarCertificadosEducacionContinua();

            $('#tipoCapacitacionEducacionContinua').val(educacionContinua.tipoCapacitacion()).trigger('change');
            $('#institucionEducacionContinua').val(educacionContinua.institucion()).trigger('change');
            $('#nombreCapacitacionEducacionContinua').val(educacionContinua.nombreCapacitacion());
            $('#numeroHorasEducacionContinua').val(educacionContinua.numeroHoras());
            $('#areaSaberEducacionContinua').val(educacionContinua.areaSaber()).trigger('change');
            $('#anyoEducacionContinua').val(educacionContinua.anyo()).trigger('change');
            $('#consecutivo').val(educacionContinua.consecutivo());
            $('input:file[name="educacionesContinuas[' + educacionContinua.consecutivo() + '].certificado"]').show();
            bootstrap_alert_educacion_continua.removeWarning();
            $('#md_educacion_continua').modal('show');
        };

        self.verCertificadoEducacionContinua = function (educacionContinua) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinua/" + educacionContinua.id();
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
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="distinciones[' + self.distinciones().length + '].certificado"]').val() === "") {
                    bootstrap_alert_distincion.warning('Debe ingresar el certificado');
                    return false;
                }
                self.distinciones.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.distinciones().length),
                    fechaDistincion: ko.observable(fechaDistincion),
                    institucionOtorga: ko.observable(institucionOtorgaDistincion),
                    descripcion: ko.observable(descripcionDistincion),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="distinciones[' + self.distinciones().length + '].certificado"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.distinciones().length; i++) {
                    if (self.distinciones()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.distinciones()[indice].fechaDistincion(fechaDistincion);
                self.distinciones()[indice].institucionOtorga(institucionOtorgaDistincion);
                self.distinciones()[indice].descripcion(descripcionDistincion);
                self.distinciones()[indice].certificado('');
                $('input:file[name="distinciones[' + indice + '].certificado"]').hide();
            }
            $('#md_distincion').modal('hide');
        };

        self.eliminarDistincion = function (distincion) {
            $('input:file[name="distinciones[' + distincion.consecutivo() + '].certificado"]').remove();
            self.distinciones.remove(distincion);
            for(i = distincion.consecutivo(); i < hojaVidaModel.distinciones().length; i++) {
               $('input:file[name="distinciones[' + (i + 1) + '].certificado"]').attr('name', 'distinciones[' + i + '].certificado'); 
                hojaVidaModel.distinciones()[i].consecutivo(i);
            }
        };

        self.editarDistincion = function (distincion) {
            ocultarCertificadosDistincion();

            $('#fechaDistincion').val(distincion.fechaDistincion());
            $('#institucionOtorgaDistincion').val(distincion.institucionOtorga());
            $('#descripcionDistincion').val(distincion.descripcion());
            $('#consecutivo').val(distincion.consecutivo());
            $('input:file[name="distinciones[' + distincion.consecutivo() + '].certificado"]').show();
            bootstrap_alert_distincion.removeWarning();
            $('#md_distincion').modal('show');
        };

        self.verCertificadoDistincion = function (distincion) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoDistincion/" + distincion.id();
        };
        
       self.adicionarExperienciaLaboral = function () {
            var tipoExperienciaLaboral = $('#tipoExperienciaLaboral').val();
            var nombreTipoExperienciaLaboral = $('#tipoExperienciaLaboral option:selected').text();
            var trabajoActualExperienciaLaboral = $('#trabajoActualExperienciaLaboral').val();
            var experienciaLaboralFNSP = $('#experienciaLaboralFNSP').val();
            var fechaIngresoExperienciaLaboral = $('#fechaIngresoExperienciaLaboral').val();
            var fechaRetiroExperienciaLaboral = $('#fechaRetiroExperienciaLaboral').val();
            var areaSaberExperienciaLaboral = $('#areaSaberExperienciaLaboral').val();
            var nombreAreaSaberExperienciaLaboral = $('#areaSaberExperienciaLaboral option:selected').text();
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
            if (trabajoActualExperienciaLaboral === "false" && fechaRetiroExperienciaLaboral === "" ) {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar la la fecha de retiro');
                return false;
            }
            if (areaSaberExperienciaLaboral === "") {
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
            
            if ($('#consecutivo').val() === "") {
                if ($('input:file[name="experienciasLaborales[' + self.experienciasLaborales().length + '].certificado"]').val() === "") {
                    bootstrap_alert_experiencia_laboral.warning('Debe ingresar el certificado');
                    return false;
                }
                self.experienciasLaborales.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.experienciasLaborales().length),
                    tipoExperiencia: ko.observable(tipoExperienciaLaboral),
                    nombreTipoExperiencia: ko.observable(nombreTipoExperienciaLaboral),
                    trabajoActual: ko.observable(trabajoActualExperienciaLaboral),
                    fnsp: ko.observable(experienciaLaboralFNSP),
                    fechaIngreso: ko.observable(fechaIngresoExperienciaLaboral),
                    fechaRetiro: ko.observable(fechaRetiroExperienciaLaboral),
                    areaSaber: ko.observable(areaSaberExperienciaLaboral),
                    nombreAreaSaber: ko.observable(nombreAreaSaberExperienciaLaboral),
                    tipoEmpresa: ko.observable(tipoEmpresaExperienciaLaboral),
                    nombreTipoEmpresa: ko.observable(nombreTipoEmpresaExperienciaLaboral),
                    nombreEmpresa: ko.observable(nombreEmpresaExperienciaLaboral),
                    actividadEconomica: ko.observable(actividadEconomicaExperienciaLaboral),
                    nombreActividadEconomica: ko.observable(nombreActividadEconomicaExperienciaLaboral),
                    tipoContrato: ko.observable(tipoContratoExperienciaLaboral),
                    nombreTipoContrato: ko.observable(nombreTipoContratoExperienciaLaboral),
                    cargo: ko.observable(cargoExperienciaLaboral),
                    naturalezaCargo: ko.observable(naturalezaCargoExperienciaLaboral),
                    nombreNaturalezaCargo: ko.observable(nombreNaturalezaCargoExperienciaLaboral),
                    certificado: ko.observable(''),
                    tieneCertificado: ko.observable(false)
                });
                $('input:file[name="experienciasLaborales[' + self.experienciasLaborales().length + '].certificado"]').hide();
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.experienciasLaborales().length; i++) {
                    if (self.experienciasLaborales()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                self.experienciasLaborales()[indice].tipoExperiencia(tipoExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreTipoExperiencia(nombreTipoExperienciaLaboral);
                self.experienciasLaborales()[indice].trabajoActual(trabajoActualExperienciaLaboral);
                self.experienciasLaborales()[indice].fnsp(experienciaLaboralFNSP);
                self.experienciasLaborales()[indice].fechaIngreso(fechaIngresoExperienciaLaboral);
                self.experienciasLaborales()[indice].fechaRetiro(fechaRetiroExperienciaLaboral);
                self.experienciasLaborales()[indice].areaSaber(areaSaberExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreAreaSaber(nombreAreaSaberExperienciaLaboral);
                self.experienciasLaborales()[indice].tipoEmpresa(tipoEmpresaExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreTipoEmpresa(nombreTipoEmpresaExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreEmpresa(nombreEmpresaExperienciaLaboral);
                self.experienciasLaborales()[indice].actividadEconomica(actividadEconomicaExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreActividadEconomica(nombreActividadEconomicaExperienciaLaboral);
                self.experienciasLaborales()[indice].tipoContrato(tipoContratoExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreTipoContrato(nombreTipoContratoExperienciaLaboral);
                self.experienciasLaborales()[indice].cargo(cargoExperienciaLaboral);
                self.experienciasLaborales()[indice].naturalezaCargo(naturalezaCargoExperienciaLaboral);
                self.experienciasLaborales()[indice].nombreNaturalezaCargo(nombreNaturalezaCargoExperienciaLaboral);
                self.experienciasLaborales()[indice].certificado('');
                $('input:file[name="experienciasLaborales[' + indice + '].certificado"]').hide();
            }
            $('#md_experiencia_laboral').modal('hide');
        };

        self.eliminarExperienciaLaboral = function (experienciaLaboral) {
            $('input:file[name="experienciasLaborales[' + experienciaLaboral.consecutivo() + '].certificado"]').remove();
            self.experienciasLaborales.remove(experienciaLaboral);
            for(i = experienciaLaboral.consecutivo(); i < hojaVidaModel.experienciasLaborales().length; i++) {
               $('input:file[name="experienciasLaborales[' + (i + 1) + '].certificado"]').attr('name', 'experienciasLaborales[' + i + '].certificado'); 
                hojaVidaModel.experienciasLaborales()[i].consecutivo(i);
            }
        };

        self.editarExperienciaLaboral = function (experienciaLaboral) {
            ocultarCertificadosExperienciaLaboral();

            $('#tipoExperienciaLaboral').val(experienciaLaboral.tipoExperiencia()).trigger('change');
            $('#trabajoActualExperienciaLaboral').val(experienciaLaboral.trabajoActual());
            if(experienciaLaboral.trabajoActual()) {
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');
              $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
            } else {
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');  
              $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
            }
            $('#experienciaLaboralFNSP').val(experienciaLaboral.fnsp());
            if(experienciaLaboral.fnsp()) {
              $('#btnExperienciaLaboralFNSPSi').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPNo').removeClass('active').addClass('notActive');
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
            } else {
              $('#btnExperienciaLaboralFNSPNo').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPSi').removeClass('active').addClass('notActive');  
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
            }
            $('#fechaIngresoExperienciaLaboral').val(experienciaLaboral.fechaIngreso());
            $('#fechaRetiroExperienciaLaboral').val(experienciaLaboral.fechaRetiro());
            $('#areaSaberExperienciaLaboral').val(experienciaLaboral.areaSaber()).trigger('change');
            $('#tipoEmpresaExperienciaLaboral').val(experienciaLaboral.tipoEmpresa()).trigger('change');
            $('#nombreEmpresaExperienciaLaboral').val(experienciaLaboral.nombreEmpresa());
            $('#actividadEconomicaExperienciaLaboral').val(experienciaLaboral.actividadEconomica()).trigger('change');
            $('#tipoContratoExperienciaLaboral').val(experienciaLaboral.tipoContrato()).trigger('change');
            $('#cargoExperienciaLaboral').val(experienciaLaboral.cargo());
            $('#naturalezaCargoExperienciaLaboral').val(experienciaLaboral.naturalezaCargo()).trigger('change');
            $('#consecutivo').val(experienciaLaboral.consecutivo());
            $('input:file[name="experienciasLaborales[' + experienciaLaboral.consecutivo() + '].certificado"]').show();
            bootstrap_alert_experiencia_laboral.removeWarning();
            $('#md_experiencia_laboral').modal('show');
        };

        self.verCertificadoExperienciaLaboral = function (experienciaLaboral) {
            window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id();
        };        
    };

    function nuevoCorreoElectronico() {
        $('#correoElectronico').val("");
        $('#consecutivo').val("");
        bootstrap_alert_correo_electronico.removeWarning();
        $('#md_correo_electronico').modal('show');
    }

    function nuevoTelefono() {
        $('#tipoTelefono').val("").trigger("change.select2");
        $('#numeroTelefono').val("");
        $('#consecutivo').val("");
        bootstrap_alert_telefono.removeWarning();
        $('#md_telefono').modal('show');
    }

    function nuevaCuentaBancaria() {
        $('#tipoCuentaBancaria').val("").trigger("change.select2");
        $('#numeroCuentaBancaria').val("");
        $('#entidadCuentaBancaria').val("");
        $('#consecutivo').val("");
        bootstrap_alert_cuenta_bancaria.removeWarning();
        $('#md_cuenta_bancaria').modal('show');
    }

    function nuevoDocumentoSoporte() {
        $('#tipoDocumento').val("").trigger('change');
        $('#consecutivo').val("");
        ocultarDocumentosSoporte();
        var fileInput = $('input:file[name="documentosSoporte[' + hojaVidaModel.documentosSoporte().length + '].documento"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="documentosSoporte[' + (self.documentosSoporte().length) + '].documento" />');
            $('#documentosSoporte').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_documento_soporte.removeWarning();
        $('#md_documento_soporte').modal('show');
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#nivelConversacionIdioma').val("").trigger('change');
        $('#nivelEscrituraIdioma').val("").trigger('change');
        $('#nivelEscuchaIdioma').val("").trigger('change');
        $('#nivelLecturaIdioma').val("").trigger('change');
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeCertificacionIdioma').val("");
        $('#consecutivo').val("");
        ocultarCertificadosIdioma();
        var fileInput = $('input:file[name="idiomas[' + hojaVidaModel.idiomas().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="idiomas[' + (self.idiomas().length) + '].certificado" />');
            $('#certificadosIdioma').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_idioma.removeWarning();
        $('#md_idioma').modal('show');
    }
        
    function nuevaEducacionBasica() {
        $('#nivelEstudioEducacionBasica').val("").trigger('change');
        $('#institucionEducacionBasica').val("").trigger('change');
        $('#anyoInicioEducacionBasica').val("").trigger('change');
        $('#anyoFinalizacionEducacionBasica').val("").trigger('change');
        $('#tituloEducacionBasica').val("");
        $('#graduadoEducacionBasica').val("false");
        $('#btnGraduadoSiEducacionBasica').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionBasica').removeClass('active').addClass('notActive');  
        $('#consecutivo').val("");
        ocultarCertificadosEducacionBasica();
        var fileInput = $('input:file[name="educacionesBasicas[' + hojaVidaModel.educacionesBasicas().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="educacionesBasicas[' + (self.educacionesBasicas().length) + '].certificado" />');
            $('#certificadosEducacionBasica').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_educacion_basica.removeWarning();
        $('#md_educacion_basica').modal('show');
    }
    
    function nuevaEducacionSuperior() {
        $('#nivelEstudioEducacionSuperior').val("").trigger('change');
        $('#tituloExteriorEducacionSuperior').val('false');
        $('#paisEducacionSuperior').val("").trigger('change');
        $('#institucionEducacionSuperior').val("");
        $('#nombreInstitucionEducacionSuperior').val("");
        $('#programaCursadoEducacionSuperior').val('');
        $('#areaSaberEducacionSuperior').val('');
        $('#nombreAreaSaberEducacionSuperior').val('');
        $('#anyoInicioEducacionSuperior').val("").trigger('change');
        $('#anyoFinalizacionEducacionSuperior').val("").trigger('change');
        $('#tituloEducacionSuperior').val("");
        $('#graduadoEducacionSuperior').val("false");
        $('#fechaTituloEducacionSuperior').val("");
        
        $('#areaSaberPrograma').val("").trigger("change.select2");
        $('#institucionEducativaPrograma').val("").trigger("change.select2");
        $('#programaCursado').val("");
        $('#tituloPrograma').val("");        
        
        $('#btnTituloExtranjeroSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnTituloExtranjeroNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#paisTituloExteriorEducacionSuperior').css("display","none");
         
        $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
        
        $('#consecutivo').val("");
        ocultarCertificadosEducacionSuperior();
        var fileInput = $('input:file[name="educacionesSuperiores[' + hojaVidaModel.educacionesSuperiores().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="educacionesSuperiores[' + (self.educacionesSuperiores().length) + '].certificado" />');
            $('#certificadosEducacionSuperior').append(fileInput);
        } else {
            fileInput.show();
        }
        fileInput = $('input:file[name="educacionesSuperiores[' + hojaVidaModel.educacionesSuperiores().length + '].certificadoHomologado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="educacionesSuperiores[' + (self.educacionesSuperiores().length) + '].certificadoHomologado" />');
            $('#certificadosHomologadosEducacionSuperior').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_educacion_superior.removeWarning();
        $('#md_educacion_superior').modal('show');
    }    

    function nuevoPrograma() {
        $('#areaSaberPrograma').val("").trigger("change.select2");
        $('#institucionEducativaPrograma').val("").trigger("change.select2");
        $('#programaCursado').val("").trigger("change.select2");
        $('#tituloPrograma').val("");

        $('#md_programa').modal('show');
    }

    function nuevaEducacionContinua() {
        $('#tipoCapacitacionEducacionContinua').val("").trigger('change');
        $('#institucionEducacionContinua').val("").trigger('change');
        $('#nombreCapacitacionEducacionContinua').val("");
        $('#numeroHorasEducacionContinua').val("");
        $('#areaSaberEducacionContinua').val("").trigger('change');
        $('#anyoEducacionContinua').val("");
        $('#consecutivo').val("");
        ocultarCertificadosEducacionContinua();
        var fileInput = $('input:file[name="educacionesContinuas[' + hojaVidaModel.educacionesContinuas().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="educacionesContinuas[' + (self.educacionesContinuas().length) + '].certificado" />');
            $('#certificadosEducacionContinua').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_educacion_continua.removeWarning();
        $('#md_educacion_continua').modal('show');
    }    

    function nuevaDistincion() {
        $('#descripcionDistincion').val("");
        $('#institucionOtorgaDistincion').val("");
        $('#fechaDistincion').val("");
        $('#consecutivo').val("");
        ocultarCertificadosDistincion();
        var fileInput = $('input:file[name="distinciones[' + hojaVidaModel.distinciones().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="distinciones[' + (self.distinciones().length) + '].certificado" />');
            $('#certificadosDistincion').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_distincion.removeWarning();
        $('#md_distincion').modal('show');
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
        $('#areaSaberExperienciaLaboral').val("").trigger('change');
        $('#tipoEmpresaExperienciaLaboral').val("").trigger('change');
        $('#nombreEmpresaExperienciaLaboral').val("");
        $('#actividadEconomicaExperienciaLaboral').val("").trigger('change');
        $('#tipoContratoExperienciaLaboral').val("").trigger('change');
        $('#cargoExperienciaLaboral').val("");
        $('#naturalezaCargoExperienciaLaboral').val("").trigger('change');
        $('#consecutivo').val("");
        ocultarCertificadosExperienciaLaboral();
        var fileInput = $('input:file[name="experienciasLaborales[' + hojaVidaModel.experienciasLaborales().length + '].certificado"]');
        if (!fileInput.attr('id')) {
            fileInput = $('<input type="file" class="form-control" name="experienciasLaborales[' + (self.experienciasLaborales().length) + '].certificado" />');
            $('#certificadosExperienciaLaboral').append(fileInput);
        } else {
            fileInput.show();
        }
        bootstrap_alert_experiencia_laboral.removeWarning();
        $('#md_experiencia_laboral').modal('show');
    } 

    function cerrarVentanaDocumentoSoporte() {
        if ($('input:file[name="documentosSoporte[' + self.documentosSoporte().length + '].documento"]')) {
            $('input:file[name="documentosSoporte[' + self.documentosSoporte().length + '].documento"]').remove();
        }
        $('#md_documento_soporte').modal('hide');
    }
    
    function cerrarVentanaIdioma() {
        if ($('input:file[name="idiomas[' + self.idiomas().length + '].certificado"]')) {
            $('input:file[name="idiomas[' + self.idiomas().length + '].certificado"]').remove();
        }
        $('#md_idioma').modal('hide');
    }
        
    function cerrarVentanaEducacionBasica() {
        if ($('input:file[name="educacionesBasicas[' + self.educacionesBasicas().length + '].certificado"]')) {
            $('input:file[name="educacionesBasicas[' + self.educacionesBasicas().length + '].certificado"]').remove();
        }
        $('#md_educacion_basica').modal('hide');
    }

    function cerrarVentanaEducacionSuperior() {
        if ($('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificado"]')) {
            $('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificado"]').remove();
        }
        if ($('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificadoHomologado"]')) {
            $('input:file[name="educacionesSuperiores[' + self.educacionesSuperiores().length + '].certificadoHomologado"]').remove();
        }
        $('#md_educacion_superior').modal('hide');
    }
    
    function cerrarVentanaPrograma() {
        $('#md_programa').modal('hide');
    }

    function cerrarVentanaEducacionContinua() {
        if ($('input:file[name="educacionesContinuas[' + self.educacionesContinuas().length + '].certificado"]')) {
            $('input:file[name="educacionesContinuas[' + self.educacionesContinuas().length + '].certificado"]').remove();
        }
        $('#md_educacion_continua').modal('hide');
    }
    
    function cerrarVentanaDistincion() {
        if ($('input:file[name="distinciones[' + self.distinciones().length + '].certificado"]')) {
            $('input:file[name="distinciones[' + self.distinciones().length + '].certificado"]').remove();
        }
        $('#md_distincion').modal('hide');
    }
   
    function cerrarVentanaExperienciaLaboral() {
        if ($('input:file[name="experienciasLaborales[' + self.experienciasLaborales().length + '].certificado"]')) {
            $('input:file[name="experienciasLaborales[' + self.experienciasLaborales().length + '].certificado"]').remove();
        }
        $('#md_experiencia_laboral').modal('hide');
    }
    
    function ocultarDocumentosSoporte() {
        for (var i = 0; i < hojaVidaModel.documentosSoporte().length; i++) {
            $('input:file[name="documentosSoporte[' + i + '].documento"]').hide();
        }
        var fileInput = $('input:file[name="documentosSoporte[' + hojaVidaModel.documentosSoporte().length + '].documento"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }

    function ocultarCertificadosIdioma() {
        for (var i = 0; i < hojaVidaModel.idiomas().length; i++) {
            $('input:file[name="idiomas[' + i + '].certificado"]').hide();
        }
        var fileInput = $('input:file[name="idiomas[' + hojaVidaModel.idiomas().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }
    
    function ocultarCertificadosEducacionBasica() {
        for (var i = 0; i < hojaVidaModel.educacionesBasicas().length; i++) {
            $('input:file[name="educacionesBasicas[' + i + '].certificado"]').hide();
        }
        var fileInput = $('input:file[name="educacionesBasicas[' + hojaVidaModel.educacionesBasicas().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }
    
    function ocultarCertificadosEducacionSuperior() {
        for (var i = 0; i < hojaVidaModel.educacionesSuperiores().length; i++) {
            $('input:file[name="educacionesSuperiores[' + i + '].certificado"]').hide();
            $('input:file[name="educacionesSuperiores[' + i + '].certificadoHomologado"]').hide();
        }
        var fileInput = $('input:file[name="educacionesSuperiores[' + hojaVidaModel.educacionesSuperiores().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
        fileInput = $('input:file[name="educacionesSuperiores[' + hojaVidaModel.educacionesSuperiores().length + '].certificadoHomologado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }
    
    function ocultarCertificadosEducacionContinua() {
        for (var i = 0; i < hojaVidaModel.educacionesContinuas().length; i++) {
            $('input:file[name="educacionesContinuas[' + i + '].certificado"]').hide();
        }
        var fileInput = $('input:file[name="educacionesContinuas[' + hojaVidaModel.educacionesContinuas().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }

    function ocultarCertificadosDistincion() {
        for (var i = 0; i < hojaVidaModel.distinciones().length; i++) {
            $('input:file[name="distinciones[' + i + '].certificado"]').hide();
        }
        var fileInput = $('input:file[name="distinciones[' + hojaVidaModel.distinciones().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }

    function ocultarCertificadosExperienciaLaboral() {
        for (var i = 0; i < hojaVidaModel.experienciasLaborales().length; i++) {
            $('input:file[name="experienciasLaborales[' + i + '].certificado"]').hide();
        }
        var fileInput = $('input:file[name="experienciasLaborales[' + hojaVidaModel.experienciasLaborales().length + '].certificado"]');
        if (fileInput.attr('id')) {
            fileInput.hide();
        }
    }

    $('#hojaVida').submit(function (evt) {
        evt.preventDefault();
        if ($('#disponeRUT').val() === 'true' && $('#actividadEconomica').val() === "") {
            bootstrap_alert_hoja_vida.warning("Debe ingresar la actividad económica");
            return;
        }
        if ($('#empleadoUDEA').val() === "true" && $('#tipoVinculacion').val() === '') {
            bootstrap_alert_hoja_vida.warning("Debe ingresar el tipo de vinculación con la U de A");
            return;
        }
        $('#md_guardar').modal('show');
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
                $('#md_guardar').modal('hide');
                if (response === "") {
                    $('#confirmacionAlmacenamientoHojaVida').modal('show');
                } else {
                    bootstrap_alert_hoja_vida.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_hoja_vida.warning("Error al almacenar la hoja de vida.");
                $('#md_guardar').modal('hide');
            }});
    });

    function verCopiaCedula() {
        window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaCedula/" + $('#idPersona').val();
    }

    function verCopiaRUT() {
        window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaRUT/" + $('#idPersona').val();
    }

    function verCopiaLibretaMilitar() {
        window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaLibretaMilitar/" + $('#idPersona').val();
    }

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

    bootstrap_alert_documento_soporte = function () { };
    bootstrap_alert_documento_soporte.warning = function (message) {
        $('#alert_documento_soporte').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_documento_soporte.removeWarning = function () {
        $('#alert_documento_soporte').html('');
    };

    bootstrap_alert_idioma = function () { };
    bootstrap_alert_idioma.warning = function (message) {
        $('#alert_idioma').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idioma.removeWarning = function () {
        $('#alert_idioma').html('');
    };

    bootstrap_alert_educacion_basica = function () { };
    bootstrap_alert_educacion_basica.warning = function (message) {
        $('#alert_educacion_basica').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_basica.removeWarning = function () {
        $('#alert_educacion_basica').html('');
    };

    bootstrap_alert_educacion_superior = function () { };
    bootstrap_alert_educacion_superior.warning = function (message) {
        $('#alert_educacion_superior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_superior.removeWarning = function () {
        $('#alert_educacion_superior').html('');
    };

    bootstrap_alert_educacion_continua = function () { };
    bootstrap_alert_educacion_continua.warning = function (message) {
        $('#alert_educacion_continua').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_continua.removeWarning = function () {
        $('#alert_educacion_continua').html('');
    };

    bootstrap_alert_distincion = function () { };
    bootstrap_alert_distincion.warning = function (message) {
        $('#alert_distincion').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_distincion.removeWarning = function () {
        $('#alert_distincion').html('');
    };
    
    bootstrap_alert_experiencia_laboral = function () { };
    bootstrap_alert_experiencia_laboral.warning = function (message) {
        $('#alert_experiencia_laboral').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencia_laboral.removeWarning = function () {
        $('#alert_experiencia_laboral').html('');
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
    for (var i = 0; i < documentosSoporte.length; i++) {
        var fileInput = $('<input type="file" class="form-control" name="documentosSoporte[' + i + '].documento" />');
        $('#documentosSoporte').append(fileInput);
        $('input:file[name="documentosSoporte[' + i + '].documento"]').hide();
    }
    </c:if>
    <c:if test = "${idiomasJSON != null}">
    idiomas = ${idiomasJSON};
    for (var i = 0; i < idiomas.length; i++) {
        var fileInput = $('<input type="file" class="form-control" name="idiomas[' + i + '].certificado" />');
        $('#certificadosIdioma').append(fileInput);
        $('input:file[name="idiomas[' + i + '].certificado"]').hide();
    }
    </c:if>
    <c:if test = "${educacionesBasicasJSON != null}">
    educacionesBasicas = ${educacionesBasicasJSON};
    for (var i = 0; i < educacionesBasicas.length; i++) {
        var fileInput = $('<input type="file" class="form-control" name="educacionesBasicas[' + i + '].certificado" />');
        $('#certificadosEducacionBasica').append(fileInput);
        $('input:file[name="educacionesBasicas[' + i + '].certificado"]').hide();
    }
    </c:if>
    <c:if test = "${educacionesSuperioresJSON != null}">
    educacionesSuperiores = ${educacionesSuperioresJSON};
    for (var i = 0; i < educacionesSuperiores.length; i++) {
        var fileInput = $('<input type="file" class="form-control" name="educacionesSuperiores[' + i + '].certificadoHomologado" />');
        $('#certificadosHomologadosEducacionSuperior').append(fileInput);
        $('input:file[name="educacionesSuperiores[' + i + '].certificadoHomologado"]').hide();

        fileInput = $('<input type="file" class="form-control" name="educacionesSuperiores[' + i + '].certificado" />');
        $('#certificadosEducacionSuperior').append(fileInput);
        $('input:file[name="educacionesSuperiores[' + i + '].certificado"]').hide();
    }
    </c:if>
    <c:if test = "${educacionesContinuasJSON != null}">
    educacionesContinuas = ${educacionesContinuasJSON};
    for (var i = 0; i < educacionesContinuas.length; i++) {
        fileInput = $('<input type="file" class="form-control" name="educacionesContinuas[' + i + '].certificado" />');
        $('#certificadosEducacionContinua').append(fileInput);
        $('input:file[name="educacionesContinuas[' + i + '].certificado"]').hide();
    }    
    </c:if>        
    <c:if test = "${distincionesJSON != null}">
    distinciones = ${distincionesJSON};
    for (var i = 0; i < distinciones.length; i++) {
        fileInput = $('<input type="file" class="form-control" name="distinciones[' + i + '].certificado" />');
        $('#certificadosDistincion').append(fileInput);
        $('input:file[name="distinciones[' + i + '].certificado"]').hide();
    }    
    </c:if>
    <c:if test = "${experienciasLaboralesJSON != null}">
    experienciasLaborales = ${experienciasLaboralesJSON};
    for (var i = 0; i < experienciasLaborales.length; i++) {
        fileInput = $('<input type="file" class="form-control" name="experienciasLaborales[' + i + '].certificado" />');
        $('#certificadosExperienciaLaboral').append(fileInput);
        $('input:file[name="experienciasLaborales[' + i + '].certificado"]').hide();
    }    
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
        experienciasLaborales);
    ko.applyBindings(hojaVidaModel);
</script>