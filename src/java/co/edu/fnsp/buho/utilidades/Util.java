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
import com.google.gson.Gson;
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
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public static Date obtenerFecha(String fecha) {
        if (fecha != null && !"".equalsIgnoreCase(fecha)) {
            try {
                return simpleDateFormat.parse(fecha);
            } catch (ParseException ex) {
                Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    public static String obtenerNumeroFormatoMoneda(Long valor) {
        if (valor != null) {
            return decimalFormat.format(valor);
        }

        return "";
    }

    public static int obtenerEntero(String numero) {
        if (numero == null || numero.length() == 0) {
            return 0;
        }
        return Integer.parseInt(numero);
    }

    public static long obtenerEnteroLargo(String numero) {
        if (numero == null || numero.length() == 0) {
            return 0;
        }
        return Long.parseLong(numero);
    }
    
    public static boolean obtenerBooleano(String valor) {
        return Boolean.parseBoolean(valor);
    }

    public static double obtenerNumeroDoble(String numero) {
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

    public static String obtenerAdendasJSON(List<Adenda> adendas) {
        Util.establecerConsecutivoAdendas(adendas);
        Gson gson = new Gson();
        String json = gson.toJson(adendas);

        return json;
    }

    public static String obtenerTelefonosJSON(List<Telefono> telefonos) {
        Util.establecerConsecutivoTelefonos(telefonos);
        Gson gson = new Gson();
        String json = gson.toJson(telefonos);

        return json;
    }

    public static String obtenerCuentasBancariasJSON(List<CuentaBancaria> cuentasBancarias) {
        Util.establecerConsecutivoCuentasBancarias(cuentasBancarias);
        Gson gson = new Gson();
        String json = gson.toJson(cuentasBancarias);

        return json;
    }

    public static String obtenerCorreosElectronicosJSON(List<CorreoElectronico> correosElectronicos) {
        Util.establecerConsecutivoCorreosElectronicos(correosElectronicos);
        Gson gson = new Gson();
        String json = gson.toJson(correosElectronicos);

        return json;
    }

    public static String obtenerDocumentosSoporteJSON(List<DocumentoSoporte> documentosSoporte) {
        Util.establecerConsecutivoDocumentosSoporte(documentosSoporte);
        Gson gson = new Gson();
        String json = gson.toJson(documentosSoporte);

        return json;
    }

    public static String obtenerIdiomasJSON(List<Idioma> idiomas) {
        Util.establecerConsecutivoIdiomas(idiomas);
        Gson gson = new Gson();
        String json = gson.toJson(idiomas);

        return json;
    }

    public static String obtenerIdiomasConvocatoriaJSON(List<IdiomaConvocatoria> idiomas) {
        Util.establecerConsecutivoIdiomasConvocatoria(idiomas);
        Gson gson = new Gson();
        String json = gson.toJson(idiomas);

        return json;
    }

    public static String obtenerEducacionesBasicasJSON(List<EducacionBasica> educacionesBasicas) {
        Util.establecerConsecutivoEducacionesBasicas(educacionesBasicas);
        Gson gson = new Gson();
        String json = gson.toJson(educacionesBasicas);

        return json;
    }

    public static String obtenerEducacionesSuperioresJSON(List<EducacionSuperior> educacionesSuperiores) {
        Util.establecerConsecutivoEducacionesSuperiores(educacionesSuperiores);
        Gson gson = new Gson();
        String json = gson.toJson(educacionesSuperiores);

        return json;
    }

    public static String obtenerEducacionesContinuasJSON(List<EducacionContinua> educacionesContinuas) {
        Util.establecerConsecutivoEducacionesContinuas(educacionesContinuas);
        Gson gson = new Gson();
        String json = gson.toJson(educacionesContinuas);

        return json;
    }

    public static String obtenerDistincionesJSON(List<Distincion> distinciones) {
        Util.establecerConsecutivoDistinciones(distinciones);
        Gson gson = new Gson();
        String json = gson.toJson(distinciones);

        return json;
    }

    public static String obtenerExperienciasLaboralesJSON(List<ExperienciaLaboral> experienciasLaborales) {
        Util.establecerConsecutivoExperienciasLaborales(experienciasLaborales);
        Gson gson = new Gson();
        String json = gson.toJson(experienciasLaborales);

        return json;
    }

    public static String obtenerExperienciasDocenciaJSON(List<ExperienciaDocencia> experienciasDocencia) {
        Util.establecerConsecutivoExperienciasDocencia(experienciasDocencia);
        Gson gson = new Gson();
        String json = gson.toJson(experienciasDocencia);

        return json;
    }

    public static String obtenerArticulosJSON(List<Articulo> articulos) {
        Util.establecerConsecutivoArticulos(articulos);
        Gson gson = new Gson();
        String json = gson.toJson(articulos);

        return json;
    }

    public static String obtenerPatentesJSON(List<Patente> patentes) {
        Util.establecerConsecutivoPatentes(patentes);
        Gson gson = new Gson();
        String json = gson.toJson(patentes);

        return json;
    }

    public static String obtenerProductosConocimientoJSON(List<ProductoConocimiento> productosConocimiento) {
        Util.establecerConsecutivoProductosConocimiento(productosConocimiento);
        Gson gson = new Gson();
        String json = gson.toJson(productosConocimiento);

        return json;
    }

    public static String obtenerAnyosExperienciaJSON(List<AnyosExperiencia> anyosExperiencias) {
        Util.establecerConsecutivoAnyosExperiencias(anyosExperiencias);
        Gson gson = new Gson();
        String json = gson.toJson(anyosExperiencias);

        return json;
    }

    public static String obtenerProgramasConvocatoriaJSON(List<ProgramaConvocatoria> programas) {
        Util.establecerConsecutivoProgramasConvocatoria(programas);
        Gson gson = new Gson();
        String json = gson.toJson(programas);

        return json;
    }

    public static String obtenerEducacionesContinuasConvocatoriaJSON(List<EducacionContinuaConvocatoria> educacionesContinuas) {
        Util.establecerConsecutivoEducacionesContinuasConvocatoria(educacionesContinuas);
        Gson gson = new Gson();
        String json = gson.toJson(educacionesContinuas);

        return json;
    }

    public static String obtenerCriteriosHabilitantesJSON(List<CriterioHabilitanteConvocatoria> criteriosHabilitantes) {
        Util.establecerConsecutivoCriteriosHabilitantesConvocatoria(criteriosHabilitantes);
        Gson gson = new Gson();
        String json = gson.toJson(criteriosHabilitantes);

        return json;
    }

    public static void establecerConsecutivoDocumentosSoporte(List<DocumentoSoporte> documentosSoporte) {
        for (int i = 0; i < documentosSoporte.size(); i++) {
            DocumentoSoporte documentoSoporte = documentosSoporte.get(i);
            documentoSoporte.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoEducacionesBasicas(List<EducacionBasica> educacionesBasicas) {
        for (int i = 0; i < educacionesBasicas.size(); i++) {
            EducacionBasica educacionBasica = educacionesBasicas.get(i);
            educacionBasica.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoEducacionesSuperiores(List<EducacionSuperior> educacionesSuperiores) {
        for (int i = 0; i < educacionesSuperiores.size(); i++) {
            EducacionSuperior educacionSuperior = educacionesSuperiores.get(i);
            educacionSuperior.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoCorreosElectronicos(List<CorreoElectronico> correosElectronicos) {
        for (int i = 0; i < correosElectronicos.size(); i++) {
            CorreoElectronico correoElectronico = correosElectronicos.get(i);
            correoElectronico.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoCuentasBancarias(List<CuentaBancaria> cuentasBancarias) {
        for (int i = 0; i < cuentasBancarias.size(); i++) {
            CuentaBancaria cuentaBancaria = cuentasBancarias.get(i);
            cuentaBancaria.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoIdiomas(List<Idioma> idiomas) {
        for (int i = 0; i < idiomas.size(); i++) {
            Idioma idioma = idiomas.get(i);
            idioma.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoEducacionesContinuas(List<EducacionContinua> educacionesContinuas) {
        for (int i = 0; i < educacionesContinuas.size(); i++) {
            EducacionContinua educacionContinua = educacionesContinuas.get(i);
            educacionContinua.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoPatentes(List<Patente> patentes) {
        for (int i = 0; i < patentes.size(); i++) {
            Patente patente = patentes.get(i);
            patente.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoExperienciasLaborales(List<ExperienciaLaboral> experienciasLaborales) {
        for (int i = 0; i < experienciasLaborales.size(); i++) {
            ExperienciaLaboral experienciaLaboral = experienciasLaborales.get(i);
            experienciaLaboral.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoExperienciasDocencia(List<ExperienciaDocencia> experienciasDocencia) {
        for (int i = 0; i < experienciasDocencia.size(); i++) {
            ExperienciaDocencia experienciaDocencia = experienciasDocencia.get(i);
            experienciaDocencia.setConsecutivo(i);
            for (int j = 0; j < experienciaDocencia.getCursosExperienciaDocencia().size(); j++) {
                CursoExperienciaDocencia cursoExperienciaDocencia = experienciaDocencia.getCursosExperienciaDocencia().get(j);
                cursoExperienciaDocencia.setConsecutivo(j);
            }

        }
    }

    public static void establecerConsecutivoDistinciones(List<Distincion> distinciones) {
        for (int i = 0; i < distinciones.size(); i++) {
            Distincion distincion = distinciones.get(i);
            distincion.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoArticulos(List<Articulo> articulos) {
        for (int i = 0; i < articulos.size(); i++) {
            Articulo articulo = articulos.get(i);
            articulo.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoTelefonos(List<Telefono> telefonos) {
        for (int i = 0; i < telefonos.size(); i++) {
            Telefono telefono = telefonos.get(i);
            telefono.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoProductosConocimiento(List<ProductoConocimiento> productoConocimientos) {
        for (int i = 0; i < productoConocimientos.size(); i++) {
            ProductoConocimiento productoConocimiento = productoConocimientos.get(i);
            productoConocimiento.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoAdendas(List<Adenda> adendas) {
        for (int i = 0; i < adendas.size(); i++) {
            Adenda adenda = adendas.get(i);
            adenda.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoAnyosExperiencias(List<AnyosExperiencia> anyosExperiencias) {
        for (int i = 0; i < anyosExperiencias.size(); i++) {
            AnyosExperiencia anyosExperiencia = anyosExperiencias.get(i);
            anyosExperiencia.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoIdiomasConvocatoria(List<IdiomaConvocatoria> idiomasConvocatoria) {
        for (int i = 0; i < idiomasConvocatoria.size(); i++) {
            IdiomaConvocatoria idiomaConvocatoria = idiomasConvocatoria.get(i);
            idiomaConvocatoria.setConsecutivo(i);
        }
    }
    
    public static void establecerConsecutivoProgramasConvocatoria(List<ProgramaConvocatoria> programasConvocatoria) {
        for (int i = 0; i < programasConvocatoria.size(); i++) {
            ProgramaConvocatoria programaConvocatoria = programasConvocatoria.get(i);
            programaConvocatoria.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoEducacionesContinuasConvocatoria(List<EducacionContinuaConvocatoria> educacionesContinuasConvocatoria) {
        for (int i = 0; i < educacionesContinuasConvocatoria.size(); i++) {
            EducacionContinuaConvocatoria educacionContinuaConvocatoria = educacionesContinuasConvocatoria.get(i);
            educacionContinuaConvocatoria.setConsecutivo(i);
        }
    }

    public static void establecerConsecutivoCriteriosHabilitantesConvocatoria(List<CriterioHabilitanteConvocatoria> criteriosHabilitantesConvocatoria) {
        for (int i = 0; i < criteriosHabilitantesConvocatoria.size(); i++) {
            CriterioHabilitanteConvocatoria criterioHabilitanteConvocatoria = criteriosHabilitantesConvocatoria.get(i);
            criterioHabilitanteConvocatoria.setConsecutivo(i);
        }
    }
}
