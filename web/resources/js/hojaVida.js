var ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN = 1201;
var ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL = 1219;
var ID_UNIVERSIDAD_ANTIOQUIA_ANDES = 1220;
var ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA = 1221;
var ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO = 1222;
var ID_UNIVERSIDAD_ANTIOQUIA_TURBO = 1223;
var ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA = 9125;

var UNIVERSIDAD_ANTIOQUIA = 'Universidad de Antioquia';
var TIPO_CERTIFICACION_OTRO = 8;
var MAXIMO_TAMANYO_ARCHIVO = 2097152;
var ID_COLOMBIA = 343;
var ACTVIDAD_ECONOMICA_EDUCACION_SUPERIOR = "8030";
var TIPO_EMPRESA_PUBLICA = "1";
var programas = [];
var nombreCampoCiudad;
var campoCiudad;
var campoNucleoBasicoConocimiento;
var campoNombreNucleoBasicoConocimiento;

var copiaDocumentoIdentificacionCambiado = false;
var copiaLibretaMilitarCambiado = false;
var documentoRUTCambiado = false;
var urlCVLACCambiada = false;

$('.fecha').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true
    });
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });
    
    $(document).ready(function () {
        $('#tblDocumentosSoporte').DataTable({
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
        $('#tblEducacionesBasicas').DataTable({
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
        $('#tblEducacionesSuperiores').DataTable({
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
        $('#tblIdiomas').DataTable({
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
        $('#tblEducacionesContinuas').DataTable({
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
        $('#tblExperienciasLaborales').DataTable({
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
        $('#tblExperienciasDocencia').DataTable({
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
        $('#tblArticulos').DataTable({
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
        $('#tblPatentes').DataTable({
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
        $('#tblProductosConocimiento').DataTable({
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
        $('#tblDistinciones').DataTable({
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
        $('#personal').click(function () {
            $('#formpersonal').css("display", "block");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','block');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','none');
        });
        
        $('#perfillaboral').click(function () {
            $('#formperfilsopor').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','block');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','none');
        });
        
        $('#academico').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "block");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','block');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','none'); 
        });
        
        $('#educacioncontinua').click(function () {
            $('#formeducontinua').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','block');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','none');  
        });
        
        $('#experiencia').click(function () {
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "block");
            $('#forminves').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','block');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','none'); 
        });
        
        $('#investigacion').click(function () {
            $('#forminves').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#formdistin').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','block');
            $('#lidist ').css('display','none'); 
        });
        
        $('#distinciones').click(function () {
            $('#formdistin').css("display", "block");
            $('#formpersonal').css("display", "none");
            $('#formperfilsopor').css("display", "none");
            $('#formacademico').css("display", "none");
            $('#formeducontinua').css("display", "none");
            $('#forminves').css("display", "none");
            $('#formexperiencia').css("display", "none");
            $('#liinfper').css('display','none');
            $('#liperfil').css('display','none');
            $('#liaspacad').css('display','none');
            $('#liedunoform').css('display','none');
            $('#liexplab').css('display','none');
            $('#liinves').css('display','none');
            $('#lidist ').css('display','block'); 
        });
        
        $('#btnrutsi').click(function () {
            $('#actividadEconomica').prop('disabled', false);
        });
        
        if ($('#disponeRUT').val() === "false") {
            $('#actividadEconomica').prop('disabled', true);
        }
        $('#btnrutno').click(function () {
            $('#actividadEconomica').val("").trigger("change.select2");
            $('#actividadEconomica').prop('disabled', 'disabled');
        });
        
        if ($('#empleadoUDEA').val() === "false") {
            $('#tipoVinculacion').prop('disabled', true);
        }
        $('#btnempleadosi').click(function () {
            $("#tipoVinculacion").prop('disabled', false);
        });
        
        $('#btnempleadono').click(function () {
            $("#tipoVinculacion").prop('disabled', 'disabled');
            $('#tipoVinculacion').val("").trigger("change.select2");
        });
        
        $('#tipoCertificacionIdioma').change(function(){
            var valor = $(this).val();
            if(valor === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }
        });   
        
        $('#btnGraduadoSiEducacionBasica').click(function(){
          $('#anyoFinalizacionEducacionBasica').prop('disabled', false);
        });
        
        $('#btnGraduadoNoEducacionBasica').click(function(){
          $('#anyoFinalizacionEducacionBasica').prop('disabled', 'disabled');
          $('#anyoFinalizacionEducacionBasica').val("");
        });
        
        $('#btnTituloExteriorSiEducacionSuperior').click(function(){
          $('#paistit').css("display","block");
          $('#certhomo').css('display','block');
          $('#btnNuevoProgramaExterior').show();
          $('#divProgramaExterior').show();
          $('#institucionEducativaProgramaExterior').next(".select2-container").show();
          $('#institucionEducativaProgramaColombiana').next(".select2-container").hide();
        });
        
        $('#btnTituloExteriorNoEducacionSuperior').click(function(){
          $('#paistit').css("display", "none");
          $('#certhomo').css('display', 'none');
          $('#btnNuevoProgramaExterior').hide();
          $('#divProgramaExterior').hide();
          $('#paisTituloExteriorEducacionSuperior').val('').trigger("change.select2");
          $('#institucionEducativaProgramaExterior').next(".select2-container").hide();
          $('#institucionEducativaProgramaColombiana').next(".select2-container").show();
        });  
        
        $('#btnGraduadoSiEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', false);
          $('#fechaTituloEducacionSuperior').prop('disabled', false);
        });
        
        $('#btnGraduadoNoEducacionSuperior').click(function () {
          $('#anyoFinalizacionEducacionSuperior').prop('disabled', 'disabled');
          $('#anyoFinalizacionEducacionSuperior').val("");
          $('#fechaTituloEducacionSuperior').prop('disabled', 'disabled');
          $('#fechaTituloEducacionSuperior').val("");
        });
        
        $('#btnAdicionarPrograma').click(function(){
          var nombreInstitucion = $('#institucionEducativaProgramaColombiana option:selected').text();
          if(strToBool($('#tituloExteriorEducacionSuperior').val())) {
            nombreInstitucion = $('#institucionEducativaProgramaExterior option:selected').text();
          }
          var programaCursado = $('#programaCursado').val();
          var nombreProgramaCursado = $('#programaCursado option:selected').text();
          var nombreNucleoBasicoConocimientoPrograma = $('#nombreNucleoBasicoConocimientoPrograma').val();
          var tituloPrograma = $('#tituloPrograma').val();

          $('#formprograma').show();
          
          $('#nombreInstitucionEducacionSuperior').val(nombreInstitucion);
          $('#programaCursadoEducacionSuperior').val(programaCursado);
          $('#nombreProgramaCursadoEducacionSuperior').val(nombreProgramaCursado);
          $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(nombreNucleoBasicoConocimientoPrograma);
          $('#tituloEducacionSuperior').val(tituloPrograma);

          $('#nucleoBasicoConocimientoPrograma').val("");
          $('#nombreNucleoBasicoConocimientoPrograma').val("");
          $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
          $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
          $('#programaCursado').val("").trigger("change.select2");
          $('#tituloPrograma').val("");
          
          $('#md_programa').modal('hide');
        });
        
        $('#btnAdicionarProgramaExterior').click(function(){
          var institucion = $('#nombreInstitucionEducativaProgramaExterior').val();
          var programaCursado = $('#programaCursadoExterior').val();
          var nucleoBasicoConocimientoPrograma = $('#nucleoBasicoConocimientoProgramaExterior').val();
          var nombreNucleoBasicoConocimientoPrograma = $('#nombreNucleoBasicoConocimientoProgramaExterior').val();
          var tituloPrograma = $('#tituloProgramaExterior').val();
          var nivel = $('#nivelEstudioEducacionSuperior').val();

        if (institucion === "") {
            bootstrap_alert_programa_exterior.warning('Debe seleccionar la institución');
            return false;
        }
        
        if (programaCursado === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar el programa cursado');
            return false;
        }

        if (nucleoBasicoConocimientoPrograma === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar núcleo básico de conocimiento');
            return false;
        }

        if (tituloPrograma === "") {
            bootstrap_alert_programa_exterior.warning('Debe ingresar el título');
            return false;
        }

        var formData = new FormData();
        formData.append("nombre", programaCursado);
        formData.append("institucion", institucion);
        formData.append("nivel", nivel);
        formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoPrograma);
        formData.append("titulo", tituloPrograma);
        $.ajax({
            type: "POST",
            url: contextPath + "/hojasVida/programa",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response !== "") {
                    var respuesta = JSON.parse(response);
                    
                    $('#nombreInstitucionEducacionSuperior').val($('#nombreInstitucionEducativaProgramaExterior option:selected').text());
                    $('#programaCursadoEducacionSuperior').val(respuesta.id);
                    $('#nombreProgramaCursadoEducacionSuperior').val(programaCursado);
                    $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(nombreNucleoBasicoConocimientoPrograma);
                    $('#tituloEducacionSuperior').val(tituloPrograma);
                    $('#formprograma').show();
                    $('#md_programa_exterior').modal('hide');
                    $('#md_programa').modal('hide');
                } else {
                    bootstrap_alert_programa_exterior.warning("Error al almacenar el programa.");
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_programa_exterior.warning("Error al almacenar el programa.");
            }});
        });

        $('#btnEstudioExteriorSiEducacionContinua').click(function(){
          $('#institucionEducacionContinuaExterior').next(".select2-container").show();
          $('#institucionEducacionContinuaColombiana').next(".select2-container").hide();
          $('#btnNuevaInstitucionExteriorEducacionContinua').show();
          $('#divMensajeInstitucionExteriorEducacionContinua').show();
        });
        
        $('#btnEstudioExteriorNoEducacionContinua').click(function(){
          $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
          $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
          $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
          $('#divMensajeInstitucionExteriorEducacionContinua').hide();
        }); 

        $('#btnAdicionarInstitucionExterior').click(function(){
            var institucion = $('#institucionEducativaExterior').val();
            if (institucion === "") {
                bootstrap_alert_institucion_exterior.warning('Debe ingresar la institución');
                return false;
            }
        
            var formData = new FormData();
            formData.append("nombre", institucion);
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/institucion",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response !== "") {
                        var respuesta = JSON.parse(response);
                        $('#institucionExperienciaDocenciaExterior').append('<option value=' + respuesta.id + '>' + institucion + '</option>');
                        $('#institucionExperienciaDocenciaExterior').val(respuesta.id).trigger("change.select2");
                        $('#institucionEducacionContinuaExterior').append('<option value=' + respuesta.id + '>' + institucion + '</option>');
                        $('#institucionEducacionContinuaExterior').val(respuesta.id).trigger("change.select2");
                        $('#nombreInstitucionEducativaProgramaExterior').append('<option value=' + respuesta.id + '>' + institucion + '</option>');
                        $('#nombreInstitucionEducativaProgramaExterior').val(respuesta.id).trigger("change.select2");
                        $('#institucionEducativaProgramaExterior').append('<option value=' + respuesta.id + '>' + institucion + '</option>');
                        $('#institucionEducativaProgramaExterior').val(respuesta.id).trigger("change.select2");
                        
                        $('#md_institucion_exterior').modal('hide');
                    } else {
                        bootstrap_alert_institucion_exterior.warning("Error al almacenar la institución.");
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_institucion_exterior.warning("Error al almacenar la institución.");
                }});
        });

        $('#btnAdicionarCiudadExtranjera').click(function(){
          var pais = $('#pais').val();
          var departamento = $('#departamento').val();
          var nombreCiudad = $('#ciudadExtranjera').val();

          if (nombreCiudad === "") {
             bootstrap_alert_ciudad_extranjera.warning('Debe ingresar la ciudad');
            return false;
          }
        
        var formData = new FormData();
        formData.append("pais", pais);
        formData.append("departamento", departamento);
        formData.append("nombre", nombreCiudad);
        
        $.ajax({
            type: "POST",
            url: contextPath + "/hojasVida/ciudad",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response !== "") {
                    var ciudad = JSON.parse(response);
                    $('#departamento').find('option').remove();
                    $('#departamento').append('<option></option>');
                    $('#departamento').append('<option value=' + ciudad.departamento + '>SIN ESPECIFICAR</option>');
                    $('#departamento').val(ciudad.departamento).trigger("change.select2");

                    $('#ciudad').find('option').remove();
                    $('#ciudad').append('<option></option>');
                    $('#ciudad').append('<option value=' + ciudad.id + '>' + nombreCiudad + '</option>');
                    $('#ciudad').val(ciudad.id).trigger("change.select2");
                    
                    $('#md_ciudad_extranjera').modal('hide');
                    seleccionarUbicacion();
                } else {
                    bootstrap_alert_ciudad_extranjera.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_ciudad_extranjera.warning("Error al almacenar la ciudad.");
            }});
        });
        
        $('#btnExperienciaDocenciaFNSPSi').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
            $('#institucionExperienciaDocenciaColombiana').val(ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN).trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', 'disabled');
        });
        $('#btnExperienciaDocenciaFNSPNo').click(function () {
            $('#institucionExperienciaDocenciaColombiana').val("").trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
        });
        $('#btnExperienciaDocenciaExteriorSi').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").show();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").hide();
            $('#btnNuevaInstitucionExperienciaDocenciaExterior').show();
            $('#institucionExperienciaDocenciaColombiana').val("").trigger('change.select2');
            $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
            $('#btnExperienciaDocenciaFNSPNo').removeClass('notActive').addClass('active');  
            $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive'); 
            $('#experienciaDocenciaFNSP').val("false");
            $('#btnNuevaInstitucionExteriorExperienciaDocencia').show();
            $('#divMensajeInstitucionExteriorExperienciaDocencia').show();
        });
        $('#btnExperienciaDocenciaExteriorNo').click(function () {
            $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
            $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
            $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
            $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
        });
        $('#btnTrabajoActualExperienciaLaboralSi').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
            $('#fechaRetiroExperienciaLaboral').val('');
        });
        $('#btnTrabajoActualExperienciaLaboralNo').click(function () {
            $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
        });
        $('#btnExperienciaLaboralFNSPSi').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val(UNIVERSIDAD_ANTIOQUIA);
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
            $('#tipoEmpresaExperienciaLaboral').val(TIPO_EMPRESA_PUBLICA).trigger('change.select2');
            $('#tipoEmpresaExperienciaLaboral').prop('disabled', 'disabled');
            $('#actividadEconomicaExperienciaLaboral').val(ACTVIDAD_ECONOMICA_EDUCACION_SUPERIOR).trigger('change.select2');
            $('#actividadEconomicaExperienciaLaboral').prop('disabled', 'disabled');
        });
        $('#btnExperienciaLaboralFNSPNo').click(function () {
            $('#nombreEmpresaExperienciaLaboral').val("");
            $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
            $('#tipoEmpresaExperienciaLaboral').val("").trigger('change.select2');
            $('#tipoEmpresaExperienciaLaboral').prop('disabled', false);
            $('#actividadEconomicaExperienciaLaboral').val("").trigger('change.select2');
            $('#actividadEconomicaExperienciaLaboral').prop('disabled', false);
        });
        $('#radrural').change(function () {
            var valor = $(this).val();
            if (valor === "rural")
            {
                $('#formrural').css("display", "block");
                $('#formurbana').css("display", "none");
                $('#radurbano').prop('checked', false);
            }
        });
        $('#radurbano').change(function () {
            var valor = $(this).val();
            if (valor === "urbano")
            {
                $('#formurbana').css("display", "block");
                $('#formrural').css("display", "none");
                $('#radrural').prop('checked', false);
            }
        });
        $('#fechaNacimiento').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaExpedicion').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaTituloEducacionSuperior').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaIngresoExperienciaLaboral').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaRetiroExperienciaLaboral').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaPatente').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaDistincion').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
       
        $('#numeroCuentaBancaria').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroHorasEducacionContinua').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroHorasCursoExperienciaDocencia').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#pin_scopus').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroIdentificacion').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#libretaMilitar').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numeroTelefono').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#numdir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#num2dir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#num3dir').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#puntajeCertificacionIdioma').change(function () {
            var decimalOnly = /^\s*[0-9]\d*(\.\d+)?\s*$/;
            if(!decimalOnly.test(this.value)) {
                this.value = '';
            }
        });
        
        $('#dircalle').change(function () {
            actualizarDireccion();
        });
        $('#numdir').change(function () {
            actualizarDireccion();
        });
        $('#letdir').change(function () {
            actualizarDireccion();
        });
        $('#dirsur').change(function () {
            actualizarDireccion();
        });
        $('#num2dir').change(function () {
            actualizarDireccion();
        });
        $('#let2dir').change(function () {
            actualizarDireccion();
        });
        $('#direst').change(function () {
            actualizarDireccion();
        });
        $('#num3dir').change(function () {
            actualizarDireccion();
        });
        $('#dirurb').change(function () {
            actualizarDireccion();
        });
        $('#anyoInicioEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionBasica').append($('<option/>').val('').html(''));
        $('#anyoInicioEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val('').html(''));
        $('#anyoEducacionContinua').append($('<option/>').val('').html(''));
        $('#anyoCursoExperienciaDocencia').append($('<option/>').val('').html(''));
        $('#anyoArticulo').append($('<option/>').val('').html(''));
        for (i = new Date().getFullYear(); i > 1800; i--) {
            $('#anyoInicioEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionBasica').append($('<option/>').val(i).html(i));
            $('#anyoInicioEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoFinalizacionEducacionSuperior').append($('<option/>').val(i).html(i));
            $('#anyoEducacionContinua').append($('<option/>').val(i).html(i));
            $('#anyoCursoExperienciaDocencia').append($('<option/>').val(i).html(i));
            $('#anyoArticulo').append($('<option/>').val(i).html(i));
        }
        $('#adddireccion').click(function () {
            if ($('#radrural').is(':checked')) {
                var dirrural = $('#dirrural').val();
                $('#direccion').val(dirrural);
                $('#md_direccion').modal('hide');
                $('#radurbano').prop('checked', false);
            }
            if ($('#radurbano').is(':checked')) {
                var direccion = $('#vistaprevia').val();
                $('#direccion').val(direccion);
                $('#md_direccion').modal('hide');
                $('#radrural').prop('checked', false);
            }
        });
        $('#institucionEducativaProgramaColombiana').change(function () {
           obtenerProgramasCursados($('#institucionEducativaProgramaColombiana').val());
        });
        $('#institucionEducativaProgramaExterior').change(function () {
           obtenerProgramasCursados($('#institucionEducativaProgramaExterior').val());
        });
        
        $('#programaCursado').change(function () {
            var programa = programas.find(function(element) {
                return element.id == $('#programaCursado').val();
            });
            $('#tituloPrograma').val(programa.titulo);
            $('#nucleoBasicoConocimientoPrograma').val(programa.nucleoBasicoConocimiento);
            $('#nombreNucleoBasicoConocimientoPrograma').val(programa.nombreNucleoBasicoConocimiento);
        });
        
        $('#btnInvestigadorReconocidoColcienciasSi').click(function () {
            $("#tipoInvestigador").prop('disabled', false);
        });
        
        $('#btnInvestigadorReconocidoColcienciasNo').click(function () {
            $("#tipoInvestigador").prop('disabled', 'disabled');
            $('#tipoInvestigador').val("").trigger("change.select2");
        });
        
        if ($('#investigadorReconocidoColciencias').val() === "false") {
           $('#tipoInvestigador').prop('disabled', true);
        }
        
        $('#copiaDocumentoIdentificacion').change(function () {
           copiaDocumentoIdentificacionCambiado = true;
           $('#nombreCopiaDocumentoIdentificacion').text($("#copiaDocumentoIdentificacion")[0].files[0].name); 
        });
        
        $('#copiaLibretaMilitar').change(function () {
           copiaLibretaMilitarCambiado = true;
           $('#nombreCopiaLibretaMilitar').text($("#copiaLibretaMilitar")[0].files[0].name); 
        });

        $('#documentoRUT').change(function () {
           documentoRUTCambiado = true;
           $('#nombreDocumentoRUT').text($("#documentoRUT")[0].files[0].name); 
        });

        $('#urlCVLAC').change(function () {
           urlCVLACCambiada = true;
        });
    });

    function actualizarDireccion() {
      var direccion = $('#dircalle').val() + ' ' + $('#numdir').val() + ' ' + $('#letdir').val() + ' ' +  $('#dirsur').val();
      if($('#num2dir').val() !== '' || $('#let2dir').val() !== '' || $('#direst').val() !== '' || $('#num3dir').val() !== '') {
        direccion = direccion + ' # ';  
      }
      direccion = direccion + $('#num2dir').val() + ' ' + $('#let2dir').val() + ' ' + $('#direst').val();
      if($('#num3dir').val() !== '') {
        direccion = direccion + ' - ' +  $('#num3dir').val();
      }
      direccion = direccion + ' ' +  $('#dirurb').val();
      $("#vistaprevia").val(direccion);
    }

    function mostrarUbicacionModal(nombreCampo, campo) {
        nombreCampoCiudad = nombreCampo;
        campoCiudad = campo;
        if($('#pais').val() != "" && $('#pais').val() != ID_COLOMBIA) {
          $('#btnNuevaCiudadExtranjera').show();   
        } else {
          $('#btnNuevaCiudadExtranjera').hide();   
        }
        $('#ubicacionModal').modal({backdrop: 'static', keyboard: false});
    }

    function seleccionarUbicacion() {
        var pais = $('#pais option:selected').text().toUpperCase();
        var dep = $('#departamento option:selected').text().toUpperCase();
        var ciu = $('#ciudad option:selected').text().toUpperCase();
        $('#' + campoCiudad).val($('#ciudad').val());
        if(dep != "SIN ESPECIFICAR") {
           $('#' + nombreCampoCiudad).val(pais + " - " + dep + " - " + ciu);
        }
        else {
           $('#' + nombreCampoCiudad).val(pais + " - " + ciu); 
        }
        $('#ubicacionModal').modal('hide');
    }

    function mostrarNucleoBasicoConocimiento(campo, nombreCampo) {
        campoNucleoBasicoConocimiento = campo;
        nombreCampoNucleoBasicoConocimiento = nombreCampo;
        $('#nucleoBasicoConocimiento').val('');
        $('#md_nucleo_basico_conocimiento').modal({backdrop: 'static', keyboard: false});
    }

    function seleccionarNucleoBasicoConocimiento() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimiento').val();
        var nombreNucleoBasicoConocimiento = $('#nucleoBasicoConocimiento option:selected').text();
        $('#' + campoNucleoBasicoConocimiento).val(nucleoBasicoConocimiento); 
        $('#' + nombreCampoNucleoBasicoConocimiento).val(nombreNucleoBasicoConocimiento); 
         
        $('#md_nucleo_basico_conocimiento').modal('hide');
    }

    function buscarDepartamentos(idPais) {
        if(idPais != ID_COLOMBIA) {
          $('#btnNuevaCiudadExtranjera').show();   
          $('#divDepartamento').hide();   
        } else {
          $('#btnNuevaCiudadExtranjera').hide();   
          $('#divDepartamento').show();
        }
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/departamentosPais/" + idPais,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#departamento').find('option').remove();
                    $('#ciudad').find('option').remove();
                    $('#departamento').append('<option></option>');
                    var departamentos = JSON.parse(response);
                    for (var i = 0; i < departamentos.length; i++) {
                        $('#departamento').append('<option value=' + departamentos[i].id + '>' + departamentos[i].nombre + '</option>');
                    }
                    
                    if(departamentos.length == 1) {
                        $('#departamento').val(departamentos[0].id).trigger('change.select2');
                    }
                }
            }});
    }

    function buscarCiudades(codigoDepartamento) {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/ciudadesDepartamento/" + codigoDepartamento,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#ciudad').find('option').remove();
                    $('#ciudad').append('<option></option>');
                    var ciudades = JSON.parse(response);
                    for (var i = 0; i < ciudades.length; i++) {
                        $('#ciudad').append('<option value=' + ciudades[i].id + '>' + ciudades[i].nombre + '</option>');
                    }
                    if(ciudades.length == 1) {
                        $('#ciudad').val(ciudades[0].id).trigger('change.select2');
                    }                    
                }
            }});
    }

    var HojaVidaModel = function (correosElectronicos, 
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
                                  productosConocimiento) {
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
        self.consecutivoExperienciaDocencia = ko.observable(0);
        self.cursosExperienciaDocencia = ko.computed(function() {
           var cursos = [];
           if(self.experienciasDocencia().length > 0 && self.experienciasDocencia().length > self.consecutivoExperienciaDocencia()) {
             for(var i = 0; i < self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length; i++) {
               cursos[i] = self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia()[i]; 
             }
           }
           
           return cursos;
        });
        self.articulos = ko.observableArray(articulos);
        self.patentes = ko.observableArray(patentes);
        self.productosConocimiento = ko.observableArray(productosConocimiento);

        self.adicionarCorreoElectronico = function () {
            var correoElectronico = $('#correoElectronico').val();
            if (correoElectronico === "") {
                bootstrap_alert_correo_electronico.warning('Debe ingresar el correo electrónico');
                return false;
            }
            if (!validarCorreoElectronico(correoElectronico)) {
                bootstrap_alert_correo_electronico.warning('Debe ingresar un correo electrónico válido');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.correosElectronicos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.correosElectronicos().length; i++) {
                    if (self.correosElectronicos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.correosElectronicos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("correoElectronico", correoElectronico);
            
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/correoElectronico",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_correo_electronico').modal('hide');
                    bootstrap_alert_correos_electronicos.success('Correo electrónico almacenado correctamente.');
                    if (response !== "") {
                        self.correosElectronicos.removeAll();
                        var correosElectronicos = JSON.parse(response);
                        for (var i = 0; i < correosElectronicos.length; i++) {
                            self.correosElectronicos.push(
                                {
                                    id: ko.observable(correosElectronicos[i].id),
                                    consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                                    correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_correos_electronicos.warning("Error al almacenar el correo electrónico.");
                }});
        };

        self.eliminarCorreoElectronico = function (correoElectronico) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarCorreoElectronico/" + correoElectronico.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_correos_electronicos.success("Correo electrónico eliminado exitosamente.");
                    self.correosElectronicos.removeAll();
                    var correosElectronicos = JSON.parse(response);
                    for (var i = 0; i < correosElectronicos.length; i++) {
                        self.correosElectronicos.push(
                            {
                                id: ko.observable(correosElectronicos[i].id),
                                consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                                correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
                            }
                         );
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_correos_electronicos.warning("Error al eliminar el correo electrónico.");
                }});
        };

        self.editarCorreoElectronico = function (correoElectronico) {
            $('#correoElectronico').val(correoElectronico.correoElectronico());
            $('#consecutivo').val(correoElectronico.consecutivo());
            bootstrap_alert_correo_electronico.removeWarning();
            bootstrap_alert_correos_electronicos.removeWarning();
            $('#md_correo_electronico').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarCuentaBancaria = function () {
            var tipoCuentaBancaria = $('#tipoCuentaBancaria').val();
            var nombreTipoCuentaBancaria = $('#tipoCuentaBancaria option:selected').text();
            var numeroCuentaBancaria = $('#numeroCuentaBancaria').val();
            var entidadCuentaBancaria = $('#entidadCuentaBancaria').val();

            if (tipoCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar el tipo de cuenta bancaria');
                return false;
            }
            if (numeroCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar el número de cuenta bancaria');
                return false;
            }
            if (entidadCuentaBancaria === "") {
                bootstrap_alert_cuenta_bancaria.warning('Debe ingresar la entidad cuenta bancaria');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.cuentasBancarias().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.cuentasBancarias().length; i++) {
                    if (self.cuentasBancarias()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.cuentasBancarias()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipo", tipoCuentaBancaria);
            formData.append("numero", numeroCuentaBancaria);
            formData.append("entidad", entidadCuentaBancaria);

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/cuentaBancaria",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_cuenta_bancaria').modal('hide');
                    bootstrap_alert_cuentas_bancarias.success('Cuenta bancaria almacenada correctamente.');
                    if (response !== "") {
                        self.cuentasBancarias.removeAll();
                        var cuentasBancarias = JSON.parse(response);
                        for (var i = 0; i < cuentasBancarias.length; i++) {
                            self.cuentasBancarias.push(
                                {
                                    id: ko.observable(cuentasBancarias[i].id),
                                    consecutivo: ko.observable(cuentasBancarias[i].consecutivo),
                                    tipo: ko.observable(cuentasBancarias[i].tipo),
                                    nombreTipo: ko.observable(cuentasBancarias[i].nombreTipo),
                                    numero: ko.observable(cuentasBancarias[i].numero),
                                    entidad: ko.observable(cuentasBancarias[i].entidad)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cuentas_bancarias.warning("Error al almacenar la cuenta bancaria.");
                }});
        };

        self.eliminarCuentaBancaria = function (cuentaBancaria) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarCuentaBancaria/" + cuentaBancaria.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_cuentas_bancarias.success('Cuenta bancaria eliminada correctamente.');
                    if (response !== "") {
                        self.cuentasBancarias.removeAll();
                        var cuentasBancarias = JSON.parse(response);
                        for (var i = 0; i < cuentasBancarias.length; i++) {
                            self.cuentasBancarias.push(
                                {
                                    id: ko.observable(cuentasBancarias[i].id),
                                    consecutivo: ko.observable(cuentasBancarias[i].consecutivo),
                                    tipo: ko.observable(cuentasBancarias[i].tipo),
                                    nombreTipo: ko.observable(cuentasBancarias[i].nombreTipo),
                                    numero: ko.observable(cuentasBancarias[i].numero),
                                    entidad: ko.observable(cuentasBancarias[i].entidad)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cuentas_bancarias.warning("Error al eliminar el cuenta bancaria.");
                }});
        };

        self.editarCuentaBancaria = function (cuentaBancaria) {
            $('#tipoCuentaBancaria').val(cuentaBancaria.tipo()).trigger('change');
            $('#nombreTipoCuentaBancaria').val(cuentaBancaria.nombreTipo());
            $('#numeroCuentaBancaria').val(cuentaBancaria.numero());
            $('#entidadCuentaBancaria').val(cuentaBancaria.entidad());
            $('#consecutivo').val(cuentaBancaria.consecutivo());
            bootstrap_alert_cuenta_bancaria.removeWarning();
            bootstrap_alert_cuentas_bancarias.removeWarning();
            $('#md_cuenta_bancaria').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarTelefono = function () {
            var tipoTelefono = $('#tipoTelefono').val();
            var nombreTipoTelefono = $('#tipoTelefono option:selected').text();
            var numeroTelefono = $('#numeroTelefono').val();

            if (tipoTelefono === "") {
                bootstrap_alert_telefono.warning('Debe ingresar el tipo de teléfono');
                return false;
            }
            if (numeroTelefono === "") {
                bootstrap_alert_telefono.warning('Debe ingresar el número de teléfono');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.telefonos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.telefonos().length; i++) {
                    if (self.telefonos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.telefonos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipo", tipoTelefono);
            formData.append("numero", numeroTelefono);

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/telefono",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_telefono').modal('hide');
                    bootstrap_alert_telefonos.success('Teléfono almacenado correctamente.');
                    if (response !== "") {
                        self.telefonos.removeAll();
                        var telefonos = JSON.parse(response);
                        for (var i = 0; i < telefonos.length; i++) {
                            self.telefonos.push(
                                {
                                    id: ko.observable(telefonos[i].id),
                                    consecutivo: ko.observable(telefonos[i].consecutivo),
                                    tipo: ko.observable(telefonos[i].tipo),
                                    nombreTipo: ko.observable(telefonos[i].nombreTipo),
                                    numero: ko.observable(telefonos[i].numero)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_telefonos.warning("Error al almacenar teléfono.");
                }});
        };

        self.eliminarTelefono = function (telefono) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarTelefono/" + telefono.id(),
                success: function (response) {
                    bootstrap_alert_telefonos.success('Teléfono eliminado correctamente.');
                    if (response !== "") {
                        self.telefonos.removeAll();
                        var telefonos = JSON.parse(response);
                        for (var i = 0; i < telefonos.length; i++) {
                            self.telefonos.push(
                                {
                                    id: ko.observable(telefonos[i].id),
                                    consecutivo: ko.observable(telefonos[i].consecutivo),
                                    tipo: ko.observable(telefonos[i].tipo),
                                    nombreTipo: ko.observable(telefonos[i].nombreTipo),
                                    numero: ko.observable(telefonos[i].numero)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_telefonos.warning("Error al eliminar el teléfono.");
                }});
        };

        self.editarTelefono = function (telefono) {
            $('#tipoTelefono').val(telefono.tipo()).trigger('change');
            $('#nombreTipoTelefono').val(telefono.nombreTipo());
            $('#numeroTelefono').val(telefono.numero());
            $('#consecutivo').val(telefono.consecutivo());
            bootstrap_alert_telefono.removeWarning();
            $('#md_telefono').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarDocumentoSoporte = function () {
            var tipoDocumento = $('#tipoDocumento').val();
            var nombreTipoDocumento = $('#tipoDocumento option:selected').text();

            if (tipoDocumento === "") {
                bootstrap_alert_documento_soporte.warning('Debe ingresar el tipo de documento');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoSoporte').val() === "") {
                    bootstrap_alert_documento_soporte.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoSoporte')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_documento_soporte.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                
                formData.append("id", 0);
                formData.append("consecutivo", self.documentosSoporte().length);
        
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.documentosSoporte().length; i++) {
                    if (self.documentosSoporte()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoSoporte').val() !== "" &&
                    $('#documentoSoporte')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_documento_soporte.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.documentosSoporte()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipoDocumento", tipoDocumento);
            if ($('#documentoSoporte').val() !== "") {
                formData.append("documento", $('#documentoSoporte')[0].files[0]);
            }

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/documentoSoporte",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_documento_soporte').modal('hide');
                    bootstrap_alert_documentos_soporte.success('Documento almacenado correctamente');
                    if (response !== "") {
                        self.documentosSoporte.removeAll();
                        var documentosSoporte = JSON.parse(response);
                        for (var i = 0; i < documentosSoporte.length; i++) {
                            self.documentosSoporte.push(
                                {
                                    id: ko.observable(documentosSoporte[i].id),
                                    consecutivo: ko.observable(documentosSoporte[i].consecutivo),
                                    tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                                    nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                                    validado: ko.observable(documentosSoporte[i].validado),
                                    nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_documento_soporte.warning("Error al almacenar el documento.");
                }});
        };

        self.eliminarDocumentoSoporte = function (documentoSoporte) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarDocumentoSoporte/" + documentoSoporte.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_documentos_soporte.success("Documento eliminado exitosamente.");
                    if (response !== "") {
                        self.documentosSoporte.removeAll();
                        var documentosSoporte = JSON.parse(response);
                        for (var i = 0; i < documentosSoporte.length; i++) {
                            self.documentosSoporte.push(
                                {
                                    id: ko.observable(documentosSoporte[i].id),
                                    consecutivo: ko.observable(documentosSoporte[i].consecutivo),
                                    tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                                    nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                                    validado: ko.observable(documentosSoporte[i].validado),
                                    nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_documentos_soporte.warning("Error al eliminar el documento.");
                }});
        };

        self.editarDocumentoSoporte = function (documentoSoporte) {
            $('#tipoDocumento').val(documentoSoporte.tipoDocumento()).trigger('change');
            $('#consecutivo').val(documentoSoporte.consecutivo());
            $('#documentoSoporte').val('');
            bootstrap_alert_documentos_soporte.removeWarning();
            bootstrap_alert_documento_soporte.removeWarning();
            $('#md_documento_soporte').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoSoporte = function (documentoSoporte) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/documentoSoporte/" + documentoSoporte.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/documentoSoporte/" + documentoSoporte.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };

        self.adicionarIdioma = function () {
            var idioma = $('#idioma').val();
            var nombreIdioma = $('#idioma option:selected').text();
            var nivelConversacion = "";
            var nombreNivelConversacion = "";
            var nivelEscritura = "";
            var nombreNivelEscritura = "";
            var nivelEscucha = "";
            var nombreNivelEscucha = "";
            var nivelLectura = "";
            var nombreNivelLectura = "";
            if($('#nivelConversacionIdiomaA').is(":checked")) {
              nivelConversacion = "A";
              nombreNivelConversacion = "Alto";
            }
            else if($('#nivelConversacionIdiomaB').is(":checked")) {
              nivelConversacion = "B";
              nombreNivelConversacion = "Bajo";
            }
            else if($('#nivelConversacionIdiomaM').is(":checked")) {
              nivelConversacion = "M";
              nombreNivelConversacion = "Medio";
            }
            if($('#nivelEscrituraIdiomaA').is(":checked")) {
              nivelEscritura = "A";
              nombreNivelEscritura = "Alto";
            }
            else if($('#nivelEscrituraIdiomaB').is(":checked")) {
              nivelEscritura = "B";
              nombreNivelEscritura = "Bajo";
            }
            else if($('#nivelEscrituraIdiomaM').is(":checked")) {
              nivelEscritura = "M";
              nombreNivelEscritura = "Medio";
            }
            if($('#nivelEscuchaIdiomaA').is(":checked")) {
              nivelEscucha = "A";
              nombreNivelEscucha = "Alto";
            }
            else if($('#nivelEscuchaIdiomaB').is(":checked")) {
              nivelEscucha = "B";
              nombreNivelEscucha = "Bajo";
            }
            else if($('#nivelEscuchaIdiomaM').is(":checked")) {
              nivelEscucha = "M";
              nombreNivelEscucha = "Medio";
            }
            if($('#nivelLecturaIdiomaA').is(":checked")) {
              nivelLectura = "A";
              nombreNivelLectura = "Alto";
            }
            else if($('#nivelLecturaIdiomaB').is(":checked")) {
              nivelLectura = "B";
              nombreNivelLectura = "Bajo";
            }
            else if($('#nivelLecturaIdiomaM').is(":checked")) {
              nivelLectura = "M";
              nombreNivelLectura = "Medio";
            }
            var otraCertificacion = $('#otraCertificacionIdioma').val();
            var tipoCertificacion = $('#tipoCertificacionIdioma').val();
            var nombreTipoCertificacion = $('#tipoCertificacionIdioma option:selected').text();
            var puntajeCertificacion = $('#puntajeCertificacionIdioma').val();

            if (idioma === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el idioma');
                return false;
            }
            if (nivelEscucha === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de escucha');
                return false;
            }
            if (nivelConversacion === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de conversación');
                return false;
            }
            if (nivelLectura === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de lectura');
                return false;
            }
            if (nivelEscritura === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el nivel de escritura');
                return false;
            }
            if (tipoCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el tipo de certificación');
                return false;
            }
            if (tipoCertificacion === TIPO_CERTIFICACION_OTRO && otraCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar la otra certificación');
                return false;
            }
            if (puntajeCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar el puntaje de certificación');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoIdioma').val() === "") {
                    bootstrap_alert_idioma.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoIdioma')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_idioma.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", 0);
                formData.append("consecutivo", self.idiomas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.idiomas().length; i++) {
                    if (self.idiomas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoIdioma').val() != "" && 
                    $('#certificadoIdioma')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_idioma.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.idiomas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#certificadoIdioma').val() !== "") {
                formData.append("certificado", $('#certificadoIdioma')[0].files[0]);
            }
            formData.append("idioma",idioma);
            formData.append("nivelConversacion",nivelConversacion);
            formData.append("nivelEscritura",nivelEscritura);
            formData.append("nivelEscucha",nivelEscucha);
            formData.append("nivelLectura",nivelLectura);
            formData.append("otraCertificacion",otraCertificacion);
            formData.append("tipoCertificacion",tipoCertificacion);
            formData.append("puntajeCertificacion",puntajeCertificacion);
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/idioma",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_idioma').modal('hide');
                    bootstrap_alert_idiomas.success('Idioma almacenado correctamente');
                    if (response !== "") {
                        self.idiomas.removeAll();
                        var idiomas = JSON.parse(response);
                        for (var i = 0; i < idiomas.length; i++) {
                            self.idiomas.push(
                                {
                                    id: ko.observable(idiomas[i].id),
                                    consecutivo: ko.observable(idiomas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_idiomas.warning("Error al almacenar el idioma.");
                }});
        };

        self.eliminarIdioma = function (idioma) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarIdioma/" + idioma.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_idiomas.success("Idioma eliminado exitosamente.");
                    if (response !== "") {
                        self.idiomas.removeAll();
                        var idiomas = JSON.parse(response);
                        for (var i = 0; i < idiomas.length; i++) {
                            self.idiomas.push(
                                {
                                    id: ko.observable(idiomas[i].id),
                                    consecutivo: ko.observable(idiomas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_idiomas.warning("Error al eliminar el idioma.");
                }});
        };

        self.editarIdioma = function (idioma) {
            $('#idioma').val(idioma.idioma()).trigger('change');
            $('#nivelConversacionIdioma' + idioma.nivelConversacion()).prop("checked", true); 
            $('#nivelEscrituraIdioma' + idioma.nivelEscritura()).prop("checked", true); 
            $('#nivelEscuchaIdioma' + idioma.nivelEscucha()).prop("checked", true); 
            $('#nivelLecturaIdioma' + idioma.nivelLectura()).prop("checked", true); 
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if($('#tipoCertificacionIdioma').val() === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#puntajeCertificacionIdioma').val(idioma.puntajeCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            $('#certificadoIdioma').show();
            bootstrap_alert_idioma.removeWarning();
            bootstrap_alert_idiomas.removeWarning();
            $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoIdioma = function (idioma) {
           $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoIdioma/" + idioma.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                  if(response != "") {
                      window.location.href = contextPath + "/hojasVida/certificadoIdioma/" + idioma.id();
                  }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });            
        };
        
        self.adicionarEducacionBasica = function () {
            var nivelEstudioEducacionBasica = $('#nivelEstudioEducacionBasica').val();
            var nombreNivelEducacionBasica = $('#nivelEstudioEducacionBasica option:selected').text();
            var institucionEducacionBasica = $('#institucionEducacionBasica').val();
            var anyoInicioEducacionBasica = $('#anyoInicioEducacionBasica').val();
            var anyoFinalizacionEducacionBasica = $('#anyoFinalizacionEducacionBasica').val();
            var tituloEducacionBasica = $('#tituloEducacionBasica').val();
            var graduadoEducacionBasica = strToBool($('#graduadoEducacionBasica').val());
        
            if (nivelEstudioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if (institucionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar la institución');
                return false;
            }
            if (anyoInicioEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionBasica && anyoFinalizacionEducacionBasica === "") {
                bootstrap_alert_educacion_basica.warning('Debe ingresar el año de finalización');
                return false;
            }
            
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionBasica').val() === "") {
                    bootstrap_alert_educacion_basica.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionBasica')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_basica.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesBasicas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.educacionesBasicas().length; i++) {
                    if (self.educacionesBasicas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoEducacionBasica').val() != "" && 
                    $('#certificadoEducacionBasica')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_basica.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }                
                formData.append("id", self.educacionesBasicas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("institucion", institucionEducacionBasica);
            formData.append("nivel", nivelEstudioEducacionBasica);
            formData.append("anyoInicio", anyoInicioEducacionBasica);
            formData.append("anyoFinalizacion", anyoFinalizacionEducacionBasica);
            formData.append("titulo", tituloEducacionBasica);
            formData.append("graduado", graduadoEducacionBasica);
            if ($('#certificadoEducacionBasica').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionBasica')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/educacionBasica",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_basica').modal('hide');
                    bootstrap_alert_educaciones_basicas.success('Educación básica almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesBasicas.removeAll();
                        var educacionesBasicas = JSON.parse(response);
                        for (var i = 0; i < educacionesBasicas.length; i++) {
                            self.educacionesBasicas.push(
                                {
                                    id: ko.observable(educacionesBasicas[i].id),
                                    consecutivo: ko.observable(educacionesBasicas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_basicas.warning("Error al almacenar la educación básica.");
                }});
        };

        self.eliminarEducacionBasica = function (educacionBasica) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarEducacionBasica/" + educacionBasica.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_basicas.success('Educación básica eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesBasicas.removeAll();
                        var educacionesBasicas = JSON.parse(response);
                        for (var i = 0; i < educacionesBasicas.length; i++) {
                            self.educacionesBasicas.push(
                                {
                                    id: ko.observable(educacionesBasicas[i].id),
                                    consecutivo: ko.observable(educacionesBasicas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_basicas.warning("Error al eliminar la educación básica.");
                }});
        };

        self.editarEducacionBasica = function (educacionBasica) {
            $('#nivelEstudioEducacionBasica').val(educacionBasica.nivel()).trigger('change');
            $('#institucionEducacionBasica').val(educacionBasica.institucion());
            $('#anyoInicioEducacionBasica').val(educacionBasica.anyoInicio());
            $('#anyoFinalizacionEducacionBasica').val(educacionBasica.anyoFinalizacion()).trigger('change');
            $('#tituloEducacionBasica').val(educacionBasica.titulo());
            $('#graduadoEducacionBasica').val(educacionBasica.graduado());            
            if(educacionBasica.graduado()) {
              $('#btnGraduadoSiEducacionBasica').removeClass('notActive').addClass('active');  
              $('#btnGraduadoNoEducacionBasica').removeClass('active').addClass('notActive');
              $('#anyoFinalizacionEducacionBasica').prop('disabled',false);
            } else {
              $('#btnGraduadoNoEducacionBasica').removeClass('notActive').addClass('active');  
              $('#btnGraduadoSiEducacionBasica').removeClass('active').addClass('notActive');  
              $('#anyoFinalizacionEducacionBasica').prop('disabled','disabled');
            }
            if($('#tipoCertificacionEducacionBasica').val() === TIPO_CERTIFICACION_OTRO) {
              $('#divOtroCertificacionIdioma').css("display","block");
            } else {
              $('#divOtroCertificacionIdioma').css("display","none");
            }            
            $('#consecutivo').val(educacionBasica.consecutivo());
            $('#certificadoEducacionBasica').val('');
            bootstrap_alert_educacion_basica.removeWarning();
            bootstrap_alert_educaciones_basicas.removeWarning();
            $('#md_educacion_basica').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoEducacionBasica = function (educacionBasica) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoEducacionBasica/" + educacionBasica.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoEducacionBasica/" + educacionBasica.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarEducacionSuperior = function () {
            var nivelEstudioEducacionSuperior = $('#nivelEstudioEducacionSuperior').val();
            var nombreNivelEducacionSuperior = $('#nivelEstudioEducacionSuperior option:selected').text();
            var tituloExteriorEducacionSuperior = strToBool($('#tituloExteriorEducacionSuperior').val());
            var paisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior').val();
            var nombrePaisTituloExteriorEducacionSuperior = $('#paisTituloExteriorEducacionSuperior option:selected').text();
            var programaCursadoEducacionSuperior = $('#programaCursadoEducacionSuperior').val();
            var nombreProgramaCursadoEducacionSuperior = $('#nombreProgramaCursadoEducacionSuperior').val();
            var nombreInstitucionEducacionSuperior = $('#nombreInstitucionEducacionSuperior').val();
            var nombreNucleoBasicoConocimientoEducacionSuperior = $('#nombreNucleoBasicoConocimientoEducacionSuperior').val();
            var anyoInicioEducacionSuperior = $('#anyoInicioEducacionSuperior').val();
            var anyoFinalizacionEducacionSuperior = $('#anyoFinalizacionEducacionSuperior').val();
            var tituloEducacionSuperior = $('#tituloEducacionSuperior').val();
            var graduadoEducacionSuperior = strToBool($('#graduadoEducacionSuperior').val());
            var fechaTituloEducacionSuperior = $('#fechaTituloEducacionSuperior').val();
        
            if (nivelEstudioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe seleccionar el nivel de estudio');
                return false;
            }
            if(tituloExteriorEducacionSuperior) {
                if(paisTituloExteriorEducacionSuperior === "") {
                    bootstrap_alert_educacion_superior.warning('Debe seleccionar el país');
                    return false;
                }
                if ($('#consecutivo').val() === "") {    
                    if ($('#certificadoHomologadoEducacionSuperior').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                    if ($('#certificadoHomologadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                        bootstrap_alert_educacion_superior.warning('El certificado homologado no debe ser mayor a 2MB');
                        return false;
                    }                
                } 
            }
            if (programaCursadoEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el programa');
                return false;
            }
            if (anyoInicioEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de inicio');
                return false;
            }
            if (graduadoEducacionSuperior && anyoFinalizacionEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el año de finalización');
                return false;
            }
            if (tituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar el título');
                return false;
            }
            if (graduadoEducacionSuperior && fechaTituloEducacionSuperior === "") {
                bootstrap_alert_educacion_superior.warning('Debe ingresar la fecha del título');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionSuperior').val() === "") {
                    bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_superior.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesSuperiores().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.educacionesSuperiores().length; i++) {
                    if (self.educacionesSuperiores()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if(tituloExteriorEducacionSuperior && self.educacionesSuperiores()[indice].tituloExterior() === false) {
                    if($('#certificadoHomologadoEducacionSuperior').val() === "") {
                        bootstrap_alert_educacion_superior.warning('Debe ingresar el certificado homologado del título');
                        return false;
                    }
                    if ($('#certificadoHomologadoEducacionSuperior').val() != "" && 
                        $('#certificadoHomologadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                        bootstrap_alert_educacion_superior.warning('El certificado homologado no debe ser mayor a 2MB');
                        return false;
                    }                    
                }
                if ($('#certificadoEducacionSuperior').val() != "" && 
                    $('#certificadoEducacionSuperior')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_superior.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.educacionesSuperiores()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("tituloExterior",tituloExteriorEducacionSuperior);
            formData.append("paisTituloExterior",paisTituloExteriorEducacionSuperior);
            formData.append("nivel",nivelEstudioEducacionSuperior);
            formData.append("programa",programaCursadoEducacionSuperior);
            formData.append("anyoInicio",anyoInicioEducacionSuperior);
            formData.append("anyoFinalizacion",anyoFinalizacionEducacionSuperior);
            formData.append("titulo",tituloEducacionSuperior);
            formData.append("graduado",graduadoEducacionSuperior);
            formData.append("fechaTitulo",fechaTituloEducacionSuperior);
            if ($('#certificadoHomologadoEducacionSuperior').val() != "") {
                formData.append("certificadoHomologado", $('#certificadoHomologadoEducacionSuperior')[0].files[0]);
            }
            if ($('#certificadoEducacionSuperior').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionSuperior')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/educacionSuperior",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_superior').modal('hide');
                    bootstrap_alert_educaciones_superiores.success('Educación superior almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesSuperiores.removeAll();
                        var educacionesSuperiores = JSON.parse(response);
                        for (var i = 0; i < educacionesSuperiores.length; i++) {
                            self.educacionesSuperiores.push(
                                {
                                    id: ko.observable(educacionesSuperiores[i].id),
                                    consecutivo: ko.observable(educacionesSuperiores[i].consecutivo),
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
                    establecerEgresadoUdeA();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_superiores.warning("Error al almacenar la educación superior.");
                }});            
        };

        self.eliminarEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarEducacionSuperior/" + educacionSuperior.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_superiores.success('Educación superior eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesSuperiores.removeAll();
                        var educacionesSuperiores = JSON.parse(response);
                        for (var i = 0; i < educacionesSuperiores.length; i++) {
                            self.educacionesSuperiores.push(
                                {
                                    id: ko.observable(educacionesSuperiores[i].id),
                                    consecutivo: ko.observable(educacionesSuperiores[i].consecutivo),
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
                    establecerEgresadoUdeA();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_superiores.warning("Error al eliminar la educación superior.");
                }});
        };

        self.editarEducacionSuperior = function (educacionSuperior) {
            $('#nivelEstudioEducacionSuperior').val(educacionSuperior.nivel()).trigger('change');
            $('#tituloExteriorEducacionSuperior').val(educacionSuperior.tituloExterior());
            $('#paisTituloExteriorEducacionSuperior').val(educacionSuperior.paisTituloExterior()).trigger('change');
            
            if(educacionSuperior.tituloExterior()) {
                $('#paistit').css("display","block");
                $('#certhomo').css('display','block');
                $('#btnNuevoProgramaExterior').show();
                $('#divProgramaExterior').show();
                $('#institucionEducativaProgramaExterior').next(".select2-container").show();
                $('#institucionEducativaProgramaColombiana').next(".select2-container").hide();
            } else {
                $('#paistit').css("display","none");
                $('#certhomo').css('display','none');
                $('#btnNuevoProgramaExterior').hide();
                $('#divProgramaExterior').hide();
                $('#institucionEducativaProgramaExterior').next(".select2-container").hide();
                $('#institucionEducativaProgramaColombiana').next(".select2-container").show();
            }
            
            $('#formprograma').css("display","block");
            
            $('#nombreInstitucionEducacionSuperior').val(educacionSuperior.nombreInstitucion());
            $('#programaCursadoEducacionSuperior').val(educacionSuperior.programa());
            $('#nombreProgramaCursadoEducacionSuperior').val(educacionSuperior.nombrePrograma());
            $('#nombreNucleoBasicoConocimientoEducacionSuperior').val(educacionSuperior.nombreNucleoBasicoConocimiento());
            $('#tituloEducacionSuperior').val(educacionSuperior.titulo());
    
            $('#anyoInicioEducacionSuperior').val(educacionSuperior.anyoInicio());
            $('#anyoFinalizacionEducacionSuperior').val(educacionSuperior.anyoFinalizacion()).trigger('change');
            $('#graduadoEducacionSuperior').val(educacionSuperior.graduado());            
            $('#fechaTituloEducacionSuperior').val(educacionSuperior.fechaTitulo());
            if(educacionSuperior.graduado()) {
              $('#btnGraduadoSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#anyoFinalizacionEducacionSuperior').prop('disabled',false);
              $('#fechaTituloEducacionSuperior').prop('disabled',false);
            } else {
              $('#btnGraduadoNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
              $('#fechaTituloEducacionSuperior').prop('disabled','disabled');
            }
            if(educacionSuperior.tituloExterior()) {
              $('#btnTituloExteriorSiEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExteriorNoEducacionSuperior').removeClass('active').addClass('notActive');
              $('#paisTituloExteriorEducacionSuperior').css("display","block");
            } else {
              $('#btnTituloExteriorNoEducacionSuperior').removeClass('notActive').addClass('active');  
              $('#btnTituloExteriorSiEducacionSuperior').removeClass('active').addClass('notActive');  
              $('#paisTituloExteriorEducacionSuperior').css("display","none");
            }
            $('#consecutivo').val(educacionSuperior.consecutivo());
            $('#certificadoEducacionSuperior').val("");
            $('#certificadoHomologadoEducacionSuperior').val("");
            bootstrap_alert_educacion_superior.removeWarning();
            bootstrap_alert_educaciones_superiores.removeWarning();
            $('#md_educacion_superior').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoHomologadoEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoHomologadoEducacionSuperior/" + educacionSuperior.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.verCertificadoEducacionSuperior = function (educacionSuperior) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoEducacionSuperior/" + educacionSuperior.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarEducacionContinua = function () {
            var tipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua').val();
            var nombreTipoCapacitacionEducacionContinua = $('#tipoCapacitacionEducacionContinua option:selected').text();
            var institucionEducacionContinua = $('#institucionEducacionContinuaColombiana').val();
            var nombreInstitucionEducacionContinua = $('#institucionEducacionContinuaColombiana option:selected').text();
            var nucleoBasicoConocimientoEducacionContinua = $('#nucleoBasicoConocimientoEducacionContinua').val();
            var nombreNucleoBasicoConocimientoEducacionContinua = $('#nombreNucleoBasicoConocimientoEducacionContinua').val();
            var nombreCapacitacionEducacionContinua = $('#nombreCapacitacionEducacionContinua').val();
            var numeroHorasEducacionContinua = $('#numeroHorasEducacionContinua').val();
            var anyoEducacionContinua = $('#anyoEducacionContinua').val();
            var estudioExteriorEducacionContinua = strToBool($('#estudioExteriorEducacionContinua').val());

            if (tipoCapacitacionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el tipo de capacitación');
                return false;
            }
            if(estudioExteriorEducacionContinua) {
                institucionEducacionContinua = $('#institucionEducacionContinuaExterior').val();
                nombreInstitucionEducacionContinua = $('#institucionEducacionContinuaExterior option:selected').text();
                if (institucionEducacionContinua === "") {
                    bootstrap_alert_educacion_continua.warning('Debe seleccionar la institución');
                    return false;
                }
            } else {
                if (institucionEducacionContinua === "") {
                    bootstrap_alert_educacion_continua.warning('Debe seleccionar la institución');
                    return false;
                }
            }
            if (nucleoBasicoConocimientoEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el área de saber');
                return false;
            }
            if (nombreCapacitacionEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el nombre de la capacitación');
                return false;
            }
            if (numeroHorasEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el número de horas');
                return false;
            }
            if (anyoEducacionContinua === "") {
                bootstrap_alert_educacion_continua.warning('Debe ingresar el año');
                return false;
            }
            var formData = new FormData();
            
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoEducacionContinua').val() === "") {
                    bootstrap_alert_educacion_continua.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoEducacionContinua')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_continua.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesContinuas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.educacionesContinuas().length; i++) {
                    if (self.educacionesContinuas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoEducacionContinua').val() != "" && 
                    $('#certificadoEducacionContinua')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_educacion_continua.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.educacionesContinuas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }

            formData.append("tipoCapacitacion", tipoCapacitacionEducacionContinua);
            formData.append("institucion", institucionEducacionContinua);
            formData.append("nombreCapacitacion", nombreCapacitacionEducacionContinua);
            formData.append("numeroHoras", numeroHorasEducacionContinua);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoEducacionContinua);
            formData.append("anyo", anyoEducacionContinua);
            formData.append("estudioExterior", estudioExteriorEducacionContinua);
            if ($('#certificadoEducacionContinua').val() !== "") {
                formData.append("certificado", $('#certificadoEducacionContinua')[0].files[0]);
            }
        
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/educacionContinua",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_educacion_continua').modal('hide');
                    bootstrap_alert_educaciones_continuas.success('Educación no formal almacenada correctamente.');
                    if (response !== "") {
                        self.educacionesContinuas.removeAll();
                        var educacionesContinuas = JSON.parse(response);
                        for (var i = 0; i < educacionesContinuas.length; i++) {
                            self.educacionesContinuas.push(
                                {
                                    id: ko.observable(educacionesContinuas[i].id),
                                    consecutivo: ko.observable(educacionesContinuas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_continuas.warning("Error al almacenar la educación no formal.");
                }});            
        };

        self.eliminarEducacionContinua = function (educacionContinua) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarEducacionContinua/" + educacionContinua.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_educaciones_continuas.success('Educación no formal eliminada correctamente.');
                    if (response !== "") {
                        self.educacionesContinuas.removeAll();
                        var educacionesContinuas = JSON.parse(response);
                        for (var i = 0; i < educacionesContinuas.length; i++) {
                            self.educacionesContinuas.push(
                                {
                                    id: ko.observable(educacionesContinuas[i].id),
                                    consecutivo: ko.observable(educacionesContinuas[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_educaciones_continuas.warning("Error al eliminar la educación no formal.");
                }});
        };

        self.editarEducacionContinua = function (educacionContinua) {
            $('#tipoCapacitacionEducacionContinua').val(educacionContinua.tipoCapacitacion()).trigger('change');
            $('#nombreCapacitacionEducacionContinua').val(educacionContinua.nombreCapacitacion());
            $('#numeroHorasEducacionContinua').val(educacionContinua.numeroHoras());
            $('#nucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nombreNucleoBasicoConocimiento());
            $('#anyoEducacionContinua').val(educacionContinua.anyo()).trigger('change');
            $('#consecutivo').val(educacionContinua.consecutivo());
            $('#certificadoEducacionContinua').show();
            if(educacionContinua.estudioExterior()) {
              $('#institucionEducacionContinuaExterior').val(educacionContinua.institucion()).trigger('change');
              $('#btnEstudioExteriorSiEducacionContinua').removeClass('notActive').addClass('active');  
              $('#btnEstudioExteriorNoEducacionContinua').removeClass('active').addClass('notActive');
              $('#institucionEducacionContinuaExterior').next(".select2-container").show();
              $('#institucionEducacionContinuaColombiana').next(".select2-container").hide();
              $('#btnNuevaInstitucionExteriorEducacionContinua').show();
              $('#divMensajeInstitucionExteriorEducacionContinua').show();
            } else {
              $('#institucionEducacionContinuaColombiana').val(educacionContinua.institucion()).trigger('change');
              $('#btnEstudioExteriorSiEducacionContinua').removeClass('active').addClass('notActive');  
              $('#btnEstudioExteriorNoEducacionContinua').removeClass('notActive').addClass('active');
              $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
              $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
              $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
              $('#divMensajeInstitucionExteriorEducacionContinua').hide();
            }
            bootstrap_alert_educacion_continua.removeWarning();
            bootstrap_alert_educaciones_continuas.removeWarning();
            $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoEducacionContinua = function (educacionContinua) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoEducacionContinua/" + educacionContinua.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoEducacionContinua/" + educacionContinua.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };        

        self.adicionarDistincion = function () {
            var fechaDistincion = $('#fechaDistincion').val();
            var institucionOtorgaDistincion = $('#institucionOtorgaDistincion').val();
            var descripcionDistincion = $('#descripcionDistincion').val();

            if (fechaDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la fecha');
                return false;
            }
            if (institucionOtorgaDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la institución');
                return false;
            }
            if (descripcionDistincion === "") {
                bootstrap_alert_distincion.warning('Debe ingresar la descripción');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoDistincion').val() === "") {
                    bootstrap_alert_distincion.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoDistincion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_distincion.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.distinciones().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.distinciones().length; i++) {
                    if (self.distinciones()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoDistincion').val() != "" && 
                    $('#certificadoDistincion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_distincion.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.distinciones()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("fechaDistincion",fechaDistincion);
            formData.append("institucionOtorga",institucionOtorgaDistincion);
            formData.append("descripcion",descripcionDistincion);
            if ($('#certificadoDistincion').val() !== "") {
                formData.append("certificado", $('#certificadoDistincion')[0].files[0]);
            }

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/distincion",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_distincion').modal('hide');
                    bootstrap_alert_distinciones.success('Distinción almacenada correctamente.');
                    if (response !== "") {
                        self.distinciones.removeAll();
                        var distinciones = JSON.parse(response);
                        for (var i = 0; i < distinciones.length; i++) {
                            self.distinciones.push(
                                {
                                    id: ko.observable(distinciones[i].id),
                                    consecutivo: ko.observable(distinciones[i].consecutivo),
                                    fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                                    institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                                    descripcion: ko.observable(distinciones[i].descripcion),
                                    certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_distinciones.warning("Error al almacenar la distinción.");
                }});            
        };

        self.eliminarDistincion = function (distincion) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarDistincion/" + distincion.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_distinciones.success('Distinción eliminada correctamente.');
                    if (response !== "") {
                        self.distinciones.removeAll();
                        var distinciones = JSON.parse(response);
                        for (var i = 0; i < distinciones.length; i++) {
                            self.distinciones.push(
                                {
                                    id: ko.observable(distinciones[i].id),
                                    consecutivo: ko.observable(distinciones[i].consecutivo),
                                    fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                                    institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                                    descripcion: ko.observable(distinciones[i].descripcion),
                                    certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_distinciones.warning("Error al eliminar la distinción.");
                }});
        };

        self.editarDistincion = function (distincion) {
            $('#fechaDistincion').val(distincion.fechaDistincion());
            $('#institucionOtorgaDistincion').val(distincion.institucionOtorga());
            $('#descripcionDistincion').val(distincion.descripcion());
            $('#consecutivo').val(distincion.consecutivo());
            $('#certificadoDistincion').val('');
            bootstrap_alert_distincion.removeWarning();
            bootstrap_alert_distinciones.removeWarning();
            $('#md_distincion').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoDistincion = function (distincion) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoDistincion/" + distincion.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoDistincion/" + distincion.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };
        
       self.adicionarExperienciaLaboral = function () {
            var tipoExperienciaLaboral = $('#tipoExperienciaLaboral').val();
            var nombreTipoExperienciaLaboral = $('#tipoExperienciaLaboral option:selected').text();
            var trabajoActualExperienciaLaboral = strToBool($('#trabajoActualExperienciaLaboral').val());
            var experienciaLaboralFNSP = strToBool($('#experienciaLaboralFNSP').val());
            var fechaIngresoExperienciaLaboral = $('#fechaIngresoExperienciaLaboral').val();
            var fechaRetiroExperienciaLaboral = $('#fechaRetiroExperienciaLaboral').val();
            var nucleoBasicoConocimientoExperienciaLaboral = $('#nucleoBasicoConocimientoExperienciaLaboral').val();
            var nombreNucleoBasicoConocimientoExperienciaLaboral = $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val();
            var tipoEmpresaExperienciaLaboral = $('#tipoEmpresaExperienciaLaboral').val();
            var nombreTipoEmpresaExperienciaLaboral = $('#tipoEmpresaExperienciaLaboral option:selected').text();
            var nombreEmpresaExperienciaLaboral = $('#nombreEmpresaExperienciaLaboral').val();
            var actividadEconomicaExperienciaLaboral = $('#actividadEconomicaExperienciaLaboral').val();
            var nombreActividadEconomicaExperienciaLaboral = $('#actividadEconomicaExperienciaLaboral option:selected').text();
            var tipoContratoExperienciaLaboral = $('#tipoContratoExperienciaLaboral').val();
            var nombreTipoContratoExperienciaLaboral = $('#tipoContratoExperienciaLaboral option:selected').text();
            var cargoExperienciaLaboral = $('#cargoExperienciaLaboral').val();
            var naturalezaCargoExperienciaLaboral = $('#naturalezaCargoExperienciaLaboral').val();
            var nombreNaturalezaCargoExperienciaLaboral = $('#naturalezaCargoExperienciaLaboral option:selected').text();
            if (tipoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de experiencia laboral');
                return false;
            }
            if (fechaIngresoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar la la fecha de ingreso');
                return false;
            }
            if (!trabajoActualExperienciaLaboral && fechaRetiroExperienciaLaboral === "" ) {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar la la fecha de retiro');
                return false;
            }
            if (nucleoBasicoConocimientoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el núcleo de conocimiento');
                return false;
            }
            if (tipoEmpresaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de empresa');
                return false;
            }
            if (nombreEmpresaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar el nombre de la empresa');
                return false;
            }
            if (actividadEconomicaExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar la actividad económica');
                return false;
            }
            if (tipoContratoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar el tipo de contrato');
                return false;
            }
            if (cargoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe ingresar el cargo');
                return false;
            }
            if (naturalezaCargoExperienciaLaboral === "") {
                bootstrap_alert_experiencia_laboral.warning('Debe seleccionar la naturaleza del cargo');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#certificadoExperienciaLaboral').val() === "") {
                    bootstrap_alert_experiencia_laboral.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoExperienciaLaboral')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_experiencia_laboral.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasLaborales().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.experienciasLaborales().length; i++) {
                    if (self.experienciasLaborales()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoExperienciaLaboral').val() != "" && 
                    $('#certificadoExperienciaLaboral')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_experiencia_laboral.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }                    
                formData.append("id", self.experienciasLaborales()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("tipoExperiencia",tipoExperienciaLaboral);
            formData.append("trabajoActual",trabajoActualExperienciaLaboral);
            formData.append("fnsp",experienciaLaboralFNSP);
            formData.append("fechaIngreso",fechaIngresoExperienciaLaboral);
            formData.append("fechaRetiro",fechaRetiroExperienciaLaboral);
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimientoExperienciaLaboral);
            formData.append("tipoEmpresa",tipoEmpresaExperienciaLaboral);
            formData.append("nombreEmpresa",nombreEmpresaExperienciaLaboral);
            formData.append("actividadEconomica",actividadEconomicaExperienciaLaboral);
            formData.append("tipoContrato",tipoContratoExperienciaLaboral);
            formData.append("cargo",cargoExperienciaLaboral);
            formData.append("naturalezaCargo",naturalezaCargoExperienciaLaboral);
            if ($('#certificadoExperienciaLaboral').val() !== "") {
                formData.append("certificado", $('#certificadoExperienciaLaboral')[0].files[0]);
            }
            
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/experienciaLaboral",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_experiencia_laboral').modal('hide');
                    bootstrap_alert_experiencias_laborales.success('Experiencia laboral almacenada correctamente.');
                    if (response !== "") {
                        self.experienciasLaborales.removeAll();
                        var experienciasLaborales = JSON.parse(response);
                        for (var i = 0; i < experienciasLaborales.length; i++) {
                            self.experienciasLaborales.push(
                                {
                                    id: ko.observable(experienciasLaborales[i].id),
                                    consecutivo: ko.observable(experienciasLaborales[i].consecutivo),
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
                                    nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_laborales.warning("Error al almacenar la experiencia laboral.");
                }});
        };

        self.eliminarExperienciaLaboral = function (experienciaLaboral) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarExperienciaLaboral/" + experienciaLaboral.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_experiencias_laborales.success('Experiencia laboral eliminada correctamente.');
                    if (response !== "") {
                        self.experienciasLaborales.removeAll();
                        var experienciasLaborales = JSON.parse(response);
                        for (var i = 0; i < experienciasLaborales.length; i++) {
                            self.experienciasLaborales.push(
                                {
                                    id: ko.observable(experienciasLaborales[i].id),
                                    consecutivo: ko.observable(experienciasLaborales[i].consecutivo),
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
                                    nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_laborales.warning("Error al eliminar la experiencia laboral.");
                }});
        };

        self.editarExperienciaLaboral = function (experienciaLaboral) {
            $('#tipoExperienciaLaboral').val(experienciaLaboral.tipoExperiencia()).trigger('change');
            $('#trabajoActualExperienciaLaboral').val(experienciaLaboral.trabajoActual());
            if(experienciaLaboral.trabajoActual()) {
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');
              $('#fechaRetiroExperienciaLaboral').prop('disabled', 'disabled');
              $('#fechaRetiroExperienciaLaboral').val('');
            } else {
              $('#btnTrabajoActualExperienciaLaboralNo').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaLaboralSi').removeClass('active').addClass('notActive');  
              $('#fechaRetiroExperienciaLaboral').prop('disabled', false);
            }
            $('#experienciaLaboralFNSP').val(experienciaLaboral.fnsp());
            if(experienciaLaboral.fnsp()) {
              $('#btnExperienciaLaboralFNSPSi').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPNo').removeClass('active').addClass('notActive');
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', 'disabled');
              $('#tipoEmpresaExperienciaLaboral').prop('disabled', 'disabled');
              $('#actividadEconomicaExperienciaLaboral').prop('disabled', 'disabled');
            } else {
              $('#btnExperienciaLaboralFNSPNo').removeClass('notActive').addClass('active');  
              $('#btnExperienciaLaboralFNSPSi').removeClass('active').addClass('notActive');  
              $('#nombreEmpresaExperienciaLaboral').prop('disabled', false);
              $('#tipoEmpresaExperienciaLaboral').prop('disabled', false);
              $('#actividadEconomicaExperienciaLaboral').prop('disabled', false);
            }
            $('#fechaIngresoExperienciaLaboral').val(experienciaLaboral.fechaIngreso());
            $('#fechaRetiroExperienciaLaboral').val(experienciaLaboral.fechaRetiro());
            $('#nucleoBasicoConocimientoExperienciaLaboral').val(experienciaLaboral.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val(experienciaLaboral.nombreNucleoBasicoConocimiento());
            $('#tipoEmpresaExperienciaLaboral').val(experienciaLaboral.tipoEmpresa()).trigger('change');
            $('#nombreEmpresaExperienciaLaboral').val(experienciaLaboral.nombreEmpresa());
            $('#actividadEconomicaExperienciaLaboral').val(experienciaLaboral.actividadEconomica()).trigger('change');
            $('#tipoContratoExperienciaLaboral').val(experienciaLaboral.tipoContrato()).trigger('change');
            $('#cargoExperienciaLaboral').val(experienciaLaboral.cargo());
            $('#naturalezaCargoExperienciaLaboral').val(experienciaLaboral.naturalezaCargo()).trigger('change');
            $('#consecutivo').val(experienciaLaboral.consecutivo());
            $('#certificadoExperienciaLaboral').val('');
            bootstrap_alert_experiencia_laboral.removeWarning();
            bootstrap_alert_experiencias_laborales.removeWarning();
            $('#md_experiencia_laboral').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoExperienciaLaboral = function (experienciaLaboral) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoExperienciaLaboral/" + experienciaLaboral.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });            
        };        
       
        self.adicionarExperienciaDocencia = function () {
            var trabajoActualDocencia = strToBool($('#trabajoActualDocencia').val());
            var experienciaDocenciaFNSP = strToBool($('#experienciaDocenciaFNSP').val());
            var experienciaDocenciaExterior = strToBool($('#experienciaDocenciaExterior').val());
            var institucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana').val();
            var nombreInstitucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana option:selected').text();
            if(experienciaDocenciaExterior) {
                institucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior').val();
                nombreInstitucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior option:selected').text();
            }
            if (institucionExperienciaDocencia === "") {
                bootstrap_alert_experiencia_docencia.warning('Debe seleccionar la institución');
                return false;
            }
            var formData = new FormData();
            if (self.consecutivoExperienciaDocencia() === self.experienciasDocencia().length) {
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasDocencia().length);
            } else {
                var indice = 0;
                for (var i = 0; i < self.experienciasDocencia().length; i++) {
                    if (self.experienciasDocencia()[i].consecutivo() === self.consecutivoExperienciaDocencia()) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.experienciasDocencia()[indice].id());
                formData.append("consecutivo", self.consecutivoExperienciaDocencia());
            }

            formData.append("trabajoActual", trabajoActualDocencia);
            formData.append("fnsp", experienciaDocenciaFNSP);
            formData.append("exterior", experienciaDocenciaExterior);
            formData.append("institucion", institucionExperienciaDocencia);

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/experienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_experiencia_docencia').modal('hide');
                    bootstrap_alert_experiencias_docencia.success('Experiencia en docencia almacenada correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var datos = JSON.parse(response);
                        var idExperienciaDocencia = datos.id;
                        var experienciasDocencia = datos.experienciasDocencia;
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            if(idExperienciaDocencia == experienciasDocencia[i].id) {
                              self.consecutivoExperienciaDocencia(experienciasDocencia[i].consecutivo);
                            }
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al almacenar la experiencia en docencia.");
                }});
        };

        self.eliminarExperienciaDocencia = function (experienciaDocencia) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarExperienciaDocencia/" + experienciaDocencia.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_experiencias_docencia.success('Experiencia en docencia eliminada correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al eliminar la experiencia en docencia.");
                }});
        };

        self.editarExperienciaDocencia = function (experienciaDocencia) {
            $('#trabajoActualDocencia').val(experienciaDocencia.trabajoActual());
            if(experienciaDocencia.trabajoActual()) {
              $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('active').addClass('notActive');
            } else {
              $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('notActive').addClass('active');  
              $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('active').addClass('notActive');  
            }
            $('#experienciaDocenciaFNSP').val(experienciaDocencia.fnsp());
            if(experienciaDocencia.fnsp()) {
              $('#btnExperienciaDocenciaFNSPSi').removeClass('notActive').addClass('active');  
              $('#btnExperienciaDocenciaFNSPNo').removeClass('active').addClass('notActive');
              $('#institucionExperienciaDocenciaColombiana').prop('disabled', 'disabled');
            } else {
              $('#btnExperienciaDocenciaFNSPNo').removeClass('notActive').addClass('active');  
              $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive');  
              $('#institucionExperienciaDocenciaColombiana').prop('disabled', false);
            }
            if(experienciaDocencia.exterior()) {
                $('#btnExperienciaDocenciaExteriorSi').removeClass('notActive').addClass('active');  
                $('#btnExperienciaDocenciaExteriorNo').removeClass('active').addClass('notActive');
                $('#institucionExperienciaDocenciaExterior').val(experienciaDocencia.institucion()).trigger('change');
                $('#institucionExperienciaDocenciaExterior').next(".select2-container").show();
                $('#institucionExperienciaDocenciaColombiana').next(".select2-container").hide();
                $('#btnNuevaInstitucionExteriorExperienciaDocencia').show();
                $('#divMensajeInstitucionExteriorExperienciaDocencia').show();
            } else {
                $('#btnExperienciaDocenciaExteriorNo').removeClass('notActive').addClass('active');  
                $('#btnExperienciaDocenciaExteriorSi').removeClass('active').addClass('notActive');  
                $('#institucionExperienciaDocenciaColombiana').val(experienciaDocencia.institucion()).trigger('change');
                $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
                $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
                $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
                $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
            }
            $('#certificadoCursoExperienciaDocencia').val('');
            self.consecutivoExperienciaDocencia(experienciaDocencia.consecutivo());
            bootstrap_alert_experiencia_docencia.removeWarning();
            bootstrap_alert_experiencias_docencia.removeWarning();
            bootstrap_alert_cursos_experiencia_docencia.removeWarning();
            bootstrap_alert_curso_experiencia_docencia.removeWarning();
            $('#md_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        };

       self.adicionarCursoExperienciaDocencia = function () {
            var nombreCursoExperienciaDocencia = $('#nombreCursoExperienciaDocencia').val();
            var nucleoBasicoConocimientoCursoExperienciaDocencia = $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val();
            var nombreNucleoBasicoConocimientoCursoExperienciaDocencia = $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val();
            var modalidadCursoExperienciaDocencia = $('#modalidadCursoExperienciaDocencia').val();
            var nombreModalidadCursoExperienciaDocencia = $('#modalidadCursoExperienciaDocencia option:selected').text();
            var nivelEstudioCursoExperienciaDocencia = $('#nivelEstudioCursoExperienciaDocencia').val();
            var nombreNivelEstudioCursoExperienciaDocencia = $('#nivelEstudioCursoExperienciaDocencia option:selected').text();
            var numeroHorasCursoExperienciaDocencia = $('#numeroHorasCursoExperienciaDocencia').val();
            var anyoCursoExperienciaDocencia = $('#anyoCursoExperienciaDocencia').val();
            if (nombreCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar el nombre del curso');
                return false;
            }
            if (nucleoBasicoConocimientoCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el núcleo de conocimiento');
                return false;
            }
            if (modalidadCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar la modalidad del curso');
                return false;
            }
            if (nivelEstudioCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el nivel del curso');
                return false;
            }
            if (numeroHorasCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar número de horas');
                return false;
            }
            if (anyoCursoExperienciaDocencia === "") {
                bootstrap_alert_curso_experiencia_docencia.warning('Debe seleccionar el año del curso');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                var consecutivo = self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length;  
                if ($('#certificadoCursoExperienciaDocencia').val() === "") {
                    bootstrap_alert_curso_experiencia_docencia.warning('Debe ingresar el certificado');
                    return false;
                }
                if ($('#certificadoCursoExperienciaDocencia')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_curso_experiencia_docencia.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", 0);
                formData.append("consecutivo", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.experienciasLaborales().length; i++) {
                    if (self.experienciasLaborales()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#certificadoCursoExperienciaDocencia').val() != "" &&
                    $('#certificadoCursoExperienciaDocencia')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_curso_experiencia_docencia.warning('El certificado no debe ser mayor a 2MB');
                    return false;
                }             
                formData.append("id", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].cursosExperienciaDocencia()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#certificadoCursoExperienciaDocencia').val() != "") {
               formData.append("certificado", $('#certificadoCursoExperienciaDocencia')[0].files[0]); 
            }
            formData.append("idExperienciaDocencia", self.experienciasDocencia()[self.consecutivoExperienciaDocencia()].id());
            formData.append("nombreCurso", nombreCursoExperienciaDocencia);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoCursoExperienciaDocencia);
            formData.append("modalidad", modalidadCursoExperienciaDocencia);
            formData.append("nivelEstudio",nivelEstudioCursoExperienciaDocencia);
            formData.append("numeroHoras",numeroHorasCursoExperienciaDocencia);
            formData.append("anyo", anyoCursoExperienciaDocencia);
                        
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/cursoExperienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_curso_experiencia_docencia').modal('hide');
                    bootstrap_alert_cursos_experiencia_docencia.success('Curso almacenado correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cursos_experiencia_docencia.warning("Error al almacenar el curso.");
                }});
        };

        self.eliminarCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_cursos_experiencia_docencia.success('Curso eliminado correctamente.');
                    if (response !== "") {
                        self.experienciasDocencia.removeAll();
                        var experienciasDocencia = JSON.parse(response);
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            self.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                self.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                                    certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                                    nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
                                });
                            }
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_cursos_experiencia_docencia.warning("Error al eliminar el curso.");
                }});
        };

        self.editarCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $('#nombreCursoExperienciaDocencia').val(cursoExperienciaDocencia.nombreCurso());
            $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val(cursoExperienciaDocencia.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val(cursoExperienciaDocencia.nombreNucleoBasicoConocimiento());
            $('#modalidadCursoExperienciaDocencia').val(cursoExperienciaDocencia.modalidad()).trigger('change');
            $('#nivelEstudioCursoExperienciaDocencia').val(cursoExperienciaDocencia.nivelEstudio()).trigger('change');
            $('#numeroHorasCursoExperienciaDocencia').val(cursoExperienciaDocencia.numeroHoras());
            $('#anyoCursoExperienciaDocencia').val(cursoExperienciaDocencia.anyo());
            $('#consecutivo').val(cursoExperienciaDocencia.consecutivo());
            $('#certificadoCursoExperienciaDocencia').val('');
            bootstrap_alert_curso_experiencia_docencia.removeWarning();
            bootstrap_alert_cursos_experiencia_docencia.removeWarning();
            $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verCertificadoCursoExperienciaDocencia = function (cursoExperienciaDocencia) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/certificadoCursoExperienciaDocencia/" + cursoExperienciaDocencia.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });                
        };        

        self.adicionarArticulo = function () {
            var nombreArticulo = $('#nombreArticulo').val();
            var tipoAutorArticulo = $('#tipoAutorArticulo').val();
            var nombreRevistaArticulo = $('#nombreRevistaArticulo').val();
            var anyoArticulo = $('#anyoArticulo').val();
            var nucleoBasicoConocimientoArticulo = $('#nucleoBasicoConocimientoArticulo').val();
            var urlArticulo = $('#urlArticulo').val();

            if (nombreArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar el título del artículo');
                return false;
            }
            if (tipoAutorArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el tipo de autor del artículo');
                return false;
            }
            if (nombreRevistaArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar el nombre de la revista');
                return false;
            }
            if (anyoArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el año del artículo');
                return false;
            }
            if (nucleoBasicoConocimientoArticulo === "") {
                bootstrap_alert_articulo.warning('Debe seleccionar el núcleo básico del conocimiento');
                return false;
            }
            if (urlArticulo === "") {
                bootstrap_alert_articulo.warning('Debe ingresar la URL del artículo');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.articulos().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.articulos().length; i++) {
                    if (self.articulos()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.articulos()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            
            formData.append("nombre", nombreArticulo);
            formData.append("tipoAutor", tipoAutorArticulo);
            formData.append("nombreRevista", nombreRevistaArticulo);
            formData.append("anyo", anyoArticulo);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoConocimientoArticulo);
            formData.append("url", urlArticulo);
            
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/articulo",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_articulo').modal('hide');
                    bootstrap_alert_articulos.success('Artículo almacenado correctamente.');
                    if (response !== "") {
                        self.articulos.removeAll();
                        var articulos = JSON.parse(response);
                        for (var i = 0; i < articulos.length; i++) {
                            self.articulos.push(
                                {
                                    id: ko.observable(articulos[i].id),
                                    consecutivo: ko.observable(articulos[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_articulos.warning("Error al almacenar el artículo.");
                }});
        };

        self.eliminarArticulo = function (articulo) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarArticulo/" + articulo.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_articulos.success('Artículo eliminado correctamente.');
                    if (response !== "") {
                        self.articulos.removeAll();
                        var articulos = JSON.parse(response);
                        for (var i = 0; i < articulos.length; i++) {
                            self.articulos.push(
                                {
                                    id: ko.observable(articulos[i].id),
                                    consecutivo: ko.observable(articulos[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_articulos.warning("Error al eliminar el artículo.");
                }});
        };

        self.editarArticulo = function (articulo) {
            $('#nombreArticulo').val(articulo.nombre());
            $('#nombreRevistaArticulo').val(articulo.nombreRevista());
            $('#tipoAutorArticulo').val(articulo.tipoAutor()).trigger('change');
            $('#urlArticulo').val(articulo.url());
            $('#anyoArticulo').val(articulo.anyo()).trigger('change');
            $('#nucleoBasicoConocimientoArticulo').val(articulo.nucleoBasicoConocimiento()).trigger('change');
            $('#consecutivo').val(articulo.consecutivo());
            bootstrap_alert_articulo.removeWarning();
            bootstrap_alert_articulos.removeWarning();
            $('#md_articulo').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarPatente = function () {
            var fechaPatente = $('#fechaPatente').val();
            var tipoPatente = $('#tipoPatente').val();
            var nombreTipoPatente = $('#tipoPatente option:selected').text();
            var propiedadCompartidaPatente = strToBool($('#propiedadCompartidaPatente').val());
            var clasePatente = $('#clasePatente').val();
            var descripcionPatente = $('#descripcionPatente').val();
        
            if (fechaPatente === "") {
                bootstrap_alert_patente.warning('Debe ingresar la fecha de la patente');
                return false;
            }
            if (tipoPatente === "") {
                bootstrap_alert_patente.warning('Debe seleccionar el tipo de pantente');
                return false;
            }
            if (clasePatente === "") {
                bootstrap_alert_patente.warning('Debe seleccionar la clase de patente');
                return false;
            }
            if (descripcionPatente === "") {
                bootstrap_alert_patente.warning('Debe ingresar la descripción de la patente');
                return false;
            }
            var nombrePropiedadCompartidaPatente = "No";
            if(propiedadCompartidaPatente) {
               nombrePropiedadCompartidaPatente = "Si";  
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoPatente').val() === "") {
                    bootstrap_alert_patente.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoPatente')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_patente.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", 0);
                formData.append("consecutivo", self.patentes().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.patentes().length; i++) {
                    if (self.patentes()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoPatente').val() != "" && 
                    $('#documentoPatente')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_patente.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.patentes()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            if ($('#documentoPatente').val() != "") {
               formData.append("documento", $('#documentoPatente')[0].files[0]); 
            }
            formData.append("fecha", fechaPatente);
            formData.append("tipo", tipoPatente);
            formData.append("propiedadCompartida", propiedadCompartidaPatente);
            formData.append("clase", clasePatente);
            formData.append("descripcion", descripcionPatente);

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/patente",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_patente').modal('hide');
                    bootstrap_alert_patentes.success('Patente almacenada correctamente.');
                    if (response !== "") {
                        self.patentes.removeAll();
                        var patentes = JSON.parse(response);
                        for (var i = 0; i < patentes.length; i++) {
                            self.patentes.push(
                                {
                                    id: ko.observable(patentes[i].id),
                                    consecutivo: ko.observable(patentes[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_patentes.warning("Error al almacenar la patente.");
                }});
        
        };

        self.eliminarPatente = function (patente) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarPatente/" + patente.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_patentes.success('Patente eliminada correctamente.');
                    if (response !== "") {
                        self.patentes.removeAll();
                        var patentes = JSON.parse(response);
                        for (var i = 0; i < patentes.length; i++) {
                            self.patentes.push(
                                {
                                    id: ko.observable(patentes[i].id),
                                    consecutivo: ko.observable(patentes[i].consecutivo),
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
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_patentes.warning("Error al eliminar el patente.");
                }});
        };

        self.editarPatente = function (patente) {
            $('#fechaPatente').val(patente.fecha());
            $('#tipoPatente').val(patente.tipo()).trigger('change');
            $('#propiedadCompartidaPatente').val(patente.propiedadCompartida());
            $('#clasePatente').val(patente.clase()).trigger('change');
            $('#descripcionPatente').val(patente.descripcion());            
            if(patente.propiedadCompartida()) {
              $('#btnPropiedadCompartidaPatenteSi').removeClass('notActive').addClass('active');  
              $('#btnPropiedadCompartidaPatenteNo').removeClass('active').addClass('notActive');
            } else {
              $('#btnPropiedadCompartidaPatenteNo').removeClass('notActive').addClass('active');  
              $('#btnPropiedadCompartidaPatenteSi').removeClass('active').addClass('notActive');  
            }
            $('#consecutivo').val(patente.consecutivo());
            $('#documentoPatente').val('');
            bootstrap_alert_patente.removeWarning();
            bootstrap_alert_patentes.removeWarning();
            $('#md_patente').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoPatente = function (patente) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/documentoPatente/" + patente.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/documentoPatente/" + patente.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });  
        };        

        self.adicionarProductoConocimiento = function () {
            var tipoProductoConocimiento = $('#tipoProductoConocimiento').val();
            var nombreTipoProductoConocimiento = $('#tipoProductoConocimiento option:selected').text();
            var nucleoBasicoProductoConocimiento = $('#nucleoBasicoProductoConocimiento').val();
            var urlProductoConocimiento = $('#urlProductoConocimiento').val();
            var descripcionProductoConocimiento = $('#descripcionProductoConocimiento').val();
        
            if (tipoProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe seleccionar el tipo de producto');
                return false;
            }
            if (nucleoBasicoProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe seleccionar el núcleo básico de conocimiento');
                return false;
            }
            if (urlProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe ingresar la URL');
                return false;
            }
            if (descripcionProductoConocimiento === "") {
                bootstrap_alert_producto_conocimiento.warning('Debe ingresar la descripción');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                if ($('#documentoProductoConocimiento').val() === "") {
                    bootstrap_alert_producto_conocimiento.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoProductoConocimiento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_producto_conocimiento.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", 0);
                formData.append("consecutivo", self.productosConocimiento().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (var i = 0; i < self.productosConocimiento().length; i++) {
                    if (self.productosConocimiento()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoProductoConocimiento').val() != "" && 
                    $('#documentoProductoConocimiento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_producto_conocimiento.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.productosConocimiento()[indice].id());
                formData.append("consecutivo", consecutivo);
            }

            if ($('#documentoProductoConocimiento').val() != "") {
               formData.append("documento", $('#documentoProductoConocimiento')[0].files[0]); 
            }
            formData.append("tipo", tipoProductoConocimiento);
            formData.append("nucleoBasicoConocimiento", nucleoBasicoProductoConocimiento);
            formData.append("url", urlProductoConocimiento);
            formData.append("descripcion", descripcionProductoConocimiento);
        
            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/productoConocimiento",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_producto_conocimiento').modal('hide');
                    bootstrap_alert_productos_conocimiento.success('Producto de conocimiento almacenado correctamente.');
                    if (response !== "") {
                        self.productosConocimiento.removeAll();
                        var productosConocimiento = JSON.parse(response);
                        for (var i = 0; i < productosConocimiento.length; i++) {
                            self.productosConocimiento.push(
                                {
                                    id: ko.observable(productosConocimiento[i].id),
                                    consecutivo: ko.observable(productosConocimiento[i].consecutivo),
                                    tipo: ko.observable(productosConocimiento[i].tipo),
                                    nombreTipo: ko.observable(productosConocimiento[i].nombreTipo),
                                    nucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nombreNucleoBasicoConocimiento),
                                    url: ko.observable(productosConocimiento[i].url),
                                    descripcion: ko.observable(productosConocimiento[i].descripcion),
                                    documentoValidado: ko.observable(productosConocimiento[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(productosConocimiento[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_productos_conocimiento.warning("Error al almacenar el producto de conocimiento.");
                }});
        };

        self.eliminarProductoConocimiento = function (productoConocimiento) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/eliminarProductoConocimiento/" + productoConocimiento.id(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_productos_conocimiento.success('Producto de conocimiento eliminada correctamente.');
                    if (response !== "") {
                        self.productosConocimiento.removeAll();
                        var productosConocimiento = JSON.parse(response);
                        for (var i = 0; i < productosConocimiento.length; i++) {
                            self.productosConocimiento.push(
                                {
                                    id: ko.observable(productosConocimiento[i].id),
                                    consecutivo: ko.observable(productosConocimiento[i].consecutivo),
                                    tipo: ko.observable(productosConocimiento[i].tipo),
                                    nombreTipo: ko.observable(productosConocimiento[i].nombreTipo),
                                    nucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nombreNucleoBasicoConocimiento),
                                    url: ko.observable(productosConocimiento[i].url),
                                    descripcion: ko.observable(productosConocimiento[i].descripcion),
                                    documentoValidado: ko.observable(productosConocimiento[i].documentoValidado),
                                    nombreDocumentoValidado: ko.observable(productosConocimiento[i].nombreDocumentoValidado)
                                }
                             );
                        }
                    } 
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_productos_conocimiento.warning("Error al eliminar el producto de conocimiento.");
                }});
        };

        self.editarProductoConocimiento = function (productoConocimiento) {
            $('#tipoProductoConocimiento').val(productoConocimiento.tipo()).trigger('change');
            $('#nucleoBasicoProductoConocimiento').val(productoConocimiento.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoProductoConocimiento').val(productoConocimiento.nombreNucleoBasicoConocimiento());
            $('#urlProductoConocimiento').val(productoConocimiento.url());
            $('#descripcionProductoConocimiento').val(productoConocimiento.descripcion());    
            $('#consecutivo').val(productoConocimiento.consecutivo());
            $('#documentoProductoConocimiento').val('');
            bootstrap_alert_producto_conocimiento.removeWarning();
            bootstrap_alert_productos_conocimiento.removeWarning();
            $('#md_producto_conocimiento').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoProductoConocimiento = function (productoConocimiento) {
            $.ajax({
                type: "GET",
                url: contextPath + "/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/hojasVida/documentoProductoConocimiento/" + productoConocimiento.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });  
        };        
    };

    function nuevaCiudadExtranjera() {
    
        $('#paisCiudad').val($('#pais option:selected').text().toUpperCase());
        $('#ciudadExtranjera').val("");

        $('#md_ciudad_extranjera').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoCorreoElectronico() {
        $('#correoElectronico').val("");
        $('#consecutivo').val("");
        bootstrap_alert_correo_electronico.removeWarning();
        bootstrap_alert_correos_electronicos.removeWarning();
        $('#md_correo_electronico').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoTelefono() {
        $('#tipoTelefono').val("").trigger("change.select2");
        $('#numeroTelefono').val("");
        $('#consecutivo').val("");
        bootstrap_alert_telefono.removeWarning();
        bootstrap_alert_telefonos.removeWarning();
        $('#md_telefono').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevaCuentaBancaria() {
        $('#tipoCuentaBancaria').val("").trigger("change.select2");
        $('#numeroCuentaBancaria').val("");
        $('#entidadCuentaBancaria').val("");
        $('#consecutivo').val("");
        bootstrap_alert_cuenta_bancaria.removeWarning();
        bootstrap_alert_cuentas_bancarias.removeWarning();
        $('#md_cuenta_bancaria').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoDocumentoSoporte() {
        $('#tipoDocumento').val("").trigger('change');
        $('#consecutivo').val("");
        $('#documentoSoporte').val("");
        bootstrap_alert_documento_soporte.removeWarning();
        bootstrap_alert_documentos_soporte.removeWarning();
        $('#md_documento_soporte').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#nivelConversacionIdiomaA').prop("checked", false); 
        $('#nivelEscrituraIdiomaA').prop("checked", false); 
        $('#nivelEscuchaIdiomaA').prop("checked", false); 
        $('#nivelLecturaIdiomaA').prop("checked", false); 
        $('#nivelConversacionIdiomaM').prop("checked", false); 
        $('#nivelEscrituraIdiomaM').prop("checked", false); 
        $('#nivelEscuchaIdiomaM').prop("checked", false); 
        $('#nivelLecturaIdiomaM').prop("checked", false); 
        $('#nivelConversacionIdiomaB').prop("checked", false); 
        $('#nivelEscrituraIdiomaB').prop("checked", false); 
        $('#nivelEscuchaIdiomaB').prop("checked", false); 
        $('#nivelLecturaIdiomaB').prop("checked", false); 
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeCertificacionIdioma').val("");
        $('#consecutivo').val("");
        $('#certificadoIdioma').val('');
        bootstrap_alert_idioma.removeWarning();
        bootstrap_alert_idiomas.removeWarning();
        $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
    }
        
    function nuevaEducacionBasica() {
        $('#nivelEstudioEducacionBasica').val("").trigger('change');
        $('#institucionEducacionBasica').val("");
        $('#anyoInicioEducacionBasica').val("").trigger('change');
        $('#anyoFinalizacionEducacionBasica').val("").trigger('change');
        $('#tituloEducacionBasica').val("");
        $('#graduadoEducacionBasica').val("false");
        $('#btnGraduadoSiEducacionBasica').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionBasica').removeClass('active').addClass('notActive');  
        $('#consecutivo').val("");
        $('#certificadoEducacionBasica').val('');
        bootstrap_alert_educacion_basica.removeWarning();
        bootstrap_alert_educaciones_basicas.removeWarning();
        $('#md_educacion_basica').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaEducacionSuperior() {
        $('#nivelEstudioEducacionSuperior').val("").trigger('change');
        $('#tituloExteriorEducacionSuperior').val('false');
        $('#paisEducacionSuperior').val("").trigger('change');
        $('#nombreInstitucionEducacionSuperior').val("");
        $('#programaCursadoEducacionSuperior').val('');
        $('#nombreProgramaCursadoEducacionSuperior').val('');
        $('#nombreNucleoBasicoConocimientoEducacionSuperior').val('');
        $('#anyoInicioEducacionSuperior').val("").trigger('change');
        $('#anyoFinalizacionEducacionSuperior').val("").trigger('change');
        $('#tituloEducacionSuperior').val("");
        $('#graduadoEducacionSuperior').val("false");
        $('#fechaTituloEducacionSuperior').val("");
        
        $('#nucleoBasicoConocimientoPrograma').val("");
        $('#nombreNucleoBasicoConocimientoPrograma').val("");
        $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
        $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
        $('#institucionEducativaProgramaExterior').next(".select2-container").hide();
        $('#institucionEducativaProgramaColombiana').next(".select2-container").show();
        $('#programaCursado').val("");
        $('#tituloPrograma').val("");        
        $('#btnNuevoProgramaExterior').hide();
        $('#divProgramaExterior').hide();
        
        $('#btnTituloExteriorSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnTituloExteriorNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#paisTituloExteriorEducacionSuperior').css("display","none");
         
        $('#btnGraduadoSiEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#btnGraduadoNoEducacionSuperior').removeClass('active').addClass('notActive');  
        $('#anyoFinalizacionEducacionSuperior').prop('disabled','disabled');
        $('#fechaTituloEducacionSuperior').prop('disabled','disabled');
                
        $('#consecutivo').val("");
        $('#certificadoEducacionSuperior').val("");
        $('#certificadosHomologadoEducacionSuperior').val("");
        bootstrap_alert_educacion_superior.removeWarning();
        bootstrap_alert_educaciones_superiores.removeWarning();
        $('#md_educacion_superior').modal({backdrop: 'static', keyboard: false})  ;
    }    

    function nuevoPrograma() {
        bootstrap_alert_educacion_superior.removeWarning();
        var nivelEstudioEducacionSuperior = $('#nivelEstudioEducacionSuperior').val();
        if (nivelEstudioEducacionSuperior === "") {
            bootstrap_alert_educacion_superior.warning('Debe seleccionar el nivel de estudio');
            return false;
        }            
        
        $('#nucleoBasicoConocimientoPrograma').val("");
        $('#nombreNucleoBasicoConocimientoPrograma').val("");
        $('#institucionEducativaProgramaColombiana').val("").trigger("change.select2");
        $('#institucionEducativaProgramaExterior').val("").trigger("change.select2");
        $('#programaCursado').val("").trigger("change.select2");
        $('#tituloPrograma').val("");
        $('#btnProgramaActivo').removeClass('active').addClass('notActive');  
        $('#btnProgramaActivo').removeClass('active').addClass('notActive');

        $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevoProgramaExterior() {
        $('#nombreInstitucionEducativaProgramaExterior').val("").trigger("change.select2");
        $('#programaCursadoExterior').val("");
        $('#nucleoBasicoConocimientoProgramaExterior').val("");
        $('#nombreNucleoBasicoConocimientoProgramaExterior').val("");
        $('#tituloProgramaExterior').val("");                    
        $('#md_programa_exterior').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaInstitucionExterior() {
        $('#institucionEducativaExterior').val("");
        $('#md_institucion_exterior').modal({backdrop: 'static', keyboard: false})  ;
    }
    
    function nuevaEducacionContinua() {
        $('#tipoCapacitacionEducacionContinua').val("").trigger('change');
        $('#institucionEducacionContinuaExterior').val("").trigger('change');
        $('#institucionEducacionContinuaColombiana').val("").trigger('change');
        $('#institucionEducacionContinuaExterior').next(".select2-container").hide();
        $('#institucionEducacionContinuaColombiana').next(".select2-container").show();
        $('#nombreCapacitacionEducacionContinua').val("");
        $('#numeroHorasEducacionContinua').val("");
        $('#nucleoBasicoConocimientoEducacionContinua').val("");
        $('#nombreNucleoBasicoConocimientoEducacionContinua').val("");
        $('#anyoEducacionContinua').val("");
        $('#consecutivo').val("");
        $('#certificadoEducacionContinua').val('');
        $('#btnEstudioExteriorSiEducacionContinua').removeClass('active').addClass('notActive');  
        $('#btnEstudioExteriorNoEducacionContinua').removeClass('active').addClass('notActive');
        $('#btnNuevaInstitucionExteriorEducacionContinua').hide();
        $('#divMensajeInstitucionExteriorEducacionContinua').hide();
        
        bootstrap_alert_educacion_continua.removeWarning();
        bootstrap_alert_educaciones_continuas.removeWarning();
        $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
    }    

    function nuevaDistincion() {
        $('#descripcionDistincion').val("");
        $('#institucionOtorgaDistincion').val("");
        $('#fechaDistincion').val("");
        $('#consecutivo').val("");
        $('#certificadoDistincion').val('');
        bootstrap_alert_distincion.removeWarning();
        bootstrap_alert_distinciones.removeWarning();
        $('#md_distincion').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaExperienciaLaboral() {
        $('#tipoExperienciaLaboral').val("").trigger('change');
        $('#trabajoActualExperienciaLaboral').val("false");
        $('#btnTrabajoActualExperienciaLaboralSi').removeClass('active').addClass('notActive');  
        $('#btnTrabajoActualExperienciaLaboralNo').removeClass('active').addClass('notActive');  
        $('#experienciaLaboralFNSP').val("false");
        $('#btnExperienciaLaboralFNSPSi').removeClass('active').addClass('notActive');  
        $('#btnExperienciaLaboralFNSPNo').removeClass('active').addClass('notActive');
        $('#fechaIngresoExperienciaLaboral').val("");
        $('#fechaRetiroExperienciaLaboral').val("");
        $('#nombreNucleoBasicoConocimientoExperienciaLaboral').val("");
        $('#nucleoBasicoConocimientoExperienciaLaboral').val("");
        $('#areaSaberExperienciaLaboral').val("").trigger('change');
        $('#tipoEmpresaExperienciaLaboral').val("").trigger('change');
        $('#nombreEmpresaExperienciaLaboral').val("");
        $('#actividadEconomicaExperienciaLaboral').val("").trigger('change');
        $('#tipoContratoExperienciaLaboral').val("").trigger('change');
        $('#cargoExperienciaLaboral').val("");
        $('#naturalezaCargoExperienciaLaboral').val("").trigger('change');
        $('#consecutivo').val("");
        $('#certificadoExperienciaLaboral').val('');
        bootstrap_alert_experiencia_laboral.removeWarning();
        bootstrap_alert_experiencias_laborales.removeWarning();
        $('#md_experiencia_laboral').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaExperienciaDocencia() {
        $('#trabajoActualDocencia').val("false");
        $('#btnTrabajoActualExperienciaDocenciaSi').removeClass('active').addClass('notActive');
        $('#btnTrabajoActualExperienciaDocenciaNo').removeClass('active').addClass('notActive');
        $('#experienciaDocenciaFNSP').val("false");
        $('#btnExperienciaDocenciaFNSPSi').removeClass('active').addClass('notActive');
        $('#btnExperienciaDocenciaFNSPNo').removeClass('active').addClass('notActive');
        $('#btnExperienciaDocenciaExteriorSi').removeClass('active').addClass('notActive');  
        $('#btnExperienciaDocenciaExteriorNo').removeClass('active').addClass('notActive');
        $('#institucionExperienciaDocenciaColombiana').val("").trigger('change');
        $('#institucionExperienciaDocenciaExterior').val("").trigger('change');
        $('#institucionExperienciaDocenciaExterior').next(".select2-container").hide();
        $('#institucionExperienciaDocenciaColombiana').next(".select2-container").show();
        $('#btnNuevaInstitucionExteriorExperienciaDocencia').hide();
        $('#divMensajeInstitucionExteriorExperienciaDocencia').hide();
        
        hojaVidaModel.consecutivoExperienciaDocencia(hojaVidaModel.experienciasDocencia().length);
        bootstrap_alert_experiencia_docencia.removeWarning();
        bootstrap_alert_experiencias_docencia.removeWarning();
        bootstrap_alert_cursos_experiencia_docencia.removeWarning();
        bootstrap_alert_curso_experiencia_docencia.removeWarning();

        $('#md_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevoCursoExperienciaDocencia() {
        $('#nombreCursoExperienciaDocencia').val("");
        $('#nucleoBasicoConocimientoCursoExperienciaDocencia').val("");
        $('#nombreNucleoBasicoConocimientoCursoExperienciaDocencia').val("");
        $('#modalidadCursoExperienciaDocencia').val("").trigger('change');
        $('#nivelEstudioCursoExperienciaDocencia').val("").trigger('change');
        $('#numeroHorasCursoExperienciaDocencia').val("");
        $('#anyoCursoExperienciaDocencia').val("");
        $('#certificadoCursoExperienciaDocencia').val('');
        $('#consecutivo').val("");
        bootstrap_alert_curso_experiencia_docencia.removeWarning();
        bootstrap_alert_cursos_experiencia_docencia.removeWarning();

        if (hojaVidaModel.consecutivoExperienciaDocencia() === hojaVidaModel.experienciasDocencia().length) {
            var trabajoActualDocencia = strToBool($('#trabajoActualDocencia').val());
            var experienciaDocenciaFNSP = strToBool($('#experienciaDocenciaFNSP').val());
            var institucionExperienciaDocencia = $('#institucionExperienciaDocenciaColombiana').val();
            var experienciaDocenciaExterior = strToBool($('#experienciaDocenciaExterior').val());
            if(experienciaDocenciaExterior) {
                institucionExperienciaDocencia = $('#institucionExperienciaDocenciaExterior').val();
            }
            if (institucionExperienciaDocencia === "") {
                bootstrap_alert_experiencia_docencia.warning('Debe seleccionar la institución');
                return false;
            }
            var formData = new FormData();
            formData.append("id", 0);
            formData.append("consecutivo", self.experienciasDocencia().length);
            formData.append("trabajoActual",trabajoActualDocencia);
            formData.append("fnsp",experienciaDocenciaFNSP);
            formData.append("exterior",experienciaDocenciaExterior);
            formData.append("institucion",institucionExperienciaDocencia);

            $.ajax({
                type: "POST",
                url: contextPath + "/hojasVida/experienciaDocencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response !== "") {
                        hojaVidaModel.experienciasDocencia.removeAll();
                        var datos = JSON.parse(response);
                        var idExperienciaDocencia = datos.id;
                        var experienciasDocencia = datos.experienciasDocencia;
                        for (var i = 0; i < experienciasDocencia.length; i++) {
                            if(idExperienciaDocencia == experienciasDocencia[i].id) {
                              hojaVidaModel.consecutivoExperienciaDocencia(experienciasDocencia[i].consecutivo);
                            }
                            hojaVidaModel.experienciasDocencia.push(
                                {
                                    id: ko.observable(experienciasDocencia[i].id),
                                    consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                                    trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                                    fnsp: ko.observable(experienciasDocencia[i].fnsp),
                                    exterior: ko.observable(experienciasDocencia[i].exterior),
                                    institucion: ko.observable(experienciasDocencia[i].institucion),
                                    nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                                    cursosExperienciaDocencia: ko.observableArray([])
                                }
                             );
                            for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
                                hojaVidaModel.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                                    id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                                    consecutivo: ko.observable(j),
                                    nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                                    nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                                    modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                                    nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                                    nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                                    nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                                    numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                                    anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo)
                                });
                            }
                        }
                    }
                    $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_experiencias_docencia.warning("Error al almacenar la experiencia en docencia.");
                }});
        } else {
            $('#md_curso_experiencia_docencia').modal({backdrop: 'static', keyboard: false})  ;
        }
    } 

    function nuevoArticulo() {
        $('#nombreArticulo').val("");
        $('#nombreRevistaArticulo').val("");
        $('#tipoAutorArticulo').val("").trigger('change');
        $('#urlArticulo').val("");
        $('#anyoArticulo').val("").trigger('change');
        $('#nucleoBasicoConocimientoArticulo').val("");
        $('#nombreNucleoBasicoConocimientoArticulo').val("");
        $('#consecutivo').val("");
        bootstrap_alert_articulo.removeWarning();
        bootstrap_alert_articulos.removeWarning();
        $('#md_articulo').modal({backdrop: 'static', keyboard: false})  ;
    } 

    function nuevaPatente() {
        $('#fechaPatente').val("");
        $('#tipoPatente').val("").trigger('change');
        $('#propiedadCompartidaPatente').val("false");
        $('#clasePatente').val("").trigger('change');
        $('#descripcionPatente').val("");            
        $('#btnPropiedadCompartidaPatenteSi').removeClass('active').addClass('notActive');  
        $('#btnPropiedadCompartidaPatenteNo').removeClass('active').addClass('notActive');
        $('#consecutivo').val("");
        $('#documentoPatente').val('');
        bootstrap_alert_patente.removeWarning();
        bootstrap_alert_patentes.removeWarning();
        $('#md_patente').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoProductoConocimiento() {
        $('#tipoProductoConocimiento').val("").trigger('change');
        $('#nucleoBasicoProductoConocimiento').val("");
        $('#nombreNucleoBasicoProductoConocimiento').val("");
        $('#urlProductoConocimiento').val("");
        $('#descripcionProductoConocimiento').val("");            
        $('#consecutivo').val("");
        $('#documentoProductosConocimiento').val('');
        bootstrap_alert_producto_conocimiento.removeWarning();
        bootstrap_alert_productos_conocimiento.removeWarning();
        $('#md_producto_conocimiento').modal({backdrop: 'static', keyboard: false})  ;
    }

    function cerrarVentanaDocumentoSoporte() {
        $('#md_documento_soporte').modal('hide');
    }
    
    function cerrarVentanaIdioma() {
        $('#md_idioma').modal('hide');
    }
        
    function cerrarVentanaEducacionBasica() {
        $('#md_educacion_basica').modal('hide');
    }

    function cerrarVentanaEducacionSuperior() {
        $('#md_educacion_superior').modal('hide');
    }
    
    function cerrarVentanaPrograma() {
        $('#md_programa').modal('hide');
    }
    
    function cerrarVentanaProgramaExterior() {
        $('#md_programa_exterior').modal('hide');
    }

    function cerrarVentanaInstitucionExterior() {
        $('#md_institucion_exterior').modal('hide');
    }
    
    function cerrarVentanaEducacionContinua() {
        $('#md_educacion_continua').modal('hide');
    }
    
    function cerrarVentanaDistincion() {
        $('#md_distincion').modal('hide');
    }
   
    function cerrarVentanaExperienciaLaboral() {
        $('#md_experiencia_laboral').modal('hide');
    }
    
    function cerrarVentanaExperienciaDocencia() {
        $('#md_experiencia_docencia').modal('hide');
    }

    function cerrarVentanaCursoExperienciaDocencia() {
        $('#md_curso_experiencia_docencia').modal('hide');
    }

    function cerrarVentanaArticulo() {
        $('#md_articulo').modal('hide');
    }
    
    function cerrarVentanaPatente() {
        $('#md_patente').modal('hide');
    }
    
    function cerrarVentanaProductoConocimiento() {
        $('#md_producto_conocimiento').modal('hide');
    }

    $('#hojaVida').submit(function (evt) {
        evt.preventDefault();
        
        if ($('#copiaDocumentoIdentificacion').val() !== "" &&
            $('#copiaDocumentoIdentificacion')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia del documento no debe ser mayor a 2MB');
            return false;
        }
        
        if ($('#copiaLibretaMilitar').val() !== "" &&
            $('#copiaLibretaMilitar')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia de la libreta militar no debe ser mayor a 2MB');
            return false;
        }

        if ($('#documentoRUT').val() !== "" &&
            $('#documentoRUT')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
            bootstrap_alert_hoja_vida.warning('La copia del RUT no debe ser mayor a 2MB');
            return false;
        }

        if (strToBool($('#disponeRUT').val()) && $('#actividadEconomica').val() === "") {
            bootstrap_alert_hoja_vida.warning("Debe ingresar la actividad económica");
            return;
        }
        if (strToBool($('#empleadoUDEA').val()) && $('#tipoVinculacion').val() === '') {
            bootstrap_alert_hoja_vida.warning("Debe ingresar el tipo de vinculación con la U de A");
            return;
        }
        $('#md_guardar').modal({backdrop: 'static', keyboard: false})  ;
        current_progress = 0;
        var interval = setInterval(function() {
            current_progress += 10;
            $(".dynamic")
             .css("width", current_progress + "%")
             .attr("aria-valuenow", current_progress)
             .text(current_progress + "% Completado");
            if (current_progress >= 100){
               clearInterval(interval);
            }
            if(current_progress === 100) {
               $('#md_guardar').modal('hide');
            }
            }, 1000);
        var formData = new FormData();
        formData.append("idPersona", $("#idPersona").val());
        formData.append("actividadEconomica", $("#actividadEconomica").val());
        formData.append("apellidos", $("#apellidos").val());
        formData.append("ciudadResidencia", $("#ciudadResidencia").val());
        formData.append("direccion", $("#direccion").val());
        formData.append("discapacidad", $("#discapacidad").val());
        formData.append("disponeRUT", $("#disponeRUT").val());
        formData.append("empleadoUDEA", $("#empleadoUDEA").val());
        formData.append("disponibilidadViajar", $("#disponibilidadViajar").val());
        formData.append("distritoClase", $("#distritoClase").val());
        formData.append("egresadoUDEA", $("#egresadoUDEA").val());
        formData.append("fechaExpedicion", $("#fechaExpedicion").val());
        formData.append("fechaNacimiento", $("#fechaNacimiento").val());
        formData.append("grupoEtnico", $("#grupoEtnico").val());
        formData.append("libretaMilitar", $("#libretaMilitar").val());
        formData.append("lugarExpedicion", $("#lugarExpedicion").val());
        formData.append("lugarNacimiento", $("#lugarNacimiento").val());
        formData.append("nacionalidad", $("#nacionalidad").val());
        formData.append("nombres", $("#nombres").val());
        formData.append("numeroIdentificacion", $("#numeroIdentificacion").val());
        formData.append("sexo", $("#sexo").val());
        formData.append("tipoIdentificacion", $("#tipoIdentificacion").val());
        formData.append("tipoVinculacion", $("#tipoVinculacion").val());
        formData.append("perfil", $("#perfil").val());
        formData.append("investigadorReconocidoColciencias", $("#investigadorReconocidoColciencias").val());
        formData.append("urlCVLAC", $("#urlCVLAC").val());
        formData.append("tipoInvestigador", $("#tipoInvestigador").val());
        formData.append("codigoORCID", $("#codigoORCID").val());
        formData.append("identificadorScopus", $("#identificadorScopus").val());
        formData.append("researcherId", $("#researcherId").val());
        if ($('#copiaDocumentoIdentificacion').val() !== "") {
           formData.append("copiaDocumentoIdentificacion", $('#copiaDocumentoIdentificacion')[0].files[0]);
        }
        if ($('#copiaLibretaMilitar').val() !== "") {
            formData.append("copiaLibretaMilitar", $('#copiaLibretaMilitar')[0].files[0]);
        }
        if ($('#documentoRUT').val() !== "") {
            formData.append("documentoRUT", $('#documentoRUT')[0].files[0]);
        }
        $.ajax({
            type: "POST",
            url: contextPath + "/hojasVida/editar",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                $('#md_guardar').modal('hide');
                if(response != "") {
                    $('#mensaje').val(response);
                } else {
                    if(copiaDocumentoIdentificacionCambiado) {
                      $('#btnCopiaDocumentoIdentificacionValidado').hide();  
                      $('#btnCopiaDocumentoIdentificacionNoValidado').show();
                      $('#btnVerCopiaDocumentoIdentificacion').show();
                      $('#btnEliminarCopiaDocumentoIdentificacion').show();
                    }
                    if(copiaLibretaMilitarCambiado) {
                      $('#btnCopiaLibretaMilitarValidado').hide();  
                      $('#btnCopiaLibretaMilitarNoValidado').show();  
                      $('#btnVerCopiaLibretaMilitar').show();
                      $('#btnEliminarCopiaLibretaMilitar').show();
                    }
                    if(documentoRUTCambiado) {
                      $('#btnDocumentoRUTValidado').hide();  
                      $('#btnDocumentoRUTNoValidado').show();  
                      $('#btnVerDocumentoRUT').show();
                      $('#btnEliminarDocumentoRUT').show();
                    }
                    if(urlCVLACCambiada) {
                      $('#btnUrlCVLACValidada').hide();  
                      $('#btnUrlCVLACNoValidada').show();  
                    }
                    $('#mensaje').text('Información de la hoja de vida actualizada exitosamente');
                }
                $('#md_guardado_exitoso').modal({backdrop: 'static', keyboard: false});
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_hoja_vida.warning("Error al almacenar la hoja de vida.");
                $('#md_guardar').modal('hide');
            }});
    });

    function obtenerProgramasCursados(institucion) {
        $('#tituloPrograma').val('');
        var nivel = $('#nivelEstudioEducacionSuperior').val();
        if(institucion != "") {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/programasInstitucion?institucion=" + institucion + "&nivel=" + nivel,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response !== "") {
                    $('#programaCursado').find('option').remove();
                    $('#programaCursado').append('<option></option>');
                    programas = JSON.parse(response);
                    for (var i = 0; i < programas.length; i++) {
                        $('#programaCursado').append('<option value=' + programas[i].id + '>' + programas[i].nombre + '</option>');
                    }
                }
            }});
        } else {
          $('#programaCursado').find('option').remove();  
        }
    }

    function verCopiaDocumentoIdentificacion() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaCedula/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaCedula/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verCopiaRUT() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaRUT/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaRUT/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verCopiaLibretaMilitar() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/copiaLibretaMilitar/" + $('#idPersona').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/hojasVida/copiaLibretaMilitar/" + $('#idPersona').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function eliminarCopiaDocumentoIdentificacion() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/eliminarCopiaCedula",
            processData: false,
            contentType: false,
            success: function (response) {
               bootstrap_alert_hoja_vida.success("Copia de la cédula eliminada exitosamente");
               $('#nombreCopiaDocumentoIdentificacion').text("");
               $('#btnCopiaDocumentoIdentificacionValidado').hide();
               $('#btnCopiaDocumentoIdentificacionNoValidado').hide();
               $('#btnVerCopiaDocumentoIdentificacion').hide();
               $('#btnEliminarCopiaDocumentoIdentificacion').hide();
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function eliminarDocumentoRUT() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/eliminarCopiaRUT",
            processData: false,
            contentType: false,
            success: function (response) {
               bootstrap_alert_hoja_vida.success("Documento de soporte RUT eliminado exitosamente");
               $('#nombreDocumentoRUT').text("");
               $('#btnDocumentoRUTValidado').hide();  
               $('#btnDocumentoRUTNoValidado').hide();  
               $('#btnVerDocumentoRUT').hide();
               $('#btnEliminarDocumentoRUT').hide();
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function eliminarCopiaLibretaMilitar() {
        $.ajax({
            type: "GET",
            url: contextPath + "/hojasVida/eliminarCopiaLibretaMilitar",
            processData: false,
            contentType: false,
            success: function (response) {
               bootstrap_alert_hoja_vida.success("Copia de la libreta militar eliminada exitosamente");
               $('#nombreCopiaLibretaMilitar').text(""); 
               $('#btnCopiaLibretaMilitarValidado').hide();  
               $('#btnCopiaLibretaMilitarNoValidado').hide();  
               $('#btnVerCopiaLibretaMilitar').hide();
               $('#btnEliminarCopiaLibretaMilitar').hide();
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function establecerEgresadoUdeA() {
        var egresadoUDEA = false;
        for (var i = 0; i < hojaVidaModel.educacionesSuperiores().length; i++) {
            if(hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_ANDES ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_TURBO ||
               hojaVidaModel.educacionesSuperiores()[i].institucion() == ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA) {

              egresadoUDEA = true;

               break;
            }
        }
        if(egresadoUDEA) {
            $('#btnEgresadoUdeASi').removeClass('notActive').addClass('active');  
            $('#btnEgresadoUdeANo').removeClass('active').addClass('notActive');
            $('#egresadoUDEA').val('true');
        } else {
            $('#btnEgresadoUdeANo').removeClass('notActive').addClass('active');  
            $('#btnEgresadoUdeASi').removeClass('active').addClass('notActive');
            $('#egresadoUDEA').val('false');
        }
    }

    bootstrap_alert_institucion_exterior = {};
    bootstrap_alert_institucion_exterior.warning = function (message) {
        $('#alert_institucion_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_institucion_exterior.removeWarning = function () {
        $('#alert_institucion_exterior').html('');
    };

    bootstrap_alert_ciudad_extranjera = {};
    bootstrap_alert_ciudad_extranjera.warning = function (message) {
        $('#alert_ciudad_extranjera').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_ciudad_extranjera.removeWarning = function () {
        $('#alert_ciudad_extranjera').html('');
    };
    
    bootstrap_alert_hoja_vida = {};
    bootstrap_alert_hoja_vida.warning = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.success = function (message) {
        $('#alert_hoja_vida').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_hoja_vida.removeWarning = function () {
        $('#alert_hoja_vida').html('');
    };

    bootstrap_alert_telefono = {};
    bootstrap_alert_telefono.warning = function (message) {
        $('#alert_telefono').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_telefono.removeWarning = function () {
        $('#alert_telefono').html('');
    };

    bootstrap_alert_telefonos = {};
    bootstrap_alert_telefonos.warning = function (message) {
        $('#alert_telefonos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_telefonos.removeWarning = function () {
        $('#alert_telefonos').html('');
    };
    bootstrap_alert_telefonos.success = function (message) {
        $('#alert_telefonos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_cuenta_bancaria = {};
    bootstrap_alert_cuenta_bancaria.warning = function (message) {
        $('#alert_cuenta_bancaria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cuenta_bancaria.removeWarning = function () {
        $('#alert_cuenta_bancaria').html('');
    };

    bootstrap_alert_cuentas_bancarias = {};
    bootstrap_alert_cuentas_bancarias.warning = function (message) {
        $('#alert_cuentas_bancarias').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cuentas_bancarias.removeWarning = function () {
        $('#alert_cuentas_bancarias').html('');
    };
    bootstrap_alert_cuentas_bancarias.success = function (message) {
        $('#alert_cuentas_bancarias').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_correo_electronico = {};
    bootstrap_alert_correo_electronico.warning = function (message) {
        $('#alert_correo_electronico').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_correo_electronico.removeWarning = function () {
        $('#alert_correo_electronico').html('');
    };

    bootstrap_alert_correos_electronicos = {};
    bootstrap_alert_correos_electronicos.warning = function (message) {
        $('#alert_correos_electronicos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_correos_electronicos.removeWarning = function () {
        $('#alert_correos_electronicos').html('');
    };
    bootstrap_alert_correos_electronicos.success = function (message) {
        $('#alert_correos_electronicos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_documento_soporte = {};
    bootstrap_alert_documento_soporte.warning = function (message) {
        $('#alert_documento_soporte').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_documento_soporte.removeWarning = function () {
        $('#alert_documento_soporte').html('');
    };

    bootstrap_alert_documentos_soporte = {};
    bootstrap_alert_documentos_soporte.warning = function (message) {
        $('#alert_documentos_soporte').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_documentos_soporte.removeWarning = function () {
        $('#alert_documentos_soporte').html('');
    };
    bootstrap_alert_documentos_soporte.success = function (message) {
        $('#alert_documentos_soporte').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_idioma = {};
    bootstrap_alert_idioma.warning = function (message) {
        $('#alert_idioma').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idioma.removeWarning = function () {
        $('#alert_idioma').html('');
    };

    bootstrap_alert_idiomas = {};
    bootstrap_alert_idiomas.warning = function (message) {
        $('#alert_idiomas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idiomas.removeWarning = function () {
        $('#alert_idiomas').html('');
    };
    bootstrap_alert_idiomas.success = function (message) {
        $('#alert_idiomas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_basica = {};
    bootstrap_alert_educacion_basica.warning = function (message) {
        $('#alert_educacion_basica').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_basica.removeWarning = function () {
        $('#alert_educacion_basica').html('');
    };

    bootstrap_alert_educaciones_basicas = {};
    bootstrap_alert_educaciones_basicas.warning = function (message) {
        $('#alert_educaciones_basicas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_basicas.removeWarning = function () {
        $('#alert_educaciones_basicas').html('');
    };
    bootstrap_alert_educaciones_basicas.success = function (message) {
        $('#alert_educaciones_basicas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_superior = {};
    bootstrap_alert_educacion_superior.warning = function (message) {
        $('#alert_educacion_superior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_superior.removeWarning = function () {
        $('#alert_educacion_superior').html('');
    };

    bootstrap_alert_educaciones_superiores = {};
    bootstrap_alert_educaciones_superiores.warning = function (message) {
        $('#alert_educaciones_superiores').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_superiores.removeWarning = function () {
        $('#alert_educaciones_superiores').html('');
    };
    bootstrap_alert_educaciones_superiores.success = function (message) {
        $('#alert_educaciones_superiores').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_programa_exterior = {};
    bootstrap_alert_programa_exterior.warning = function (message) {
        $('#alert_programa_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programa_exterior.removeWarning = function () {
        $('#alert_programa_exterior').html('');
    };

    bootstrap_alert_programas_exterior = {};
    bootstrap_alert_programas_exterior.warning = function (message) {
        $('#alert_programas_exterior').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programas_exterior.removeWarning = function () {
        $('#alert_programas_exterior').html('');
    };
    bootstrap_alert_programas_exterior.success = function (message) {
        $('#alert_programas_exterior').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_educacion_continua = {};
    bootstrap_alert_educacion_continua.warning = function (message) {
        $('#alert_educacion_continua').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educacion_continua.removeWarning = function () {
        $('#alert_educacion_continua').html('');
    };

    bootstrap_alert_educaciones_continuas = {};
    bootstrap_alert_educaciones_continuas.warning = function (message) {
        $('#alert_educaciones_continuas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_continuas.removeWarning = function () {
        $('#alert_educaciones_continuas').html('');
    };
    bootstrap_alert_educaciones_continuas.success = function (message) {
        $('#alert_educaciones_continuas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_distincion = {};
    bootstrap_alert_distincion.warning = function (message) {
        $('#alert_distincion').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_distincion.removeWarning = function () {
        $('#alert_distincion').html('');
    };
    
    bootstrap_alert_distinciones = {};
    bootstrap_alert_distinciones.warning = function (message) {
        $('#alert_distinciones').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_distinciones.removeWarning = function () {
        $('#alert_distinciones').html('');
    };
    bootstrap_alert_distinciones.success = function (message) {
        $('#alert_distinciones').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_experiencia_laboral = {};
    bootstrap_alert_experiencia_laboral.warning = function (message) {
        $('#alert_experiencia_laboral').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencia_laboral.removeWarning = function () {
        $('#alert_experiencia_laboral').html('');
    };

    bootstrap_alert_experiencias_laborales = {};
    bootstrap_alert_experiencias_laborales.warning = function (message) {
        $('#alert_experiencias_laborales').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencias_laborales.removeWarning = function () {
        $('#alert_experiencias_laborales').html('');
    };
    bootstrap_alert_experiencias_laborales.success = function (message) {
        $('#alert_experiencias_laborales').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_experiencia_docencia = {};
    bootstrap_alert_experiencia_docencia.warning = function (message) {
        $('#alert_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencia_docencia.removeWarning = function () {
        $('#alert_experiencia_docencia').html('');
    };
    
    bootstrap_alert_experiencias_docencia = {};
    bootstrap_alert_experiencias_docencia.warning = function (message) {
        $('#alert_experiencias_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_experiencias_docencia.removeWarning = function () {
        $('#alert_experiencias_docencia').html('');
    };
    bootstrap_alert_experiencias_docencia.success = function (message) {
        $('#alert_experiencias_docencia').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_curso_experiencia_docencia = {};
    bootstrap_alert_curso_experiencia_docencia.warning = function (message) {
        $('#alert_curso_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_curso_experiencia_docencia.removeWarning = function () {
        $('#alert_curso_experiencia_docencia').html('');
    };

    bootstrap_alert_cursos_experiencia_docencia = {};
    bootstrap_alert_cursos_experiencia_docencia.warning = function (message) {
        $('#alert_cursos_experiencia_docencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_cursos_experiencia_docencia.removeWarning = function () {
        $('#alert_cursos_experiencia_docencia').html('');
    };
    bootstrap_alert_cursos_experiencia_docencia.success = function (message) {
        $('#alert_cursos_experiencia_docencia').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_articulo = {};
    bootstrap_alert_articulo.warning = function (message) {
        $('#alert_articulo').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_articulo.removeWarning = function () {
        $('#alert_articulo').html('');
    };

    bootstrap_alert_articulos = {};
    bootstrap_alert_articulos.warning = function (message) {
        $('#alert_articulos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_articulos.removeWarning = function () {
        $('#alert_articulos').html('');
    };
    bootstrap_alert_articulos.success = function (message) {
        $('#alert_articulos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_patente = {};
    bootstrap_alert_patente.warning = function (message) {
        $('#alert_patente').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_patente.removeWarning = function () {
        $('#alert_patente').html('');
    };

    bootstrap_alert_patentes = {};
    bootstrap_alert_patentes.warning = function (message) {
        $('#alert_patentes').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_patentes.removeWarning = function () {
        $('#alert_patentes').html('');
    };
    bootstrap_alert_patentes.success = function (message) {
        $('#alert_patentes').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    bootstrap_alert_producto_conocimiento = {};
    bootstrap_alert_producto_conocimiento.warning = function (message) {
        $('#alert_producto_conocimiento').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_producto_conocimiento.removeWarning = function () {
        $('#alert_producto_conocimiento').html('');
    };
    
    bootstrap_alert_productos_conocimiento = {};
    bootstrap_alert_productos_conocimiento.warning = function (message) {
        $('#alert_productos_conocimiento').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_productos_conocimiento.removeWarning = function () {
        $('#alert_productos_conocimiento').html('');
    };
    bootstrap_alert_productos_conocimiento.success = function (message) {
        $('#alert_productos_conocimiento').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };

    var hojaVidaModel = new HojaVidaModel([], [], [], [], [], [], [], [], [], [], [], [], [], []);
    ko.applyBindings(hojaVidaModel);

    establecerEgresadoUdeA();
    
    for (var i = 0; i < correosElectronicos.length; i++) {
        hojaVidaModel.correosElectronicos.push(
            {
                id: ko.observable(correosElectronicos[i].id),
                consecutivo: ko.observable(correosElectronicos[i].consecutivo),
                correoElectronico: ko.observable(correosElectronicos[i].correoElectronico)
            }
         );
    }
    
    for (var i = 0; i < telefonos.length; i++) {
        hojaVidaModel.telefonos.push(
            {
                id: ko.observable(telefonos[i].id),
                consecutivo: ko.observable(telefonos[i].consecutivo),
                tipo: ko.observable(telefonos[i].tipo),
                nombreTipo: ko.observable(telefonos[i].nombreTipo),
                numero: ko.observable(telefonos[i].numero)
            }
         );
    }
    
    for (var i = 0; i < documentosSoporte.length; i++) {
        hojaVidaModel.documentosSoporte.push(
            {
                id: ko.observable(documentosSoporte[i].id),
                consecutivo: ko.observable(documentosSoporte[i].consecutivo),
                tipoDocumento: ko.observable(documentosSoporte[i].tipoDocumento),
                nombreTipoDocumento: ko.observable(documentosSoporte[i].nombreTipoDocumento),
                validado: ko.observable(documentosSoporte[i].validado),
                nombreValidado: ko.observable(documentosSoporte[i].nombreValidado)
            }
         );
    }

    for (var i = 0; i < idiomas.length; i++) {
        hojaVidaModel.idiomas.push(
            {
                id: ko.observable(idiomas[i].id),
                consecutivo: ko.observable(idiomas[i].consecutivo),
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
    
    for (var i = 0; i < educacionesBasicas.length; i++) {
        hojaVidaModel.educacionesBasicas.push(
            {
                id: ko.observable(educacionesBasicas[i].id),
                consecutivo: ko.observable(educacionesBasicas[i].consecutivo),
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
    
    for (var i = 0; i < educacionesSuperiores.length; i++) {
        hojaVidaModel.educacionesSuperiores.push(
            {
                id: ko.observable(educacionesSuperiores[i].id),
                consecutivo: ko.observable(educacionesSuperiores[i].consecutivo),
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

    for (var i = 0; i < educacionesContinuas.length; i++) {
        hojaVidaModel.educacionesContinuas.push(
            {
                id: ko.observable(educacionesContinuas[i].id),
                consecutivo: ko.observable(educacionesContinuas[i].consecutivo),
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

    for (var i = 0; i < experienciasLaborales.length; i++) {
        hojaVidaModel.experienciasLaborales.push(
            {
                id: ko.observable(experienciasLaborales[i].id),
                consecutivo: ko.observable(experienciasLaborales[i].consecutivo),
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
                nombreCertificadoValidado: ko.observable(experienciasLaborales[i].nombreCertificadoValidado)
            }
         );
    }

    for (var i = 0; i < experienciasDocencia.length; i++) {
        hojaVidaModel.experienciasDocencia.push(
            {
                id: ko.observable(experienciasDocencia[i].id),
                consecutivo: ko.observable(experienciasDocencia[i].consecutivo),
                trabajoActual: ko.observable(experienciasDocencia[i].trabajoActual),
                fnsp: ko.observable(experienciasDocencia[i].fnsp),
                exterior: ko.observable(experienciasDocencia[i].exterior),
                institucion: ko.observable(experienciasDocencia[i].institucion),
                nombreInstitucion: ko.observable(experienciasDocencia[i].nombreInstitucion),
                cursosExperienciaDocencia: ko.observableArray([])
            }
         );
        for(var j = 0; j < experienciasDocencia[i].cursosExperienciaDocencia.length; j++) {
            hojaVidaModel.experienciasDocencia()[i].cursosExperienciaDocencia.push({
                id: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].id),
                consecutivo: ko.observable(j),
                nombreCurso: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCurso),
                nucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nucleoBasicoConocimiento),
                nombreNucleoBasicoConocimiento: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNucleoBasicoConocimiento),
                modalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].modalidad),
                nombreModalidad: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreModalidad),
                nivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nivelEstudio),
                nombreNivelEstudio: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreNivelEstudio),
                numeroHoras: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].numeroHoras),
                anyo: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].anyo),
                certificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].certificadoValidado),
                nombreCertificadoValidado: ko.observable(experienciasDocencia[i].cursosExperienciaDocencia[j].nombreCertificadoValidado)
            });
        }
    }

    for (var i = 0; i < distinciones.length; i++) {
        hojaVidaModel.distinciones.push(
            {
                id: ko.observable(distinciones[i].id),
                consecutivo: ko.observable(distinciones[i].consecutivo),
                fechaDistincion: ko.observable(distinciones[i].fechaDistincionFormateada),
                institucionOtorga: ko.observable(distinciones[i].institucionOtorga),
                descripcion: ko.observable(distinciones[i].descripcion),
                certificadoValidado: ko.observable(distinciones[i].certificadoValidado),
                nombreCertificadoValidado: ko.observable(distinciones[i].nombreCertificadoValidado)
            }
         );
    }
    
    for (var i = 0; i < patentes.length; i++) {
        hojaVidaModel.patentes.push(
            {
                id: ko.observable(patentes[i].id),
                consecutivo: ko.observable(patentes[i].consecutivo),
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
    
     for (var i = 0; i < productosConocimiento.length; i++) {
        hojaVidaModel.productosConocimiento.push(
            {
                id: ko.observable(productosConocimiento[i].id),
                consecutivo: ko.observable(productosConocimiento[i].consecutivo),
                tipo: ko.observable(productosConocimiento[i].tipo),
                nombreTipo: ko.observable(productosConocimiento[i].nombreTipo),
                nucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nucleoBasicoConocimiento),
                nombreNucleoBasicoConocimiento: ko.observable(productosConocimiento[i].nombreNucleoBasicoConocimiento),
                url: ko.observable(productosConocimiento[i].url),
                descripcion: ko.observable(productosConocimiento[i].descripcion),
                documentoValidado: ko.observable(productosConocimiento[i].documentoValidado),
                nombreDocumentoValidado: ko.observable(productosConocimiento[i].nombreDocumentoValidado)
            }
         );
    }

    for (var i = 0; i < articulos.length; i++) {
        hojaVidaModel.articulos.push(
            {
                id: ko.observable(articulos[i].id),
                consecutivo: ko.observable(articulos[i].consecutivo),
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