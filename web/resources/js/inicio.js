$(document).ready(function() {
      

        var table = $('#tbconvo').DataTable({
                "language":{
                 "sProcessing":     "Procesando...",
                 "sLengthMenu":     "Mostrar _MENU_ registros",
                 "sZeroRecords":    "No se encontraron resultados",
                 "sEmptyTable":     "Ningún dato disponible en esta tabla",
                 "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                 "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                 "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                 "sInfoPostFix":    "",
                 "sSearch":         "Buscar:",
                 "sUrl":            "",
                 "sInfoThousands":  ",",
                 "sLoadingRecords": "Cargando...",
                 "oPaginate": {
                     "sFirst":    "Primero",
                     "sLast":     "Último",
                     "sNext":     "Siguiente",
                     "sPrevious": "Anterior"} 
            },
    "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
        });
         table.column().every(function()
            {
                var that = this;
                $('#incod').on('keyup change',function()
                    {
                        if(that.search() !== this.value)
                        {
                            that
                            .search(this.value)
                            .draw();
                        }
                    });

            });
        $('#intip').on( 'keyup', function () {
                table
                .columns(1)
                .search( this.value )
                .draw();
            } );
        
        $('#infechfin').on( 'keyup', function () {
                table
                .columns(2)
                .search( this.value )
                .draw();
            } );
        $('#innom').on( 'keyup', function () {
                table
                .columns(3)
                .search( this.value )
                .draw();
            } );
       
        $('#btnpostu').click(function(e){
            e.preventDefault();
            var obtener = $(this).parents("tr").find("td").eq(5);
            var boton = $(this);
            $('#addpostula').click(function(){
            obtener.html("si");
            boton.css("display","none");
            $('#md_postular').modal('hide');
        });


        });

         $('#quitarmodal').click(function(){
            $('#md_adenda').modal('hide');
        });
         $('#addadendas').click(function(){
            var nom = $('#doca_nombre').val();
            var documento = $('#doca_documentos').val();

            fila = "<tr><td>"+nom+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar' style='margin-left:10px;'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"; 
            $('#tbadendas').append(fila);
             $('#md_adenda').modal('hide');
               $('#doca_nombre').val("");
            $('#doca_documentos').val("");
        });
});

$(document).on('click', '#btnborrar', function (event) {
    event.preventDefault();
    $(this).closest('tr').remove();});  