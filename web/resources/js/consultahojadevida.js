$(document).ready(function() {
 
  var table =$('#tbconhojavida').DataTable({
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
                $('#cedinput').on('keyup change',function()
                    {
                        if(that.search() !== this.value)
                        {
                            that
                            .search(this.value)
                            .draw();
                        }
                    });

            });
        $('#nomapeinput').on( 'keyup', function () {
                table
                .columns(1)
                .search( this.value )
                .draw();
            } );
        
        $('#fecnacinput').on( 'keyup', function () {
                table
                .columns(2)
                .search( this.value )
                .draw();
            } );
        $('#telinput').on( 'keyup', function () {
                table
                .columns(3)
                .search( this.value )
                .draw();
            } );
        $('#niedinput').on( 'keyup', function () {
                table
                .columns(4)
                .search( this.value )
                .draw();
            } );
        $('#expinput').on( 'keyup', function () {
                table
                .columns(5)
                .search( this.value )
                .draw();
            } );
        $('#disinput').on( 'keyup', function () {
                table
                .columns(6)
                .search( this.value )
                .draw();
            } );
        $('#pubinput').on( 'keyup', function () {
                table
                .columns(7)
                .search( this.value )
                .draw();
            } );

        $('#btnpersonal').click(function(){
  		$('#formpersonal').css("display","block");
  		$('#formacademico').css("display","none");
  		$('#formexperiencia').css("display","none");
      $('#formpublicacion').css("display","none");
      $('#formdistin').css("display","none"); 
  	});
  	$('#btnacademico').click(function(){
  		$('#formpersonal').css("display","none");
  		$('#formacademico').css("display","block");
  		$('#formexperiencia').css("display","none");
      $('#formpublicacion').css("display","none");
      $('#formdistin').css("display","none"); 
  	});
  	$('#btnexperiencia').click(function(){
  		$('#formpersonal').css("display","none");
  		$('#formacademico').css("display","none");
  		$('#formexperiencia').css("display","block");
      $('#formpublicacion').css("display","none");
      $('#formdistin').css("display","none"); 
  	});
    $('#btndist').click(function(){
      $('#formdistin').css("display","block"); 
      $('#formpersonal').css("display","none");
      $('#formacademico').css("display","none");
      $('#formexperiencia').css("display","none");
      $('#formpublicacion').css("display","none");
      
    });
    $('#btnpubli').click(function(){
      $('#formpublicacion').css("display","block");
      $('#formdistin').css("display","none"); 
      $('#formpersonal').css("display","none");
      $('#formacademico').css("display","none");
      $('#formexperiencia').css("display","none");    
    });

    $('#btnpersonal2').click(function(){
  		$('#formpersonal2').css("display","block");
  		$('#formacademico2').css("display","none");
  		$('#formexperiencia2').css("display","none");
      $('#formpublicacion2').css("display","none");
      $('#formdistin2').css("display","none"); 
  	});
  	$('#btnacademico2').click(function(){
  		$('#formpersonal2').css("display","none");
  		$('#formacademico2').css("display","block");
  		$('#formexperiencia2').css("display","none");
      $('#formpublicacion2').css("display","none");
      $('#formdistin2').css("display","none"); 
  	});
  	$('#btnexperiencia2').click(function(){
  		$('#formpersonal2').css("display","none");
  		$('#formacademico2').css("display","none");
  		$('#formexperiencia2').css("display","block");
      $('#formpublicacion2').css("display","none");
      $('#formdistin2').css("display","none"); 
  	});
    $('#btndist2').click(function(){
      $('#formdistin2').css("display","block"); 
      $('#formpersonal2').css("display","none");
      $('#formacademico2').css("display","none");
      $('#formexperiencia2').css("display","none");
      $('#formpublicacion2').css("display","none");
      
    });
    $('#btnpubli2').click(function(){
      $('#formpublicacion2').css("display","block");
      $('#formdistin2').css("display","none"); 
      $('#formpersonal2').css("display","none");
      $('#formacademico2').css("display","none");
      $('#formexperiencia2').css("display","none");    
    });


});

$(document).on('click', '#btnborrar', function (event) {
    event.preventDefault();
    $(this).closest('tr').remove();});

