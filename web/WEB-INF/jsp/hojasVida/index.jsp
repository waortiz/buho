<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">         
    <div class="container">
        <legend>Consulta de hoja de vida</legend>
        <div class="table-responsive">
            <table class="table table-hover tableestilo" id="tbconhojavida">
                <thead>
                    <tr>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="cedinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="nomapeinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="fecnacinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="telinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="niedinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="expinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="disinput"></td>
                        <td><input type="text" class="form-control input-sm" placeholder="Buscar" id="pubinput"></td>
                    </tr>
                    <tr>
                        <th>C&eacute;dula</th>
                        <th>Nombre y apellidos</th>
                        <th>Fecha de nacimiento</th>
                        <th>Telef&oacute;no</th>
                        <th>Nivel educativo</th>
                        <th>Experiencia</th>
                        <th>Distincion</th>
                        <th>Publicacion</th>
                        <th></th>
                    </tr>
                </thead>
                <tr>
                    <td>141235123</td>
                    <td>Juan Camilo Monsalve </td>
                    <td>04/05/1993</td>
                    <td>3994955</td>
                    <td>Profesional</td>
                    <td>ITM</td>
                    <td>liand</td>
                    <td>loinsd</td>                    
                    <td style='white-space: nowrap'><button type="button" class="btn btn-success btn-xs" style="margin-right: 10px;" data-toggle="modal" data-target="#md_ver">Ver</button><button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#md_edicion" style="margin-right: 5px;" ><i class="fa fa-pencil" aria-hidden="true"></i></button><button type='button'  id='btnborrar' class='btn btn-danger btn-xs'><span id='btnbo' class='glyphicon glyphicon-remove'></span></button></td>
                </tr>
                <tr>
                    <td>7869234</td>
                    <td>Daniel luis osorio </td>
                    <td>06/12/1978</td>
                    <td>7582839</td>
                    <td>Tecnologo</td>
                    <td>UPB</td>
                    <td>asdas</td>
                    <td>frasd</td>                    
                    <td style='white-space: nowrap'><button type="button" class="btn btn-success btn-xs" style="margin-right: 10px;" data-toggle="modal" data-target="#md_ver">Ver</button><button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#md_edicion" style="margin-right: 5px;" ><i class="fa fa-pencil" aria-hidden="true"></i></button><button type='button'  id='btnborrar' class='btn btn-danger btn-xs'><span id='btnbo' class='glyphicon glyphicon-remove'></span></button></td>
                </tr>
            </table>
        </div>
    </div>
</div>  
</div>
<!--modal ver -->
<div class="modal fade" id="md_ver" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-address-card-o" aria-hidden="true" style="margin-right: 5px;"></i>Informacion de Hoja de vida</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 form-group form-inline">
                        <button class="btn btn-success btn-sm" id="btnpersonal">Informaci&oacute;n personal</button>
                        <button class="btn btn-success btn-sm" id="btnacademico">Aspectos acad&eacute;micos</button>
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
                                <input type="text" style="border: 0px; text-align: right;"  value="MedellÃ­n">
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
                                <input type="text" style="border: 0px; text-align: right;"  value="MedellÃ­n">
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
                                <label for="">DirecciÃ³n</label><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="calle 45 a 56 - 56">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Ciudad de residencia</label><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="itagÃ¼i">
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
                                <label for="">Disponibilidad para trabajar en BogotÃ¡</label><br>
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
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Tipo</th>
                                    <th>N&uacute;mero</th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="">Correo electr&oacute;nico</label>
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Email</th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="">Idioma</label>

                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Idioma</th>
                                    <th>Lectura</th>
                                    <th>Escritura</th>
                                    <th>Habla</th>
                                    <th>Certificado</th>
                                    </thead>
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
<!--fin de modal ver-->
<!--modal editar de hoja de vida -->
<div class="modal fade" id="md_edicion" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-address-card-o" aria-hidden="true" style="margin-right: 5px;"></i>Informacion de Hoja de vida</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 form-group form-inline">
                        <button class="btn btn-success btn-sm" id="btnpersonal2">Informaci&oacute;n personal</button>
                        <button class="btn btn-success btn-sm" id="btnacademico2">Aspectos acad&eacute;micos</button>
                        <button class="btn btn-success btn-sm" id="btnexperiencia2">Experiencia laboral</button>
                        <button class="btn btn-success btn-sm" id="btndist2">Distinci&oacute;n</button>
                        <button class="btn btn-success btn-sm" id="btnpubli2">Publicaci&oacute;n</button>
                    </div>
                </div>
                <div id="formpersonal2">                                 
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Tipo de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de identificaciÃ³n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="C&eacute;dula de ciudadania">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de identificaciÃ³n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="15123123">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Fecha de expedici&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de expediciÃ³n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="5/07/2017">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Lugar de expedici&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el lugar de expediciÃ³n ">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                <input type="text" style="border: 0px; text-align: right;"  value="MedellÃ­n">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Nombre</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su nombre completo ">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="Daniel Esteban">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Apellido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el apellido completo">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                <input type="text" style="border: 0px; text-align: right;"  value="Monsalve Garcia">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Sexo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger el sexo que perteneces">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="Masculino">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Fecha de nacimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de nacimiento">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="5/07/2017">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Lugar de nacimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el lugar de nacimiento">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="MedellÃ­n">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Nacionalidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la nacionalidad">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="Colombiano">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Libreta Militar</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de libreta militar">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="5123125">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Distrito -- Clase</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de distrito y su clase de la libreta militar">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="48 -- Segunda">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">DirecciÃ³n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la direccion">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="calle 45 a 56 - 56">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Ciudad de residencia</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la ciudad de residencia">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                <input type="text" style="border: 0px; text-align: right;"  value="itagÃ¼i">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Grupo &eacute;tnico</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el grupo etnico que pertenece">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="No">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Discapacidad</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de discapacidad">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                <input type="text" style="border: 0px; text-align: right;"  value="no">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">RUT</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger tienes RUT">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="si">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Actividad economica del RUT</label>
                                <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad economica del RUT">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="ujde">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Disponibilidad para trabajar en otras regiones</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas en disponible para trabajar en otras regiones del paÃ­s">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="no">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Disponibilidad para trabajar en BogotÃ¡</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas en disponible apra trabajar en bogotÃ¡">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" style="border: 0px; text-align: right;"  value="no">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Perfil laboral y profesional</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el perfil laboral y profesional ">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <textarea style="border: 0;width: 95%;" id="con_descripcion" >
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo           consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </textarea>   
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="">Telefono</label>
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Tipo</th>
                                    <th>N&uacute;mero</th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="">Correo electr&oacute;nico</label>
                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Email</th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="">Idioma</label>

                            <div class="table-responsive">
                                <table class="table table-hover tableestilo">
                                    <thead>
                                    <th>Idioma</th>
                                    <th>Lectura</th>
                                    <th>Escritura</th>
                                    <th>Habla</th>
                                    <th>Certificado</th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="formacademico2" style="display: none;">
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
                                            <th>InstituciÃ³n</th>
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
                <div id="formexperiencia2" style="display: none;">
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
                <div id="formdistin2" style="display: none;">
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
                <div id="formpublicacion2" style="display: none;">
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
                <button type="button" class="btn btn-success">Guardar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </div>
</div>
<!--fin de modal editar-->
<!-- jQuery -->
<script src='<c:url value="/resources/js/consultahojadevida.js" />' type="text/javascript"></script>
