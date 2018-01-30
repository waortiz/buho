<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido">
    <div class="container"> 

        <!-- FILA 1 FROMULARIO-->
        <div class="row">
            <div class="col-md-12">
                <div class="page-header">
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Convocatorias vigentes FNSP</h4>
                </div>
                <div id="addscroll">
                    <table class="table table-hover" id="tbconvo">
                        <thead>
                            <tr>
                                <td></td>
                                <td><input type="text" id="intip" class="form-control input-sm" placeholder="Buscar tipo de convocatoria" "></td>
                                <td><input type="text" id="infechfin" class="form-control input-sm fecha" placeholder="Buscar fecha de finalizacion" "></td>
                                <td><input type="text" id="innom" class="form-control input-sm" placeholder="Buscar Nombre de convo"></td>
                            </tr>
                            <tr> 
                                <th></th>
                                <th>Tipo de convocatoria</th>
                                <th>Fecha de finalizacion</th>
                                <th>Nombre</th>
                                <th>Documento</th>
                                <th>Postulado</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="convocatoria" items="${convocatorias}">   
                                <tr>
                                    <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#md_postular" id="btnpostu" >Postularme</button></td>
                                    <td>${convocatoria.getNombreTipoConvocatoria()}</td>
                                    <td>${convocatoria.getFechaFinFormateada()}</td>
                                    <td>${convocatoria.getNombre()}</td>               
                                    <td><a href="#" target="_black" title="Ver documento"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                    <td>
                                        <p id="postulado">
                                        <c:if test = "${convocatoria.isPostulado()}">    
                                            Si
                                        </c:if>
                                        <c:if test = "${!convocatoria.isPostulado()}">    
                                            No
                                        </c:if>
                                        </p>
                                    </td>
                                    <td style='white-space: nowrap'><button type="button" class="btn btn-success btn-sm" style="margin-right: 10px;" data-toggle="modal" data-target="#md_ver">Ver</button><button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#md_edicion" style="margin-right: 5px;" ><i class="fa fa-pencil" aria-hidden="true"></i></button><button type='button'  id='btnborrar' class='btn btn-danger btn-sm'><span id='btnbo' class='glyphicon glyphicon-remove'></span></button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- FIN FILA 1 FROMULARIO-->
    <!-- FILA 2 FROMULARIO-->
    <!--  CONTENIDOS MODALES -->
    <!--  MODAL informacion de la convocatorias -->
    <div id="md_ver" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" >
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Información de la convocatoria<small> FNSP</small></h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="con_fecha_registro">
                    <div class="row">
                        <input type="hidden" id="con_persona_registra">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Tipo de convocatoria</label>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;" readonly id="con_tipo_convocatoria" value="docencia">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>&Aacute;rea de saber</label>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;" readonly id="con_area" value="Tecnologia">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Nombre de la convocatoria</label>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;" readonly id="con_nombre" value="portal 80">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Fecha de publicaci&oacute;n de resultado</label>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;" readonly id="con_fecha_resultados" value="20/04/201753">
                            </div>
                        </div>
                    </div>

                    <div class="row">   
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de inicio</label>
                                <input type="text" name="" id="con_fecha_inicio" style="border: 0; text-align: right;margin-left: 20px;" readonly value="10/10/2017">
                            </div>        
                        </div>
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de vigencia(cierre)</label>
                                <input type="text"  name="" id="con_fecha_fin" style="border: 0; text-align: right;margin-left: 20px;" readonly value="20/12/2017">
                            </div>  
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Descripci&oacute;n de la convocatoria</label>
                                <textarea style="border: 0;width: 95%;" id="con_descripcion" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo           consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </textarea>   
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="">Documento de convocatoria</label>
                            <button target="_black" title="Ver documemnto" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></button>
                        </div>
                    </div>   
                    <div class="form-group">    
                        <table class="table table-hover tableestilo">
                            <thead> 
                                <tr>
                                    <th>Adenda</th>
                                    <th>Documento</th>
                                </tr>
                            </thead>
                            <tr>
                                <td></td>
                                <td> <a href="#" target="_black" title="Ver documemnto" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a></td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--fin modal de informacion de convocatoria-->
    <!--modal edicion de informacion de convocatoria -->
    <div id="md_edicion" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" >
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Editar la Información de la convocatoria<small> FNSP</small></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="con_persona_registra">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Tipo de convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe seleccionar el tipo de convocatoria">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;"  id="con_tipo_convocatoria" value="docencia">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>&Aacute;rea de saber</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el &aacute;rea de convocatoria">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;"  id="con_area" value="Tecnologia">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Nombre de la convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar el nombre de la convocatoria">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;"  id="con_nombre" value="portal 80">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">    
                                <label>Fecha de publicaci&oacute;n de resultado</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de resultado de publicaci&oacute;n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" name="" style="border: 0; text-align: right;margin-left: 20px;"  id="con_fecha_resultados" value="20/04/201753">
                            </div>
                        </div>
                    </div> 
                    <div class="row">   
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de inicio</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de inicio">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text" name="" id="con_fecha_inicio" style="border: 0; text-align: right;margin-left: 20px;"  value="10/10/2017">
                            </div>        
                        </div>
                        <div class="col-md-6"> 
                            <div class="form-group">    
                                <label>Fecha de vigencia(cierre)</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe indicar la fecha de finalizaci&oacute;n">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <input type="text"  name="" id="con_fecha_fin" style="border: 0; text-align: right;margin-left: 20px;"  value="20/12/2017">
                            </div>  
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>Descripci&oacute;n de la convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe describir el perfil requerido con el cargo y la experiencia requerida">
                                    <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                                <textarea style="border: 0;width: 95%;" id="con_descripcion" >
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo           consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </textarea>   
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="">Documento de convocatoria</label><a href="#" data-toggle="tooltip" data-placement="right" title = "Debe adjuntar un documento de la convocatoria">
                                <i class="fa fa-question-circle" aria-hidden="true"></i></a><br>
                            <button target="_black" title="Ver documento" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></button>
                        </div>
                    </div>   
                    <div class="form-group">
                        <label>Agregar adendas</label>
                        <button style="margin-top: 20px;"  type="button" class="btn btn-success" data-toggle="modal" data-target="#md_adenda"><span class="glyphicon glyphicon-plus" style="margin-right: 5px;"></span></button>  
                        <div id="md_adenda" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" >
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Agregar adenda</h4>
                                    </div>
                                    <div class="modal-body">    
                                        <div class="form-group">    
                                            <label>Adenda</label>
                                            <input type="text" name="doca_nombre" id="doca_nombre" class="form-control">
                                        </div>
                                        <div class="form-group">    
                                            <label>Documento</label>
                                            <input type="file" name="doca_documentos" id="doca_documentos" class="form-control">
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button"  class="btn btn-success" id="addadendas">Agregar</button>
                                        <button type="button" class="btn btn-default" id="quitarmodal">Cerrar</button>
                                    </div>
                                </div>


                            </div>

                        </div>  
                        <table class="table table-hover tableestilo" id="tbadendas">
                            <thead> 
                                <tr>
                                    <th>Adenda</th>
                                    <th>Documento</th>
                                    <th width="5">Opciones</th>
                                </tr>
                            </thead>
                            <tr>
                                <td></td>
                                <td> <a href="#" target="_black" title="Ver documemnto" style="margin-left: 30px;" class="btn btn-success btn-sm" type="button"><i class="fa fa-file-pdf-o" aria-hidden="true"> </i></a></td>
                                <td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;'><span class='glyphicon glyphicon-remove'></span></button></td> 
                            </tr>
                        </table>

                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success">Guardar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>


        </div>

    </div>
    <!--fin modal de informacion de convocatoria-->
    <!--fin de modal de edicion-->
    <!-- Modal de postulacion-->

    <div id="md_postular" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" >
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4><i class="fa fa-address-book-o" aria-hidden="true"></i> Postulate</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">    
                                <label>¿Desea confirmar la postulaci&oacute;n de su hoja de vida a la convocatoria?</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="addpostula">Aceptar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!--fin modal de postulacion-->
</div>

<!-- jQuery -->
<script src='<c:url value="/resources/js/inicio.js" />' type="text/javascript"></script>
