<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">         
    <div class="container"> 
        <div  style="margin-top:30px;">
            <ul class="list-inline">
                <li><button  id="btnpersonal" class="btn btn-success">Informaci&oacute;n personal</button></li>
                <li><button  id="btnacademico" class="btn btn-success">Aspectos acad&eacute;micos</button></li>
                <li><button  id="btnexperiencia" class="btn btn-success">Experiencia laboral</button></li>
                <li><button id="btndist" class="btn btn-success">Distinciones</button></li>
                <li><button id="btnpubli" class="btn btn-success">Publicaciones</button></li>
            </ul>
        </div>
        <div id="formpersonal">
            <form>
                <!-- FILA 1 FROMULARIO-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_tipo_id">Tipo de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de identificaciÃ³n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_tipo_id" id="pe_tipo_id" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_numero_id">N&uacute;mero de identificaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de identificaciÃ³n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                            <input type="text" class="form-control" name="pe_numero_id" id="pe_numero_id">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_fechaexpedicion">Fecha de expedici&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de expediciÃ³n">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control fecha2" name="pe_fechaexpedicion" />
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_lugar_expedicion">Lugar de expedici&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el lugar de expediciÃ³n ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_lugar_expedicion" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 1 FROMULARIO-->
                <!-- FILA 2 FROMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_nombres">Nombres</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su nombre completo ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <input type="text" class="form-control" name="pe_nombres">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_apellidos">Apellidos</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el apellido completo">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <input type="text" class="form-control" name="pe_apellidos">
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 2 FROMULARIO-->
                <!-- FILA 3 FROMULARIO-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_sexo">Sexo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger el sexo que perteneces">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <label for="pe_sexo">
                                <input type="radio" name="pe_sexo" value="F" id="pe_sexo_0">
                                Femenino</label>

                            <label for="pe_sexo">
                                <input type="radio" name="pe_sexo" value="M" id="pe_sexo_1">
                                Masculino</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_FechaNac">Fecha de nacimiento</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de nacimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control fecha2" name="pe_FechaNac" />
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_lugarNac">Lugar de nacimiento</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el lugar de nacimiento">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_lugarNac" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="pe_nacionalidad">Nacionalidad</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la nacionalidad">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_nacionalidad" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 3 FROMULARIO-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Libreta militar</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de libreta militar">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <input type="text" class="form-control" name="pe_libretamilitar" id="pe_libretamilitar">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Distrito -- clase</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el numero de distrito y su clase de la libreta militar">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <input type="text" class="form-control" name="pe_distritoclase" id="pe_distritoclase">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_ciudad_residencia">Ciudad de residencia </label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la ciudad de residencia">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_ciudad_residencia" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- FILA 4 FROMULARIO-->
                <div class="row">

                    <div class="col-md-8">
                        <div class="form-group form-inline">
                            <label for="pe_direccion">Direcci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la direccion">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>     
                            <input type="text" class="form-control" name="pe_direccion" id="pe_direccion" style="width: 80%" readonly><button type="button" class="btn btn-success btn-sm" data-target="#md_direccion" data-toggle="modal" style="margin-left: 10px;"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="md_direccion" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar direcci&oacute;n</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row" >
                                    <div class="col-md-12">
                                        <div class="form-group form-inline">
                                            <label for="id_idioma">Tipo de direcci&oacute;n</label>
                                            <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
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
                                                    <option value="Calle">Calle</option>
                                                    <option value="Carrera">Carrera</option>
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
                                                    <option value="--">--</option>
                                                    <option value="sur">Sur</option>
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
                                                    <option value="--">--</option>
                                                    <option value="este">este</option>
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
                                            <input type="text" class="form-control" id="vistaprevia">
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
                            <label for="pe_grupo_etnico">Grupo &eacute;tnico </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el grupo etnico que pertenece">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                            <select name="pe_ciudad_residencia" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_discapacidad">Posee alguna discapacidad</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de discapacidad">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_ciudad_residencia" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 5 FROMULARIO-->
                <!-- FILA 6 FROMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_dispone_rut">Tiene RUT</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger tienes RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <label for="pe_dispone_rut">
                                <input type="radio" name="pe_dispone_rut" value="Si" id="pe_dispone_rut_0">
                                Si</label>

                            <label for="pe_dispone_rut">
                                <input type="radio" name="pe_dispone_rut" value="No" id="pe_dispone_rut_1">
                                No</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_actividad_economica">Actividad econ&oacute;mica del RUT</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad economica del RUT">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <select name="pe_actividad_economica" class="js-select-basic-single js-states form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- FIN FILA 6 FROMULARIO-->
                <!-- FILA 7 FROMULARIO-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_disponibilidad_viajar">Â¿Tiene disponibilidad para trabajar en otras regiones del pa&iacute;s?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas en disponible para trabajar en otras regiones del paÃ­s">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <label for="pe_disponibilidad_viajar">
                                <input type="radio" name="pe_disponibilidad_viajar" value="Si" id="pe_disponibilidad_viajar_0">
                                Si</label>

                            <label for="pe_disponibilidad_viajar"><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de identificaciÃ³n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                <input type="radio" name="pe_disponibilidad_viajar" value="No" id="pe_disponibilidad_viajar_1">
                                No</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pe_disp_viajar_bogota">Â¿Tiene disponibilidad para trabajar en Bogot&aacute;?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas en disponible apra trabajar en bogotÃ¡">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                            <label for="pe_disp_viajar_bogota">
                                <input type="radio" name="pe_disp_viajar_bogota" value="Si" id="pe_disp_viajar_bogota_0">
                                Si</label>

                            <label for="pe_disp_viajar_bogota">
                                <input type="radio" name="pe_disp_viajar_bogota" value="No" id="pe_disp_viajar_bogota_1">
                                No</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="pe_perfil">Perfil laboral y profesional</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el perfil laboral y profesional ">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                            <textarea class="form-control" name="pe_perfil">                                    
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label>Agregar Telef&oacute;no</label>
                        <button style="margin-bottom: 20px;" type="button" class="btn btn-success btn-sm" data-target="#md_telefono" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>

                        <table class="table table-hover" id="tbtel">
                            <thead>
                            <th>Tipo</th>
                            <th>N&uacute;mero</th>
                            <th></th>
                            </thead>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <label>Agregar correo electr&oacute;nico</label>
                        <button style="margin-bottom: 20px;" type="button" class="btn btn-success btn-sm" data-target="#md_email" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button> 


                        <table class="table table-hover" id="tbemail">
                            <thead>
                            <th>Email</th>
                            <th></th>                                         
                            </thead>
                        </table>
                    </div>
                    <div class="col-md-5">
                        <label>Agregar idioma</label>
                        <button style="margin-bottom: 20px;" type="button" class="btn btn-success btn-sm" data-target="#md_idioma" data-toggle="modal" >
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>                  

                        <table class="table table-hover" id="tbidiomas">
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
                <!-- Fin Cuerpo-->
                <!--  CONTENIDOS MODALES -->
                <!--  MODAL IDIOMA -->
                <div class="modal fade" id="md_idioma" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar idioma</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row" >
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="id_idioma">Idioma</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar su idioma">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <select style="width: 100%;" name="id_idioma" id="id_idioma" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="ingles">Ingl&eacute;s</option>
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
                                                <option></option>
                                                <option value="bien">bien</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id_habla">Nivel de habla</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de habla">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br> 
                                            <select style="width: 100%;" name="id_habla" id="id_habla" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="bien">bien</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id_escritura">Nivel de escritura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el nivel de escritura">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <select style="width: 100%;" name="id_escritura" id="id_escritura" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="bien">bien</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id_lectura">Nivel de lectura</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cial es el nivel de lectura">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <select style="width: 100%;" name="id_lectura" id="id_lectura" class="js-select-basic-single js-states form-control">
                                                <option></option>
                                                <option value="bien">bien</option>
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
                <!--  MODAL EMAIL -->
                <div class="modal fade" id="md_email" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar correo electr&oacute;nico</h4>
                            </div>
                            <div class="row" style="margin:20px;">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="email">Nombre del correo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su correo">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                        <input name="email" id="email" type="text" class="form-control">

                                    </div>
                                </div>                  
                            </div>


                            <div class="modal-footer">
                                <input type="hidden" name="email_persona">
                                <button type="button" class="btn btn-success"  id="addemail">Agregar</button>
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
                            <div class="modal-header">


                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar telef&oacute;no</h4>
                            </div>
                            <div class="row" style="margin:20px;">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="tel_tipo">Tipo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de numero telefonica">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>
                                        <select name="tel_tipo" id="tel_tipo" class="js-select-basic-single js-states form-control" style="width: 100%;">
                                            <option></option>
                                            <option value="celular">Celular</option>
                                            <option value="telefono">Telefono</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_habla">N&uacute;mero</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar su numero ">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br> 
                                        <input type="text" name="tel_numero" id="tel_numero" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="tel_persona">
                                <button type="button" class="btn btn-success"  id="addtel">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>
                <button class="btn btn-success" style="float: right; margin-bottom:20px; ">Guardar</button>
            </form>
        </div>
        <div id="formacademico" style="display: none;"> 
            </br>
            <label>Agregar estudios t&eacute;cnicos&nbsp;</label>
            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_aspesttecnicos" data-toggle="modal" >
                <span class="glyphicon glyphicon-plus"></span>   
            </button>
            <form>
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
                <label>Agregar estudios tecnol&oacute;gicos</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_asesttecnologico" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
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
                <label>Agregar estudios profesionales</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_asestprofesional" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbprofesional">
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
                <label>Agregar estudios de posgrado</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_asestposgrados" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbestposgrados">
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
                <label>Agregar otros estudios</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_aspestotros" data-toggle="modal" >
                    <span class="glyphicon glyphicon-plus"></span>
                </button>				
                <div class="table-responsive">
                    <table class="table table-hover tableestilo" id="tbestotros">
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

                <!--MODAL ASPECTOS academicos modal estudio tecnicos-->
                <div class="modal fade" id="md_aspesttecnicos" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar estudios t&eacute;cnicos</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="est_nivel" id="est_nivel" value="Tecnico">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Ingenieria">Ingenieria</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="ITM">Itm</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">Fecha de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_inicio" id="est_anio_inicio" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_fin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaciÃ³n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_fin" id="est_anio_fin" style="display: inline;width: 80%;margin-right: -5px;" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de tÃ­tutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de t&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
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
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">Â¿Est&aacute;s estudiando?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando" value="Si" id="pe_dispone_rut_0">
                                                Si</label>

                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando" value="No" id="pe_dispone_rut_1">
                                                No</label>
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
                </div><!--fin modal aspectos academicos modal estudios tecnicos-->
                <!--modal aspectos academicos modal estudios tecnologicos-->
                <div class="modal fade" id="md_asesttecnologico" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar estudios tecnol&oacute;gicos</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="est_nivel" id="est_nivel2" value="Tecnologia">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber2" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Ingenieria">IngenierÃ­a</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa2" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="ITM">Itm</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado2">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">Fecha de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_inicio" id="est_anio_inicio2" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_fin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaciÃ³n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_fin" id="est_anio_fin2" style="display: inline;width: 80%;margin-right: -5px;" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de tÃ­tutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido2">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de t&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 

                                            <input type='text' class="form-control fecha input-sm" name="est_fecha_titulo" id="est_fecha_titulo2" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_certificado">Certificado</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debesubir el certificado del estudion">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" class="form-control" name="es_certificado" id="es_certificado2">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">Â¿Est&aacute;s estudiando?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando2" value="Si" id="pe_dispone_rut_0">
                                                Si</label>

                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando2" value="No" id="pe_dispone_rut_1">
                                                No</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addesttecnologia">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios tecnologia-->
                <!--MODAL ASPECTOS academicos modal estudio profesional-->
                <div class="modal fade" id="md_asestprofesional" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar estudios profesionales</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="est_nivel" id="est_nivel3" value="Profesional">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber3" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Ingenieria">Ingenieria</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa3" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="ITM">Itm</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado3">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">Fecha de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_inicio" id="est_anio_inicio3" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_fin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaciÃ³n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_fin" id="est_anio_fin3" style="display: inline;width: 80%;margin-right: -5px;" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de tÃ­tutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido3">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de t&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 

                                            <input type='text' class="form-control fecha input-sm" name="est_fecha_titulo" id="est_fecha_titulo3" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="ep_certificado">Certificado</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debesubir el certificado del estudion">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type="file" class="form-control" name="es_certificado" id="es_certificado3">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">Â¿Est&aacute;s estudiando?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando3" value="Si" id="pe_dispone_rut_0">
                                                Si</label>

                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando3" value="No" id="pe_dispone_rut_1">
                                                No</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addestprofesional">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios profesional-->
                <!--MODAL ASPECTOS academicos modal estudio posgrados-->
                <div class="modal fade" id="md_asestposgrados" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar estudios posgrados</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="est_nivel" id="est_nivel4" value="Posgrado">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label> <a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber4" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Ingenieria">Ingenieria</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa4" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="ITM">Itm</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado4">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">Fecha de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_inicio" id="est_anio_inicio4" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_fin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaciÃ³n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_fin" id="est_anio_fin4" style="display: inline;width: 80%;margin-right: -5px;" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de tÃ­tutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido4">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de t&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 

                                            <input type='text' class="form-control fecha input-sm" name="est_fecha_titulo" id="est_fecha_titulo4" style="display: inline;width: 80%;margin-right: -5px;"/>
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
                                            <input type="file" class="form-control" name="es_certificado" id="es_certificado4">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">Â¿Est&aacute;s estudiando?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando4" value="Si" >
                                                Si</label>

                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando4" value="No" >
                                                No</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addestpsogrados">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios posgrados-->
                <!--MODAL ASPECTOS academicos modal estudio otros-->
                <div class="modal fade" id="md_aspestotros" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Agregar estudios otros</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <input type="hidden" name="est_nivel" id="est_nivel5" value="otros estudios">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_area_saber">&Aacute;rea de estudio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es el area del estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_area_saber" id="est_area_saber5" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="Ingenieria">Ingenieria</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_institucion_educativa">Instituci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la institucion que estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <select style="width: 100%;" name="est_institucion_educativa" id="est_institucion_educativa5" class="js-select-basic-single js-states form-control">
                                                <option value=""></option>
                                                <option value="ITM">Itm</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_programa_cursado">Programa cursado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre del programa cursado">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_programa_cursado" id="est_programa_cursado5">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_inicio">Fecha de inicio </label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_inicio" id="est_anio_inicio5" style="display: inline;width: 80%;margin-right: -5px;"/>
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="est_anio_fin">Fecha de finalizaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaciÃ³n">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                            <input type='text' class="form-control fecha input-sm" name="est_anio_fin" id="est_anio_fin5" style="display: inline;width: 80%;margin-right: -5px;" />
                                            <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar" ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="est_titulo_obtenido">T&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de tÃ­tutlo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  
                                            <input type="text" class="form-control" name="est_titulo_obtenido" id="est_titulo_obtenido5">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label for="est_fecha_titulo">Fecha de t&iacute;tulo obtenido</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de titulo obtenido">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a> 

                                            <input type='text' class="form-control fecha input-sm" name="est_fecha_titulo" id="est_fecha_titulo5" style="display: inline;width: 80%;margin-right: -5px;"/>
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
                                            <input type="file" class="form-control" name="es_certificado" id="es_certificado5">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="est_estudiando">Â¿Est&aacute;s estudiando?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger estas en estudio">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i></a>  <br>
                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando5" value="Si" >
                                                Si</label>

                                            <label for="est_estudiando">
                                                <input type="radio" name="est_estudiando" id="est_estudiando5" value="No" >
                                                No</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="id_persona">
                                    <button type="button" class="btn btn-success" id="addestotros">Agregar</button>
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>              
                        </div>
                    </div>
                </div><!--fin modal aspectos academicos modal estudios otros-->
            </form>
        </div> <!--Agregado-->

        <div id="formexperiencia" style="display: none;">
            </br>		
            <label>Agregar experiencia</label>
            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_expdocsalud" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
            <br>	
            <label for="">Experiencia docencia en salud</label>	
            <div class="table-responsive">
                <table class="table table-hover tableestilo" id="tbexpdocsal">
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>

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


            <label for="">Experiencia laboral en Salud</label>	
            <div class="table-responsive">
                <table class="table table-hover" id="tbexplabsal">
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>


            <label for="">Experiencia laboral en otras &aacute;reas</label>
            <div class="table-responsive">
                <table class="table table-hover" id="tbexplab">
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>


            <label for="">Experiencia en proyectos de investigaci&oacute;n</label>
            <div class="table-responsive">
                <table class="table table-hover tableestilo" id="tbexpinv">
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>      
            <label for="">Experiencia en proyectos de extensi&oacute;n</label>
            <div class="table-responsive">
                <table class="table table-hover tableestilo" id="tbexpext">
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>	

            <!--MODAL Experiencia docencia en salud-->
            <div class="modal fade" id="md_expdocsalud" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Agregar experiencia docencia en salud</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="ep_tipoexperiencia">Tipo de experiencia</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de experiencia">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ep_tipoexperiencia" id="ep_tipoexperiencia" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="Profesional">Profesional</option>
                                            <option value="Docencia">Docencia</option>
                                            <option value="Proyectos de investigacion">Proyectos de investigaci&oacute;n</option>
                                            <option value="Proyectos de extension">Proyectos de extensi&oacute;n</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="ep_tipo_exp">&Aacute;rea</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el area">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ep_tipo_exp" id="ep_tipo_exp" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="Salud">Salud</option>
                                            <option value="Educacion">Educaci&oacute;n</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="ep_tipo_contrato">Tipo de contrato</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de contrato">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <select style="width: 100%;" name="ep_tipo_contrato" id="ep_tipo_contrato" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="prestacion de servicio">prestacion de servicio</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_tipo_empresa">Tipo de empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de empresa">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ep_tipo_empresa" id="ep_tipo_empresa" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="Privada">Privada</option>
                                            <option value="P&uacute;blica">P&uacute;blica</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_actividad_economica">Actividad econ&oacute;mica</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar cual es la actividad econÃ³mica">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <select style="width: 100%;" name="ep_actividad_economica" id="ep_actividad_economica" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="apoyo integracion"> Apoyo integracion</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_nombre_empresa">Nombre de empresa</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de empresa">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="text" class="form-control" name="ep_nombre_empresa" id="ep_nombre_empresa">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_dedicacion">Dedicaci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar la dedicaciÃ³n">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ep_dedicacion" id="ep_dedicacion" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="profesor">Medio tiempo</option>
                                            <option value="profesor">Tiempo completo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_cargo">Cargo</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar cual es su cargo">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <input type="text" class="form-control" name="ep_cargo" id="ep_cargo">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ep_cargo_equivalente">cargo equivalente</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el cargo equivalente">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="ep_cargo_equivalente" id="ep_cargo_equivalente" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="sal">sal</option>
                                        </select>
                                    </div>
                                </div>
                            </div>                               
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ep_fechaingreso">Fecha de ingreso</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de ingreso">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <input type='text' class="form-control fecha input-sm" style="display: inline;width: 80%;margin-right: -5px;" name="ep_fechaingreso" id="ep_fechaingreso" />
                                        <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ep_fecharetiro">Fecha de retiro</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de retiro">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type='text' class="form-control fecha input-sm" style="display: inline;width: 80%;margin-right: -5px;" name="ep_fecharetiro" id="ep_fecharetiro" />
                                        <span class="input-group-addon" style="display: inline;"><span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="ep_actual">Trabajo actual?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que si estas trabajando actual">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                        <label for="ep_actual">
                                            <input type="radio" name="ep_actual" value="Si" id="ep_actual">
                                            Si</label>

                                        <label for="ep_actual">
                                            <input type="radio" name="ep_actual" value="No" id="ep_actual">
                                            No</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="ep_exp_fnsp">En la Facultad Nacional Salud p&uacute;blica?</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe escoger que estas trabajando en la Facultad nacional salud pÃºblica">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> <br>

                                        <input type="checkbox" value="si" name="ep_exp_fnsp" id="ep_exp_fnsp2">Si
                                        <input type="checkbox" value="no" name="ep_exp_fnsp" id="ep_exp_fnsp3">No

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="ep_certificado">Certificado-soporte</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe subir el certificado">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="file" class="form-control" name="ep_certificado" id="ep_certificado">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id_persona">
                            <button type="button" class="btn btn-success" id="addexpdocsalud">Agregar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>              
                </div>
            </div>
            <!--Fin modal experiencia docencia en salud-->
        </div>

        <div id="formdistin" style="display: none;">
            <br>
            <label>Agregar distinci&oacute;n</label>
            <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_distincion" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
            <br>
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
            <br>                

            <!--modal distincion-->

            <div class="modal fade" id="md_distincion" role="dialog">
                <div class="modal-dialog modal-md">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Agregar distinci&oacute;n</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" name="iddistincion" id="iddistincion" value="253">
                                <input type="hidden" name="Fecharegistro" id="fechaactual">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="ep_tipoexperiencia">Persona</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar persona">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="dist_persona" id="dist_persona" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="JuanFernando">Juan Fernando alvarez</option>
                                            <option value="Alejandro">Alejandro</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="dist_institucion_otorga">Instituci&oacute;n otorga</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nombre de instituci&oacute;n">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="dist_institucion_otorga" id="dist_institucion_otorga" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="Celestin">Celestin Freinet</option>
                                            <option value="Canadiense">Instituci&oacute;n</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="ep_tipo_contrato">Descripci&oacute;n</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de contrato">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a>
                                        <textarea class="form-control" id="dist_descripcion" name="dist_descripcion" >
                                                
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="ep_tipo_empresa">Certificado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de empresa">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="file" name="pdc_certiifcado" id="pdc_certiifcado">
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
        <div id="formpublicacion" style="display: none;">
            <div class="form-group">
                <br>
                <label>Agregar publicaci&oacute;n</label>
                <button style="margin-left: 10px;" type="button" class="btn btn-success btn-sm" data-target="#md_publicacion" data-toggle="modal" ><span class="glyphicon glyphicon-plus"></span></button>
                <br>
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
            <!-- modal publicacion-->
            <div class="modal fade" id="md_publicacion" role="dialog">
                <div class="modal-dialog modal-md">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Agregar publicaci&oacute;n</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" name="Fecharegistro" id="fechaactual2">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="publi_persona">Persona</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar persona">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <select style="width: 100%;" name="publi_persona" id="publi_persona" class="js-select-basic-single js-states form-control">
                                            <option></option>
                                            <option value="JuanFernando">Juan Fernando alvarez</option>
                                            <option value="Alejandro">Alejandro</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="publi_cvlac_url">URL</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el nombre de instituci&oacute;n">
                                            <i class="fa fa-question-circle" aria-hidden="true"></i></a> 
                                        <input type="text" name="publi_cvlac_url" id="publi_cvlac_url" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-success" id="addpubli">Agregar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>              
                    </div>
                </div>                
            </div><!--fin de modal publicacion-->
        </div>
        <!--</div>-->     
    </div>
</div>
<script src='<c:url value="/resources/js/hojadevida.js" />' type="text/javascript"></script>