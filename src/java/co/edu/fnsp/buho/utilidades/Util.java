/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.utilidades;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.CursoExperienciaDocencia;
import co.edu.fnsp.buho.entidades.Distincion;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import static java.util.Calendar.DATE;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author William
 */
public class Util {

    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    private static final SimpleDateFormat simpleLongDateFormat = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("es", "CO"));
    private static final DecimalFormat decimalFormat = new DecimalFormat("'$'###,###");

    public static String obtenerFechaFormateada(Date fecha) {
        if (fecha != null) {
            return simpleDateFormat.format(fecha);
        }

        return "";
    }

    public static String obtenerFechaLargaFormateada(Date fecha) {
        if (fecha != null) {
            return simpleLongDateFormat.format(fecha);
        }

        return "";
    }

    public static Date obtenerFecha(String fecha) throws ParseException {
        if (fecha != null && !"".equalsIgnoreCase(fecha)) {
            return simpleDateFormat.parse(fecha);
        }

        return null;
    }

    public static String obtenerNumeroFormatoMoneda(Long valor) {
        if (valor != null) {
            return decimalFormat.format(valor);
        }

        return "";
    }

    public static long obtenerNumero(String numero) throws ParseException {
        return (long) decimalFormat.parse(numero);
    }

    public static int obtenerEntero(String numero) throws ParseException {
        return Integer.parseInt(numero);
    }

    public static double obtenerNumeroDoble(String numero) throws ParseException {
        return Double.parseDouble(numero);
    }

    public static int getAnyos(Date fechaInicial, Date fechaFinal) {
        Calendar a = getCalendar(fechaInicial);
        Calendar b = getCalendar(fechaFinal);
        int diff = b.get(YEAR) - a.get(YEAR);
        if (a.get(MONTH) > b.get(MONTH)
                || (a.get(MONTH) == b.get(MONTH) && a.get(DATE) > b.get(DATE))) {
            diff--;
        }
        return diff;
    }

    public static Calendar getCalendar(Date date) {
        Calendar cal = Calendar.getInstance(Locale.US);
        cal.setTime(date);
        return cal;
    }

    public static String obtenerAdendasJSON(List<Adenda> correosElectronicos) {
        String json = "";

        if (correosElectronicos.size() > 0) {
            json = "[";

            for (int i = 0; i < correosElectronicos.size(); i++) {
                Adenda adenda = correosElectronicos.get(i);
                String nombreDocumento = "";
                if (adenda.getDocumento() != null) {
                    nombreDocumento = adenda.getDocumento().getNombre();
                }
                json = json
                        + "{id: ko.observable(" + adenda.getId() + "),"
                        + "descripcion:ko.observable('" + adenda.getDescripcion() + "'),"
                        + "tipoAdenda:ko.observable('" + adenda.getTipoAdenda() + "'),"
                        + "nombreTipoAdenda:ko.observable('" + adenda.getNombreTipoAdenda() + "'),"
                        + "documento:ko.observable('" + nombreDocumento + "'),"
                        + "tieneDocumento:ko.observable(" + adenda.isTieneDocumento() + "),"
                        + "fecha:ko.observable('" + Util.obtenerFechaFormateada(adenda.getFecha()) + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < correosElectronicos.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerTelefonosJSON(List<Telefono> telefonos) {
        String json = "";

        if (telefonos.size() > 0) {
            json = "[";

            for (int i = 0; i < telefonos.size(); i++) {
                Telefono telefono = telefonos.get(i);
                json = json
                        + "{id: ko.observable(" + telefono.getId() + "),"
                        + "tipo:ko.observable(" + telefono.getTipo() + "),"
                        + "nombreTipo:ko.observable('" + telefono.getNombreTipo() + "'),"
                        + "numero:ko.observable('" + telefono.getNumero() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < telefonos.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerCuentasBancariasJSON(List<CuentaBancaria> cuentasBancarias) {
        String json = "";

        if (cuentasBancarias.size() > 0) {
            json = "[";

            for (int i = 0; i < cuentasBancarias.size(); i++) {
                CuentaBancaria cuentaBancaria = cuentasBancarias.get(i);
                json = json
                        + "{id: ko.observable(" + cuentaBancaria.getId() + "),"
                        + "entidad:ko.observable('" + cuentaBancaria.getEntidad() + "'),"
                        + "tipo:ko.observable('" + cuentaBancaria.getTipo() + "'),"
                        + "nombreTipo:ko.observable('" + cuentaBancaria.getNombreTipo() + "'),"
                        + "numero:ko.observable('" + cuentaBancaria.getNumero() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < cuentasBancarias.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerCorreosElectronicosJSON(List<CorreoElectronico> correosElectronicos) {
        String json = "";

        if (correosElectronicos.size() > 0) {
            json = "[";

            for (int i = 0; i < correosElectronicos.size(); i++) {
                CorreoElectronico correoElectronico = correosElectronicos.get(i);
                json = json
                        + "{id: ko.observable(" + correoElectronico.getId() + "),"
                        + "correoElectronico:ko.observable('" + correoElectronico.getCorreoElectronico() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < correosElectronicos.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerDocumentosSoporteJSON(List<DocumentoSoporte> documentosSoporte) {
        String json = "";

        if (documentosSoporte.size() > 0) {
            json = "[";

            for (int i = 0; i < documentosSoporte.size(); i++) {
                DocumentoSoporte documentoSoporte = documentosSoporte.get(i);
                json = json
                        + "{id: ko.observable(" + documentoSoporte.getId() + "),"
                        + "tipoDocumento:ko.observable('" + documentoSoporte.getTipoDocumento() + "'),"
                        + "nombreTipoDocumento:ko.observable('" + documentoSoporte.getNombreTipoDocumento() + "'),"
                        + "documento:ko.observable(''),"
                        + "tieneDocumento:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < documentosSoporte.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerIdiomasJSON(List<Idioma> idiomas) {
        String json = "";

        if (idiomas.size() > 0) {
            json = "[";

            for (int i = 0; i < idiomas.size(); i++) {
                Idioma idioma = idiomas.get(i);
                json = json
                        + "{id: ko.observable(" + idioma.getId() + "),"
                        + "idioma:ko.observable(" + idioma.getIdioma() + "),"
                        + "nombreIdioma:ko.observable('" + idioma.getNombreIdioma() + "'),"
                        + "nivelConversacion:ko.observable('" + idioma.getNivelConversacion() + "'),"
                        + "nombreNivelConversacion:ko.observable('" + idioma.getNombreNivelConversacion() + "'),"
                        + "nivelEscritura:ko.observable('" + idioma.getNivelEscritura() + "'),"
                        + "nombreNivelEscritura:ko.observable('" + idioma.getNombreNivelEscritura() + "'),"
                        + "nivelEscucha:ko.observable('" + idioma.getNivelEscucha() + "'),"
                        + "nombreNivelEscucha:ko.observable('" + idioma.getNombreNivelEscucha() + "'),"
                        + "nivelLectura:ko.observable('" + idioma.getNivelLectura() + "'),"
                        + "nombreNivelLectura:ko.observable('" + idioma.getNombreNivelLectura() + "'),"
                        + "otraCertificacion:ko.observable('" + idioma.getOtraCertificacion() + "'),"
                        + "tipoCertificacion:ko.observable(" + idioma.getTipoCertificacion() + "),"
                        + "nombreTipoCertificacion:ko.observable('" + idioma.getNombreTipoCertificacion() + "'),"
                        + "puntajeCertificacion:ko.observable(" + idioma.getPuntajeCertificacion() + "),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < idiomas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerIdiomasConvocatoriaJSON(List<IdiomaConvocatoria> idiomas) {
        String json = "";

        if (idiomas.size() > 0) {
            json = "[";

            for (int i = 0; i < idiomas.size(); i++) {
                IdiomaConvocatoria idioma = idiomas.get(i);
                json = json
                        + "{id: ko.observable(" + idioma.getId() + "),"
                        + "idioma:ko.observable(" + idioma.getIdioma() + "),"
                        + "nombreIdioma:ko.observable('" + idioma.getNombreIdioma() + "'),"
                        + "otraCertificacion:ko.observable('" + idioma.getOtraCertificacion() + "'),"
                        + "tipoCertificacion:ko.observable(" + idioma.getTipoCertificacion() + "),"
                        + "nombreTipoCertificacion:ko.observable('" + idioma.getNombreTipoCertificacion() + "'),"
                        + "puntajeMinimoCertificacion:ko.observable(" + idioma.getPuntajeMinimoCertificacion() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < idiomas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerEducacionesBasicasJSON(List<EducacionBasica> educacionesBasicas) {
        String json = "";

        if (educacionesBasicas.size() > 0) {
            json = "[";

            for (int i = 0; i < educacionesBasicas.size(); i++) {
                EducacionBasica educacionBasica = educacionesBasicas.get(i);
                json = json
                        + "{id: ko.observable(" + educacionBasica.getId() + "),"
                        + "institucion:ko.observable(" + educacionBasica.getInstitucion() + "),"
                        + "nombreInstitucion:ko.observable('" + educacionBasica.getNombreInstitucion() + "'),"
                        + "nivel:ko.observable(" + educacionBasica.getNivel() + "),"
                        + "nombreNivel:ko.observable('" + educacionBasica.getNombreNivel() + "'),"
                        + "titulo:ko.observable('" + educacionBasica.getTitulo() + "'),"
                        + "anyoInicio:ko.observable(" + educacionBasica.getAnyoInicio() + "),"
                        + "graduado:ko.observable(" + educacionBasica.isGraduado() + "),"
                        + "anyoFinalizacion:ko.observable(" + educacionBasica.getAnyoFinalizacion() + "),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < educacionesBasicas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerEducacionesSuperioresJSON(List<EducacionSuperior> educacionesSuperiores) {
        String json = "";

        if (educacionesSuperiores.size() > 0) {
            json = "[";

            for (int i = 0; i < educacionesSuperiores.size(); i++) {
                EducacionSuperior educacionSuperior = educacionesSuperiores.get(i);
                boolean tieneCertificadoHomologado = false;
                String paisTitulo = "";
                String nombrePaisTitulo = "";
                if (educacionSuperior.isTituloExterior()) {
                    tieneCertificadoHomologado = true;
                    paisTitulo = educacionSuperior.getPaisTituloExterior().toString();
                    nombrePaisTitulo = educacionSuperior.getNombrePaisTituloExterior();
                }
                json = json
                        + "{id: ko.observable(" + educacionSuperior.getId() + "),"
                        + "institucion:ko.observable(" + educacionSuperior.getInstitucion() + "),"
                        + "nombreInstitucion:ko.observable('" + educacionSuperior.getNombreInstitucion() + "'),"
                        + "tituloExterior:ko.observable(" + educacionSuperior.isTituloExterior() + "),"
                        + "paisTituloExterior:ko.observable(" + paisTitulo + "),"
                        + "nombrePaisTitulo:ko.observable('" + nombrePaisTitulo + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + educacionSuperior.getNucleoBasicoConocimiento() + "),"
                        + "nombreNucleoBasicoConocimiento:ko.observable('" + educacionSuperior.getNombreNucleoBasicoConocimiento() + "'),"
                        + "programa:ko.observable(" + educacionSuperior.getPrograma() + "),"
                        + "nombrePrograma:ko.observable('" + educacionSuperior.getNombrePrograma() + "'),"
                        + "nivel:ko.observable(" + educacionSuperior.getNivel() + "),"
                        + "nombreNivel:ko.observable('" + educacionSuperior.getNombreNivel() + "'),"
                        + "titulo:ko.observable('" + educacionSuperior.getTitulo() + "'),"
                        + "fechaTitulo:ko.observable('" + Util.obtenerFechaFormateada(educacionSuperior.getFechaTitulo()) + "'),"
                        + "anyoInicio:ko.observable(" + educacionSuperior.getAnyoInicio() + "),"
                        + "graduado:ko.observable(" + educacionSuperior.isGraduado() + "),"
                        + "anyoFinalizacion:ko.observable(" + educacionSuperior.getAnyoFinalizacion() + "),"
                        + "certificadoHomologado:ko.observable(''),"
                        + "tieneCertificadoHomologado:ko.observable(" + tieneCertificadoHomologado + "),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < educacionesSuperiores.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerEducacionesContinuasJSON(List<EducacionContinua> educacionesContinuas) {
        String json = "";

        if (educacionesContinuas.size() > 0) {
            json = "[";

            for (int i = 0; i < educacionesContinuas.size(); i++) {
                EducacionContinua educacionContinua = educacionesContinuas.get(i);
                json = json
                        + "{id: ko.observable(" + educacionContinua.getId() + "),"
                        + "institucion:ko.observable(" + educacionContinua.getInstitucion() + "),"
                        + "nombreInstitucion:ko.observable('" + educacionContinua.getNombreInstitucion() + "'),"
                        + "tipoCapacitacion:ko.observable(" + educacionContinua.getTipoCapacitacion() + "),"
                        + "nombreTipoCapacitacion:ko.observable('" + educacionContinua.getNombreTipoCapacitacion() + "'),"
                        + "nombreCapacitacion:ko.observable('" + educacionContinua.getNombreCapacitacion() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + educacionContinua.getNucleoBasicoConocimiento() + "),"
                        + "nombreNucleoBasicoConocimiento:ko.observable('" + educacionContinua.getNombreNucleoBasicoConocimiento() + "'),"
                        + "anyo:ko.observable(" + educacionContinua.getAnyo() + "),"
                        + "numeroHoras:ko.observable(" + educacionContinua.getNumeroHoras() + "),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < educacionesContinuas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerDistincionesJSON(List<Distincion> distinciones) {
        String json = "";

        if (distinciones.size() > 0) {
            json = "[";

            for (int i = 0; i < distinciones.size(); i++) {
                Distincion distincion = distinciones.get(i);
                json = json
                        + "{id: ko.observable(" + distincion.getId() + "),"
                        + "descripcion:ko.observable('" + distincion.getDescripcion() + "'),"
                        + "institucionOtorga:ko.observable('" + distincion.getInstitucionOtorga() + "'),"
                        + "fechaDistincion:ko.observable('" + Util.obtenerFechaFormateada(distincion.getFechaDistincion()) + "'),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < distinciones.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerExperienciasLaboralesJSON(List<ExperienciaLaboral> experienciasLaborales) {
        String json = "";

        if (experienciasLaborales.size() > 0) {
            json = "[";

            for (int i = 0; i < experienciasLaborales.size(); i++) {
                ExperienciaLaboral experienciaLaboral = experienciasLaborales.get(i);
                json = json
                        + "{id: ko.observable(" + experienciaLaboral.getId() + "),"
                        + "cargo:ko.observable('" + experienciaLaboral.getCargo() + "'),"
                        + "fnsp:ko.observable(" + experienciaLaboral.isFnsp() + "),"
                        + "trabajoActual:ko.observable(" + experienciaLaboral.isTrabajoActual() + "),"
                        + "fechaIngreso:ko.observable('" + Util.obtenerFechaFormateada(experienciaLaboral.getFechaIngreso()) + "'),"
                        + "fechaRetiro:ko.observable('" + Util.obtenerFechaFormateada(experienciaLaboral.getFechaRetiro()) + "'),"
                        + "actividadEconomica:ko.observable(" + experienciaLaboral.getActividadEconomica() + "),"
                        + "nombreActividadEconomica:ko.observable('" + experienciaLaboral.getNombreActividadEconomica() + "'),"
                        + "tipoContrato:ko.observable(" + experienciaLaboral.getTipoContrato() + "),"
                        + "nombreTipoContrato:ko.observable('" + experienciaLaboral.getNombreTipoContrato() + "'),"
                        + "tipoEmpresa:ko.observable(" + experienciaLaboral.getTipoEmpresa() + "),"
                        + "nombreTipoEmpresa:ko.observable('" + experienciaLaboral.getNombreTipoEmpresa() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + experienciaLaboral.getNucleoBasicoConocimiento() + "),"
                        + "nombreNucleoBasicoConocimiento:ko.observable('" + experienciaLaboral.getNombreNucleoBasicoConocimiento() + "'),"
                        + "naturalezaCargo:ko.observable(" + experienciaLaboral.getNaturalezaCargo() + "),"
                        + "nombreNaturalezaCargo:ko.observable('" + experienciaLaboral.getNombreNaturalezaCargo() + "'),"
                        + "nombreEmpresa:ko.observable('" + experienciaLaboral.getNombreEmpresa() + "'),"
                        + "tipoExperiencia:ko.observable(" + experienciaLaboral.getTipoExperiencia() + "),"
                        + "nombreTipoExperiencia:ko.observable('" + experienciaLaboral.getNombreTipoExperiencia() + "'),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < experienciasLaborales.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerExperienciasDocenciaJSON(List<ExperienciaDocencia> experienciasDocencia) {
        String json = "";

        if (experienciasDocencia.size() > 0) {
            json = "[";

            for (int i = 0; i < experienciasDocencia.size(); i++) {
                ExperienciaDocencia experienciaDocencia = experienciasDocencia.get(i);
                String jsonCursos = "";
                for (int j = 0; j < experienciaDocencia.getCursosExperienciaDocencia().size(); j++) {
                    CursoExperienciaDocencia cursoExperienciaDocencia = experienciaDocencia.getCursosExperienciaDocencia().get(j);
                    jsonCursos = jsonCursos
                            + "{id: ko.observable(" + cursoExperienciaDocencia.getId() + "),"
                            + "nombreCurso:ko.observable('" + cursoExperienciaDocencia.getNombreCurso() + "'),"
                            + "nucleoBasicoConocimiento:ko.observable(" + cursoExperienciaDocencia.getNucleoBasicoConocimiento() + "),"
                            + "nombreNucleoBasicoConocimiento:ko.observable('" + cursoExperienciaDocencia.getNombreNucleoBasicoConocimiento() + "'),"
                            + "modalidad:ko.observable(" + cursoExperienciaDocencia.getModalidad() + "),"
                            + "nombreModalidad:ko.observable('" + cursoExperienciaDocencia.getNombreModalidad() + "'),"
                            + "nivelEstudio:ko.observable(" + cursoExperienciaDocencia.getNivelEstudio() + "),"
                            + "nombreNivelEstudio:ko.observable('" + cursoExperienciaDocencia.getNombreNivelEstudio() + "'),"
                            + "anyo:ko.observable(" + cursoExperienciaDocencia.getAnyo() + "),"
                            + "numeroHoras:ko.observable(" + cursoExperienciaDocencia.getNumeroHoras() + "),"
                            + "certificado:ko.observable(''),"
                            + "tieneCertificado:ko.observable(true),"
                            + "consecutivo:ko.observable(" + j + ")"
                            + "}";
                    if (j < experienciaDocencia.getCursosExperienciaDocencia().size() - 1) {
                        jsonCursos = jsonCursos + ",";
                    }
                }
                json = json
                        + "{id: ko.observable(" + experienciaDocencia.getId() + "),"
                        + "fnsp:ko.observable(" + experienciaDocencia.isFnsp() + "),"
                        + "trabajoActual:ko.observable(" + experienciaDocencia.isTrabajoActual() + "),"
                        + "institucion:ko.observable(" + experienciaDocencia.getInstitucion() + "),"
                        + "nombreInstitucion:ko.observable('" + experienciaDocencia.getNombreInstitucion() + "'),"
                        + "cursosExperienciaDocencia: ko.observableArray([" + jsonCursos + "]),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < experienciasDocencia.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static Object obtenerArticulosJSON(List<Articulo> articulos) {
        String json = "";

        if (articulos.size() > 0) {
            json = "[";

            for (int i = 0; i < articulos.size(); i++) {
                Articulo articulo = articulos.get(i);
                json = json
                        + "{id: ko.observable(" + articulo.getId() + "),"
                        + "nombreRevista:ko.observable('" + articulo.getNombreRevista() + "'),"
                        + "nombre:ko.observable('" + articulo.getNombre() + "'),"
                        + "anyo:ko.observable(" + articulo.getAnyo() + "),"
                        + "tipoAutor:ko.observable(" + articulo.getTipoAutor() + "),"
                        + "url:ko.observable('" + articulo.getUrl() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + articulo.getNucleoBasicoConocimiento() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < articulos.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerPatentesJSON(List<Patente> patentes) {
        String json = "";

        if (patentes.size() > 0) {
            json = "[";

            for (int i = 0; i < patentes.size(); i++) {
                Patente patente = patentes.get(i);
                String nombrePropiedadCompartida = "No";
                if (patente.isPropiedadCompartida()) {
                    nombrePropiedadCompartida = "Si";
                }
                json = json
                        + "{id: ko.observable(" + patente.getId() + "),"
                        + "descripcion:ko.observable('" + patente.getDescripcion() + "'),"
                        + "nombreTipo:ko.observable('" + patente.getNombreTipo() + "'),"
                        + "propiedadCompartida:ko.observable(" + patente.isPropiedadCompartida() + "),"
                        + "nombrePropiedadCompartida:ko.observable('" + nombrePropiedadCompartida + "'),"
                        + "tipo:ko.observable(" + patente.getTipo() + "),"
                        + "clase:ko.observable(" + patente.getClase() + "),"
                        + "fecha:ko.observable('" + Util.obtenerFechaFormateada(patente.getFecha()) + "'),"
                        + "documento:ko.observable(''),"
                        + "tieneDocumento:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < patentes.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerProductosConocimientoJSON(List<ProductoConocimiento> productosConocimiento) {
        String json = "";

        if (productosConocimiento.size() > 0) {
            json = "[";

            for (int i = 0; i < productosConocimiento.size(); i++) {
                ProductoConocimiento productoConocimiento = productosConocimiento.get(i);
                json = json
                        + "{id: ko.observable(" + productoConocimiento.getId() + "),"
                        + "descripcion:ko.observable('" + productoConocimiento.getDescripcion() + "'),"
                        + "nombreTipo:ko.observable('" + productoConocimiento.getNombreTipo() + "'),"
                        + "tipo:ko.observable(" + productoConocimiento.getTipo() + "),"
                        + "url:ko.observable('" + productoConocimiento.getUrl() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable('" + productoConocimiento.getNucleoBasicoConocimiento() + "'),"
                        + "documento:ko.observable(''),"
                        + "tieneDocumento:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < productosConocimiento.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerAnyosExperienciaJSON(List<AnyosExperiencia> anyosExperiencias) {
        String json = "";

        if (anyosExperiencias.size() > 0) {
            json = "[";

            for (int i = 0; i < anyosExperiencias.size(); i++) {
                AnyosExperiencia anyosExperiencia = anyosExperiencias.get(i);
                json = json
                        + "{id: ko.observable(" + anyosExperiencia.getId() + "),"
                        + "nucleoBasicoConocimiento:ko.observable(" + anyosExperiencia.getNucleoBasicoConocimiento() + "),"
                        + "nombreNucleoBasicoConocimiento:ko.observable('" + anyosExperiencia.getNombreNucleoBasicoConocimiento() + "'),"
                        + "anyos:ko.observable(" + anyosExperiencia.getAnyos() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < anyosExperiencias.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerProgramasConvocatoriaJSON(List<ProgramaConvocatoria> programas) {
        String json = "";

        if (programas.size() > 0) {
            json = "[";

            for (int i = 0; i < programas.size(); i++) {
                ProgramaConvocatoria programa = programas.get(i);
                json = json
                        + "{id: ko.observable(" + programa.getId() + "),"
                        + "nivelFormacion:ko.observable(" + programa.getNivelFormacion() + "),"
                        + "nombreNivelFormacion:ko.observable('" + programa.getNombreNivelFormacion() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + programa.getNucleoBasicoConocimiento() + "),"
                        + "programa:ko.observable('" + programa.getPrograma() + "'),"
                        + "nombrePrograma:ko.observable('" + programa.getNombrePrograma() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < programas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerEducacionesContinuasConvocatoriaJSON(List<EducacionContinuaConvocatoria> educacionesContinuas) {
        String json = "";

        if (educacionesContinuas.size() > 0) {
            json = "[";

            for (int i = 0; i < educacionesContinuas.size(); i++) {
                EducacionContinuaConvocatoria educacionContinua = educacionesContinuas.get(i);
                json = json
                        + "{id: ko.observable(" + educacionContinua.getId() + "),"
                        + "tipoCapacitacion:ko.observable(" + educacionContinua.getTipoCapacitacion() + "),"
                        + "nombreTipoCapacitacion:ko.observable('" + educacionContinua.getNombreTipoCapacitacion() + "'),"
                        + "nombreCapacitacion:ko.observable('" + educacionContinua.getNombreCapacitacion() + "'),"
                        + "nucleoBasicoConocimiento:ko.observable(" + educacionContinua.getNucleoBasicoConocimiento() + "),"
                        + "nombreNucleoBasicoConocimiento:ko.observable('" + educacionContinua.getNombreNucleoBasicoConocimiento() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < educacionesContinuas.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }

    public static String obtenerCriteriosHabilitantesJSON(List<CriterioHabilitanteConvocatoria> criteriosHabilitantes) {
        String json = "";

        if (criteriosHabilitantes.size() > 0) {
            json = "[";

            for (int i = 0; i < criteriosHabilitantes.size(); i++) {
                CriterioHabilitanteConvocatoria criterioHabilitante = criteriosHabilitantes.get(i);
                json = json
                        + "{id: ko.observable(" + criterioHabilitante.getId() + "),"
                        + "campoHojaVida:ko.observable(" + criterioHabilitante.getCampoHojaVida() + "),"
                        + "nombreCampoHojaVida:ko.observable('" + criterioHabilitante.getNombreCampoHojaVida() + "'),"
                        + "valor:ko.observable('" + criterioHabilitante.getValor() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < criteriosHabilitantes.size() - 1) {
                    json = json + ",";
                }
            }

            json = json + "]";
        }

        return json;
    }
}
