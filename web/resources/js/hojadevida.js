$(document).ready(function() {
 
  $('#tbdistin').DataTable({
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
  $('#tbpublicacion').DataTable({
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
  	
    $('#addidioma').click(function(){
        var idioma = $('#id_idioma').val();
        var escucha = $('#id_escucha').val();
        var habla = $('#id_habla').val();
        var escritura = $('#id_escritura').val();
        var lectura = $('#id_lectura').val();
        var certifidioma  = $('#cid_certificado').val();

        fila = "<tr><td>"+idioma+"</td><td>"+lectura+"</td><td>"+escritura+"</td><td>"+habla+"</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
        $('#tbidiomas').append(fila);
        $('#md_idioma').modal('hide');
        $('#id_idioma').val("");
        $('#id_escucha').val("");
        $('#id_habla').val("");
        $('#id_escritura').val("");
        $('#id_lectura').val("");
        $('#cid_certificado').val("");
    });
    $('#addemail').click(function(){
        var email = $('#email').val();
        fila = "<tr><td>"+email+"</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
        $('#tbemail').append(fila);
        $('#md_email').modal('hide');
        $('#email').val("");
    });
    $('#addtel').click(function(){
      var tipotel = $('#tel_tipo').val();
      var numero = $('#tel_numero').val();
      fila = "<tr><td>"+tipotel+"</td><td>"+numero+"</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
      $('#tbtel').append(fila);
      $('#md_telefono').modal('hide');
      $('#tel_tipo').val("");  
      $('#tel_numero').val("");        
    });

    //atraer los datos de modal de aspectos academicos

   $('#addesttecnicos').click(function(){
      var nivel = $('#est_nivel').val();
      var area = $('#est_area_saber').val();
      var inst = $('#est_institucion_educativa').val(); 
      var programa = $('#est_programa_cursado').val();
      var fectit = $('#est_fecha_titulo').val();
      var certificado = $('#es_certificado').val();

      fila = "<tr><td>"+nivel+"</td><td>"+area+"</td><td>"+inst+"</td><td>"+programa+"</td><td>"+fectit+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      $('#tbestecnico').append(fila); 
      $('#md_aspesttecnicos').modal('hide');
      $('#est_nivel').select2("val","");
      $('#est_area_saber').select2("val","");
      $('#est_institucion_educativa').select2("val","");
      $('#est_programa_cursado').val(" ");
      $('#est_fecha_titulo').val(" ");
      $('#es_certificado').val("");
   });
   $('#addesttecnologia').click(function(){
      var nivel = $('#est_nivel2').val();
      var area = $('#est_area_saber2').val();
      var inst = $('#est_institucion_educativa2').val(); 
      var programa = $('#est_programa_cursado2').val();
      var fectit = $('#est_fecha_titulo2').val();
      var certificado = $('#es_certificado2').val();

      fila = "<tr><td>"+nivel+"</td><td>"+area+"</td><td>"+inst+"</td><td>"+programa+"</td><td>"+fectit+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      $('#tbestecnologico').append(fila); 
      $('#md_asesttecnologico').modal('hide');
      $('#est_nivel2').select2("val","");
      $('#est_area_saber2').select2("val","");
      $('#est_institucion_educativa2').select2("val","");
      $('#est_programa_cursado2').val(" ");
      $('#est_fecha_titulo2').val(" ");
      $('#es_certificado2').val("");
   });
   $('#addestprofesional').click(function(){
      var nivel = $('#est_nivel3').val();
      var area = $('#est_area_saber3').val();
      var inst = $('#est_institucion_educativa3').val(); 
      var programa = $('#est_programa_cursado3').val();
      var fectit = $('#est_fecha_titulo3').val();
      var certificado = $('#es_certificado3').val();

      fila = "<tr><td>"+nivel+"</td><td>"+area+"</td><td>"+inst+"</td><td>"+programa+"</td><td>"+fectit+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      $('#tbprofesional').append(fila); 
      $('#md_asestprofesional').modal('hide');
      $('#est_nivel3').select2("val","");
      $('#est_area_saber3').select2("val","");
      $('#est_institucion_educativa3').select2("val","");
      $('#est_programa_cursado3').val(" ");
      $('#est_fecha_titulo3').val(" ");
      $('#es_certificado3').val("");
   });
   $('#addestpsogrados').click(function(){
      var nivel = $('#est_nivel4').val();
      var area = $('#est_area_saber4').val();
      var inst = $('#est_institucion_educativa4').val(); 
      var programa = $('#est_programa_cursado4').val();
      var fectit = $('#est_fecha_titulo4').val();
      var certificado = $('#es_certificado4').val();

      fila = "<tr><td>"+nivel+"</td><td>"+area+"</td><td>"+inst+"</td><td>"+programa+"</td><td>"+fectit+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      $('#tbestposgrados').append(fila); 
      $('#md_aspestposgrados').modal('hide');
      $('#est_nivel4').select2("val","");
      $('#est_area_saber4').select2("val","");
      $('#est_institucion_educativa4').select2("val","");
      $('#est_programa_cursado4').val(" ");
      $('#est_fecha_titulo4').val(" ");
      $('#es_certificado4').val("");
   });
   $('#addestotros').click(function(){
      var nivel = $('#est_nivel5').val();
      var area = $('#est_area_saber5').val();
      var inst = $('#est_institucion_educativa5').val(); 
      var programa = $('#est_programa_cursado5').val();
      var fectit = $('#est_fecha_titulo5').val();
      var certificado = $('#es_certificado5').val();

      fila = "<tr><td>"+nivel+"</td><td>"+area+"</td><td>"+inst+"</td><td>"+programa+"</td><td>"+fectit+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      $('#tbestotros').append(fila); 
      $('#md_aspestotros').modal('hide');
      $('#est_nivel5').select2("val","");
      $('#est_area_saber5').select2("val","");
      $('#est_institucion_educativa5').select2("val","");
      $('#est_programa_cursado5').val(" ");
      $('#est_fecha_titulo5').val(" ");
      $('#es_certificado5').val("");
   });
   $('#addexpdocsalud').click(function(){
      var tipoexpe = $('#ep_tipoexperiencia').val();
      var area = $('#ep_tipo_exp').val();
      var tipocon = $('#ep_tipo_contrato').val();
      var nomemp = $('#ep_nombre_empresa').val();
      var dedic = $('#ep_dedicacion').val();
      var cargo = $('#ep_cargo').val();
      var carequi = $('#ep_cargo_equivalente').val();
      var fecharet = $('#ep_fecharetiro').val();
      var certifi = $('#ep_certificado').val();
      var trafnsp = $('#ep_exp_fnsp2').val();
      var trafnsp = $('#ep_exp_fnsp3').val();


      fila = "<tr><td>"+tipocon+"</td><td>"+nomemp+"</td><td>"+dedic+"</td><td>"+cargo+"</td><td>"+carequi+"</td><td>"+fecharet+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-sm' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td>"+trafnsp+"</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"
      
      if((tipoexpe == 'Docencia') && (area == 'Salud'))
      {
        $('#tbexpdocsal').append(fila);
      }
      if(tipoexpe == 'Docencia'&& area == 'Educacion')
      {
        $('#tbexpdoc').append(fila);
      }
      if (tipoexpe == 'Profesional' && area == 'Salud') 
      {
        $('#tbexplabsal').append(fila);
      }
      if (tipoexpe == 'Profesional' && area == 'Educacion') 
      {
        $('#tbexplab').append(fila);
      }
      if (tipoexpe == 'Proyectos de investigacion') 
      {
        $('#tbexpinv').append(fila);
      }
      if (tipoexpe == 'Proyectos de extension') 
      {
        $('#tbexpext').append(fila);
      }

      $('#md_expdocsalud').modal('hide');


      $('#ep_tipoexperiencia').val("");
      $('#ep_tipo_exp').val("");
      $('#ep_tipo_contrato').val("");
      $('#ep_nombre_empresa').val("");
      $('#ep_dedicacion').val("");
      $('#ep_cargo').val("");
      $('#ep_cargo_equivalente').val("");
      $('#ep_fecharetiro').val("");
      $('#ep_certificado').val("");
      $('#ep_exp_fnsp').val("");
   });
   

   // $('#clickdescarga').click(function(){

   //  html2canvas($('#formpersonal'),{
   //    onrendered: function(canvas)
   //    {
   //      var img = canvas.toDataURL("image/png");
   //      var doc = new jsPDF('p','pt','a4');
   //      doc.addImage(img,'JPEG',15,25,570,400);
   //      doc.save('prueba.pdf');
   //    }
   //  });

    
   // });
   $('#adddistinpubli').click(function(){
    var fecha = $('#fechaactual').val();
      var person = $('#dist_persona').val();
      var instit = $('#dist_institucion_otorga').val();
      var descrip = $('#dist_descripcion').val();
      var certif = $('#pdc_certiifcado').val();

      fila = "<tr><td>2563</td><td>"+person+"</td><td>"+instit+"</td><td>"+descrip+"</td><td>"+fecha+"</td><td> <a href='#' target='_black' title='Ver documemnto' style='margin-left: 30px;' class='btn btn-success btn-xs' type='button'><i class='fa fa-file-pdf-o' aria-hidden='true'> </i></a></td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"

      $('#tbdistin').append(fila);
      $('#md_distincion').modal('hide');
   });

$('#addpubli').click(function(){
    var fechaac = $('#fechaactual2').val();
    var personpubli = $('#publi_persona').val();
    var url = $('#publi_cvlac_url').val();

    fila = "<tr><td>2562</td><td>"+personpubli+"</td><td>"+url+"</td><td>"+fechaac+"</td><td style='white-space: nowrap'><button class='btn btn-success btn-xs' type='button'><i class='fa fa-pencil' aria-hidden='true'></i></button><button class='btn btn-danger btn-xs' type='button' id='btnborrar'><span class='glyphicon glyphicon-remove'></span></button></td></tr>"

    $('#tbpublicacion').append(fila);
    $('#md_publicacion').modal('hide');
});

   $('#radrural').change(function()
   {
    var valor = $(this).val();
    if(valor == "rural")
    {
      $('#formrural').css("display","block");
      $('#formurbana').css("display","none");
      $('#radurbano').prop('checked',false);
    }
   });
   $('#radurbano').change(function(){
    var valor = $(this).val();
    if(valor=="urbano")
    {
      $('#formurbana').css("display","block");
      $('#formrural').css("display","none");
      $('#radrural').prop('checked',false);
    }
   });

   
    $('#pe_numero_id').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });
    $('#pe_libretamilitar').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });
     $('#tel_numero').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });
    
   $('#numdir').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });
   $('#num2dir').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });
   $('#num3dir').keyup(function (){
            this.value = (this.value + '').replace(/[^0-9]/g, '');
          });


   $('#dircalle').change(function(){
      var valor = $(this).val();
      $("#rescalle").val(valor);
      $("#vistaprevia").val(valor);
    });
   $('#numdir').keyup(function(){
    var valor =$(this).val();
    var rescalle =$("#rescalle").val();
    $('#resnumdir').val(valor);
    $("#vistaprevia").val(rescalle +" "+valor);

   });
   $('#letdir').keyup(function(){
    var valor =$(this).val();
     var rescalle =$("#rescalle").val();
    var resnumdir = $('#resnumdir').val();
    $('#resletdir').val(valor);
    $("#vistaprevia").val(rescalle +" "+resnumdir+valor);
   });
   $('#dirsur').change(function(){
      var valor = $(this).val();
      var rescalle =$("#rescalle").val();
      var resnumdir = $('#resnumdir').val();
       var resletdir = $('#resletdir').val();
      $("#resdisur").val(valor);
      $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+valor);
    });
   $('#num2dir').keyup(function(){
    var valor =$(this).val();
     var rescalle =$("#rescalle").val();
    var resnumdir = $('#resnumdir').val();
    var resletdir = $('#resletdir').val();
    var resdisur = $("#resdisur").val();
    $('#resnum2dir').val(valor);
    $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+resdisur+" # "+valor);
   });
   $('#let2dir').keyup(function(){
    var valor =$(this).val();
     var rescalle =$("#rescalle").val();
    var resnumdir = $('#resnumdir').val();
    var resletdir = $('#resletdir').val();
    var resdisur = $("#resdisur").val();
    var resnum2dir = $('#resnum2dir').val();
    $('#reslet2dir').val(valor);
    $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+resdisur+" # "+resnum2dir+valor);
   });
   $('#direst').change(function(){
      var valor = $(this).val();
      var rescalle =$("#rescalle").val();
      var resnumdir = $('#resnumdir').val();
      var resletdir = $('#resletdir').val();
      var resdisur = $("#resdisur").val();
      var resnum2dir = $('#resnum2dir').val();
      var reslet2dir =  $('#reslet2dir').val();
      $("#resdirest").val(valor);
      $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+resdisur+" # "+resnum2dir+reslet2dir+" "+valor);
    });
   $('#num3dir').keyup(function(){
    var valor =$(this).val();
     var rescalle =$("#rescalle").val();
    var resnumdir = $('#resnumdir').val();
    var resletdir = $('#resletdir').val();
    var resdisur = $("#resdisur").val();
    var resnum2dir = $('#resnum2dir').val();
    var reslet2dir =  $('#reslet2dir').val();
    var resdirest = $("#resdirest").val();
    $('#resnum3dir').val(valor);
    $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+resdisur+" # "+resnum2dir+reslet2dir+" "+resdirest+"- "+valor);
   });
   $('#dirurb').keyup(function(){
    var valor =$(this).val();
     var rescalle =$("#rescalle").val();
    var resnumdir = $('#resnumdir').val();
    var resletdir = $('#resletdir').val();
    var resdisur = $("#resdisur").val();
    var resnum2dir = $('#resnum2dir').val();
    var reslet2dir =  $('#reslet2dir').val();
    var resdirest = $("#resdirest").val();
    var resnum3dir = $('#resnum3dir').val();
    
    $("#vistaprevia").val(rescalle +" "+resnumdir+resletdir+" "+resdisur+" # "+resnum2dir+reslet2dir+" "+resdirest+"- "+resnum3dir+" "+valor);
   });
   $('#adddireccion').click(function(){
    if($('#radrural').is(':checked'))
    {
      var dirrural = $('#dirrural').val();
    $('#pe_direccion').val(dirrural);
    $('#md_direccion').modal('hide');
    $('#radurbano').prop('checked',false);
    }
    if ($('#radurbano').is(':checked')) {
      var direccion = $('#vistaprevia').val();
      $('#pe_direccion').val(direccion);
      $('#md_direccion').modal('hide');
      $('#radrural').prop('checked',false);
    }
    

   });
});

$(document).on('click', '#btnborrar', function (event) {
    event.preventDefault();
    $(this).closest('tr').remove();});

window.onload=function()
     {
        var today = new Date();
        var dd= today.getDate();
        var mm = today.getMonth()+1;
        var yyyy = today.getFullYear();
         var output= (dd<10?'0':'')+dd+'/'+(mm<10?'0':'')+mm+"/"+yyyy;
         document.getElementById('fechaactual').value=output;
         document.getElementById('fechaactual2').value= output;
     }