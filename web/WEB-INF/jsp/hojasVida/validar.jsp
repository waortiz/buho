<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">
    <div class="container">
        <legend><h3>Validaci&oacute;n documentos de soporte</h3></legend>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group form-inline">
                    <label for="convocatoria">Convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la convocatoria">
                        <i class="fa fa-question-circle" aria-hidden="true"></i></a><br> 
                    <select style="width: 100%;" id="convocatoria" class="js-select-basic-single js-states form-control" onchange="buscarHojasVida()">
                        <option></option>
                        <c:forEach var="convocatoria" items="${convocatorias}">
                            <option value="${convocatoria.getId()}">${convocatoria.getNombre()}</option>
                        </c:forEach>                                                 
                    </select>  
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">

            </div>
        </div>
        <div class="row">

        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive" style="margin-top: -25px;">
                    <div style="overflow-y: auto; max-height:400px;">
                        <table class="table table-hover tableestilo" id="hojasVida">
                        <thead>
                            <th>C&eacute;dula</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th class="opc">Opciones</th>
                        </thead>
                        <tbody data-bind="foreach: { data: hojasVida }">
                            <tr class="table-row">
                                <td style="width: 20%">
                                    <span data-bind="text: numeroIdentificacion" ></span>
                                </td>
                                <td style="width: 35%">
                                    <span data-bind="text: nombres" ></span>
                                </td>
                                <td style="width: 35%">
                                    <span data-bind="text: apellidos" ></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnver' type='button' data-bind="click: $root.verHojaVida">Ver</button>
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
                <legend><h4>Soportes Personales y de afiliaci&oacute;n</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsoppers">
                        <thead>
                            <th style="width: 400px;">Descripci&oacute;n del soporte</th>
                            <th>Archivo</th>
                            <th>Validado</th>
                            <th class="opc">Opciones</th>
                        </thead>
                        <tbody data-bind="foreach: { data: documentosSoporteComplementariosValidar }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: nombreTipoDocumento" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarDocumentoSoporte">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                          
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Experiencia Laboral</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopexlab">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Empresa o Instituci&oacute;n</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: experienciasLaborales }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: nombreEmpresa" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoExperienciaLaboral" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreCertificadoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoExperienciaLaboral">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                            
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Experiencia Docencia</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
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
                                <td style="width: 30%">
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
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoCursoExperienciaDocencia">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                            
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Educaci&oacute;n B&aacute;sica</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopedbas">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Instituci&oacute;n</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: educacionesBasicas }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: institucion" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoEducacionBasica" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreCertificadoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoEducacionBasica">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                           
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Educaci&oacute;n continua</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopedcon">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Capacitaci&oacute;n</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
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
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoEducacionContinua">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                           
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Educaci&oacute;n superior</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopedsup">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Estudio</th>
                                <th>Archivo Homologado</th>
                                <th>Validado Homologado</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: educacionesSuperiores }">
                            <tr class="table-row">
                                <td style="width: 50%">
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
                                <td style='white-space: nowrap; width: 20%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoHomologadoEducacionSuperior">Ver soporte homologado</button>
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoEducacionSuperior">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                           
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Idiomas</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopidiom">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Idioma</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: idiomas }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: nombreIdioma" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoIdioma" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreCertificadoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoIdioma">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                                   
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Distinciones y premios</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopdispre">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Descripci&oacute;n del soporte</th>
                                <th>Archivo</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: distinciones }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: descripcion" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver certificado' data-bind="click: $root.verCertificadoDistincion" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreCertificadoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarCertificadoDistincion">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                               
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes investigaci&oacute;n</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopinves">
                        <thead>
                            <tr>
                                <th>Tipo de investigador</th>
                                <th>CVLAC</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: investigaciones }">
                            <tr class="table-row">
                                <td style="width: 20%">
                                    <span data-bind="text: nombreTipoInvestigador" ></span>
                                </td>
                                <td style="width: 60%">
                                    <span data-bind="text: urlCVLAC" ></span>
                                </td>
                                <td style="width: 10%">
                                    <span data-bind="text: nombreUrlCVLACValidada"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarUrlInvestigacion">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                               
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes art&iacute;culos y publicaciones</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopartpub">
                        <thead>
                            <tr>
                                <th>Título</th>
                                <th>Enlace</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: articulos }">
                            <tr class="table-row">
                                <td style="width: 20%">
                                    <span data-bind="text: nombre" ></span>
                                </td>
                                <td style="width: 60%">
                                    <span data-bind="text: url" ></span>
                                </td>
                                <td style="width: 10%">
                                    <span data-bind="text: nombreValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarUrlArticulo">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                                     
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes Patentes</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsoppatente">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Descripci&oacute;n</th>
                                <th>Soporte</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: patentes }">
                            <tr class="table-row">
                                <td style="width: 50%">
                                    <span data-bind="text: descripcion" ></span>
                                </td>
                                <td style="width: 20%" align="center">
                                    <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoPatente" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreDocumentoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarDocumentoPatente">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                                     
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes productos de conocimiento</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsopprodcon">
                        <thead>
                            <tr>
                                <th style="width: 400px;">Descripci&oacute;n</th>
                                <th>Soporte</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: productosConocimiento }">
                            <tr class="table-row">
                                <td style="width: 30%">
                                    <span data-bind="text: descripcion" ></span>
                                </td>
                                <td style="width: 10%" align="center">
                                    <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoProductoConocimiento" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 10%">
                                    <span data-bind="text: nombreDocumentoValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarDocumentoProductoConocimiento">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                                     
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <legend><h4>Soportes propuestas o proyectos</h4></legend>
                <div class="table-responsive" style="margin-top: -25px;">
                    <table class="table table-hover tableestilo" id="tbsoppropoproy">
                        <thead>
                            <tr>
                                <th>Documento propuesta</th>
                                <th>Validado</th>
                                <th class="opc">Opciones</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: { data: documentosSoporteInvestigacion }">
                            <tr class="table-row">
                                <td style="width: 70%" align="center">
                                    <a href='#' title='Ver documento' data-bind="click: $root.verDocumentoSoporte" class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'></i></a>
                                </td>
                                <td style="width: 20%">
                                    <span data-bind="text: nombreValidado"></span>
                                </td>
                                <td style='white-space: nowrap; width: 10%' align="center">
                                    <button class='btn btn-success btn-xs btnsopor' type='button' data-bind="click: $root.validarDocumentoSoporteInvestigacion">Ver soporte</button>
                                </td>
                            </tr>
                        </tbody>                          
                    </table>
                </div>
            </div>
        </div>

        <div class="modal fade" id="md_validar_soporte" role="dialog">
            <div class="modal-dialog modal-lg" style="height: 100%;">
                <div class="modal-content">
                    <div class="modal-header mhsuccess">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Informaci&oacute;n de documento de soporte</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <embed id="visorDocumento" style="width: 100%;height: 500px;" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group form-inline">
                                    <label style="text-align: left;" id="titulo"></label>
                                    <input type="text" id="valor" readonly style="border:0;margin-left: 10px;">
                                </div>
                            </div>
                            <div class="col-md-3" style="float: left;">
                                <div id="divExperienciaExtension">
                                    <div class="form-group form-inline" >
                                        <label>Experiencia extensión</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar si la experiencia es en extensión">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <div id="radioExperienciaExtension" class="btn-group" style="margin-left: 40px;">
                                            <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaExtension" data-title="true" id="btnExperienciaExtensionSi">Si</a>
                                            <a class="btn btn-primary btn-sm notActive" data-toggle="experienciaExtension" data-title="false" id="btnExperienciaExtensionNo">No</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2" style="float: left;">
                                <div class="form-group form-inline" >
                                    <label>Validar</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la validación del documento">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                    <div id="radioBtn" class="btn-group">
                                        <a class="btn btn-primary btn-sm notActive" data-toggle="validado" data-title="true" id="btnValidadoSi">Si</a>
                                        <a class="btn btn-primary btn-sm notActive" data-toggle="validado" data-title="false" id="btnValidadoNo">No</a>
                                    </div>
                                    <input type="hidden" name="validado" id="validado" value="false">
                                    <input type="hidden" name="experienciaExtension" id="experienciaExtension" value="false">
                                    <input type="hidden" name="idDocumento" id="idDocumento">
                                    <input type="hidden" name="tipoDocumento" id="tipoDocumento">
                                    <input type="hidden" name="idPersona" id="idPersona">
                                    <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-default" style="float: right" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</div>
<div class="modal fade" id="md_validar" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header mhsuccess">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Deseas aceptar los cambios?</label></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success btnacpt" type="button" onclick="validarDocumento()" >Aceptar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<script>
    
    var DOCUMENTO_SOPORTE = 1;
    var EXPERIENCIA_LABORAL = 2;
    var CURSO_EXPERIENCIA_DOCENCIA = 3;
    var EDUCACION_BASICA = 4;
    var EDUCACION_CONTINUA = 5;
    var EDUCACION_SUPERIOR = 6;
    var EDUCACION_HOMOLOGADO_SUPERIOR = 7;
    var IDIOMA = 8;
    var DISTINCION = 9;
    var CVLAC = 10;
    var ARTICULO = 11;
    var PATENTE = 12;
    var PRODUCTO_CONOCIMIENTO = 13;
    var PROPUESTA_INVESTIGACION = 14;
    var cedula = "";
    
    $(document).ready(function() {
        var hojasVida = $('#hojasVida').DataTable({
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
        
        $('#btnValidadoSi').click(function () {
            $('#md_validar').modal({backdrop: 'static', keyboard: false})  ;
        });
        $('#btnValidadoNo').click(function () {
            $('#md_validar').modal({backdrop: 'static', keyboard: false})  ;
        });
        $('#radioExperienciaExtension a').on('click', function () {
            var sel = $(this).data('title');
            var tog = $(this).data('toggle');
            $('#' + tog).prop('value', sel);

            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
        });        
    }); 
    
    function validarDocumento() {
        var formData = new FormData();
        formData.append("validado", $("#validado").val());
        formData.append("experienciaExtension", $("#experienciaExtension").val());
        formData.append("idDocumento", $("#idDocumento").val());
        formData.append("tipoDocumento", $("#tipoDocumento").val());
        formData.append("idPersona", $("#idPersona").val());

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/validarDocumento",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                $('#md_validar').modal('hide');
                $('#md_validar_soporte').modal('hide');
                var datos = [];
                if(response != "") {
                  datos = JSON.parse(response);  
                }
                if($("#tipoDocumento").val() == DOCUMENTO_SOPORTE) {
                   cargarDocumentosSoporteComplementariosValidar(datos);
                } else if($("#tipoDocumento").val() == EXPERIENCIA_LABORAL) {
                   cargarExperienciasLaborales(datos); 
                } else if($("#tipoDocumento").val() == CURSO_EXPERIENCIA_DOCENCIA) {
                   cargarCursosExperienciaDocencia(datos);  
                } else if($("#tipoDocumento").val() == EDUCACION_BASICA) {
                   cargarEducacionesBasicas(datos);  
                } else if($("#tipoDocumento").val() == EDUCACION_CONTINUA) {
                   cargarEducacionesContinuas(datos);  
                } else if($("#tipoDocumento").val() == EDUCACION_SUPERIOR || $("#tipoDocumento").val() == EDUCACION_HOMOLOGADO_SUPERIOR) {
                   cargarEducacionesSuperiores(datos);  
                } else if($("#tipoDocumento").val() == IDIOMA) {
                   cargarIdiomas(datos);  
                } else if($("#tipoDocumento").val() == DISTINCION) {
                   cargarDistinciones(datos);  
                } else if($("#tipoDocumento").val() == CVLAC) {
                   cargarInvestigaciones(datos);  
                } else if($("#tipoDocumento").val() == ARTICULO) {
                   cargarArticulos(datos);  
                } else if($("#tipoDocumento").val() == PATENTE) {
                   cargarPatentes(datos);  
                } else if($("#tipoDocumento").val() == PRODUCTO_CONOCIMIENTO) {
                   cargarProdcutosConocimiento(datos);  
                } else if($("#tipoDocumento").val() == PROPUESTA_INVESTIGACION) {
                   cargarPropuestasInvestigacion(datos);  
                }    
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }});
    }

    function buscarHojasVida() {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/personas/" + $('#convocatoria').val(),
            processData: false,
            contentType: false,
            success: function (response) {
                datosModel.hojasVida.removeAll();
                if (response !== "") {
                    var hojasVida = JSON.parse(response);
                    for (var i = 0; i < hojasVida.length; i++) {
                         self.hojasVida.push(
                                {
                                    idPersona: ko.observable(hojasVida[i].idPersona),
                                    numeroIdentificacion: ko.observable(hojasVida[i].numeroIdentificacion),
                                    nombres: ko.observable(hojasVida[i].nombres),
                                    apellidos: ko.observable(hojasVida[i].apellidos)
                                }
                             );                        
                    }
                }
            }});
    }

    var DatosModel = function (hojasVida, 
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
        self.hojasVida = ko.observableArray(hojasVida);
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
        
        self.verHojaVida = function (hojaVida) {
            cedula = hojaVida.numeroIdentificacion();
            $("#idPersona").val(hojaVida.idPersona());
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/hojasVida/datos/" + hojaVida.idPersona(),
                processData: false,
                contentType: false,
                success: function (response) {
                    self.documentosSoporteComplementariosValidar.removeAll();
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
                        cargarProdcutosConocimiento(hojaVida.productosConocimiento);
                        cargarPropuestasInvestigacion(hojaVida.documentosSoporteInvestigacion);                        
                    }
                }});
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
        
        self.validarDocumentoSoporte = function (documentoSoporte) {
            verDocumentoValidar(DOCUMENTO_SOPORTE, 
                    documentoSoporte.id(), 
                    documentoSoporte.validado(), 
                    '${pageContext.request.contextPath}/hojasVida/documentoSoporteValidar/' + documentoSoporte.id(),
                    "Cédula",
                    cedula
            );
        };
        
        self.validarCertificadoExperienciaLaboral = function (experienciaLaboral) {
            verDocumentoValidar(EXPERIENCIA_LABORAL, 
                    experienciaLaboral.id(), 
                    experienciaLaboral.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoExperienciaLaboralValidar/' + experienciaLaboral.id(),
                    "Empresa",
                    experienciaLaboral.nombreEmpresa(),
                    experienciaLaboral.extension()
            );
        };
        
        self.validarCertificadoCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            verDocumentoValidar(CURSO_EXPERIENCIA_DOCENCIA, 
                    cursoExperienciaDocencia.id(), 
                    cursoExperienciaDocencia.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoCursoExperienciaDocenciaValidar/' + cursoExperienciaDocencia.id(),
                    "Curso",
                    cursoExperienciaDocencia.nombreCurso()
            );
        };
        
        self.validarCertificadoEducacionBasica = function (educacionBasica) {
            verDocumentoValidar(EDUCACION_BASICA, 
                    educacionBasica.id(), 
                    educacionBasica.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoEducacionBasicaValidar/' + educacionBasica.id(),
                    "Institución",
                    educacionBasica.institucion()
            );
        };

        self.validarCertificadoEducacionContinua = function (educacionContinua) {
            verDocumentoValidar(EDUCACION_CONTINUA, 
                    educacionContinua.id(), 
                    educacionContinua.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoEducacionContinuaValidar/' + educacionContinua.id(),
                    "Institución",
                    educacionContinua.nombreInstitucion()
            );
        };
        
        self.validarCertificadoEducacionSuperior = function (educacionSuperior) {
            verDocumentoValidar(EDUCACION_SUPERIOR, 
                    educacionSuperior.id(), 
                    educacionSuperior.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoEducacionSuperiorValidar/' + educacionSuperior.id(),
                    "Institución",
                    educacionSuperior.nombreInstitucion()
            );
        };

        self.validarCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
            verDocumentoValidar(EDUCACION_HOMOLOGADO_SUPERIOR, 
                    educacionSuperior.id(), 
                    educacionSuperior.certificadoHomologadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoHomologadoEducacionSuperiorValidar/' + educacionSuperior.id(), 
                    "Institución",
                    educacionSuperior.nombreInstitucion()
            );
        };

        self.validarCertificadoIdioma = function (idioma) {
            verDocumentoValidar(IDIOMA, 
                    idioma.id(), 
                    idioma.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoIdiomaValidar/' + idioma.id(),
                    "Idioma",
                    idioma.nombreIdioma()
            );
        };

        self.validarCertificadoDistincion = function (distincion) {
            verDocumentoValidar(DISTINCION, 
                    distincion.id(), 
                    distincion.certificadoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/certificadoDistincionValidar/' + distincion.id(),
                    "Premio",
                    distincion.descripcion()
            );
        };

        self.validarUrlInvestigacion = function (investigacion) {
            verDocumentoValidar(CVLAC, 
                    investigacion.id(), 
                    investigacion.urlCVLACValidada(), 
                    investigacion.urlCVLAC(),
                    "Cédula",
                    cedula
            );
        };
        
        self.validarUrlArticulo = function (articulo) {
            verDocumentoValidar(ARTICULO, 
                    articulo.id(), 
                    articulo.validado(), 
                    articulo.url(), 
                    "Artículo",
                    articulo.nombre()
            );
        };

        self.validarDocumentoPatente = function (patente) {
            verDocumentoValidar(PATENTE, 
                    patente.id(), 
                    patente.documentoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/documentoPatenteValidar/' + patente.id(),
                    "Patente",
                    patente.descripcion()
            );
        };

        self.validarDocumentoProductoConocimiento = function (productoConocimiento) {
            verDocumentoValidar(PRODUCTO_CONOCIMIENTO, 
                    productoConocimiento.id(), 
                    productoConocimiento.documentoValidado(), 
                    '${pageContext.request.contextPath}/hojasVida/documentoProductoConocimientoValidar/' + productoConocimiento.id(),
                    "Producción",
                    productoConocimiento.descripcion()
            );
        };
        
        self.validarDocumentoSoporteInvestigacion = function (documentoSoporte) {
            verDocumentoValidar(PROPUESTA_INVESTIGACION, 
                    documentoSoporte.id(), 
                    documentoSoporte.validado(), 
                    '${pageContext.request.contextPath}/hojasVida/documentoSoporteValidar/' + documentoSoporte.id(),
                    "Cédula",
                    cedula
            );
        };

    };

    function verDocumentoValidar (tipoValidacion, id, validado, urlVisor, titulo, valor, experienciaExtension) {
        if(validado) {
          $('#btnValidadoSi').removeClass('notActive').addClass('active');  
          $('#btnValidadoNo').removeClass('active').addClass('notActive');
        } else {
          $('#btnValidadoNo').removeClass('notActive').addClass('active');  
          $('#btnValidadoSi').removeClass('active').addClass('notActive');  
        }
        $("#divExperienciaExtension").hide();
        if(tipoValidacion == EXPERIENCIA_LABORAL) {
           $("#divExperienciaExtension").show();
           if(experienciaExtension) {
             $('#btnExperienciaExtensionSi').removeClass('notActive').addClass('active');  
             $('#btnExperienciaExtensionNo').removeClass('active').addClass('notActive');
           } else {
             $('#btnExperienciaExtensionNo').removeClass('notActive').addClass('active');  
             $('#btnExperienciaExtensionSi').removeClass('active').addClass('notActive');  
           }
        }
        $('#titulo').text(titulo);
        $('#valor').val(valor);
        $('#tipoDocumento').val(tipoValidacion);
        $('#idDocumento').val(id);
        $('#visorDocumento').attr("src", urlVisor)
        $('#md_validar_soporte').modal({backdrop: 'static', keyboard: false});
    }

    function cargarDocumentosSoporteComplementariosValidar(documentosSoporteComplementariosValidar) {
        datosModel.documentosSoporteComplementariosValidar.removeAll();
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
    
    function cargarProdcutosConocimiento(productosConocimiento) {
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

    function cargarPropuestasInvestigacion(documentosSoporteInvestigacion) {
        datosModel.documentosSoporteInvestigacion.removeAll();
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

    var hojasVida = [];
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
    
    var datosModel = new DatosModel(hojasVida, 
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