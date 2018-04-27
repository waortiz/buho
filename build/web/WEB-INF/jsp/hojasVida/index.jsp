<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">         
    <div class="container">
        <div id="alert_placeholder_hoja_vida"></div>
        <legend>Consulta de hoja de vida</legend>
        <div class="table-responsive">
            <table class="table table-hover tableestilo" id="tbconhojavida">
                <thead>
                    <tr>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="cedinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="nomapeinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="fecnacinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="telinput"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>C&eacute;dula</th>
                        <th>Nombre y apellidos</th>
                        <th>Fecha de nacimiento</th>
                        <th>Telef&oacute;no</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hojaVida" items="${hojasVida}">   
                        <tr>
                            <td>${hojaVida.getNumeroIdentificacion()}</td>
                            <td>${hojaVida.getNombres()} ${hojaVida.getApellidos()}</td>               
                            <td>${hojaVida.getFechaNacimientoFormateada()}</td>
                            <td>${hojaVida.getTelefono()}</td>
                            <td style='white-space: nowrap'>
                                <button type="button" class="btn btn-success btn-sm" style="margin-right: 10px;" onclick="mostrarHojaVida(${hojaVida.getIdPersona()})">Ver</button>
                                <button type="button" class="btn btn-success btn-sm"  onclick="window.location.href = '${pageContext.request.contextPath}/hojasVida/editar/${hojaVida.getIdPersona()}'" style="margin-right: 5px;" >
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </button>
                                <button type='button'  id='btnborrar' class='btn btn-danger btn-sm' onclick="confirmarEliminacionHojaVida(${hojaVida.getIdPersona()})">
                                    <span id='btnbo' class='glyphicon glyphicon-remove'></span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" id="md_ver" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header mhsuccess"> 
                    <input type="hidden" id="idPersona" />
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-address-card-o" aria-hidden="true" style="margin-right: 5px;"></i>Informacion de Hoja de vida</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 form-group form-inline">
                            <button class="btn btn-success btn-sm" id="btnpersonal">Informaci&oacute;n personal</button>
                            <button class="btn btn-success btn-sm" id="btnacademico">Aspectos acad&eacute;micos</button>
                            <button id="btneducontinua" class="btn btn-success btn-sm">Educaci&oacute;n contin&uacute;a</button>
                            <button class="btn btn-success btn-sm" id="btnexperiencia">Experiencia laboral</button>
                            <button class="btn btn-success btn-sm" id="btndist">Distinci&oacute;n</button>
                            <button class="btn btn-success btn-sm" id="btnpubli">Publicaci&oacute;n</button>
                        </div>
                    </div>
                    <div id="formpersonal">                                 
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Tipo de identificaci&oacute;n</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="C&eacute;dula de ciudadania">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Identificaci&oacute;n</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="15123123">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Fecha de expedici&oacute;n</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="5/07/2017">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Lugar de expedici&oacute;n</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Medellín">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Nombre</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Daniel Esteban">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Apellido</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Monsalve Garcia">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Sexo</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Masculino">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Fecha de nacimiento</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="5/07/2017">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Lugar de nacimiento</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Medellín">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Nacionalidad</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="Colombiano">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Libreta Militar</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="5123125">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Distrito -- Clase</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="48 -- Segunda">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Dirección</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="calle 45 a 56 - 56">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Ciudad de residencia</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="itagüi">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Grupo &eacute;tnico</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="No">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Discapacidad</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="5/07/2017">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">RUT</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="si">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Actividad economica del RUT</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="ujde">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Disponibilidad para trabajar en otras regiones</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="no">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Disponibilidad para trabajar en Bogotá</label><br>
                                    <input type="text" style="border: 0px; text-align: right;"  value="no">
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">    
                                    <label>Perfil laboral y profesional</label>
                                    <textarea style="border: 0;width: 95%;" id="con_descripcion" >
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo           consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </textarea>   
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="">Telefono</label>
                                <div class="table-responsive"> <table class="table table-hover tableestilo" id="tbtel">
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
                                <label for="">Correo electr&oacute;nico</label>
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
                                <label for="">Cuentas bancarias</label>
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
                    </div>
                    <div id="formacademico" style="display: none;">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Estudios t&eacute;cnicos</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestecnico">
                                        <thead>
                                            <tr>
                                                <th>Tipo de estudio</th>
                                                <th>Area de estudio</th>
                                                <th>Instituci&oacute;n</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
                                                <th>Certificado</th>
                                                <th>Opciones</th>
                                            </tr> 
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Estudios tecnol&oacute;gicos</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestecnologico">
                                        <thead>
                                            <tr>
                                                <th>Tipo de estudio</th>
                                                <th>Area de estudio</th>
                                                <th>Institución</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
                                                <th>Certificado</th>
                                                <th>Opciones</th>
                                            </tr> 
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Estudios profesionales</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestecnologico">
                                        <thead>
                                            <tr>
                                                <th>Tipo de estudio</th>
                                                <th>Area de estudio</th>
                                                <th>Institución</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
                                                <th>Certificado</th>
                                                <th>Opciones</th>
                                            </tr> 
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for=" ">Estudios de posgrados</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestecnologico">
                                        <thead>
                                            <tr>
                                                <th>Tipo de estudio</th>
                                                <th>Area de estudio</th>
                                                <th>Institución</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
                                                <th>Certificado</th>
                                                <th>Opciones</th>
                                            </tr> 
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Otros estudios</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestecnologico">
                                        <thead>
                                            <tr>
                                                <th>Tipo de estudio</th>
                                                <th>Area de estudio</th>
                                                <th>Institución</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
                                                <th>Certificado</th>
                                                <th>Opciones</th>
                                            </tr> 
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="formeducontinua" style="display: none;">
                        <br>
                        <label>Agregar estudios capacitaci&oacute;n</label>
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbcapaci">
                                <thead>
                                    <tr>
                                        <th>Tipo de capacitaci&oacute;n</th>
                                        <th>Nombre de capacitaci&oacute;n</th>
                                        <th>Instituci&oacute;n</th>
                                        <th>N&uacute;mero de horas</th>
                                        <th>a&ntilde;o</th>
                                        <th>Certificado</th>
                                        <th>Opciones</th>
                                    </tr>    
                                </thead>    
                            </table>
                        </div>
                    </div>
                    <div id="formexperiencia" style="display: none;">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia docencia en salud</label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia docencia en otras &aacute;reas</label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia laboral en salud</label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia laboral en otras &aacute;reas </label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia en proyectos de investigaci&oacute;n</label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Experiencia en proyectos de extensi&oacute;n</label>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="tbexpdoc">
                                        <thead>
                                            <tr>
                                                <th>Tipo de contrato</th>
                                                <th>Nombre de empresa</th>
                                                <th>Dedicaci&oacute;n</th>
                                                <th>Cargo</th>
                                                <th>Cargo equivalente</th>
                                                <th>Fecha de retiro</th>
                                                <th>Certificado</th>
                                                <th>FNSP</th>
                                                <th>opciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="formdistin" style="display: none;">
                        <legend>Distinciones</legend>  
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbdistin">
                                <thead>
                                    <tr>

                                        <th>C&oacute;digo</th>
                                        <th>Persona</th>
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
                    <div id="formpublicacion" style="display: none;">
                        <legend>Publicaciones</legend>  
                        <div class="table-responsive">
                            <table class="table table-hover tableestilo" id="tbpublicacion">
                                <thead>
                                    <tr>                                
                                        <th>C&oacute;digo</th>
                                        <th>Persona</th>
                                        <th>URL</th>
                                        <th>Fecha de publicaci&oacute;n</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="email_persona">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div id="modalEliminacionHojaVida" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header mhsuccess" >
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Eliminar Hoja de Vida</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>¿Desea eliminar la hoja de vida?</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="eliminarHojaVida()">Aceptar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>  
<!--fin de modal editar-->
<!-- jQuery -->
<script type="text/javascript">

    $(document).ready(function () {

        var table = $('#tbconhojavida').DataTable({
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
        table.column().every(function ()
        {
            var that = this;
            $('#cedinput').on('keyup change', function ()
            {
                if (that.search() !== this.value)
                {
                    that
                            .search(this.value)
                            .draw();
                }
            });
        });
        $('#nomapeinput').on('keyup', function () {
            table
                    .columns(1)
                    .search(this.value)
                    .draw();
        });

        $('#fecnacinput').on('keyup', function () {
            table
                    .columns(2)
                    .search(this.value)
                    .draw();
        });
        $('#telinput').on('keyup', function () {
            table
                    .columns(3)
                    .search(this.value)
                    .draw();
        });
        $('#niedinput').on('keyup', function () {
            table
                    .columns(4)
                    .search(this.value)
                    .draw();
        });
        $('#expinput').on('keyup', function () {
            table
                    .columns(5)
                    .search(this.value)
                    .draw();
        });
        $('#disinput').on('keyup', function () {
            table
                    .columns(6)
                    .search(this.value)
                    .draw();
        });
        $('#pubinput').on('keyup', function () {
            table
                    .columns(7)
                    .search(this.value)
                    .draw();
        });

        $('#btnpersonal').click(function () {
            $('#formpersonal').css("display", "block");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formpublicacion').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btnacademico').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "block");
            $('#formexperiencia').css("display", "none");
            $('#formpublicacion').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btnexperiencia').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "block");
            $('#formpublicacion').css("display", "none");
            $('#formdistin').css("display", "none");
        });
        $('#btndist').click(function () {
            $('#formdistin').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formpublicacion').css("display", "none");

        });
        $('#btnpubli').click(function () {
            $('#formpublicacion').css("display", "block");
            $('#formdistin').css("display", "none");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
        });

        $('#btnpersonal2').click(function () {
            $('#formpersonal2').css("display", "block");
            $('#formacademico2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btnacademico2').click(function () {
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "block");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btnexperiencia2').click(function () {
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formexperiencia2').css("display", "block");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btndist2').click(function () {
            $('#formdistin2').css("display", "block");
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");

        });
        $('#btnpubli2').click(function () {
            $('#formpublicacion2').css("display", "block");
            $('#formdistin2').css("display", "none");
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
        });
    });

    function confirmarEliminacionHojaVida(idPersona) {
        $('#idPersona').val(idPersona);
        $('#modalEliminacionHojaVida').modal('show');
    }

    function mostrarHojaVida(idHojaVida) {
        $('#md_ver').modal('show');
    }

    function eliminarHojaVida() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/eliminar/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    var resultado = JSON.parse(response);
                    if (resultado.resultado) {
                        window.location.href = '${pageContext.request.contextPath}/hojasVida/index';
                    } else {
                        bootstrap_alert_hoja_vida.warning('No se pudo eliminar la hoja vida');
                    }
                    $('#modalEliminacionHojaVida').modal('hide');
                }
            }});
    }

    bootstrap_alert_hoja_vida = function () { };
    bootstrap_alert_hoja_vida.warning = function (message) {
        $('#alert_placeholder_hoja_vida').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.success = function (message) {
        $('#alert_placeholder_hoja_vida').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.removeWarning = function () {
        $('#alert_placeholder_hoja_vida').html('');
    };
</script>
