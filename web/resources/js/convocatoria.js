    var DOCENCIA_MEDELLIN = "3";
    var DOCENCIA_REGIONES = "4";
    var TIPO_CERTIFICACION_OTRO = "8";
    var MAXIMO_TAMANYO_ARCHIVO = 2097152;
    
    var PE_TIPO_ID = 1;
    var PE_LUGAR_EXPEDICION = 2;
    var PE_FECHA_EXPEDICION = 3;
    var PE_LIBRETA_MILITAR=4;
    var PE_NOMBRES=5;
    var PE_APELLIDOS=6;
    var PE_FECHA_NACIMIENTO=7;
    var PE_LUGAR_NACIMIENTO=8;
    var PE_NACIONALIDAD=9;
    var PE_SEXO=10;
    var PE_CIUDAD_RESIDENCIA=11;
    var PE_DIRECCION=12;
    var PE_EGRESADO_UDEA=13;
    var PE_GRUPO_ETNICO=14;
    var PE_DISCAPACIDAD=15;
    var PE_DISPONE_RUT=16;
    var PE_ACTIVIDAD_ECONOMICA=17;
    var PE_DISPONIBILIDAD_VIAJAR=18;
    var PE_TIPO_VINCULACION=19;
    var PE_EMPLEADO_UDEA=20;
    var PE_NUMERO_ID = 21;

    var programaCursado = '';
    var capacitacionEducacionContinua = '';
    
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    $('.fecha').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true
    });

    $('#tbadendas').DataTable({
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

    $(document).ready(function () {
        var output = moment().format('DD/MM/YYYY');
        if($('#fechaInicio').val() == '') {
            $('#fechaInicio').val(output);
        }
        if($('#fechaFin').val() == '') {
            $('#fechaFin').val(output);
        }
        if($('#fechaPublicacionResultados').val() == '') {
            $('#fechaPublicacionResultados').val(output);
        }
        $('#fechaInicio').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaFin').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaPublicacionResultados').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        $('#fechaAdenda').change(function () {
             if(!moment(this.value, 'DD/MM/YYYY',true).isValid()) {
               this.value = '';  
             }
        });
        
        $('#tipoConvocatoria').change(function () {
            var valor = $(this).val();
            if (valor === DOCENCIA_MEDELLIN || valor === DOCENCIA_REGIONES) {
                $('#formcurso').show();
            } else {
                $('#formcurso').hide();
            }
        });
        
        $('#totalHorasSemestre').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        
        $('#sede').change(function () {
            var idSede = $(this).val();
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/programasSede/" + idSede,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response !== "") {
                        $('#programa').find('option').remove();
                        $('#programa').append('<option></option>');
                        var programas = JSON.parse(response);
                        for (var i = 0; i < programas.length; i++) {
                            $('#programa').append('<option value=' + programas[i].id + '>' + programas[i].nombre + '</option>');
                        }
                    }
                }});
        });

        $('#addcurso').click(function () {
            var sede = $('#sede').val();
            var nombreSede = $('#sede option:selected').text();
            var programa = $('#programa').val();
            var nombrePrograma = $('#programa option:selected').text();
            var curso = $('#curso').val();
            var tothoras = $('#totalHorasSemestre').val();

            $('#idSedeCurso').val(sede);
            $('#sedeCurso').val(nombreSede);
            $('#idProgramaCurso').val(programa);
            $('#programaCurso').val(nombrePrograma);
            $('#nombreCurso').val(curso);
            $('#totalHorasSemestreCurso').val(tothoras);
            $('#inputscurso').show();
            $('#md_curso').modal('hide');
        });
        if ($('#tipoConvocatoria').val() === DOCENCIA_MEDELLIN || $('#tipoConvocatoria').val() === DOCENCIA_REGIONES) {
            $('#formcurso').show();
        } else {
            $('#formcurso').hide();
        }
        $('#tipoCapacitacionEducacionContinua').change(function () {
            obtenerCapacitaciones();
        });

        if($('#id').val() == "0") {
            $('#btnVerDocumento').hide();
            $('#btnVerResultado').hide();
            $('#btnNuevoIdioma').hide();
            $('#btnNuevoPrograma').hide();
            $('#btnNuevaEducacionContinua').hide();
            $('#btnNuevoCriterioHabilitante').hide();
            $('#btnNuevoAnyosExperiencia').hide();
            $('#btnNuevaAdenda').hide();
            $("#anyosMinimosExperiencia").prop("disabled", true);
            $("#resultado").prop("disabled", true);
        }
        $('#anyosMinimosExperiencia').change(function () {
            var formData = new FormData();
            formData.append("idConvocatoria", $("#id").val());
            formData.append("anyosMinimosExperiencia", $("#anyosMinimosExperiencia").val());
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/actualizarAnyosMinimosExperiencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_anyos_minima_experiencia.success("Años de mínima de experiencia de la convocatoria almacenados correctamente.");
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_anyos_minima_experiencia.warning("Error al almacenar los años de mínima de experiencia de la convocatoria.");
                }});
        });

        $('#resultado').change(function () {
            var formData = new FormData();
            formData.append("idConvocatoria", $("#id").val());
            if ($('#resultado').val() != "") {
                formData.append("resultado", $('#resultado')[0].files[0]);
            }
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/actualizarResultado",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    bootstrap_alert_resultado.success("Resultado de la convocatoria almacenado correctamente.");
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_resultado.warning("Error al almacenar el resultado de la convocatoria.");
                }});
        });

        $('#tipoCertificacionIdioma').change(function () {
            var valor = $(this).val();
            if (valor === TIPO_CERTIFICACION_OTRO) {
                $('#divOtroCertificacionIdioma').css("display", "block");
            } else {
                $('#divOtroCertificacionIdioma').css("display", "none");
            }
        });
        $('#btndatosgen').click(function(){
          $('#formdatosgen').css('display','block');
          $('#formcrithab').css('display','none');
          $('#formcriteva').css('display','none');
          $('#formadendas').css('display','none');
          $('#formresultado').css('display','none');
          $('#liconvoca').css('display','block');
          $('#licrihab').css('display','none');
          $('#licrieva').css('display','none');
          $('#liresul').css('display','none');
          $('#liadendas').css('display','none');
        });
        $('#btncrithab').click(function(){
          $('#formdatosgen').css('display','none');
          $('#formcrithab').css('display','block');
          $('#formcriteva').css('display','none');
          $('#formadendas').css('display','none');
          $('#formresultado').css('display','none');
          $('#liconvoca').css('display','none');
          $('#licrihab').css('display','block');
          $('#licrieva').css('display','none');
          $('#liresul').css('display','none');
          $('#liadendas').css('display','none');
        });
        $('#btncriteva').click(function(){
          $('#formdatosgen').css('display','none');
          $('#formcrithab').css('display','none');
          $('#formcriteva').css('display','block');
          $('#formadendas').css('display','none');
          $('#formresultado').css('display','none');
          $('#liconvoca').css('display','none');
          $('#licrihab').css('display','none');
          $('#licrieva').css('display','block');
          $('#liresul').css('display','none');
          $('#liadendas').css('display','none');
        });
        $('#btnadendas').click(function(){
          $('#formdatosgen').css('display','none');
          $('#formcrithab').css('display','none');
          $('#formcriteva').css('display','none');
          $('#formadendas').css('display','block');
          $('#formresultado').css('display','none');
          $('#liconvoca').css('display','none');
          $('#licrihab').css('display','none');
          $('#licrieva').css('display','none');
          $('#liresul').css('display','none');
          $('#liadendas').css('display','block');
        });
        $('#btnresultado').click(function(){
            $('#formresultado').css('display','block');
            $('#formdatosgen').css('display','none');
            $('#formcrithab').css('display','none');
            $('#formcriteva').css('display','none');
            $('#formadendas').css('display','none');
            $('#liconvoca').css('display','none');
            $('#licrihab').css('display','none');
            $('#licrieva').css('display','none');
            $('#liresul').css('display','block');
            $('#liadendas').css('display','none');
        });
    
        $('#anyosMinimosExperiencia').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#anyosExperiencia').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
        $('#puntajeMinimoCertificacionIdioma').change(function () {
            var decimalOnly = /^\s*[0-9]\d*(\.\d+)?\s*$/;
            if(!decimalOnly.test(this.value)) {
                this.value = '';
            }
        });
    
        $('#radioSexo a').on('click', function () {
            var sel = $(this).data('title');
            var tog = $(this).data('toggle');
            $('#' + tog).prop('value', sel);

            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
        });
    
        $('#convocatoria').submit(function (evt) {
            evt.preventDefault();
            if($('#documento').val() != "" && $('#documento')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                bootstrap_alert_convocatoria.warning("El documento de la convocatoria no puede ser mayor a 2MB.");
                return;
            }
            if($('#resultado').val() != "" && $('#resultado')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                bootstrap_alert_convocatoria.warning("El resultado de la convocatoria no puede ser mayor a 2MB.");
                return;
            }
            if ($('#tipoConvocatoria').val() === DOCENCIA_MEDELLIN || $('#tipoConvocatoria').val() === DOCENCIA_REGIONES) {
                if ($("#idProgramaCurso").val() == "") {
                    bootstrap_alert_convocatoria.warning("Debe ingresar el programa.");
                    return;
                }
                if ($("#nombreCurso").val() == "") {
                    bootstrap_alert_convocatoria.warning("Debe ingresar el nombre del curso.");
                    return;
                }
                if ($("#totalHorasSemestreCurso").val() == "") {
                    bootstrap_alert_convocatoria.warning("Debe ingresar total de horas del semestre.");
                    return;
                }
            }

            $('#md_guardar').modal({backdrop: 'static', keyboard: false})  ;
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
                    $('#md_guardar').modal('hide');
                }
            }, 1000);
            var formData = new FormData();
            formData.append("id", $("#id").val());
            formData.append("descripcion", $("#descripcion").val());
            formData.append("fechaFin", $("#fechaFin").val());
            formData.append("fechaInicio", $("#fechaInicio").val());
            formData.append("nombre", $("#nombre").val());
            formData.append("fechaPublicacionResultados", $("#fechaPublicacionResultados").val());
            formData.append("tipoConvocatoria", $("#tipoConvocatoria").val());
            formData.append("idProgramaCurso", $("#idProgramaCurso").val());
            formData.append("nombreCurso", $("#nombreCurso").val());
            formData.append("totalHorasSemestreCurso", $("#totalHorasSemestreCurso").val());
            if ($('#documento').val() != "") {
                formData.append("documento", $('#documento')[0].files[0]);
            }
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/crear",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_guardar').modal('hide');
                    var respuesta = JSON.parse(response);
                    if($("#id").val() == "0") {
                        $('#mensaje').text('Convocatoria creada exitosamente');
                    } else {
                        $('#mensaje').text('Información de convocatoria actualizada exitosamente');
                    }
                    $("#id").val(respuesta.id);
                    $('#btnVerDocumento').show();
                    $('#btnVerResultado').show();
                    $('#btnNuevoIdioma').show();
                    $('#btnNuevoPrograma').show();
                    $('#btnNuevaEducacionContinua').show();
                    $('#btnNuevoCriterioHabilitante').show();
                    $('#btnNuevoAnyosExperiencia').show();
                    $('#btnNuevaAdenda').show();
                    $("#anyosMinimosExperiencia").prop("disabled", false);
                    $("#resultado").prop("disabled", false);
                    bootstrap_alert_convocatoria.success("Convocatoria almacenada correctamente.");
                    
                    $('#md_guardado_exitoso').modal({backdrop: 'static', keyboard: false});
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_convocatoria.warning("Error al almacenar la convocatoria.");
                    $('#md_guardar').modal('hide');
                }});
        });
    });    
    
    function obtenerProgramasCursados() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoPrograma').val();
        if(nucleoBasicoConocimiento == "") {
           $('#programaCursado').find('option').remove();
           $('#programaCursado').append('<option></option>');
           return;
        }
        $.ajax({
            type: "GET",
            url: contextPath + "/convocatorias/programas?nucleoBasicoConocimiento=" + nucleoBasicoConocimiento,
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
                    if (programaCursado != '') {
                        $('#programaCursado').val(programaCursado).trigger('change');
                    }
                }
            }});
    }

    function obtenerCapacitaciones() {
        var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoEducacionContinua').val();
        var tipoCapacitacion = $('#tipoCapacitacionEducacionContinua').val();
        if (nucleoBasicoConocimiento !== "" && tipoCapacitacion !== "") {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/capacitaciones?nucleoBasicoConocimiento=" + nucleoBasicoConocimiento + "&tipoCapacitacion=" + tipoCapacitacion,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response !== "") {
                        $('#capacitacionEducacionContinua').find('option').remove();
                        $('#capacitacionEducacionContinua').append('<option></option>');
                        capacitaciones = JSON.parse(response);
                        for (var i = 0; i < capacitaciones.length; i++) {
                            $('#capacitacionEducacionContinua').append('<option value=' + capacitaciones[i].nombre + '>' + capacitaciones[i].nombre + '</option>');
                        }
                        if (capacitacionEducacionContinua != '') {
                            $('#capacitacionEducacionContinua').val(capacitacionEducacionContinua).trigger('change');
                        }
                    }
                }});
        }
    }

    function buscarDepartamentos(idPais) {
        $.ajax({
            type: "GET",
            url: contextPath + "/convocatorias/departamentosPais/" + idPais,
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
            url: contextPath + "/convocatorias/ciudadesDepartamento/" + codigoDepartamento,
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

    function mostrarCampo(campoHojaVida) {
       $('#divFecha').hide();
       $('#divLugar').hide();
       $('#divSelect').hide();
       $('#divRadio').hide();
       $('#divSexo').hide();
       $('#divTexto').hide(); 
        
       if(campoHojaVida == PE_TIPO_ID || campoHojaVida == PE_NACIONALIDAD || campoHojaVida == PE_GRUPO_ETNICO || 
          campoHojaVida == PE_DISCAPACIDAD || campoHojaVida == PE_ACTIVIDAD_ECONOMICA || campoHojaVida == PE_TIPO_VINCULACION) {
           $('#divSelect').show();
           $('#divTipoIdentificacion').hide();
           $('#divNacionalidad').hide();
           $('#divGrupoEtnico').hide();
           $('#divDiscapacidad').hide();
           $('#divActividadEconomica').hide();
           $('#divTipoVinculacion').hide();
           if(campoHojaVida == PE_TIPO_ID) {
             $('#divTipoIdentificacion').show();
           } else if(campoHojaVida == PE_NACIONALIDAD) {
             $('#divNacionalidad').show();
           } else if(campoHojaVida == PE_GRUPO_ETNICO) {
             $('#divGrupoEtnico').show();
           } else if(campoHojaVida == PE_DISCAPACIDAD) {
             $('#divDiscapacidad').show();
           } else if(campoHojaVida == PE_ACTIVIDAD_ECONOMICA) {
             $('#divActividadEconomica').show();
           } else if(campoHojaVida == PE_TIPO_VINCULACION) {
             $('#divTipoVinculacion').show();
           }
       } else if(campoHojaVida == PE_LUGAR_EXPEDICION || campoHojaVida == PE_CIUDAD_RESIDENCIA || campoHojaVida == PE_LUGAR_NACIMIENTO) {
           $('#divLugar').show(); 
       } else if(campoHojaVida == PE_FECHA_EXPEDICION || campoHojaVida == PE_FECHA_NACIMIENTO) {
           $('#divFecha').show(); 
       } else if(campoHojaVida == PE_EGRESADO_UDEA || campoHojaVida == PE_GRUPO_ETNICO || campoHojaVida == PE_DISPONE_RUT ||
           campoHojaVida == PE_DISPONIBILIDAD_VIAJAR || campoHojaVida == PE_EMPLEADO_UDEA) {
           $('#divRadio').show(); 
       } else if(campoHojaVida == PE_SEXO) {
           $('#divSexo').show(); 
       } else if(campoHojaVida == PE_NUMERO_ID || campoHojaVida == PE_LIBRETA_MILITAR || campoHojaVida == PE_APELLIDOS ||
                 campoHojaVida == PE_NOMBRES || campoHojaVida == PE_DIRECCION) {
           $('#divTexto').show(); 
       }
    }

    bootstrap_alert_convocatoria = {};
    bootstrap_alert_convocatoria.warning = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.success = function (message) {
        $('#alert_placeholder_convocatoria').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_convocatoria.removeWarning = function () {
        $('#alert_placeholder_convocatoria').html('');
    };

    bootstrap_alert_adenda = {};
    bootstrap_alert_adenda.warning = function (message) {
        $('#alert_adenda').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_adenda.removeWarning = function () {
        $('#alert_adenda').html('');
    };

    bootstrap_alert_adendas = {};
    bootstrap_alert_adendas.warning = function (message) {
        $('#alert_adendas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_adendas.success = function (message) {
        $('#alert_adendas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_adendas.removeWarning = function () {
        $('#alert_adendas').html('');
    };

    bootstrap_alert_anyos_minima_experiencia = {};
    bootstrap_alert_anyos_minima_experiencia.warning = function (message) {
        $('#alert_anyos_minima_experiencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_minima_experiencia.success = function (message) {
        $('#alert_anyos_minima_experiencia').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_minima_experiencia.removeWarning = function () {
        $('#alert_anyos_minima_experiencia').html('');
    };

    bootstrap_alert_resultado = {};
    bootstrap_alert_resultado.warning = function (message) {
        $('#alert_resultado').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_resultado.success = function (message) {
        $('#alert_resultado').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_resultado.removeWarning = function () {
        $('#alert_resultado').html('');
    };

    bootstrap_alert_anyos_experiencia = {};
    bootstrap_alert_anyos_experiencia.warning = function (message) {
        $('#alert_anyos_experiencia').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_experiencia.removeWarning = function () {
        $('#alert_anyos_experiencia').html('');
    };

    bootstrap_alert_anyos_experiencias = {};
    bootstrap_alert_anyos_experiencias.warning = function (message) {
        $('#alert_anyos_experiencias').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_experiencias.success = function (message) {
        $('#alert_anyos_experiencias').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_anyos_experiencias.removeWarning = function () {
        $('#alert_anyos_experiencias').html('');
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
    bootstrap_alert_idiomas.success = function (message) {
        $('#alert_idiomas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_idiomas.removeWarning = function () {
        $('#alert_idiomas').html('');
    };

    bootstrap_alert_programa = {};
    bootstrap_alert_programa.warning = function (message) {
        $('#alert_programa').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programa.removeWarning = function () {
        $('#alert_programa').html('');
    };

    bootstrap_alert_programas = {};
    bootstrap_alert_programas.warning = function (message) {
        $('#alert_programas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programas.success = function (message) {
        $('#alert_programas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_programas.removeWarning = function () {
        $('#alert_programas').html('');
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
    bootstrap_alert_educaciones_continuas.success = function (message) {
        $('#alert_educaciones_continuas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_educaciones_continuas.removeWarning = function () {
        $('#alert_educaciones_continuas').html('');
    };

    bootstrap_alert_criterio_habilitante = {};
    bootstrap_alert_criterio_habilitante.warning = function (message) {
        $('#alert_criterio_habilitante').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_criterio_habilitante.removeWarning = function () {
        $('#alert_criterio_habilitante').html('');
    };
    
    bootstrap_alert_criterios_habilitantes = {};
    bootstrap_alert_criterios_habilitantes.warning = function (message) {
        $('#alert_criterios_habilitantes').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_criterios_habilitantes.success = function (message) {
        $('#alert_criterios_habilitantes').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_criterios_habilitantes.removeWarning = function () {
        $('#alert_criterios_habilitantes').html('');
    };

    var ConvocatoriaModel = function (adendas, anyosExperiencias, idiomas, programas, educacionesContinuas, criteriosHabilitantes) {
        self = this;
        self.adendas = ko.observableArray(adendas);
        self.anyosExperiencias = ko.observableArray(anyosExperiencias);
        self.idiomas = ko.observableArray(idiomas);
        self.programas = ko.observableArray(programas);
        self.educacionesContinuas = ko.observableArray(educacionesContinuas);
        self.criteriosHabilitantes = ko.observableArray(criteriosHabilitantes);

        self.adicionarAdenda = function () {
            var tipoAdenda = $('#tipoAdenda').val();
            var nombreTipoAdenda = $('#tipoAdenda option:selected').text();
            var descripcionAdenda = $('#descripcionAdenda').val();
            var fechaAdenda = $('#fechaAdenda').val();

            if (tipoAdenda === "") {
                bootstrap_alert_adenda.warning('Debe seleccionar el tipo de adenda');
                return false;
            }
            if (descripcionAdenda === "") {
                bootstrap_alert_adenda.warning('Debe ingresar la descripción de la adenda');
                return false;
            }
            if (fechaAdenda === "") {
                bootstrap_alert_adenda.warning('Debe ingresar la fecha de la adenda');
                return false;
            }
            var formData = new FormData();   
            if ($('#consecutivo').val() === "") {
                if ($('#documentoAdenda').val() === "") {
                    bootstrap_alert_adenda.warning('Debe ingresar el documento');
                    return false;
                }
                if ($('#documentoAdenda')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_adenda.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", 0);
                formData.append("consecutivo", self.adendas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.adendas().length; i++) {
                    if (self.adendas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                if ($('#documentoAdenda').val() != "" && $('#documentoAdenda')[0].files[0].size > MAXIMO_TAMANYO_ARCHIVO) {
                    bootstrap_alert_adenda.warning('El documento no debe ser mayor a 2MB');
                    return false;
                }
                formData.append("id", self.adendas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("tipoAdenda",tipoAdenda);
            formData.append("descripcion",descripcionAdenda);
            formData.append("fecha",fechaAdenda);
            if ($('#documentoAdenda').val() !== "") {
                formData.append("documento", $('#documentoAdenda')[0].files[0]);
            }
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/adenda",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_adenda').modal('hide');
                    bootstrap_alert_adendas.success('Adenda almacenada correctamente.');
                    if (response !== "") {
                        self.adendas.removeAll();
                        var adendas = JSON.parse(response);
                        for (var i = 0; i < adendas.length; i++) {
                            self.adendas.push(
                                {
                                    id: ko.observable(adendas[i].id),
                                    consecutivo: ko.observable(adendas[i].consecutivo),
                                    fecha: ko.observable(adendas[i].fechaFormateada),
                                    tipoAdenda: ko.observable(adendas[i].tipoAdenda),
                                    nombreTipoAdenda: ko.observable(adendas[i].nombreTipoAdenda),
                                    descripcion: ko.observable(adendas[i].descripcion)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_adendas.warning("Error al almacenar la adenda.");
            }});
        };

        self.eliminarAdenda = function (adenda) {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/eliminarAdenda/" + $("#id").val() + "/" + adenda.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    bootstrap_alert_adendas.success('Adenda eliminada correctamente.');
                    if (response !== "") {
                        self.adendas.removeAll();
                        var adendas = JSON.parse(response);
                        for (var i = 0; i < adendas.length; i++) {
                            self.adendas.push(
                                {
                                    id: ko.observable(adendas[i].id),
                                    consecutivo: ko.observable(adendas[i].consecutivo),
                                    fecha: ko.observable(adendas[i].fechaFormateada),
                                    tipoAdenda: ko.observable(adendas[i].tipoAdenda),
                                    nombreTipoAdenda: ko.observable(adendas[i].nombreTipoAdenda),
                                    descripcion: ko.observable(adendas[i].descripcion)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_adendas.warning("Error al eliminar la adenda.");
            }});
        };

        self.editarAdenda = function (adenda) {
            $('#tipoAdenda').val(adenda.tipoAdenda()).trigger('change');
            $('#fechaAdenda').val(adenda.fecha());
            $('#descripcionAdenda').val(adenda.descripcion());
            $('#consecutivo').val(adenda.consecutivo());
            bootstrap_alert_adendas.removeWarning();
            bootstrap_alert_adenda.removeWarning();
            $('#md_adenda').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.verDocumentoAdenda = function (adenda) {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/adenda/documento/" + adenda.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                   if(response != "") {
                     window.location.href = contextPath + "/convocatorias/adenda/documento/" + adenda.id();
                   }
                },
                error:function (xhr, ajaxOptions, thrownError) {
                    
                } 
            });
        };

        self.adicionarAnyosExperiencia = function () {
            var nucleoBasicoConocimientoAnyosExperiencia = $('#nucleoBasicoConocimientoAnyosExperiencia').val();
            var anyosExperiencia = $('#anyosExperiencia').val();

            if (nucleoBasicoConocimientoAnyosExperiencia === "") {
                bootstrap_alert_anyos_experiencia.warning('Debe seleccionar el núcleo básico de conocimento');
                return false;
            }
            if (anyosExperiencia === "") {
                bootstrap_alert_anyos_experiencia.warning('Debe ingresar el número de años de experiencia');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.anyosExperiencias().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.anyosExperiencias().length; i++) {
                    if (self.anyosExperiencias()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.anyosExperiencias()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimientoAnyosExperiencia);
            formData.append("anyos",anyosExperiencia);
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/anyosExperiencia",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_anyos_experiencia').modal('hide');
                    bootstrap_alert_anyos_experiencias.success('Años de experiencia almacenado correctamente.');
                    if (response !== "") {
                        self.anyosExperiencias.removeAll();
                        var anyosExperiencias = JSON.parse(response);
                        for (var i = 0; i < anyosExperiencias.length; i++) {
                            self.anyosExperiencias.push(
                                {
                                    id: ko.observable(anyosExperiencias[i].id),
                                    consecutivo: ko.observable(anyosExperiencias[i].consecutivo),
                                    nucleoBasicoConocimiento: ko.observable(anyosExperiencias[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(anyosExperiencias[i].nombreNucleoBasicoConocimiento),
                                    anyos: ko.observable(anyosExperiencias[i].anyos)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_anyos_experiencias.warning("Error al almacenar los años de experiencia.");
            }});
        };

        self.eliminarAnyosExperiencia = function (anyosExperiencia) {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/eliminarAnyosExperiencia/" + $("#id").val() + "/" + anyosExperiencia.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    $('#md_anyos_experiencia').modal('hide');
                    bootstrap_alert_anyos_experiencias.success('Años de experiencia eliminado correctamente.');
                    if (response !== "") {
                        self.anyosExperiencias.removeAll();
                        var anyosExperiencias = JSON.parse(response);
                        for (var i = 0; i < anyosExperiencias.length; i++) {
                            self.anyosExperiencias.push(
                                {
                                    id: ko.observable(anyosExperiencias[i].id),
                                    consecutivo: ko.observable(anyosExperiencias[i].consecutivo),
                                    nucleoBasicoConocimiento: ko.observable(anyosExperiencias[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(anyosExperiencias[i].nombreNucleoBasicoConocimiento),
                                    anyos: ko.observable(anyosExperiencias[i].anyos)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_anyos_experiencias.warning("Error al eliminar los años de experiencia.");
            }});
        };

        self.editarAnyosExperiencia = function (anyosExperiencia) {
            $('#nucleoBasicoConocimientoAnyosExperiencia').val(anyosExperiencia.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoAnyosExperiencia').val(anyosExperiencia.nombreNucleoBasicoConocimiento());
            $('#anyosExperiencia').val(anyosExperiencia.anyos());
            $('#consecutivo').val(anyosExperiencia.consecutivo());
            bootstrap_alert_anyos_experiencia.removeWarning();
            bootstrap_alert_anyos_experiencias.removeWarning();
            $('#md_anyos_experiencia').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarIdioma = function () {
            var idioma = $('#idioma').val();
            var nombreIdioma = $('#idioma option:selected').text();
            var otraCertificacion = $('#otraCertificacionIdioma').val();
            var tipoCertificacion = $('#tipoCertificacionIdioma').val();
            var nombreTipoCertificacion = $('#tipoCertificacionIdioma option:selected').text();
            var puntajeMinimoCertificacion = $('#puntajeMinimoCertificacionIdioma').val();

            if (idioma === "") {
                bootstrap_alert_idioma.warning('Debe seleccionar el idioma');
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
            if (puntajeMinimoCertificacion === "") {
                bootstrap_alert_idioma.warning('Debe ingresar el puntaje de certificación');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.idiomas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.idiomas().length; i++) {
                    if (self.idiomas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.idiomas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("idioma",idioma);
            formData.append("otraCertificacion",otraCertificacion);
            formData.append("tipoCertificacion",tipoCertificacion);
            formData.append("puntajeMinimoCertificacion",puntajeMinimoCertificacion);
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/idioma",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_idioma').modal('hide');
                    bootstrap_alert_idiomas.success('Idioma almacenado correctamente.');
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
                                    otraCertificacion: ko.observable(idiomas[i].otraCertificacion),
                                    tipoCertificacion: ko.observable(idiomas[i].tipoCertificacion),
                                    nombreTipoCertificacion: ko.observable(idiomas[i].nombreTipoCertificacion),
                                    puntajeMinimoCertificacion: ko.observable(idiomas[i].puntajeMinimoCertificacion)
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
                url: contextPath + "/convocatorias/eliminarIdioma/" + $("#id").val() + "/" + idioma.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    bootstrap_alert_idiomas.success('Idioma eliminado correctamente.');
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
                                    otraCertificacion: ko.observable(idiomas[i].otraCertificacion),
                                    tipoCertificacion: ko.observable(idiomas[i].tipoCertificacion),
                                    nombreTipoCertificacion: ko.observable(idiomas[i].nombreTipoCertificacion),
                                    puntajeMinimoCertificacion: ko.observable(idiomas[i].puntajeMinimoCertificacion)
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
            $('#otraCertificacionIdioma').val(idioma.otraCertificacion());
            $('#tipoCertificacionIdioma').val(idioma.tipoCertificacion()).trigger('change');
            if ($('#tipoCertificacionIdioma').val() === TIPO_CERTIFICACION_OTRO) {
                $('#divOtroCertificacionIdioma').css("display", "block");
            } else {
                $('#divOtroCertificacionIdioma').css("display", "none");
            }
            $('#puntajeMinimoCertificacionIdioma').val(idioma.puntajeMinimoCertificacion());
            $('#consecutivo').val(idioma.consecutivo());
            bootstrap_alert_idioma.removeWarning();
            bootstrap_alert_idiomas.removeWarning();
            $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarPrograma = function () {
            var nivelFormacion = $('#nivelFormacionPrograma').val();
            var nombreNivelFormacion = $('#nivelFormacionPrograma option:selected').text();
            var nucleoBasicoConocimientoPrograma = $('#nucleoBasicoConocimientoPrograma').val();
            var programa = $('#programaCursado').val();
            var nombrePrograma = $('#programaCursado option:selected').text();

            if (nivelFormacion === "") {
                bootstrap_alert_programa.warning('Debe seleccionar el nivel de formación');
                return false;
            }
            if (programa === "") {
                bootstrap_alert_programa.warning('Debe seleccionar el programa');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.programas().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.programas().length; i++) {
                    if (self.programas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.programas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("nivelFormacion",nivelFormacion);
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimientoPrograma);
            formData.append("programa",programa);
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/programa",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_programa').modal('hide');
                    bootstrap_alert_programas.success('Programa almacenado correctamente.');
                    if (response !== "") {
                        self.programas.removeAll();
                        var programas = JSON.parse(response);
                        for (var i = 0; i < programas.length; i++) {
                            self.programas.push(
                                {
                                    id: ko.observable(programas[i].id),
                                    consecutivo: ko.observable(programas[i].consecutivo),
                                    nivelFormacion: ko.observable(programas[i].nivelFormacion),
                                    nombreNivelFormacion: ko.observable(programas[i].nombreNivelFormacion),
                                    nucleoBasicoConocimiento: ko.observable(programas[i].nucleoBasicoConocimiento),
                                    programa: ko.observable(programas[i].programa),
                                    nombrePrograma: ko.observable(programas[i].nombrePrograma)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_programas.warning("Error al almacenar el idioma.");
            }});
        };

        self.eliminarPrograma = function (programa) {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/eliminarPrograma/" + $("#id").val() + "/" + programa.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    bootstrap_alert_programas.success('Programa eliminado correctamente.');
                    if (response !== "") {
                        self.programas.removeAll();
                        var programas = JSON.parse(response);
                        for (var i = 0; i < programas.length; i++) {
                            self.programas.push(
                                {
                                    id: ko.observable(programas[i].id),
                                    consecutivo: ko.observable(programas[i].consecutivo),
                                    nivelFormacion: ko.observable(programas[i].nivelFormacion),
                                    nombreNivelFormacion: ko.observable(programas[i].nombreNivelFormacion),
                                    nucleoBasicoConocimiento: ko.observable(programas[i].nucleoBasicoConocimiento),
                                    programa: ko.observable(programas[i].programa),
                                    nombrePrograma: ko.observable(programas[i].nombrePrograma)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_programas.warning("Error al eliminar el idioma.");
            }});
        };

        self.editarPrograma = function (programa) {
            programaCursado = programa.programa();
            $('#nivelFormacionPrograma').val(programa.nivelFormacion()).trigger('change');
            $('#nucleoBasicoConocimientoPrograma').val(programa.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoPrograma').val(programa.nombreNucleoBasicoConocimiento());
            $('#consecutivo').val(programa.consecutivo());
            obtenerProgramasCursados();
            bootstrap_alert_programa.removeWarning();
            bootstrap_alert_programas.removeWarning();
            $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarEducacionContinua = function () {
            var tipoCapacitacion = $('#tipoCapacitacionEducacionContinua').val();
            var nombreTipoCapacitacion = $('#tipoCapacitacionEducacionContinua option:selected').text();
            var nucleoBasicoConocimiento = $('#nucleoBasicoConocimientoEducacionContinua').val();
            var capacitacion = $('#capacitacionEducacionContinua').val();

            if (tipoCapacitacion === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el tipo de capacitación');
                return false;
            }
            if (nucleoBasicoConocimiento === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar el núcleo básico de conocimiento');
                return false;
            }
            if (capacitacion === "") {
                bootstrap_alert_educacion_continua.warning('Debe seleccionar la capacitación');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.educacionesContinuas().length);
                self.educacionesContinuas.push({
                    id: ko.observable(0),
                    consecutivo: ko.observable(self.educacionesContinuas().length),
                    tipoCapacitacion: ko.observable(tipoCapacitacion),
                    nombreTipoCapacitacion: ko.observable(nombreTipoCapacitacion),
                    nucleoBasicoConocimiento: ko.observable(nucleoBasicoConocimiento),
                    nombreCapacitacion: ko.observable(capacitacion)
                });
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.educacionesContinuas().length; i++) {
                    if (self.educacionesContinuas()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.educacionesContinuas()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("tipoCapacitacion",tipoCapacitacion);
            formData.append("nucleoBasicoConocimiento",nucleoBasicoConocimiento);
            formData.append("nombreCapacitacion",capacitacion);
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/educacionContinua",
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
                                    nucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nombreNucleoBasicoConocimiento),
                                    nombreCapacitacion: ko.observable(educacionesContinuas[i].nombreCapacitacion)
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
                url: contextPath + "/convocatorias/eliminarEducacionContinua/" + $("#id").val() + "/" + educacionContinua.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    $('#md_educacion_continua').modal('hide');
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
                                    nucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nucleoBasicoConocimiento),
                                    nombreNucleoBasicoConocimiento: ko.observable(educacionesContinuas[i].nombreNucleoBasicoConocimiento),
                                    nombreCapacitacion: ko.observable(educacionesContinuas[i].nombreCapacitacion)
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
            capacitacionEducacionContinua = educacionContinua.nombreCapacitacion();
            $('#tipoCapacitacionEducacionContinua').val(educacionContinua.tipoCapacitacion()).trigger('change');
            $('#nucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nucleoBasicoConocimiento());
            $('#nombreNucleoBasicoConocimientoEducacionContinua').val(educacionContinua.nombreNucleoBasicoConocimiento());
            $('#consecutivo').val(educacionContinua.consecutivo());
            obtenerCapacitaciones();
            bootstrap_alert_educacion_continua.removeWarning();
            bootstrap_alert_educaciones_continuas.removeWarning();
            $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
        };

        self.adicionarCriterioHabilitante = function () {
            var campoHojaVida = $('#campoHojaVidaCriterioHabilitante').val();
            var nombreCampoHojaVidaCriterio = $('#campoHojaVidaCriterioHabilitante option:selected').text();
            var valorCriterio = "";
            var textoCriterio = "";

            if(campoHojaVida == PE_TIPO_ID || campoHojaVida == PE_NACIONALIDAD || campoHojaVida == PE_GRUPO_ETNICO || 
               campoHojaVida == PE_DISCAPACIDAD || campoHojaVida == PE_ACTIVIDAD_ECONOMICA || campoHojaVida == PE_TIPO_VINCULACION) {
                if(campoHojaVida == PE_TIPO_ID) {
                  valorCriterio = $('#tipoIdentificacion').val();
                  textoCriterio = $('#tipoIdentificacion option:selected').text();
                } else if(campoHojaVida == PE_NACIONALIDAD) {
                  valorCriterio = $('#nacionalidad').val();
                  textoCriterio = $('#nacionalidad option:selected').text();
                } else if(campoHojaVida == PE_GRUPO_ETNICO) {
                  valorCriterio = $('#grupoEtnico').val();
                  textoCriterio = $('#grupoEtnico option:selected').text();
                } else if(campoHojaVida == PE_DISCAPACIDAD) {
                  valorCriterio = $('#discapacidad').val();
                  textoCriterio = $('#discapacidad option:selected').text();
                } else if(campoHojaVida == PE_ACTIVIDAD_ECONOMICA) {
                  valorCriterio = $('#actividadEconomica').val();
                  textoCriterio = $('#actividadEconomica option:selected').text();
                } else if(campoHojaVida == PE_TIPO_VINCULACION) {
                  valorCriterio = $('#tipoVinculacion').val();
                  textoCriterio = $('#tipoVinculacion option:selected').text();
                }
            } else if(campoHojaVida == PE_LUGAR_EXPEDICION || campoHojaVida == PE_CIUDAD_RESIDENCIA || campoHojaVida == PE_LUGAR_NACIMIENTO) {
                valorCriterio = $('#lugar').val();
                textoCriterio = $('#nombreLugar').val();
            } else if(campoHojaVida == PE_FECHA_EXPEDICION || campoHojaVida == PE_FECHA_NACIMIENTO) {
                valorCriterio = $('#fecha').val();
                textoCriterio = $('#fecha').val();
            } else if(campoHojaVida == PE_EGRESADO_UDEA || campoHojaVida == PE_DISPONE_RUT ||
                campoHojaVida == PE_DISPONIBILIDAD_VIAJAR || campoHojaVida == PE_EMPLEADO_UDEA) {
                valorCriterio = $('#radio').val();
                if(valorCriterio == "true") {
                  textoCriterio = "Sí"; 
                } else {
                  textoCriterio = "No"; 
                }
            } else if(campoHojaVida == PE_SEXO) {
                valorCriterio = $('#sexo').val();
                if(valorCriterio == "1") {
                  textoCriterio = "Masculino";
                } else {
                  textoCriterio = "Femenino";
                }
            } else if(campoHojaVida == PE_NUMERO_ID || campoHojaVida == PE_LIBRETA_MILITAR || campoHojaVida == PE_APELLIDOS ||
                      campoHojaVida == PE_NOMBRES || campoHojaVida == PE_DIRECCION) {
                valorCriterio = $('#texto').val();
                textoCriterio = $('#texto').val();
            }

            if (campoHojaVida === "") {
                bootstrap_alert_criterio_habilitante.warning('Debe seleccionar el campo de la hoja de vida');
                return false;
            }
            if (valorCriterio === "") {
                bootstrap_alert_criterio_habilitante.warning('Debe ingresar el valor');
                return false;
            }
            var formData = new FormData();
            if ($('#consecutivo').val() === "") {
                formData.append("id", 0);
                formData.append("consecutivo", self.criteriosHabilitantes().length);
            } else {
                var consecutivo = parseInt($('#consecutivo').val(), 10);
                var indice = 0;
                for (i = 0; i < self.criteriosHabilitantes().length; i++) {
                    if (self.criteriosHabilitantes()[i].consecutivo() === consecutivo) {
                        indice = i;
                        break;
                    }
                }
                formData.append("id", self.criteriosHabilitantes()[indice].id());
                formData.append("consecutivo", consecutivo);
            }
            formData.append("idConvocatoria",$("#id").val());
            formData.append("campoHojaVida",campoHojaVida);
            formData.append("nombreCampoHojaVida",nombreCampoHojaVidaCriterio);
            formData.append("valor",valorCriterio);
            formData.append("texto",textoCriterio);
            $.ajax({
                type: "POST",
                url: contextPath + "/convocatorias/criterioHabilitante",
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    $('#md_criterio_habilitante').modal('hide');
                    bootstrap_alert_criterios_habilitantes.success('Criterio habilitante almacenado correctamente.');
                    if (response !== "") {
                        self.criteriosHabilitantes.removeAll();
                        var criteriosHabilitantes = JSON.parse(response);
                        for (var i = 0; i < criteriosHabilitantes.length; i++) {
                            self.criteriosHabilitantes.push(
                                {
                                    id: ko.observable(criteriosHabilitantes[i].id),
                                    consecutivo: ko.observable(criteriosHabilitantes[i].consecutivo),
                                    campoHojaVida: ko.observable(criteriosHabilitantes[i].campoHojaVida),
                                    nombreCampoHojaVida: ko.observable(criteriosHabilitantes[i].nombreCampoHojaVida),
                                    valor: ko.observable(criteriosHabilitantes[i].valor),
                                    texto: ko.observable(criteriosHabilitantes[i].texto)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_criterios_habilitantes.warning("Error al almacenar el criterio habilitante.");
            }});
        };

        self.eliminarCriterioHabilitante = function (criterio) {
            $.ajax({
                type: "GET",
                url: contextPath + "/convocatorias/eliminarCriterioHabilitante/" + $("#id").val() + "/" + criterio.id(),
                processData: false,
                contentType: false,
                success: function (response) {
                    $('#md_criterio_habilitante').modal('hide');
                    bootstrap_alert_criterios_habilitantes.success('Criterio habilitante eliminado correctamente.');
                    if (response !== "") {
                        self.criteriosHabilitantes.removeAll();
                        var criteriosHabilitantes = JSON.parse(response);
                        for (var i = 0; i < criteriosHabilitantes.length; i++) {
                            self.criteriosHabilitantes.push(
                                {
                                    id: ko.observable(criteriosHabilitantes[i].id),
                                    consecutivo: ko.observable(criteriosHabilitantes[i].consecutivo),
                                    campoHojaVida: ko.observable(criteriosHabilitantes[i].campoHojaVida),
                                    nombreCampoHojaVida: ko.observable(criteriosHabilitantes[i].nombreCampoHojaVida),
                                    valor: ko.observable(criteriosHabilitantes[i].valor),
                                    texto: ko.observable(criteriosHabilitantes[i].texto)
                                }
                             );
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    bootstrap_alert_criterios_habilitantes.warning("Error al eliminar el criterio habilitante.");
            }});
        };

        self.editarCriterioHabilitante = function (criterio) {
            $('#divFecha').hide();
            $('#divLugar').hide();
            $('#divSelect').hide();
            $('#divRadio').hide();
            $('#divSexo').hide();
            $('#divTexto').hide(); 
        
            $('#campoHojaVidaCriterioHabilitante').val(criterio.campoHojaVida()).trigger('change');
            $('#consecutivo').val(criterio.consecutivo());
            
            var campoHojaVida = criterio.campoHojaVida();
            if(campoHojaVida == PE_TIPO_ID || campoHojaVida == PE_NACIONALIDAD || campoHojaVida == PE_GRUPO_ETNICO || 
               campoHojaVida == PE_DISCAPACIDAD || campoHojaVida == PE_ACTIVIDAD_ECONOMICA || campoHojaVida == PE_TIPO_VINCULACION) {
                $('#divSelect').show();
                $('#divTipoIdentificacion').hide();
                $('#divNacionalidad').hide();
                $('#divGrupoEtnico').hide();
                $('#divDiscapacidad').hide();
                $('#divActividadEconomica').hide();
                $('#divTipoVinculacion').hide();
                if(campoHojaVida == PE_TIPO_ID) {
                  $('#divTipoIdentificacion').show();
                  $('#tipoIdentificacion').val(criterio.valor()).trigger('change');
                } else if(campoHojaVida == PE_NACIONALIDAD) {
                  $('#divNacionalidad').show();
                  $('#nacionalidad').val(criterio.valor()).trigger('change');
                } else if(campoHojaVida == PE_GRUPO_ETNICO) {
                  $('#divGrupoEtnico').show();
                  $('#grupoEtnico').val(criterio.valor()).trigger('change');
                } else if(campoHojaVida == PE_DISCAPACIDAD) {
                  $('#divDiscapacidad').show();
                  $('#discapacidad').val(criterio.valor()).trigger('change');
                } else if(campoHojaVida == PE_ACTIVIDAD_ECONOMICA) {
                  $('#divActividadEconomica').show();
                  $('#actividadEconomica').val(criterio.valor()).trigger('change');
                } else if(campoHojaVida == PE_TIPO_VINCULACION) {
                  $('#divTipoVinculacion').show();
                  $('#tipoVinculacion').val(criterio.valor()).trigger('change');
                }
            } else if(campoHojaVida == PE_LUGAR_EXPEDICION || campoHojaVida == PE_CIUDAD_RESIDENCIA || campoHojaVida == PE_LUGAR_NACIMIENTO) {
                $('#divLugar').show(); 
                $('#nombreLugar').val(criterio.texto());
                
            } else if(campoHojaVida == PE_FECHA_EXPEDICION || campoHojaVida == PE_FECHA_NACIMIENTO) {
                $('#divFecha').show(); 
                $('#fecha').val(criterio.valor());
            } else if(campoHojaVida == PE_EGRESADO_UDEA || campoHojaVida == PE_DISPONE_RUT ||
                campoHojaVida == PE_DISPONIBILIDAD_VIAJAR || campoHojaVida == PE_EMPLEADO_UDEA) {
                $('#divRadio').show();
                if(criterio.valor() == "true") {
                  $('#btnRadioSi').removeClass('notActive').addClass('active');  
                  $('#btnRadioNo').removeClass('active').addClass('notActive');
                } else {
                  $('#btnRadioNo').removeClass('notActive').addClass('active');  
                  $('#btnRadioSi').removeClass('active').addClass('notActive');  
                }
            } else if(campoHojaVida == PE_SEXO) {
                $('#divSexo').show(); 
                if(criterio.valor() == "1") {
                  $('#btnSexoSi').removeClass('notActive').addClass('active');  
                  $('#btnSexoNo').removeClass('active').addClass('notActive');
                } else {
                  $('#btnSexoNo').removeClass('notActive').addClass('active');  
                  $('#btnSexoSi').removeClass('active').addClass('notActive');  
                }
            } else if(campoHojaVida == PE_NUMERO_ID || campoHojaVida == PE_LIBRETA_MILITAR || campoHojaVida == PE_APELLIDOS ||
                      campoHojaVida == PE_NOMBRES || campoHojaVida == PE_DIRECCION) {
                $('#divTexto').show(); 
                $('#texto').val(criterio.valor());
            }
            
            bootstrap_alert_criterio_habilitante.removeWarning();
            bootstrap_alert_criterios_habilitantes.removeWarning();
            $('#md_criterio_habilitante').modal({backdrop: 'static', keyboard: false})  ;
        };
    };

    function verDocumentoConvocatoria() {
        $.ajax({
            type: "GET",
            url: contextPath + "/convocatorias/documento/" + $('#id').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/convocatorias/documento/" + $('#id').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function verDocumentoResultado() {
        $.ajax({
            type: "GET",
            url: contextPath + "/convocatorias/resultado/" + $('#id').val(),
            processData: false,
            contentType: false,
            success: function (response) {
               if(response != "") {
                 window.location.href = contextPath + "/convocatorias/resultado/" + $('#id').val();
               }
            },
            error:function (xhr, ajaxOptions, thrownError) {

            } 
        });  
    }

    function nuevaAdenda() {
        $('#tipoAdenda').val("").trigger('change');
        $('#fechaAdenda').val("");
        $('#descripcionAdenda').val("");
        bootstrap_alert_adenda.removeWarning();
        bootstrap_alert_adendas.removeWarning();
        $('#md_adenda').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoAnyosExperiencia() {
        $('#nucleoBasicoConocimientoAnyosExperiencia').val("");
        $('#nombreNucleoBasicoConocimientoAnyosExperiencia').val("");
        $('#anyosExperiencia').val("");
        $('#consecutivo').val("");
        bootstrap_alert_anyos_experiencia.removeWarning();
        bootstrap_alert_anyos_experiencias.removeWarning();
        $('#md_anyos_experiencia').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoIdioma() {
        $('#idioma').val("").trigger('change');
        $('#otraCertificacionIdioma').val("");
        $('#tipoCertificacionIdioma').val("").trigger('change');
        $('#puntajeMinimoCertificacionIdioma').val("");
        $('#consecutivo').val("");
        bootstrap_alert_idioma.removeWarning();
        bootstrap_alert_idiomas.removeWarning();
        $('#md_idioma').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoPrograma() {
        programaCursado = '';
        $('#programaCursado').find('option').remove();
        $('#programaCursado').append('<option></option>');
        $('#programaCursado').val("").trigger('change');
        $('#nivelFormacionPrograma').val("").trigger('change');
        $('#nucleoBasicoConocimientoPrograma').val("");
        $('#nombreNucleoBasicoConocimientoPrograma').val("");
        $('#consecutivo').val("");
        bootstrap_alert_programa.removeWarning();
        bootstrap_alert_programas.removeWarning();
        $('#md_programa').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevaEducacionContinua() {
        capacitacionEducacionContinua = '';
        $('#tipoCapacitacionEducacionContinua').val("").trigger('change');
        $('#nucleoBasicoConocimientoEducacionContinua').val("");
        $('#nombreNucleoBasicoConocimientoEducacionContinua').val("");
        $('#capacitacionEducacionContinua').find('option').remove();
        $('#capacitacionEducacionContinua').append('<option></option>');
        $('#capacitacionEducacionContinua').val("").trigger('change');
        $('#consecutivo').val("");
        bootstrap_alert_educacion_continua.removeWarning();
        bootstrap_alert_educaciones_continuas.removeWarning();
        $('#md_educacion_continua').modal({backdrop: 'static', keyboard: false})  ;
    }

    function nuevoCriterioHabilitante() {
        $('#campoHojaVidaCriterioHabilitante').val("").trigger('change');
        $('#tipoIdentificacion').val("").trigger('change');
        $('#nacionalidad').val("").trigger('change');
        $('#grupoEtnico').val("").trigger('change');
        $('#discapacidad').val("").trigger('change');
        $('#actividadEconomica').val("").trigger('change');
        $('#tipoVinculacion').val("").trigger('change');
        $('#nombreLugar').val("");
        $('#lugar').val("");
        $('#fecha').val("");
        $('#btnRadioSi').removeClass('active').addClass('notActive');  
        $('#btnRadioNo').removeClass('active').addClass('notActive');  
        $('#btnSexoSi').removeClass('active').addClass('notActive');  
        $('#btnSexoNo').removeClass('active').addClass('notActive');  
        $('#texto').val("");
        $('#consecutivo').val("");
        $('#divFecha').hide();
        $('#divLugar').hide();
        $('#divSelect').hide();
        $('#divRadio').hide();
        $('#divSexo').hide();
        $('#divTexto').show(); 
        bootstrap_alert_criterio_habilitante.removeWarning();
        bootstrap_alert_criterios_habilitantes.removeWarning();
        $('#md_criterio_habilitante').modal({backdrop: 'static', keyboard: false})  ;
    }

    function cerrarVentanaAndenda() {
        $('#md_adenda').modal('hide');
    }

    function cerrarVentanaAnyosExperiencia() {
        $('#md_anyos_experiencia').modal('hide');
    }

    function cerrarVentanaIdioma() {
        $('#md_idioma').modal('hide');
    }

    function cerrarVentanaPrograma() {
        $('#md_programa').modal('hide');
    }

    function cerrarVentanaEducacionContinua() {
        $('#md_educacion_continua').modal('hide');
    }

    function cerrarVentanaCriterioHabilitante() {
        $('#md_criterio_habilitante').modal('hide');
    }

    function mostrarUbicacionModal(nombreCampo, campo) {
        nombreCampoCiudad = nombreCampo;
        campoCiudad = campo;
        $('#ubicacionModal').modal({backdrop: 'static', keyboard: false})  ;
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
        if(campoNucleoBasicoConocimiento == "nucleoBasicoConocimientoPrograma") {
            obtenerProgramasCursados(); 
        } else if(campoNucleoBasicoConocimiento == "nucleoBasicoConocimientoEducacionContinua") {
            obtenerCapacitaciones();
        }
        $('#md_nucleo_basico_conocimiento').modal('hide');
    }
    
    var convocatoriaModel = new ConvocatoriaModel(adendas, anyosExperiencias, idiomas, programas, educacionesContinuas, criteriosHabilitantes);
    ko.applyBindings(convocatoriaModel);