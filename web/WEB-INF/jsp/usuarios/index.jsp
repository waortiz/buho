<%-- 
    Document   : usuarios
    Created on : 23-jul-2017, 13:19:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <form:form>
        <table class='table tabla table-hover' style='font-size:12px;' id="usuarios"> 
            <thead>
                <tr>
                    <td><input type="text" id="nombres" class="form-control input-sm" placeholder="Buscar nombres"></td>
                    <td><input type="text" id="apellidos" class="form-control input-sm" placeholder="Buscar apellidos"></td>
                    <td><input type="text" id="usuario" class="form-control input-sm" placeholder="Buscar usuario"></td>
                    <td>&nbsp;</td>
                </tr>                  
                <tr  class='text-success'>
                    <th align="center" width='35%'><strong>Nombres</strong></th>
                    <th align="center" width='35%'><strong>Apellidos</strong></th> 
                    <th align="center" width='20%'><strong>Usuario</strong></th> 
                    <th align="center" width='10%'><strong>Privilegios</strong></th> 
                </tr> 
            </thead>
                <tbody>
                    <c:forEach var="usuario" items="${usuarios}">   
                        <tr>
                            <td>
                                ${usuario.getNombres()}
                            </td>
                            <td>
                                ${usuario.getApellidos()}
                            </td>
                            <td>
                                ${usuario.getNombreUsuario()}
                            </td>
                            <td align="center">
                                <button type="button" class="btn btn-success btn-sm"  onclick="window.location.href = '${pageContext.request.contextPath}/usuarios/privilegios/${usuario.getIdUsuario()}'" style="margin-right: 5px;" >
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </button>                                    
                            </td>  
                        </tr>
                    </c:forEach>
                </tbody>
        </table> 
    </form:form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var table = $('#usuarios').DataTable({
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

        $('#nombres').on('keyup', function () {
            table
                    .columns(0)
                    .search(this.value)
                    .draw();
        });
        $('#apellidos').on('keyup', function () {
            table
                    .columns(1)
                    .search(this.value)
                    .draw();
        });
        $('#usuario').on('keyup', function () {
            table
                    .columns(2)
                    .search(this.value)
                    .draw();
        });
    });
    
</script>
