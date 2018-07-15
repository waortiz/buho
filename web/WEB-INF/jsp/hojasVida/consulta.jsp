<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">         
    <div class="container">
        <legend>Consulta de hoja de vida</legend>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Buscar Numero de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre para buscar las hojas de vida">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <select style="width: 75%;" id="cboNumeroIdentificacion" class="js-select-basic-single js-states form-control">
                        <option></option>
                        <c:forEach var="numeroDocumento" items="${numerosDocumento}">
                            <option value="${numeroDocumento.getId()}">${numeroDocumento.getNombre()}</option>
                        </c:forEach>                                                 
                    </select>
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarNumeroIdentificacion()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                    <button type="button" class="btn btn-success btn-sm" onclick="buscarHojasVida()"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Buscar nombres</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre para buscar las hojas de vida">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <select style="width: 75%;" id="cboNombres" class="js-select-basic-single js-states form-control">
                        <option></option>
                        <c:forEach var="nombre" items="${nombres}">
                            <option value="${nombre.getId()}">${nombre.getNombre()}</option>
                        </c:forEach>                                                 
                    </select>
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarNombres()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                    <button type="button" class="btn btn-success btn-sm" onclick="buscarHojasVida()"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Buscar apellidos</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre para buscar las hojas de vida">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <select style="width: 75%;" id="cboApellidos" class="js-select-basic-single js-states form-control">
                        <option></option>
                        <c:forEach var="apellido" items="${apellidos}">
                            <option value="${apellido.getId()}">${apellido.getNombre()}</option>
                        </c:forEach>                                                 
                    </select>
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarApellidos()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                    <button type="button" class="btn btn-success btn-sm" onclick="buscarHojasVida()"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-">
                <div class="table-responsive">
                    <div style="overflow-y: scroll">
                        <table class="table table-hover tableestilo" id="tblHojasVida">
                            <thead>
                                <tr>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="cedinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="tipidinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="fecexcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="lugexpinput"></td>
                                    <td></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="nomapeinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="sexinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="nacinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="fecnacinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="lugnacinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="libmilcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="disclinput"></td>
                                    <td></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="ciudrescinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="dirinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="etnicocinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="discapcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="rutcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="acrutinput"></td>
                                    <td></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="viajcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="egreinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="vinculadoudeainput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="tipvininput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="telinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="correocinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="niedinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="expinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="invcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="artinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="patcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="prodcinput"></td>
                                    <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="disinput"></td>
                                </tr>
                                <tr>
                                    <th>N&deg; de identificaci&oacute;n</th>
                                    <th>Tipo de identificaci&oacute;n</th>
                                    <th>Fecha de expedici&oacute;n</th>
                                    <th>Lugar de expedici&oacute;n</th>
                                    <th>Copia de identificaci&oacute;n</th>
                                    <th>Nombre y apellidos</th>
                                    <th>Sexo</th>
                                    <th>Nacionalidad</th>
                                    <th>Fecha de nacimiento</th>
                                    <th>Lugar de nacimiento</th>
                                    <th>N&deg; libreta militar</th>
                                    <th>Distrito-clase</th>
                                    <th>Copia Libreta militar</th>
                                    <th>Ciudad de residencia</th>
                                    <th>Direcci&oacute;n</th>
                                    <th>Grupo &eacute;nico</th>
                                    <th>Discapacidad</th>
                                    <th>RUT</th>
                                    <th>Actividad económica del RUT</th>
                                    <th>Documento de soporte RUT</th>
                                    <th>Tiene disponibilidad para trabajar por fuera de Medellín</th>
                                    <th>Egresado de la Universidad de Antioquia</th>
                                    <th>Empleado de la Universidad de Antioquia</th>
                                    <th>Tipo de vinculacion</th>
                                    <th>Telef&oacute;no</th>
                                    <th>Correo electr&oacute;nico</th>
                                    <th>Nivel educativo</th>
                                    <th>Experiencia</th>
                                    <th>Tipo de investigador</th>
                                    <th>Articulos</th>
                                    <th>Patente</th>
                                    <th>Producto de conocimiento</th>
                                    <th>Distincion</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div id="divDescargar" style="display: none;" align="center">
            <center><label>Descargar listado</label><button class="btn btn-success " id="btnDescargar" onclick="descargar()" style="margin-left: 10px"><i class="fa fa-download"></i></button></center>
        </div>        
    </div>
</div>  
<!--modal ver -->
<div class="modal fade" id="md_ver" role="dialog">
    <div class="modal-dialog modal-lg modal-reporPS2">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header mhsuccess"> 
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-address-card-o" aria-hidden="true" style="margin-right: 5px;"></i>Informacion de Hoja de vida</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-1" id="numside" style="width: 80px!important;">
                        <div class="sidebar-nav">
                            <div class="navbar" role="navigation">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                                    </button>
                                </div>
                                <div class="navbar-collapse collapse sidebar-navbar-collapse">
                                    <ul class="nav navbar-nav">
                                        <li class="active" id="btnpersonal" data-toggle="tooltip" data-placement="right" title="" data-original-title="Información personal"><a href="#"><i  class="fa fa-address-book" style="font-size:32px;"></i></a></li>
                                        <li id="btnpersopor" data-toggle="tooltip" data-placement="right" title="" data-original-title="Perfil"><a href="#"><i  class="fa fa-address-book-o" style="font-size:32px;"></i></a></li>
                                        <li id="btnacademico" data-toggle="tooltip" data-placement="right"  data-original-title="Aspectos Acádemicos"> <a href="#"><i  class="fa fa-mortar-board" style="font-size:32px;"></i></a></li>
                                        <li id="btneducontinua" data-toggle="tooltip" data-placement="right" title="" data-original-title="Educación no formal"><a href="#"><i  class="fa fa-address-card-o" style="font-size:32px;"></i></a></li>
                                        <li id="btnexperiencia" data-toggle="tooltip" data-placement="right" title="" data-original-title="Experiencia laboral"><a href="#"><i  class="fa fa-list" style="font-size:32px;"></i></a></li>
                                        <li id="btninvestigacion" data-toggle="tooltip" data-placement="right" title="" data-original-title="Investigación e Innovación"><a href="#"><i  class="fa fa-lightbulb-o" style="font-size:32px;"></i></a></li>
                                        <li id="btndist" data-toggle="tooltip" data-placement="right" title="" data-original-title="Distinciones"><a href="#"><i  class="fa fa-trophy" style="font-size:32px;"></i></a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-11">
                        <div class="form-group">
                            <ul class="nav nav-tabs">
                                <li class="active" id="liinfper"><a data-toggle="tab" href="#tabinfper" >
                                        <i  class="fa fa-address-book"></i>
                                        Informacion personal</a></li>
                                <li class="active" style="display: none"  id="liperfil"><a data-toggle="tab" href="#tabperfil" >
                                        <i  class="fa fa-address-book-o"></i>
                                        Perfil y soportes</a></li>
                                <li class="active" style="display: none"  id="liaspacad"><a data-toggle="tab" href="#tabaspacad" >
                                        <i  class="fa fa-mortar-board"></i>
                                        Aspectos acad&eacute;micos</a></li>
                                <li class="active" style="display: none"  id="liedunoform"><a data-toggle="tab" href="#tabedunoform" >
                                        <i  class="fa fa-address-card-o"></i> 
                                        Educación no formal</a></li>
                                <li class="active" style="display: none"  id="liexplab"><a data-toggle="tab" href="#tabexplab" >
                                        <i  class="fa fa-list"></i>
                                        Experiencia laboral</a></li>
                                <li class="active" style="display: none"  id="liinves"><a data-toggle="tab" href="#tabinves" >
                                        <i  class="fa fa-lightbulb-o"></i>
                                        Investigacion / innovaci&oacute;n</a></li>
                                <li class="active" style="display: none"  id="lidist"><a data-toggle="tab" href="#tabdist" >
                                        <i  class="fa fa-trophy"></i>
                                        Distinciones</a></li>
                            </ul>
                        </div>

                        <div id="formpersonal">                                 
                            <div class="row">
                                <div class="col-md-4" style="width: 350px;">
                                    <div class="form-group">
                                        <label for="">Tipo de identificaci&oacute;n</label>
                                        <input type="text" style="border: 0px; width: 150px;margin-left: 10px;" readonly  id="tipoIdentificacion">
                                    </div>
                                </div>
                                <div class="col-md-2" style="width:240px;">
                                    <div class="form-group form-inline">
                                        <label for="">Identificaci&oacute;n</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;" readonly  id="numeroIdentificacion">
                                        <input type="hidden" id="idPersona" name="idPersona" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Fecha de expedici&oacute;n</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  readonly id="fechaExpedicion">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Lugar de expedici&oacute;n</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  readonly id="lugarExpedicion">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Nombre</label>
                                        <input type="text" style="border: 0px;margin-left: 10px;" readonly id="nombres">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Apellido</label>
                                        <input type="text" style="border: 0px;margin-left: 10px;" readonly id="apellidos">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="">Sexo</label>
                                        <input type="text" style="border: 0px;margin-left: 10px;width: 100px" readonly id="sexo">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Pais/Nacionalidad</label>
                                        <input type="text" style="border: 0px;margin-left: 10px;"  id="nacionalidad" readonly>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Fecha de nacimiento</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  id="fechaNacimiento" readonly>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Lugar de nacimiento</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  id="lugarNacimiento" readonly>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Libreta Militar</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  id="libretaMilitar" readonly>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Distrito -- Clase</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  id="distritoClase" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Ciudad de residencia</label>
                                        <input type="text" style="border: 0px; width: 100px;margin-left: 10px;"  id="ciudadResidencia" readonly>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="">Dirección</label>
                                        <input type="text" style="border: 0px;margin-left: 10px; " id="direccion" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Grupo &eacute;tnico</label>
                                        <input type="text" style="border: 0px; margin-left: 10px;" id="grupoEtnico" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">RUT</label>
                                        <input type="text" style="border: 0px; width: 30px;margin-left: 10px;"  id="disponeRUT" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Actividad economica principal registrada en el RUT</label>
                                        <input type="text" style="border: 0px; margin-left: 10px;width: 400px;"  id="actividadEconomica" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 ">
                                    <div class="form-group">
                                        <label for="">Tiene disponibilidad para trabajar por fuera de Medellín?</label>
                                        <input type="text" style="border: 0px; width: 30px;margin-left: 10px;" id="disponibilidadViajar" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="">Discapacidad</label>
                                        <input type="text" style="border: 0px; margin-left: 10px;" id="discapacidad" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Egresado de la Universidad de Antioquia</label>
                                        <input type="text" style="border: 0px; width: 30px;margin-left: 10px;" id="egresadoUDEA" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <label>Empleado de la Universidad de Antioquia</label>
                                    <input type="text" style="border: 0px;margin-left: 10px; width: 30px;" id="empleadoUDEA" readonly>
                                </div>
                                <div class="col-md-7">
                                    <div class="form-group">
                                        <label>Tipo de vinculaci&oacute;n</label>
                                        <input type="text" style="border: 0px;margin-left: 10px;" id="tipoVinculacion" readonly> 
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Telefono</label>
                                    <div class="table-responsive">
                                        <div style="overflow-y: scroll;max-height: 150px;">
                                            <table class="table table-hover tableestilo">
                                                <thead>
                                                    <th>Tipo</th>
                                                    <th>N&uacute;mero</th>
                                                </thead>
                                                <tbody data-bind="foreach: { data: telefonos }">
                                                    <tr class="table-row">
                                                        <td style="width: 50%">
                                                            <span data-bind="text: nombreTipo" ></span>
                                                        </td>
                                                        <td style="width: 50%">
                                                            <span data-bind="text: numero" ></span>
                                                        </td>
                                                    </tr>
                                                </tbody>                                                                             
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Correo electr&oacute;nico</label>
                                    <div class="table-responsive">
                                        <div style="overflow-y: scroll;max-height: 150px;">
                                            <table class="table table-hover tableestilo">
                                                <thead>
                                                    <th>Email</th>
                                                </thead>
                                                <tbody data-bind="foreach: { data: correosElectronicos }">
                                                    <tr class="table-row">
                                                        <td>
                                                            <span data-bind="text: correoElectronico" ></span>
                                                        </td>
                                                    </tr>
                                                </tbody>                                      
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="formperfilsopor" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">    
                                        <label>Perfil laboral y profesional</label>
                                        <textarea style="border: 0;width: 95%;" id="perfil">
                                        </textarea>   
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <label>Documentos de soporte(Foto,certificados bancarios, EPS, ARL, AFP entre otros)</label>
                                    <div class="table-responsive">
                                        <div style="overflow-y: scroll;max-height: 200px;">
                                            <table class="table table-hover tableestilo" id="tbdocad">
                                                <thead>
                                                    <th>Tipo de documento</th>
                                                    <th >Documento de soporte</th>
                                                    <th></th>
                                                </thead>
                                                <tbody data-bind="foreach: { data: documentosSoporte }">
                                                    <tr class="table-row">
                                                        <td style="width: 40%">
                                                            <span data-bind="text: nombreTipoDocumento" ></span>
                                                        </td>
                                                        <td style="width: 50%" align="center">
                                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>                                           
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="formacademico" style="display: none;"> 
                            <div class="row">

                                <div class="col-md-12">
                                    <label>Estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                                    <div class="table-responsive">
                                        <div style="overflow-y: scroll;max-height: 100px">
                                            <table class="table table-hover tableestilo" id="tbestedbas">
                                                <thead>
                                                    <tr>
                                                        <th>Nivel de estudio</th>
                                                        <th>Instituci&oacute;n</th>
                                                        <th>T&iacute;tulo</th>
                                                        <th>A&ntilde;o de t&iacute;tulo</th>
                                                        <th>Certificado</th>
                                                    </tr> 
                                                </thead>
                                                <tbody data-bind="foreach: { data: educacionesBasicas }">
                                                    <tr class="table-row">
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombreNivel" ></span>
                                                        </td>
                                                        <td style="width: 30%">
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
                                                        </td>
                                                    </tr>
                                                </tbody>                           
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Estudios educaci&oacute;n superior</label>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbestedsup">
                                                <thead>
                                                    <tr>
                                                        <th>Nivel de estudio</th>
                                                        <th>Instituci&oacute;n</th>
                                                        <th>Programa cursado</th>
                                                        <th>Fecha de título</th>
                                                        <th class="cer" align="center">Certificado homologación</th>
                                                        <th class="cer" align="center">Certificado</th>
                                                    </tr> 
                                                </thead>
                                                <tbody data-bind="foreach: { data: educacionesSuperiores }">
                                                    <tr class="table-row">
                                                        <td style="width: 10%">
                                                            <span data-bind="text: nombreNivel" ></span>
                                                        </td>
                                                        <td style="width: 30%">
                                                            <span data-bind="text: nombreInstitucion" ></span>
                                                        </td>
                                                        <td style="width: 30%">
                                                            <span data-bind="text: nombrePrograma" ></span>
                                                        </td>
                                                        <td style="width: 10%">
                                                            <span data-bind="text: fechaTitulo" ></span>
                                                        </td>
                                                        <td style="width: 10%" align="center">
                                                            <a href='#' title='Ver certificado homologado' data-bind="click: $root.verCertificadoHomologadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                        <td style="width: 10%" align="center">
                                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>                           
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Estudios idiomas</label>
                                    <div class="table-responsive">
                                        <div style="overflow-y: scroll;max-height: 100px">
                                            <table class="table table-hover tableestilo" id="tbestid">
                                                <thead>
                                                    <tr>
                                                        <th>Idioma</th>
                                                        <th>Lectura</th>
                                                        <th>Escucha</th>
                                                        <th>Escritura</th>
                                                        <th>Habla</th>
                                                        <th>Certificado</th>
                                                    </tr> 
                                                </thead>
                                                <tbody data-bind="foreach: { data: idiomas }">
                                                    <tr class="table-row">
                                                        <td style="width: 25%">
                                                            <span data-bind="text: nombreIdioma" ></span>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <span data-bind="text: nombreNivelLectura" ></span>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <span data-bind="text: nombreNivelEscucha" ></span>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <span data-bind="text: nombreNivelEscritura" ></span>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <span data-bind="text: nombreNivelConversacion" ></span>
                                                        </td>
                                                        <td style="width: 15%" align="center">
                                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoIdioma" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>                                   
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="formeducontinua" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Estudios educaci&oacute;n no formal</label>           
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbcapaci">
                                                <thead>
                                                    <tr>
                                                        <th>Tipo de capacitaci&oacute;n</th>
                                                        <th>Nombre de capacitaci&oacute;n</th>
                                                        <th>Instituci&oacute;n</th>
                                                        <th>N&uacute;mero de horas</th>
                                                        <th>Certificado</th>
                                                    </tr> 
                                                </thead>
                                                <tbody data-bind="foreach: { data: educacionesContinuas }">
                                                    <tr class="table-row">
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombreTipoCapacitacion" ></span>
                                                        </td>
                                                        <td style="width: 30%">
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
                                                        </td>
                                                    </tr>
                                                </tbody>                           
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="formexperiencia" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Experiencia laboral</label>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbexplab">
                                                <thead>
                                                    <tr>
                                                        <th>&Aacute;rea</th>
                                                        <th>Empresa/Instituci&oacute;n</th>
                                                        <th>Cargo</th>
                                                        <th>Certificado</th>
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
                                                        <td style="width: 30%">
                                                            <span data-bind="text: cargo" ></span>
                                                        </td>
                                                        <td style="width: 10%" align="center">
                                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoExperienciaLaboral" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>                          
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Experiencia docencia</label>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover" id="tbexpdoc">
                                                <thead>
                                                    <tr>
                                                        <th>Instituci&oacute;n</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: { data: experienciasDocencia }">
                                                    <tr class="table-row">
                                                        <td>
                                                            <span data-bind="text: nombreInstitucion" ></span>
                                                        </td>
                                                    </tr>
                                                </tbody>                          
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="forminves" style="display: none;">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Investigador reconocido por Colciencias</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="investigadorReconocidoColciencias" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Currículum vitae de latinoamerica y el caribe (CVLAC)</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="urlCVLAC" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Tipo de investigador</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="tipoInvestigador" readonly>
                                    </div>
                                </div>  
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Código ORCID</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="codigoORCID" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Identificador Scopus</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="identificadorScopus" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Researcher Id</label>
                                        <input type="text" style="border: 0px; width: 100%;" id="researcherId" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <legend style="margin-bottom: -10px;">Articulos y publicaciones relevantes</legend>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbearticulo">
                                                <thead>
                                                    <tr>
                                                        <th>T&iacute;tulo</th>
                                                        <th>Revista</th>
                                                        <th>Enlace</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: { data: articulos }">
                                                    <tr class="table-row">
                                                        <td style="width: 20%">
                                                            <span data-bind="text: nombre" ></span>
                                                        </td>
                                                        <td style="width: 30%">
                                                            <span data-bind="text: nombreRevista" ></span>
                                                        </td>
                                                        <td style="width: 50%">
                                                            <span data-bind="text: url" ></span>
                                                        </td>
                                                    </tr>
                                                </tbody>                                     
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <legend style="margin-bottom: -10px;">Patentes</legend>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table tabla table-hover tableestilo" id="tbpatente">
                                                <thead>
                                                    <tr>
                                                        <th>Fecha</th>
                                                        <th>Tipo</th>
                                                        <th>Propiedad compartida</th>
                                                        <th>Descripci&oacute;n</th>
                                                        <th>Documento</th>
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
                                                       <td style="width: 45%">
                                                           <span data-bind="text: descripcion" ></span>
                                                       </td>
                                                       <td style="width: 10%" align="center">
                                                           <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoPatente" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                       </td>
                                                   </tr>
                                               </tbody>                                     
                                         </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <legend style="margin-bottom: -10px;">Productos de conocimiento</legend>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbearticulo">
                                                <thead>
                                                    <tr>
                                                        <th>Tipo</th>
                                                        <th>Cita</th>
                                                        <th>Descripci&oacute;n</th>
                                                        <th class="cer">Documento</th>
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
                                                        <td style="width: 30%">
                                                            <span data-bind="text: descripcion" ></span>
                                                        </td>
                                                        <td style="width: 10%" align="center">
                                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoProductoConocimiento" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>                                     
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="formdistin" style="display: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label> Distinciones, premios y reconocimientos</label>
                                    <div class="table-responsive">
                                        <div id="addscrolly">
                                            <table class="table table-hover tableestilo" id="tbdistin" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th>Instituci&oacute;n otorga</th>
                                                        <th>Descripci&oacute;n</th>
                                                        <th>Fecha de distinci&oacute;n</th>
                                                        <th>Certificado</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: { data: distinciones }">
                                                    <tr class="table-row">
                                                        <td style="width: 25%">
                                                            <span data-bind="text: institucionOtorga" ></span>
                                                        </td>
                                                        <td style="width: 35%">
                                                            <span data-bind="text: descripcion" ></span>
                                                        </td>
                                                        <td style="width: 20%">
                                                            <span data-bind="text: fechaDistincion" ></span>
                                                        </td>
                                                        <td style="width: 20%" align="center">
                                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoDistincion" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
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
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>
                <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
        </div>
    </div>
</div>
<div id="md_resultados" class="modal fade" role="dialog" disabled>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header mhsuccess">
                    <h4>Por favor espere. Consultando resultados...</h4>
                </div>
                <div class="modal-body">
                    <div class="barprogress">
                        <div class="progress" >
                            <div  class="progress-bar progress-bar-success progress-bar-striped active dynamic" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"><span id="current-progress"></span>

                            </div>
                        </div><span>Consultando resultados...</span>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
</div>            
<div id="md_descargar_resultados" class="modal fade" role="dialog" disabled>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header mhsuccess">
                <h4>Por favor espere. Descargando resultados...</h4>
            </div>
            <div class="modal-body">
                <div class="barprogress">
                    <div class="progress" >
                        <div  class="progress-bar progress-bar-success progress-bar-striped active dynamic2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"><span id="current-progress"></span>

                        </div>
                    </div><span>Descargando resultados...</span>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>            
            
<script>
    var contextPath = "${pageContext.request.contextPath}";
    
    function limpiarNumeroIdentificacion() {
       $('#cboNumeroIdentificacion').val("").trigger('change');
    }

    function limpiarNombres() {
       $('#cboNombres').val("").trigger('change');
    }

    function limpiarApellidos() {
       $('#cboApellidos').val("").trigger('change');
    }

    $(document).ready(function () {
        $('.navbar-nav li').tooltip();
        tblHojasVida = $('#tblHojasVida').DataTable({
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
        tblHojasVida.column().every(function ()
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
        $('#tipidinput').on('keyup', function () {
            tblHojasVida
                    .columns(1)
                    .search(this.value)
                    .draw();
        });
        $('#fecexcinput').on('keyup', function () {
            tblHojasVida
                    .columns(2)
                    .search(this.value)
                    .draw();
        });
        $('#lugexpinput').on('keyup', function () {
            tblHojasVida
                    .columns(3)
                    .search(this.value)
                    .draw();
        });
        $('#nomapeinput').on('keyup', function () {
            tblHojasVida
                    .columns(5)
                    .search(this.value)
                    .draw();
        });
        $('#sexinput').on('keyup', function () {
            tblHojasVida
                    .columns(6)
                    .search(this.value)
                    .draw();
        });

        $('#nacinput').on('keyup', function () {
            tblHojasVida
                    .columns(7)
                    .search(this.value)
                    .draw();
        });
        $('#fecnacinput').on('keyup', function () {
            tblHojasVida
                    .columns(8)
                    .search(this.value)
                    .draw();
        });
        $('#lugnacinput').on('keyup', function () {
            tblHojasVida
                    .columns(9)
                    .search(this.value)
                    .draw();
        });
        $('#libmilcinput').on('keyup', function () {
            tblHojasVida
                    .columns(10)
                    .search(this.value)
                    .draw();
        });
        $('#disclinput').on('keyup', function () {
            tblHojasVida
                    .columns(11)
                    .search(this.value)
                    .draw();
        });
        $('#ciudrescinput').on('keyup', function () {
            tblHojasVida
                    .columns(13)
                    .search(this.value)
                    .draw();
        });
        $('#dirinput').on('keyup', function () {
            tblHojasVida
                    .columns(14)
                    .search(this.value)
                    .draw();
        });
        $('#etnicocinput').on('keyup', function () {
            tblHojasVida
                    .columns(15)
                    .search(this.value)
                    .draw();
        });
        $('#discapcinput').on('keyup', function () {
            tblHojasVida
                    .columns(16)
                    .search(this.value)
                    .draw();
        });
        $('#rutcinput').on('keyup', function () {
            tblHojasVida
                    .columns(17)
                    .search(this.value)
                    .draw();
        });
        $('#rutcinput').on('keyup', function () {
            tblHojasVida
                    .columns(17)
                    .search(this.value)
                    .draw();
        });
        $('#acrutinput').on('keyup', function () {
            tblHojasVida
                    .columns(18)
                    .search(this.value)
                    .draw();
        });
        $('#viajcinput').on('keyup', function () {
            tblHojasVida
                    .columns(20)
                    .search(this.value)
                    .draw();
        });
        $('#egreinput').on('keyup', function () {
            tblHojasVida
                    .columns(21)
                    .search(this.value)
                    .draw();
        });
        $('#vinculadoudeainput').on('keyup', function () {
            tblHojasVida
                    .columns(22)
                    .search(this.value)
                    .draw();
        });
        $('#tipvininput').on('keyup', function () {
            tblHojasVida
                    .columns(23)
                    .search(this.value)
                    .draw();
        });
        $('#telinput').on('keyup', function () {
            tblHojasVida
                    .columns(24)
                    .search(this.value)
                    .draw();
        });
        $('#correocinput').on('keyup', function () {
            tblHojasVida
                    .columns(25)
                    .search(this.value)
                    .draw();
        });
        $('#niedinput').on('keyup', function () {
            tblHojasVida
                    .columns(26)
                    .search(this.value)
                    .draw();
        });
        $('#expinput').on('keyup', function () {
            tblHojasVida
                    .columns(27)
                    .search(this.value)
                    .draw();
        });
        $('#invcinput').on('keyup', function () {
            tblHojasVida
                    .columns(28)
                    .search(this.value)
                    .draw();
        });
        $('#artinput').on('keyup', function () {
            tblHojasVida
                    .columns(29)
                    .search(this.value)
                    .draw();
        });
        $('#patcinput').on('keyup', function () {
            tblHojasVida
                    .columns(30)
                    .search(this.value)
                    .draw();
        });
        $('#prodcinput').on('keyup', function () {
            tblHojasVida
                    .columns(31)
                    .search(this.value)
                    .draw();
        });
        $('#disinput').on('keyup', function () {
            tblHojasVida
                    .columns(32)
                    .search(this.value)
                    .draw();
        });
        $('#btnpersonal').click(function () {
            $('#formpersonal').css("display", "block");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'block');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'none');
        });
        $('#btnpersopor').click(function () {
            $('#formperfilsopor').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'block');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'none');
        });
        $('#btnacademico').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "block");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'block');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'none');
        });
        $('#btneducontinua').click(function () {
            $('#formeducontinua').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'block');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'none');
        });
        $('#btnexperiencia').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "block");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'block');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'none');
        });
        $('#btninvestigacion').click(function () {
            $('#forminves').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'block');
            $('#lidist ').css('display', 'none');
        });
        $('#btndist').click(function () {
            $('#formdistin').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#liinfper').css('display', 'none');
            $('#liperfil').css('display', 'none');
            $('#liaspacad').css('display', 'none');
            $('#liedunoform').css('display', 'none');
            $('#liexplab').css('display', 'none');
            $('#liinves').css('display', 'none');
            $('#lidist ').css('display', 'block');
        });

        $('#btnpersonal2').click(function () {
            $('#formpersonal2').css("display", "block");
            $('#formacademico2').css("display", "none");
            $('#formeducontinua2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btnacademico2').click(function () {
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "block");
            $('#formeducontinua2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btneducontinua2').click(function () {
            $('#formeducontinua2').css("display", "block");
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btnexperiencia2').click(function () {
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formeducontinua2').css("display", "none");
            $('#formexperiencia2').css("display", "block");
            $('#formpublicacion2').css("display", "none");
            $('#formdistin2').css("display", "none");
        });
        $('#btndist2').click(function () {
            $('#formdistin2').css("display", "block");
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formeducontinua2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
            $('#formpublicacion2').css("display", "none");

        });
        $('#btnpubli2').click(function () {
            $('#formpublicacion2').css("display", "block");
            $('#formdistin2').css("display", "none");
            $('#formpersonal2').css("display", "none");
            $('#formacademico2').css("display", "none");
            $('#formeducontinua2').css("display", "none");
            $('#formexperiencia2').css("display", "none");
        });
    });
    
    function buscarHojasVida() {
        $('#divDescargar').hide();
        if($('#cboNumeroIdentificacion').val() == "" && $('#cboNombres').val() == "" && $('#cboApellidos').val() == "") {
            tblHojasVida.clear().draw();
            return;
        }
        $('#md_resultados').modal({backdrop: 'static', keyboard: false});
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
                $('#md_resultados').modal('hide');
            }
        }, 2000);
        
        var formData = new FormData();
        formData.append("idPersona", $('#cboNumeroIdentificacion').val());
        formData.append("nombres", $('#cboNombres option:selected').text());
        formData.append("apellidos", $('#cboApellidos option:selected').text());
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/consultarHojasVida",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                tblHojasVida.clear().draw();
                $('#md_resultados').modal('hide');
                if (response !== "") {
                    var hojasVida = JSON.parse(response);
                    if (hojasVida.length > 0) {
                        $('#divDescargar').show();
                    }                    
                    for (var i = 0; i < hojasVida.length; i++) {
                        tblHojasVida.row.add([
                            hojasVida[i].numeroIdentificacion,
                            hojasVida[i].tipoIdentificacion,
                            getValue(hojasVida[i].fechaExpedicion),
                            getValue(hojasVida[i].lugarExpedicion),
                            '<td style="text-align: center"><a href="#" title="Ver documento" onclick=\'verCopiaCedula(' + hojasVida[i].idPersona + ')\' class="btn btn-success btn-xs" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a></td>',
                            hojasVida[i].nombres + " " + hojasVida[i].apellidos,
                            getValue(hojasVida[i].sexo),
                            getValue(hojasVida[i].nacionalidad),
                            getValue(hojasVida[i].fechaNacimiento),
                            getValue(hojasVida[i].lugarNacimiento),
                            getValue(hojasVida[i].libretaMilitar),
                            getValue(hojasVida[i].distritoClase),
                            '<td style="text-align: center"><a href="#" title="Ver documento" onclick=\'verCopiaLibretaMilitar(' + hojasVida[i].idPersona + ')\' class="btn btn-success btn-xs" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a></td>',
                            getValue(hojasVida[i].ciudadResidencia),
                            getValue(hojasVida[i].direccion),
                            getValue(hojasVida[i].grupoEtnico),
                            getValue(hojasVida[i].discapacidad),
                            getValue(hojasVida[i].disponeRUT),
                            getValue(hojasVida[i].actividadEconomica),
                            '<td style="text-align: center"><a href="#" title="Ver documento" onclick=\'verCopiaRUT(' + hojasVida[i].idPersona + ')\' class="btn btn-success btn-xs" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a></td>',
                            getValue(hojasVida[i].disponibilidadViajar),
                            getValue(hojasVida[i].egresadoUDEA),
                            getValue(hojasVida[i].empleadoUDEA),
                            getValue(hojasVida[i].tipoVinculacion),
                            getValue(hojasVida[i].telefono),
                            getValue(hojasVida[i].correoElectronico),
                            getValue(hojasVida[i].nivelEducativo),
                            getValue(hojasVida[i].experiencia),
                            getValue(hojasVida[i].tipoInvestigador),
                            getValue(hojasVida[i].articulo),
                            getValue(hojasVida[i].patente),
                            getValue(hojasVida[i].productoConocimiento),
                            getValue(hojasVida[i].distincion),
                            '<td style="white-space: nowrap"><button type="button" class="btn btn-success btn-sm" style="margin-right: 10px;" onclick="verHojaVida( ' + hojasVida[i].idPersona + ')">Ver</button></td>'
                        ]).draw(false); 
                    }
                }
            }});
    }
    
    function descargar() {
        $('#md_descargar_resultados').modal({backdrop: 'static', keyboard: false});
        current_progress = 0;
        var interval = setInterval(function () {
            current_progress += 10;
            $(".dynamic2")
                    .css("width", current_progress + "%")
                    .attr("aria-valuenow", current_progress)
                    .text(current_progress + "% Completado");
            if (current_progress >= 100) {
                clearInterval(interval);
            }
            if (current_progress === 100) {
                $('#md_descargar_resultados').modal('hide');
            }
        }, 3000);
    
        $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/descargarHojasVida?idPersona=" + $('#cboNumeroIdentificacion').val() + "&nombres=" + $('#cboNombres option:selected').text() + "&apellidos=" + $('#cboApellidos option:selected').text(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/descargarHojasVida?idPersona=" + $('#cboNumeroIdentificacion').val() + "&nombres=" + $('#cboNombres option:selected').text() + "&apellidos=" + $('#cboApellidos option:selected').text();
                    }
                    $('#md_descargar_resultados').modal('hide');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $('#md_descargar_resultados').modal('hide');
                }
            });
    }
    
    function verCopiaCedula(idPersona) {
        if(idPersona === undefined) {
          idPersona = $('#idPersona').val();
        }    
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaCedula/" + idPersona,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaCedula/" + idPersona;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }
    
    function verCopiaLibretaMilitar(idPersona) {
        if(idPersona === undefined) {
          idPersona = $('#idPersona').val();
        }    
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaLibretaMilitar/" + idPersona,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaLibretaMilitar/" + idPersona;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verCopiaRUT(idPersona) {
        if(idPersona === undefined) {
          idPersona = $('#idPersona').val();
        }    
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaRUT/" + idPersona,
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaRUT/" + idPersona;
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verHojaVida(idPersona) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/datos/" + idPersona,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response !== "") {
                        var hojaVida = JSON.parse(response);
                        $("#numeroIdentificacion").val(hojaVida.numeroIdentificacion);
                        $("#idPersona").val(hojaVida.idPersona);
                        $("#tipoIdentificacion").val(hojaVida.nombreTipoIdentificacion);
                        $("#nombres").val(hojaVida.nombres);
                        $("#apellidos").val(hojaVida.apellidos);
                        $("#sexo").val(hojaVida.nombreSexo);
                        $("#fechaExpedicion").val(hojaVida.fechaExpedicionFormateada);
                        $("#fechaNacimiento").val(hojaVida.fechaNacimientoFormateada);
                        $("#lugarNacimiento").val(hojaVida.nombreLugarNacimiento);
                        $("#nacionalidad").val(hojaVida.nombreNacionalidad);
                        $("#libretaMilitar").val(hojaVida.libretaMilitar);
                        $("#distritoClase").val(hojaVida.distritoClase);
                        $("#ciudadResidencia").val(hojaVida.nombreCiudadResidencia);
                        $("#direccion").val(hojaVida.direccion);
                        $("#grupoEtnico").val(hojaVida.nombreGrupoEtnico);
                        $("#discapacidad").val(hojaVida.nombreDiscapacidad);
                        if (hojaVida.disponeRUT) {
                            $("#disponeRUT").val("Si");
                        } else {
                            $("#disponeRUT").val("No");
                        }
                        $("#actividadEconomica").val(hojaVida.nombreActividadEconomica);
                        if (hojaVida.disponibilidadViajar) {
                            $("#disponibilidadViajar").val("Si");
                        } else {
                            $("#disponibilidadViajar").val("No");
                        }
                        if (hojaVida.egresadoUDEA) {
                            $("#egresadoUDEA").val("Si");
                        } else {
                            $("#egresadoUDEA").val("No");
                        }
                        if (hojaVida.empleadoUDEA) {
                            $("#empleadoUDEA").val("Si");
                        } else {
                            $("#empleadoUDEA").val("No");
                        }
                        $("#tipoVinculacion").val(hojaVida.nombreTipoVinculacion);
                        $("#lugarExpedicion").val(hojaVida.nombreLugarExpedicion);
                        $("#perfil").val(hojaVida.perfil);
                        if (hojaVida.investigadorReconocidoColciencias) {
                            $("#investigadorReconocidoColciencias").val("Si");
                        } else {
                            $("#investigadorReconocidoColciencias").val("No");
                        }
                        $("#urlCVLAC").val(hojaVida.urlCVLAC);
                        $("#codigoORCID").val(hojaVida.codigoORCID);
                        $("#identificadorScopus").val(hojaVida.identificadorScopus);
                        $("#researcherId").val(hojaVida.researcherId);
                        $("#identificadorScopus").val(hojaVida.identificadorScopus);
                        cargarDocumentosSoporte(hojaVida.documentosSoporte);
                        cargarTelefonos(hojaVida.telefonos);
                        cargarCuentasBancarias(hojaVida.cuentasBancarias);
                        cargarCorreosElectronicos(hojaVida.correosElectronicos);
                        cargarExperienciasLaborales(hojaVida.experienciasLaborales);
                        cargarExperienciasDocencia(hojaVida.experienciasDocencia);
                        cargarEducacionesBasicas(hojaVida.educacionesBasicas);
                        cargarEducacionesContinuas(hojaVida.educacionesContinuas);
                        cargarEducacionesSuperiores(hojaVida.educacionesSuperiores);
                        cargarIdiomas(hojaVida.idiomas);
                        cargarDistinciones(hojaVida.distinciones);
                        cargarInvestigaciones(hojaVida.investigaciones);
                        cargarArticulos(hojaVida.articulos);
                        cargarPatentes(hojaVida.patentes);
                        cargarProductosConocimiento(hojaVida.productosConocimiento);
                        $('#md_ver').modal({backdrop: 'static', keyboard: false});
                    }
                }});
        }

        var DatosModel = function (
                correosElectronicos,
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
                productosConocimiento,
                investigaciones) {
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
            self.articulos = ko.observableArray(articulos);
            self.patentes = ko.observableArray(patentes);
            self.productosConocimiento = ko.observableArray(productosConocimiento);
            self.investigaciones = ko.observableArray(investigaciones);
            self.verDocumentoSoporte = function (documentoSoporte) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/documentoSoporte/" + documentoSoporte.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/documentoSoporte/" + documentoSoporte.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoIdioma = function (idioma) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoIdioma/" + idioma.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoIdioma/" + idioma.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoEducacionBasica = function (educacionBasica) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoEducacionBasica/" + educacionBasica.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoEducacionBasica/" + educacionBasica.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoEducacionSuperior = function (educacionSuperior) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoEducacionContinua = function (educacionContinua) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoEducacionContinua/" + educacionContinua.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoEducacionContinua/" + educacionContinua.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoDistincion = function (distincion) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoDistincion/" + distincion.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoDistincion/" + distincion.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoExperienciaLaboral = function (experienciaLaboral) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verCertificadoCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verDocumentoPatente = function (patente) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/documentoPatente/" + patente.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/documentoPatente/" + patente.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };

            self.verDocumentoProductoConocimiento = function (productoConocimiento) {
                $.ajax({
                    type: "GET",
                    url: contextPath + "/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id(),
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                            window.location.href = contextPath + "/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id();
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {

                    }
                });
            };
        };

        function cargarDocumentosSoporte(documentosSoporte) {
            datosModel.documentosSoporte.removeAll();
            for (var i = 0; i < documentosSoporte.length; i++) {
                datosModel.documentosSoporte.push(
                        {
                            id: ko.observable(documentosSoporte[i].id),
                            tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                            nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                            validado: ko.observable(documentosSoporte[i].validado),
                            nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
                        }
                );
            }
        }

        function cargarTelefonos(telefonos) {
            datosModel.telefonos.removeAll();
            for (var i = 0; i < telefonos.length; i++) {
                datosModel.telefonos.push(
                        {
                            id: ko.observable(telefonos[i].id),
                            tipo: ko.observable(telefonos[i].tipo),
                            nombreTipo: ko.observable(telefonos[i].nombreTipo),
                            numero: ko.observable(telefonos[i].numero)
                        }
                );
            }
        }

        function cargarCuentasBancarias(cuentasBancarias) {
            datosModel.cuentasBancarias.removeAll();
            for (var i = 0; i < cuentasBancarias.length; i++) {
                datosModel.cuentasBancarias.push(
                        {
                            id: ko.observable(cuentasBancarias[i].id),
                            tipo: ko.observable(cuentasBancarias[i].tipo),
                            nombreTipo: ko.observable(cuentasBancarias[i].nombreTipo),
                            numero: ko.observable(cuentasBancarias[i].numero),
                            entidad: ko.observable(cuentasBancarias[i].entidad)
                        }
                );
            }
        }

        function cargarCorreosElectronicos(correosElectronicos) {
            datosModel.correosElectronicos.removeAll();
            for (var i = 0; i < correosElectronicos.length; i++) {
                datosModel.correosElectronicos.push(
                        {
                            id: ko.observable(correosElectronicos[i].id),
                            consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                            correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
                        }
                );
            }
        }

        function cargarExperienciasLaborales(experienciasLaborales) {
            datosModel.experienciasLaborales.removeAll();
            for (var i = 0; i < experienciasLaborales.length; i++) {
                datosModel.experienciasLaborales.push(
                        {
                            id: ko.observable(experienciasLaborales[i].id),
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
                            extension: ko.observable(experienciasLaborales[i].extension),
                            nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
                        }
                );
            }
        }

        function cargarExperienciasDocencia(experienciasDocencia) {
            datosModel.experienciasDocencia.removeAll();
            for (var i = 0; i < experienciasDocencia.length; i++) {
                datosModel.experienciasDocencia.push(
                        {
                            id: ko.observable(experienciasDocencia[i].id),
                            nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion)
                        }
                );
            }
        }

        function cargarEducacionesBasicas(educacionesBasicas) {
            datosModel.educacionesBasicas.removeAll();
            for (var i = 0; i < educacionesBasicas.length; i++) {
                datosModel.educacionesBasicas.push(
                        {
                            id: ko.observable(educacionesBasicas[i].id),
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

        function cargarEducacionesContinuas(educacionesContinuas) {
            datosModel.educacionesContinuas.removeAll();
            for (var i = 0; i < educacionesContinuas.length; i++) {
                datosModel.educacionesContinuas.push(
                        {
                            id: ko.observable(educacionesContinuas[i].id),
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

        function cargarEducacionesSuperiores(educacionesSuperiores) {
            datosModel.educacionesSuperiores.removeAll();
            for (var i = 0; i < educacionesSuperiores.length; i++) {
                datosModel.educacionesSuperiores.push(
                        {
                            id: ko.observable(educacionesSuperiores[i].id),
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

        function cargarIdiomas(idiomas) {
            datosModel.idiomas.removeAll();
            for (var i = 0; i < idiomas.length; i++) {
                datosModel.idiomas.push(
                        {
                            id: ko.observable(idiomas[i].id),
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

        function cargarDistinciones(distinciones) {
            datosModel.distinciones.removeAll();
            for (var i = 0; i < distinciones.length; i++) {
                datosModel.distinciones.push(
                        {
                            id: ko.observable(distinciones[i].id),
                            fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                            institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                            descripcion: ko.observable(distinciones[i].descripcion),
                            certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                            nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
                        }
                );
            }
        }

        function cargarInvestigaciones(investigaciones) {
            datosModel.investigaciones.removeAll();
            for (var i = 0; i < investigaciones.length; i++) {
                datosModel.investigaciones.push(
                        {
                            id: ko.observable(investigaciones[i].id),
                            investigadorReconocidoColciencias: ko.observable(investigaciones[i].investigadorReconocidoColciencias),
                            urlCVLAC: ko.observable(investigaciones[i].urlCVLAC),
                            urlCVLACValidada: ko.observable(investigaciones[i].urlCVLACValidada),
                            nombreUrlCVLACValidada: ko.observable(investigaciones[i].nombreUrlCVLACValidada),
                            tipoInvestigador: ko.observable(investigaciones[i].tipoInvestigador),
                            nombreTipoInvestigador: ko.observable(investigaciones[i].nombreTipoInvestigador),
                            codigoORCID: ko.observable(investigaciones[i].codigoORCID),
                            identificadorScopus: ko.observable(investigaciones[i].identificadorScopus),
                            researcherId: ko.observable(investigaciones[i].researcherId)
                        }
                );
            }
        }

        function cargarArticulos(articulos) {
            datosModel.articulos.removeAll();
            for (var i = 0; i < articulos.length; i++) {
                datosModel.articulos.push(
                        {
                            id: ko.observable(articulos[i].id),
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

        function cargarPatentes(patentes) {
            datosModel.patentes.removeAll();
            for (var i = 0; i < patentes.length; i++) {
                datosModel.patentes.push(
                        {
                            id: ko.observable(patentes[i].id),
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

        function cargarProductosConocimiento(productosConocimiento) {
            datosModel.productosConocimiento.removeAll();
            for (var i = 0; i < productosConocimiento.length; i++) {
                datosModel.productosConocimiento.push(
                        {
                            id: ko.observable(productosConocimiento[i].id),
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
        var investigaciones = [];

        var datosModel = new DatosModel(
                correosElectronicos,
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
                productosConocimiento,
                investigaciones);
        ko.applyBindings(datosModel);

</script>