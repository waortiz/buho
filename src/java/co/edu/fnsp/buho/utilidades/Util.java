/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.utilidades;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CriterioEvaluacion;
import co.edu.fnsp.buho.entidades.CriterioHabilitante;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.Idioma;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        return simpleDateFormat.parse(fecha);
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

    public static String obtenerAdendasJSON(List<Adenda> correosElectronicos) {
        String jscriptArray = "";

        if (correosElectronicos.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < correosElectronicos.size(); i++) {
                Adenda adenda = correosElectronicos.get(i);
                String nombreDocumento = "";
                if (adenda.getDocumento() != null) {
                    nombreDocumento = adenda.getDocumento().getNombre();
                }
                jscriptArray = jscriptArray
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
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerCriteriosEvaluacionJSON(List<CriterioEvaluacion> criteriosEvaluacion) {
        String jscriptArray = "";

        if (criteriosEvaluacion.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < criteriosEvaluacion.size(); i++) {
                CriterioEvaluacion criterioEvaluacion = criteriosEvaluacion.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + criterioEvaluacion.getId() + "),"
                        + "nombre:ko.observable('" + criterioEvaluacion.getNombre() + "'),"
                        + "nombreSubcriterio():ko.observable('" + criterioEvaluacion.getNombreSubcriterio() + "'),"
                        + "peso:ko.observable('" + criterioEvaluacion.getPeso() + "'),"
                        + "idSubcriterio:ko.observable('" + criterioEvaluacion.getIdSubcriterio() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < criteriosEvaluacion.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerCriteriosHabilitantesJSON(List<CriterioHabilitante> criteriosHabilitantes) {
        String jscriptArray = "";

        if (criteriosHabilitantes.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < criteriosHabilitantes.size(); i++) {
                CriterioHabilitante criterioHabilitante = criteriosHabilitantes.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + criterioHabilitante.getId() + "),"
                        + "nombre:ko.observable('" + criterioHabilitante.getNombre() + "'),"
                        + "valor:ko.observable('" + criterioHabilitante.getValor() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < criteriosHabilitantes.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerTelefonosJSON(List<Telefono> telefonos) {
        String jscriptArray = "";

        if (telefonos.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < telefonos.size(); i++) {
                Telefono telefono = telefonos.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + telefono.getId() + "),"
                        + "tipo:ko.observable(" + telefono.getTipo() + "),"
                        + "nombreTipo:ko.observable('" + telefono.getNombreTipo() + "'),"
                        + "numero:ko.observable('" + telefono.getNumero() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < telefonos.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerCuentasBancariasJSON(List<CuentaBancaria> cuentasBancarias) {
        String jscriptArray = "";

        if (cuentasBancarias.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < cuentasBancarias.size(); i++) {
                CuentaBancaria cuentaBancaria = cuentasBancarias.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + cuentaBancaria.getId() + "),"
                        + "entidad:ko.observable('" + cuentaBancaria.getEntidad() + "'),"
                        + "tipo:ko.observable('" + cuentaBancaria.getTipo() + "'),"
                        + "nombreTipo:ko.observable('" + cuentaBancaria.getNombreTipo() + "'),"
                        + "numero:ko.observable('" + cuentaBancaria.getNumero() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < cuentasBancarias.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerCorreosElectronicosJSON(List<CorreoElectronico> correosElectronicos) {
        String jscriptArray = "";

        if (correosElectronicos.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < correosElectronicos.size(); i++) {
                CorreoElectronico correoElectronico = correosElectronicos.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + correoElectronico.getId() + "),"
                        + "correoElectronico:ko.observable('" + correoElectronico.getCorreoElectronico() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < correosElectronicos.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerDocumentosSoporteJSON(List<DocumentoSoporte> documentosSoporte) {
        String jscriptArray = "";

        if (documentosSoporte.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < documentosSoporte.size(); i++) {
                DocumentoSoporte documentoSoporte = documentosSoporte.get(i);
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + documentoSoporte.getId() + "),"
                        + "tipoDocumento:ko.observable('" + documentoSoporte.getTipoDocumento() + "'),"
                        + "nombreTipoDocumento:ko.observable('" + documentoSoporte.getNombreTipoDocumento() + "'),"
                        + "documento:ko.observable(''),"
                        + "tieneDocumento:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < documentosSoporte.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerIdiomasJSON(List<Idioma> idiomas) {
        String jscriptArray = "";

        if (idiomas.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < idiomas.size(); i++) {
                Idioma idioma = idiomas.get(i);
                jscriptArray = jscriptArray
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
                        + "tipoCertificacion:ko.observable('" + idioma.getTipoCertificacion() + "'),"
                        + "nombreTipoCertificacion:ko.observable('" + idioma.getNombreTipoCertificacion() + "'),"
                        + "puntajeCertificacion:ko.observable(" + idioma.getPuntajeCertificacion() + "),"
                        + "certificado:ko.observable(''),"
                        + "tieneCertificado:ko.observable(true),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < idiomas.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerEducacionesBasicasJSON(List<EducacionBasica> educacionesBasicas) {
        String jscriptArray = "";

        if (educacionesBasicas.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < educacionesBasicas.size(); i++) {
                EducacionBasica educacionBasica = educacionesBasicas.get(i);
                jscriptArray = jscriptArray
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
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static Object obtenerEducacionesSuperioresJSON(List<EducacionSuperior> educacionesSuperiores) {
        String jscriptArray = "";

        if (educacionesSuperiores.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < educacionesSuperiores.size(); i++) {
                EducacionSuperior educacionSuperior = educacionesSuperiores.get(i);
                boolean tieneCertificadoHomologado = false;
                String paisTitulo = "";
                String nombrePaisTitulo = "";
                if(educacionSuperior.isTituloExterior()) {
                    tieneCertificadoHomologado = true;
                    paisTitulo = educacionSuperior.getPaisTituloExterior().toString();
                    nombrePaisTitulo = educacionSuperior.getNombrePaisTituloExterior();
                }
                jscriptArray = jscriptArray
                        + "{id: ko.observable(" + educacionSuperior.getId() + "),"
                        + "institucion:ko.observable(" + educacionSuperior.getInstitucion() + "),"
                        + "nombreInstitucion:ko.observable('" + educacionSuperior.getNombreInstitucion() + "'),"
                        + "tituloExterior:ko.observable(" + educacionSuperior.isTituloExterior()+ "),"
                        + "paisTituloExterior:ko.observable(" + paisTitulo + "),"
                        + "nombrePaisTitulo:ko.observable('" + nombrePaisTitulo + "'),"
                        + "areaSaber:ko.observable(" + educacionSuperior.getAreaSaber()+ "),"
                        + "nombreAreaSaber:ko.observable('" + educacionSuperior.getNombreAreaSaber() + "'),"
                        + "programa:ko.observable('" + educacionSuperior.getPrograma()+ "'),"
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
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

}
