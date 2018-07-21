<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">
    <div class="container">
        <legend><h3>Validaci&oacute;n documentos de soporte</h3></legend>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Buscar número de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el número de identificación para buscar las hojas de vida">
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
                    <label>Buscar nombres</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar los nombres para buscar las hojas de vida">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <input type='text' class="form-control input-sm" name="nombres" id="nombres" maxlength="100" style="width: 75%;">
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarNombres()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                    <button type="button" class="btn btn-success btn-sm" onclick="buscarHojasVida()"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Buscar apellidos</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar los apellidos para buscar las hojas de vida">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <input type='text' class="form-control input-sm" name="apellidos" id="apellidos" maxlength="100" style="width: 75%;">
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarApellidos()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                    <button type="button" class="btn btn-success btn-sm" onclick="buscarHojasVida()"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tblHojasVida">
                        <thead>
                        <th>C&eacute;dula</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th class="opc">Opciones</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <div id="divDescargar" style="display: none;" align="center">
            <center><label>Descargar listado</label><button class="btn btn-success " id="btnDescargar" onclick="descargar()" style="margin-left: 10px"><i class="fa fa-download"></i></button></center>
        </div>
        <div id="formPersona" style="display: none;">
            <div class="row" id="tbinfo" style="margin-top: 50px;">
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <table class="table table-hover tableestilo" id="tblPersona">
                            <thead>
                            <th>C&eacute;dula</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>   
            <div style="overflow-y: auto; max-height:750px;">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <legend><h4>Soportes Personales y de afiliaci&oacute;n</h4></legend>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <h5><label>Número de soportes cargados:&nbsp;</label><label id="numeroSoportesPersonalesCargados"></label></h5>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesPersonalesValidados"></label></h5>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive" style="margin-top: -25px;">
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table table-hover tableestilo" id="tbsoppers">
                                    <thead>
                                    <th style="width: 400px;">Descripci&oacute;n del soporte</th>
                                    <th>Archivo</th>
                                    <th>Validado</th>
                                    </thead>
                                    <tbody data-bind="foreach: { data: documentosSoporteComplementariosValidar }">
                                        <tr class="table-row">
                                            <td style="width: 60%">
                                                <span data-bind="text: nombreTipoDocumento" ></span>
                                            </td>
                                            <td style="width: 20%" align="center">
                                                <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreValidado"></span>
                                            </td>
                                        </tr>
                                    </tbody>                          
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="form-group">
                            <legend><h4>Soportes Experiencia Laboral</h4></legend>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosExperienciaLaboral"></label></h5>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosExperienciaLaboral"></label></h5>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive" style="margin-top: -25px;">
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table table-hover tableestilo" id="tbsopexlab">
                                    <thead>
                                        <tr>
                                            <th style="width: 400px;">Empresa o Instituci&oacute;n</th>
                                            <th>Archivo</th>
                                            <th>Validado</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: experienciasLaborales }">
                                        <tr class="table-row">
                                            <td style="width: 60%">
                                                <span data-bind="text: nombreEmpresa" ></span>
                                            </td>
                                            <td style="width: 20%" align="center">
                                                <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoExperienciaLaboral" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreCertificadoValidado"></span>
                                            </td>
                                        </tr>
                                    </tbody>                            
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <legend><h4>Soportes Experiencia Docencia</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosExperienciaDocencia"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosExperienciaDocencia"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopexlab">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Instituci&oacute;n</th>
                                        <th style="width: 400px;">Curso</th>
                                        <th>Archivo</th>
                                        <th>Validado</th>
                                        <th class="opc">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: cursosExperienciaDocencia }">
                                    <tr class="table-row">
                                        <td style="width: 40%">
                                            <span data-bind="text: nombreInstitucion" ></span>
                                        </td>
                                        <td style="width: 40%">
                                            <span data-bind="text: nombreCurso" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoCursoExperienciaDocencia" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: nombreCertificadoValidado"></span>
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
                        <legend><h4>Soportes Educaci&oacute;n B&aacute;sica</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosEducacionBasica"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosEducacionBasica"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopedbas">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Instituci&oacute;n</th>
                                        <th>Archivo</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesBasicas }">
                                    <tr class="table-row">
                                        <td style="width: 60%">
                                            <span data-bind="text: institucion" ></span>
                                        </td>
                                        <td style="width: 20%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionBasica" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreCertificadoValidado"></span>
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
                        <legend><h4>Soportes Educaci&oacute;n no formal</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosEducacionContinua"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosEducacionContinua"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopedcon">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Capacitaci&oacute;n</th>
                                        <th>Archivo</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesContinuas }">
                                    <tr class="table-row">
                                        <td style="width: 50%">
                                            <span data-bind="text: nombreCapacitacion" ></span>
                                        </td>
                                        <td style="width: 20%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionContinua" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreCertificadoValidado"></span>
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
                        <legend><h4>Soportes Educaci&oacute;n superior</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosEducacionSuperior"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosEducacionSuperior"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopedsup">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Estudio</th>
                                        <th>Archivo Homologado</th>
                                        <th>Validado Homologado</th>
                                        <th>Archivo</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: educacionesSuperiores }">
                                    <tr class="table-row">
                                        <td style="width: 60%">
                                            <span data-bind="text: nombrePrograma" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado homologado' data-bind="click: $root.verCertificadoHomologadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: nombreCertificadoHomologadoValidado"></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionSuperior" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreCertificadoValidado"></span>
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
                    <div class="col-md-4">
                        <div class="form-group">
                            <legend><h4>Soportes Idiomas</h4></legend>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosIdioma"></label></h5>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosIdioma"></label></h5>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive" style="margin-top: -25px;">
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table table-hover tableestilo" id="tbsopidiom">
                                    <thead>
                                        <tr>
                                            <th style="width: 400px;">Idioma</th>
                                            <th>Archivo</th>
                                            <th>Validado</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: idiomas }">
                                        <tr class="table-row">
                                            <td style="width: 60%">
                                                <span data-bind="text: nombreIdioma" ></span>
                                            </td>
                                            <td style="width: 20%" align="center">
                                                <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoIdioma" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreCertificadoValidado"></span>
                                            </td>
                                        </tr>
                                    </tbody>                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="form-group">
                            <legend><h4>Soportes Distinciones y premios</h4></legend>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosDistincion"></label></h5>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosDistincion"></label></h5>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive" style="margin-top: -25px;">
                            <div style="overflow-y: auto; max-height:200px;">
                                <table class="table table-hover tableestilo" id="tbsopdispre">
                                    <thead>
                                        <tr>
                                            <th style="width: 400px;">Descripci&oacute;n del soporte</th>
                                            <th>Archivo</th>
                                            <th>Validado</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: distinciones }">
                                        <tr class="table-row">
                                            <td style="width: 60%">
                                                <span data-bind="text: descripcion" ></span>
                                            </td>
                                            <td style="width: 20%" align="center">
                                                <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoDistincion" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreCertificadoValidado"></span>
                                            </td>
                                        </tr>
                                    </tbody>                               
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <legend><h4>Soportes investigaci&oacute;n</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosInvestigacion"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosInvestigacion"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopinves">
                                <thead>
                                    <tr>
                                        <th>Tipo de investigador</th>
                                        <th>CVLAC</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: investigaciones }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreTipoInvestigador" ></span>
                                        </td>
                                        <td style="width: 70%">
                                            <span data-bind="text: urlCVLAC" ></span>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: nombreUrlCVLACValidada"></span>
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
                        <legend><h4>Soportes art&iacute;culos y publicaciones</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosArticulo"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosArticulo"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopartpub">
                                <thead>
                                    <tr>
                                        <th>Título</th>
                                        <th>Enlace</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: articulos }">
                                    <tr class="table-row">
                                        <td style="width: 20%">
                                            <span data-bind="text: nombre" ></span>
                                        </td>
                                        <td style="width: 70%">
                                            <span data-bind="text: url" ></span>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: nombreValidado"></span>
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
                        <legend><h4>Soportes Patentes</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosPatente"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosPatente"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsoppatente">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Descripci&oacute;n</th>
                                        <th>Soporte</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: patentes }">
                                    <tr class="table-row">
                                        <td style="width: 60%">
                                            <span data-bind="text: descripcion" ></span>
                                        </td>
                                        <td style="width: 20%" align="center">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoPatente" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreDocumentoValidado"></span>
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
                        <legend><h4>Soportes productos de conocimiento</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label><label id="numeroSoportesCargadosProductoConocimiento"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosProductoConocimiento"></label></h5>
                </div>
                <div class="col-md-12">

                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsopprodcon">
                                <thead>
                                    <tr>
                                        <th style="width: 400px;">Descripci&oacute;n</th>
                                        <th>Soporte</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: productosConocimiento }">
                                    <tr class="table-row">
                                        <td style="width: 80%">
                                            <span data-bind="text: descripcion" ></span>
                                        </td>
                                        <td style="width: 10%" align="center">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoProductoConocimiento" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 10%">
                                            <span data-bind="text: nombreDocumentoValidado"></span>
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
                        <legend><h4>Soportes propuestas o proyectos</h4></legend>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <h5><label>Número de soportes cargados:&nbsp;</label> <label id="numeroSoportesCargadosPropuestaInvestigacion"></label></h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5><label>Número de soportes validados:&nbsp;</label><label id="numeroSoportesValidadosPropuestaInvestigacion"></label></h5>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-top: -25px;">
                        <div style="overflow-y: auto; max-height:200px;">
                            <table class="table table-hover tableestilo" id="tbsoppropoproy">
                                <thead>
                                    <tr>
                                        <th>Documento propuesta</th>
                                        <th>Validado</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: documentosSoporteInvestigacion }">
                                    <tr class="table-row">
                                        <td style="width: 80%" align="center">
                                            <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                        </td>
                                        <td style="width: 20%">
                                            <span data-bind="text: nombreValidado"></span>
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
    <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
</div> 
<script>
    function limpiarNumeroIdentificacion() {
        $('#cboNumeroIdentificacion').val("").trigger('change');
    }

    function limpiarNombres() {
        $('#nombres').val("");
    }

    function limpiarApellidos() {
        $('#apellidos').val("");
    }

    var numeroIdentificacion = "";
    var nombres = "";
    var apellidos = "";

    $(document).ready(function () {
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

        tblPersona = $('#tblPersona').DataTable({
            "paging": false,
            "bFilter": false,
            "info": false,
            "language": {
                "sEmptyTable": "Ningún dato disponible en esta tabla"
            }
        });
    });

    function buscarHojasVida() {
        $('#formPersona').hide();
        $('#divDescargar').hide();
        if ($('#cboNumeroIdentificacion').val() == "" && $('#nombres').val() == "" && $('#apellidos').val() == "") {
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
        formData.append("nombres", $('#nombres').val());
        formData.append("apellidos", $('#apellidos').val());
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
                $('#md_resultados').modal('hide');
                tblHojasVida.clear().draw();
                if (response !== "") {
                    var hojasVida = JSON.parse(response);
                    if (hojasVida.length > 0) {
                        $('#divDescargar').show();
                    }                    
                    for (var i = 0; i < hojasVida.length; i++) {
                        tblHojasVida.row.add([
                            hojasVida[i].numeroIdentificacion,
                            hojasVida[i].nombres,
                            hojasVida[i].apellidos,
                            '<button class="btn btn-success btn-xs btnver" type="button" onclick=\'verHojaVida(' + hojasVida[i].idPersona + ',\"' +
                                    hojasVida[i].numeroIdentificacion + '\",\"' +
                                    hojasVida[i].nombres + '\",\"' +
                                    hojasVida[i].apellidos + '\")\'>Ver</button>'
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
                url: "${pageContext.request.contextPath}/hojasVida/descargarHojasVidaSoporte?idPersona=" + $('#cboNumeroIdentificacion').val() + "&nombres=" + $('#nombres').val() + "&apellidos=" + $('#apellidos').val(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/descargarHojasVidaSoporte?idPersona=" + $('#cboNumeroIdentificacion').val() + "&nombres=" + $('#nombres').val() + "&apellidos=" + $('#apellidos').val();
                    }
                    $('#md_descargar_resultados').modal('hide');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $('#md_descargar_resultados').modal('hide');
                }
            });
    }

    function verHojaVida(pIdPersona, pNumeroIdentificacion, pNombres, pApellidos) {
        numeroIdentificacion = pNumeroIdentificacion;
        nombres = pNombres;
        apellidos = pApellidos;
        tblPersona.clear().draw();
        tblPersona.row.add([numeroIdentificacion, nombres, apellidos]).draw(false);

        $("#idPersona").val(pIdPersona);
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/datos/" + pIdPersona,
            processData: false,
            contentType: false,
            success: function (response) {
                $('#formPersona').show();
                if (response !== "") {
                    var hojaVida = JSON.parse(response);
                    cargarDocumentosSoporteComplementariosValidar(hojaVida.documentosSoporteComplementariosValidar);
                    cargarExperienciasLaborales(hojaVida.experienciasLaborales);
                    cargarCursosExperienciaDocencia(hojaVida.cursosExperienciaDocencia);
                    cargarEducacionesBasicas(hojaVida.educacionesBasicas);
                    cargarEducacionesContinuas(hojaVida.educacionesContinuas);
                    cargarEducacionesSuperiores(hojaVida.educacionesSuperiores);
                    cargarIdiomas(hojaVida.idiomas);
                    cargarDistinciones(hojaVida.distinciones);
                    cargarInvestigaciones(hojaVida.investigaciones);
                    cargarArticulos(hojaVida.articulos);
                    cargarPatentes(hojaVida.patentes);
                    cargarProductosConocimiento(hojaVida.productosConocimiento);
                    cargarPropuestasInvestigacion(hojaVida.documentosSoporteInvestigacion);
                }
            }});
    }

    var DatosModel = function (
            documentosSoporteComplementariosValidar,
            documentosSoporteInvestigacion,
            idiomas,
            educacionesBasicas,
            educacionesSuperiores,
            educacionesContinuas,
            distinciones,
            experienciasLaborales,
            cursosExperienciaDocencia,
            articulos,
            patentes,
            productosConocimiento,
            investigaciones) {
        self = this;
        self.documentosSoporteComplementariosValidar = ko.observableArray(documentosSoporteComplementariosValidar);
        self.documentosSoporteInvestigacion = ko.observableArray(documentosSoporteInvestigacion);
        self.idiomas = ko.observableArray(idiomas);
        self.educacionesBasicas = ko.observableArray(educacionesBasicas);
        self.educacionesSuperiores = ko.observableArray(educacionesSuperiores);
        self.educacionesContinuas = ko.observableArray(educacionesContinuas);
        self.distinciones = ko.observableArray(distinciones);
        self.experienciasLaborales = ko.observableArray(experienciasLaborales);
        self.cursosExperienciaDocencia = ko.observableArray(cursosExperienciaDocencia);
        self.articulos = ko.observableArray(articulos);
        self.patentes = ko.observableArray(patentes);
        self.productosConocimiento = ko.observableArray(productosConocimiento);
        self.investigaciones = ko.observableArray(investigaciones);
        self.verDocumentoSoporte = function (documentoSoporte) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoSoporte/" + documentoSoporte.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoSoporte/" + documentoSoporte.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoIdioma = function (idioma) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoIdioma/" + idioma.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoIdioma/" + idioma.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoEducacionBasica = function (educacionBasica) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasica/" + educacionBasica.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasica/" + educacionBasica.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

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
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoEducacionContinua = function (educacionContinua) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinua/" + educacionContinua.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinua/" + educacionContinua.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoDistincion = function (distincion) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoDistincion/" + distincion.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoDistincion/" + distincion.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoExperienciaLaboral = function (experienciaLaboral) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verCertificadoCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verDocumentoPatente = function (patente) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoPatente/" + patente.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoPatente/" + patente.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };

        self.verDocumentoProductoConocimiento = function (productoConocimiento) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        };
    };

    function cargarDocumentosSoporteComplementariosValidar(documentosSoporteComplementariosValidar) {
        datosModel.documentosSoporteComplementariosValidar.removeAll();
        $("#numeroSoportesPersonalesCargados").text(documentosSoporteComplementariosValidar.length);
        $("#numeroSoportesPersonalesValidados").text(documentosSoporteComplementariosValidar.filter(function(x) {return x.validado;} ).length);
        for (var i = 0; i < documentosSoporteComplementariosValidar.length; i++) {
            datosModel.documentosSoporteComplementariosValidar.push(
                    {
                        id: ko.observable(documentosSoporteComplementariosValidar[i].id),
                        tipoDocumento: ko.observable(documentosSoporteComplementariosValidar[i].tipoDocumento),
                        nombreTipoDocumento: ko.observable(documentosSoporteComplementariosValidar[i].nombreTipoDocumento),
                        validado: ko.observable(documentosSoporteComplementariosValidar[i].validado),
                        nombreValidado: ko.observable(documentosSoporteComplementariosValidar[i].nombreValidado)
                    }
            );
        }
    }

    function cargarExperienciasLaborales(experienciasLaborales) {
        datosModel.experienciasLaborales.removeAll();
        $("#numeroSoportesCargadosExperienciaLaboral").text(experienciasLaborales.length);
        $("#numeroSoportesValidadosExperienciaLaboral").text(experienciasLaborales.filter(function(x) {return x.certificadoValidado;} ).length);
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

    function cargarCursosExperienciaDocencia(cursosExperienciaDocencia) {
        datosModel.cursosExperienciaDocencia.removeAll();
        $("#numeroSoportesCargadosExperienciaDocencia").text(cursosExperienciaDocencia.length);
        $("#numeroSoportesValidadosExperienciaDocencia").text(cursosExperienciaDocencia.filter(function(x) {return x.certificadoValidado;} ).length);
        for (var i = 0; i < cursosExperienciaDocencia.length; i++) {
            datosModel.cursosExperienciaDocencia.push(
                    {
                        id: ko.observable(cursosExperienciaDocencia[i].id),
                        nombreCurso: ko.observable(cursosExperienciaDocencia[i].nombreCurso),
                        nombreInstitucion: ko.observable(cursosExperienciaDocencia[i].nombreInstitucion),
                        nucleoBasicoConocimiento: ko.observable(cursosExperienciaDocencia[i].nucleoBasicoConocimiento),
                        nombreNucleoBasicoConocimiento: ko.observable(cursosExperienciaDocencia[i].nombreNucleoBasicoConocimiento),
                        modalidad: ko.observable(cursosExperienciaDocencia[i].modalidad),
                        nombreModalidad: ko.observable(cursosExperienciaDocencia[i].nombreModalidad),
                        nivelEstudio: ko.observable(cursosExperienciaDocencia[i].nivelEstudio),
                        nombreNivelEstudio: ko.observable(cursosExperienciaDocencia[i].nombreNivelEstudio),
                        numeroHoras: ko.observable(cursosExperienciaDocencia[i].numeroHoras),
                        anyo: ko.observable(cursosExperienciaDocencia[i].anyo),
                        certificadoValidado: ko.observable(cursosExperienciaDocencia[i].certificadoValidado),
                        nombreCertificadoValidado: ko.observable(cursosExperienciaDocencia[i].nombreCertificadoValidado)
                    }
            );
        }
    }

    function cargarEducacionesBasicas(educacionesBasicas) {
        datosModel.educacionesBasicas.removeAll();
        $("#numeroSoportesCargadosEducacionBasica").text(educacionesBasicas.length);
        $("#numeroSoportesValidadosEducacionBasica").text(educacionesBasicas.filter(function(x) {return x.certificadoValidado;} ).length);
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
        $("#numeroSoportesCargadosEducacionContinua").text(educacionesContinuas.length);
        $("#numeroSoportesValidadosEducacionContinua").text(educacionesContinuas.filter(function(x) {return x.certificadoValidado;} ).length);
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
        $("#numeroSoportesCargadosEducacionSuperior").text(educacionesSuperiores.length);
        $("#numeroSoportesValidadosEducacionSuperior").text(educacionesSuperiores.filter(function(x) {return x.certificadoValidado;} ).length);
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
        $("#numeroSoportesCargadosIdioma").text(idiomas.length);
        $("#numeroSoportesValidadosIdioma").text(idiomas.filter(function(x) {return x.certificadoValidado;} ).length);
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
        $("#numeroSoportesCargadosDistincion").text(distinciones.length);
        $("#numeroSoportesValidadosDistincion").text(distinciones.filter(function(x) {return x.certificadoValidado;} ).length);
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
        $("#numeroSoportesCargadosInvestigacion").text(investigaciones.length);
        $("#numeroSoportesValidadosInvestigacion").text(investigaciones.filter(function(x) {return x.urlCVLACValidada;} ).length);
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
        $("#numeroSoportesCargadosArticulo").text(articulos.length);
        $("#numeroSoportesValidadosArticulo").text(articulos.filter(function(x) {return x.validado;} ).length);
        for (var i = 0; i < articulos.length; i++) {
            datosModel.articulos.push(
                    {
                        id: ko.observable(articulos[i].id),
                        nombre: ko.observable(articulos[i].nombre),
                        tipoAutor: ko.observable(articulos[i].tipoAutor),
                        nombreTipoAutor: ko.observable(articulos[i].nombreTipoAutor),
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
        $("#numeroSoportesCargadosPatente").text(patentes.length);
        $("#numeroSoportesValidadosPatente").text(patentes.filter(function(x) {return x.documentoValidado;} ).length);
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
        $("#numeroSoportesCargadosProductoConocimiento").text(productosConocimiento.length);
        $("#numeroSoportesValidadosProductoConocimiento").text(productosConocimiento.filter(function(x) {return x.documentoValidado;} ).length);
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

    function cargarPropuestasInvestigacion(documentosSoporteInvestigacion) {
        datosModel.documentosSoporteInvestigacion.removeAll();
        $("#numeroSoportesCargadosPropuestaInvestigacion").text(documentosSoporteInvestigacion.length);
        $("#numeroSoportesValidadosPropuestaInvestigacion").text(documentosSoporteInvestigacion.filter(function(x) {return x.validado;} ).length);
        for (var i = 0; i < documentosSoporteInvestigacion.length; i++) {
            datosModel.documentosSoporteInvestigacion.push(
                    {
                        id: ko.observable(documentosSoporteInvestigacion[i].id),
                        tipoDocumento: ko.observable(documentosSoporteInvestigacion[i].tipoDocumento),
                        nombreTipoDocumento: ko.observable(documentosSoporteInvestigacion[i].nombreTipoDocumento),
                        validado: ko.observable(documentosSoporteInvestigacion[i].validado),
                        nombreValidado: ko.observable(documentosSoporteInvestigacion[i].nombreValidado)
                    }
            );
        }
    }

    var documentosSoporteComplementariosValidar = [];
    var documentosSoporteInvestigacion = [];
    var idiomas = [];
    var educacionesBasicas = [];
    var educacionesSuperiores = [];
    var educacionesContinuas = [];
    var distinciones = [];
    var experienciasLaborales = [];
    var cursosExperienciaDocencia = [];
    var articulos = [];
    var patentes = [];
    var productosConocimiento = [];
    var investigaciones = [];

    var datosModel = new DatosModel(
            documentosSoporteComplementariosValidar,
            documentosSoporteInvestigacion,
            idiomas,
            educacionesBasicas,
            educacionesSuperiores,
            educacionesContinuas,
            distinciones,
            experienciasLaborales,
            cursosExperienciaDocencia,
            articulos,
            patentes,
            productosConocimiento,
            investigaciones);
    ko.applyBindings(datosModel);
</script>