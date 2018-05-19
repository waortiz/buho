<%-- 
    Document   : usuarios
    Created on : 23-jul-2017, 13:19:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div id="contenido">
    <div class="container">
    <c:if test = "${not empty mensajeError}">
        <div class="alert alert-danger">
            ${mensajeError}
        </div>
    </c:if>    
    <c:if test = "${not empty mensaje}">
        <div class="alert alert-success">
            ${mensaje}
        </div>
    </c:if>    
        <form:form>
          <table class='table tabla table-hover' style='font-size:12px;' id="privilegios"> 
                <thead>
                    <tr>
                        <td><input type="text" id="codigo" class="form-control input-sm" placeholder="Buscar código"></td>
                        <td><input type="text" id="nombre" class="form-control input-sm" placeholder="Buscar nombre"></td>
                        <td>&nbsp;</td>
                    </tr>                    
                    <tr  class='text-success'>
                        <th align="center" width='40%'><strong>Código</strong></th>
                        <th align="center" width='40%'><strong>Nombre</strong></th> 
                        <th align="center" width='20%'><strong>&nbsp;</strong></th> 
                    </tr> 
                </thead>
                <tbody>
                    <c:forEach var="privilegio" items="${privilegios}">   
                        <tr>
                            <td>
                                ${privilegio.getCodigo()}
                            </td>
                            <td>
                                ${privilegio.getNombre()}
                            </td>
                            <td style='white-space: nowrap'>
                                <button type="button" class="btn btn-success btn-sm"  onclick="window.location.href = '${pageContext.request.contextPath}/privilegios/editar/${privilegio.getIdPrivilegio()}'" style="margin-right: 5px;" >
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </button>
                                <button type='button'  id='btnborrar' class='btn btn-danger btn-sm' onclick="JavaScript:mostrarVentanaConfirmacionEliminacionPrivilegio('${pageContext.request.contextPath}/privilegios/eliminar/${privilegio.getIdPrivilegio()}')">
                                    <span id='btnbo' class='glyphicon glyphicon-remove'></span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
          </table> 
          <div class="modal fade" id="confirmacionEliminacionPrivilegio" tabindex="-1" role="dialog" aria-labelledby="privilegioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header mhsuccess" >
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4><i class="fa fa-address-book-o" aria-hidden="true"></i>Eliminar Privilegio</h4>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro de eliminar el privilegio?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="eliminarPrivilegio();">Aceptar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>                         
        </form:form>
    </div>
</div>
<script type="text/javascript">
 $(document).ready(function () {
        var table = $('#privilegios').DataTable({
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

        $('#codigo').on('keyup', function () {
            table
                    .columns(0)
                    .search(this.value)
                    .draw();
        });
        $('#nombre').on('keyup', function () {
            table
                    .columns(1)
                    .search(this.value)
                    .draw();
        });
    });

    var urlEliminacion = '';

    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    function mostrarVentanaConfirmacionEliminacionPrivilegio(url) {
        urlEliminacion = url;
        $('#confirmacionEliminacionPrivilegio').modal('toggle');
    }

    function eliminarPrivilegio() {
        window.location.href = urlEliminacion;
    }

</script>