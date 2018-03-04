/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.utilidades;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.CriterioEvaluacion;
import co.edu.fnsp.buho.entidades.CriterioHabilitante;
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

    public static String obtenerAdendasJSON(List<Adenda> adendas) {
        String jscriptArray = "";

        if (adendas.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adendas.size(); i++) {
                Adenda adenda = adendas.get(i);
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
                if (i < adendas.size() - 1) {
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
                        + "nombre:ko.observable('" + criterioEvaluacion.getNombre()+ "'),"
                        + "nombreSubcriterio():ko.observable('" + criterioEvaluacion.getNombreSubcriterio()+ "'),"
                        + "peso:ko.observable('" + criterioEvaluacion.getPeso()+ "'),"
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
                        + "nombre:ko.observable('" + criterioHabilitante.getNombre()+ "'),"
                        + "valor:ko.observable('" + criterioHabilitante.getValor()+ "'),"
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
}
