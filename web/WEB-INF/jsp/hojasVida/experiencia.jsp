<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">         
    <div class="container">
        <legend>Consulta de hoja de vida por tiempo de experiencia</legend>
        <div class="row">
             <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Tiempo de experiencia en docencia</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nivel de estudio">
                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <input type='text' class="form-control input-sm" id="tiempoExperienciaDocencia" maxlength="5">
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarTiempoExperienciaDocencia()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Tiempo de experiencia laboral</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el núcleo básico de conocimiento">
                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <input type='text' class="form-control input-sm" id="tiempoExperienciaLaboral" maxlength="5">
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarTiempoExperienciaLaboral()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-inline">
                    <label>Tiempo de experiencia profesional</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la duración">
                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                    <input type='text' class="form-control input-sm" id="tiempoExperienciaProfesional" maxlength="5">
                    <button type="button" class="btn btn-danger btn-sm" onclick="limpiarTiempoExperienciaProfesional()"><span class="glyphicon glyphicon-remove-sign"></span></button> 
                </div>
            </div>            
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tblHojasVida">
                        <thead>
                            <tr>
                                <th>C&eacute;dula</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Tiempo de experiencia en docencia</th>
                                <th>Tiempo de experiencia laboral</th>
                                <th>Tiempo de experiencia profesional</th>
                                <th class='opc'>Opciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <div id="divDescargar" style="display: none;" align="center">
            <center><label>Descargar listado</label><button class="btn btn-success " id="btnDescargar" onclick="descargar()" style="margin-left: 10px"><i class="fa fa-download"></i></button></center>
        </div>
        <div id="formHV" style="display: none;">
            <div class="container">
                <legend><center><h3>Hoja de vida</h3></center></legend>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Informaci&oacute;n personal
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 500px;">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo de identificaci&oacute;n</label>
                                    <input type="text" style="border: 0px;" readonly  id="tipoIdentificacion">
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Identificaci&oacute;n</label>
                                    <input type="text" style="border: 0px;" readonly  id="numeroIdentificacion">
                                    <input type="hidden" id="idPersona" name="idPersona" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Fecha de expedici&oacute;n</label>
                                    <input type="text" style="border: 0px;" readonly  id="fechaExpedicion">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Lugar de expedici&oacute;n</label>
                                    <input type="text" style="border: 0px;" readonly  id="lugarExpedicion">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Nombres</label>
                                    <input type="text" style="border: 0px;" readonly  id="nombres">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Apellidos</label>
                                    <input type="text" style="border: 0px;" readonly  id="apellidos">
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Sexo</label>
                                    <input type="text" style="border: 0px;" readonly  id="sexo">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Fecha de nacimiento</label>
                                    <input type="text" style="border: 0px;"  id="fechaNacimiento" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Lugar de nacimiento</label>
                                    <input type="text" style="border: 0px;"  id="lugarNacimiento" readonly>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Nacionalidad</label>
                                    <input type="text" style="border: 0px;"  id="nacionalidad" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Libreta Militar</label>
                                    <input type="text" style="border: 0px;"  id="libretaMilitar" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Distrito -- Clase</label>
                                    <input type="text" style="border: 0px;"  id="distritoClase" readonly>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Direcci&oacute;n</label><br>
                                    <input type="text" style="border: 0px; width: 100%;" id="direccion" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Ciudad de residencia</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="ciudadResidencia" readonly>
                                </div>
                            </div>
                            <div class="col-md-2" >
                                <div class="form-group">
                                    <label for="">Grupo &eacute;tnico</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="grupoEtnico" readonly>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Discapacidad</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="discapacidad" readonly>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">RUT</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="disponeRUT" readonly>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Actividad economica del RUT</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="actividadEconomica" readonly>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Documento de soporte RUT</label><br>
                                    <a href='#' onclick="verCopiaRUT()" target='_black' title='Ver documento' class='btn btn-success btn-xs' type='button' style="margin-left: 70px;"><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Disponibilidad para trabajar por fuera de Medell&iacute;n</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="disponibilidadViajar" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Egresado de la U de A</label><br>
                                    <input type="text" style="border: 0px; width: 100%;"  id="egresadoUDEA" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Empleado de la U de A</label><br>
                                    <input type="text" style="border: 0px; width: 100%;" id="empleadoUDEA" readonly>
                                </div>
                            </div> 
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo de vinculacion</label><br>
                                    <input type="text" style="border: 0px; width: 100%;" id="tipoVinculacion" readonly>
                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Perfil laboral y profesional</label>
                                <textarea class="form-control" style="border: 0px; background: white;" id="perfil" readonly></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Telef&oacute;no</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbtel">
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
                            <div class="col-md-6">
                                <label>Correo electr&oacute;nico</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbemail">
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Documentos de soporte (foto,certificados bancarios, EPS, ARL y AFP entre otros)
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 200px;">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbdocad">
                                        <thead>
                                        <th>Tipo de documento</th>
                                        <th>Documento de soporte</th>
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Aspectos acad&eacute;micos
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 500px;">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Estudios educaci&oacute;n b&aacute;sica&nbsp;</label>
                                <div class="table-responsive">
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
                        <div class="row">
                            <div class="col-md-12">
                                <label>Estudios educaci&oacute;n superior</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestedbas">
                                        <thead>
                                            <tr>
                                                <th>Nivel de estudio</th>
                                                <th>Instituci&oacute;n</th>
                                                <th>Programa cursado</th>
                                                <th>Fecha de titulo</th>
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
                        <div class="row">
                            <div class="col-md-12">
                                <label>Estudios idiomas</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbestedbas">
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Educaci&oacute;n no formal
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 200px;">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Estudios educaci&oacute;n no formal</label>           
                                <div class="table-responsive">
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Experiencia laboral
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 400px;">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Experiencia laboral</label>
                                <div class="table-responsive">
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
                        <div class="row">
                            <div class="col-md-12">
                                <label>Experiencia docencia</label>
                                <div class="table-responsive">
                                    <table class="table table-hover tableestilo" id="tbexpdoc">
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Investigaci&oacute;n e innovaci&oacute;n
                    </div>
                    <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 500px;">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Investigador reconocido por Colciencias</label>
                                    <input type="text" style="border: 0px; width: 100%;" id="investigadorReconocidoColciencias" readonly>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Curriculum vitae de latinoamerica y el caribe (CVLAC)</label>
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
                                <legend style="margin-bottom: -10px;">Artículos y publicaciones relevantes</legend>
                                <div class="table-responsive">
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
                        <div class="row">
                            <div class="col-md-12">
                            <legend style="margin-bottom: -10px;">Patentes</legend>
                            <div class="table-responsive">
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
                        <div class="row">
                            <div class="col-md-12">
                             <legend style="margin-bottom: -10px;">Productos de conocimiento</legend>
                             <div class="table-responsive">
                             <table class="table tabla table-hover tableestilo" id="tbprodcono">
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
                <div class="panel panel-success">
                        <div class="panel-heading">
                            Distinciones, premios y reconocimientos
                        </div>
                        <div class="panel-body" style="overflow-y: scroll;overflow-x: scroll; max-height: 200px;">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
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
        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
  </div> 
  <script>
    function limpiarTiempoExperienciaDocencia() {
       $('#tiempoExperienciaDocencia').val("");
       buscarHojasVida(); 
    }

    function limpiarTiempoExperienciaLaboral() {
       $('#tiempoExperienciaLaboral').val("");
       buscarHojasVida(); 
    }

    function limpiarTiempoExperienciaProfesional() {
        $('#tiempoExperienciaProfesional').val("");
        buscarHojasVida(); 
    }

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
        
        $('#tiempoExperienciaDocencia').on('change', function () {
           buscarHojasVida(); 
        });
        
        $('#tiempoExperienciaLaboral').on('change', function () {
           buscarHojasVida(); 
        });
        
        $('#tiempoExperienciaProfesional').on('change', function () {
           buscarHojasVida(); 
        });
        
        $('#tiempoExperienciaDocencia').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        
        $('#tiempoExperienciaLaboral').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });

        $('#tiempoExperienciaProfesional').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
    });

    function buscarHojasVida() {
        $('#formHV').hide();
        $('#divDescargar').hide();
        if($('#tiempoExperienciaDocencia').val() == "" && $('#tiempoExperienciaLaboral').val() == "" && $('#tiempoExperienciaProfesional').val() == "") {
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
        formData.append("tiempoExperienciaDocencia", $('#tiempoExperienciaDocencia').val());
        formData.append("tiempoExperienciaLaboral", $('#tiempoExperienciaLaboral').val());
        formData.append("tiempoExperienciaProfesional", $('#tiempoExperienciaProfesional').val());
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/consultarHojasVidaExperiencia",
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
                            hojasVida[i].nombres,
                            hojasVida[i].apellidos,
                            getValue(hojasVida[i].tiempoExperienciaDocencia),
                            getValue(hojasVida[i].tiempoExperienciaLaboral),
                            getValue(hojasVida[i].tiempoExperienciaProfesional),
                            "<button class='btn btn-success btn-xs btnver' type='button' onclick='verHojaVida(" + hojasVida[i].idPersona + ")'>Ver</button>"
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
                url: "${pageContext.request.contextPath}/hojasVida/descargarHojasVidaExperiencia?tiempoExperienciaDocencia=" + $('#tiempoExperienciaDocencia').val() + "&tiempoExperienciaLaboral=" + $('#tiempoExperienciaLaboral').val() + "&tiempoExperienciaProfesional=" + $('#tiempoExperienciaProfesional').val(),
                processData: false,
                contentType: false,
                success: function (response) {
                    $('#md_descargar_resultados').modal('hide');
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/hojasVida/descargarHojasVidaExperiencia?tiempoExperienciaDocencia=" + $('#tiempoExperienciaDocencia').val() + "&tiempoExperienciaLaboral=" + $('#tiempoExperienciaLaboral').val() + "&tiempoExperienciaProfesional=" + $('#tiempoExperienciaProfesional').val();
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                   $('#md_descargar_resultados').modal('hide');
                }
            });
    }

    function verHojaVida(idPersona) {
        $('#formHV').show();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/hojasVida/datos/" + idPersona,
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
                    $("#nacionalidad").val(hojaVida.nombreNacionalidad);
                    $("#fechaNacimiento").val(hojaVida.fechaNacimientoFormateada);
                    $("#lugarNacimiento").val(hojaVida.nombreLugarNacimiento);
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

    function verCopiaRUT() {
        $.ajax({
            type: "GET",
              url: "${pageContext.request.contextPath}/hojasVida/copiaRUT/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
                if (response != "") {
                    window.location.href = "${pageContext.request.contextPath}/hojasVida/copiaRUT/" + $('#idPersona').val();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {

            }
        });
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