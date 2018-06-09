/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.CampoHojaVida;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.Evaluacion;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.Preseleccionado;
import co.edu.fnsp.buho.entidades.Programa;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.excepciones.CriteriosHabilitacionException;
import co.edu.fnsp.buho.servicios.IServicioConvocatoria;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import co.edu.fnsp.buho.excel.EvaluacionExcelReportView;
import co.edu.fnsp.buho.excel.PostuladosExcelReportView;
import co.edu.fnsp.buho.excel.PreseleccionadosExcelReportView;
import co.edu.fnsp.buho.utilidades.Util;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/convocatorias")
public class ConvocatoriaController {

    private static final Logger logger = LogManager.getLogger(ConvocatoriaController.class.getName());

    @Autowired
    private IServicioConvocatoria servicioConvocatoria;

    @Autowired
    private IServicioMaestro servicioMaestro;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        List<ListadoConvocatoria> convocatoriasVigentes = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdPersona());
        model.addAttribute("convocatoriasVigentes", convocatoriasVigentes);

        List<ListadoConvocatoria> convocatoriasCerradas = servicioConvocatoria.obtenerConvocatoriasCerradas();
        model.addAttribute("convocatoriasCerradas", convocatoriasCerradas);

        if (esAdministrador()) {

            return "convocatorias/index";
        } else {

            model.addAttribute("autenticado", esAutenticado());
            return "convocatorias/postular";
        }
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String obtenerConvocatorias(Model model) {
        List<ListadoConvocatoria> convocatoriasVigentes = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdPersona());
        model.addAttribute("convocatoriasVigentes", convocatoriasVigentes);

        List<ListadoConvocatoria> convocatoriasCerradas = servicioConvocatoria.obtenerConvocatoriasCerradas();
        model.addAttribute("convocatoriasCerradas", convocatoriasCerradas);

        if (esAdministrador()) {

            return "convocatorias/index";
        } else {
            model.addAttribute("autenticado", esAutenticado());

            return "convocatorias/postular";
        }
    }

    @RequestMapping(value = "/postular", method = RequestMethod.GET)
    public String postular(Model model) {
        List<ListadoConvocatoria> convocatoriasVigentes = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdPersona());
        model.addAttribute("convocatoriasVigentes", convocatoriasVigentes);

        List<ListadoConvocatoria> convocatoriasCerradas = servicioConvocatoria.obtenerConvocatoriasCerradas();
        model.addAttribute("convocatoriasCerradas", convocatoriasCerradas);

        model.addAttribute("autenticado", esAutenticado());

        return "convocatorias/postular";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {

        List<Maestro> tiposConvocatoria = servicioMaestro.obtenerTiposConvocatoria();
        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        List<Maestro> sedes = servicioMaestro.obtenerSedes();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesFormacion = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnicos = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        List<CampoHojaVida> camposHojaVida = servicioMaestro.obtenerCamposHojaVida();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnicos", gruposEtnicos);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposConvocatoria", tiposConvocatoria);
        model.addAttribute("nucleosBasicosConocimiento", nucleosBasicosConocimiento);
        model.addAttribute("tiposAdenda", tiposAdenda);
        model.addAttribute("sedes", sedes);
        model.addAttribute("idiomas", idiomas);
        model.addAttribute("tiposCertificacion", tiposCertificacion);
        model.addAttribute("nivelesFormacion", nivelesFormacion);
        model.addAttribute("tiposCapacitacion", tiposCapacitacion);
        model.addAttribute("camposHojaVida", camposHojaVida);
        model.addAttribute("convocatoria", new Convocatoria());

        return "convocatorias/crear";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearConvocatoria(@ModelAttribute co.edu.fnsp.buho.entidadesVista.Convocatoria convocatoria, Model model) throws ParseException, IOException {
        try {
            Convocatoria convocatoriaIngresar = new Convocatoria();
            convocatoriaIngresar.setId(convocatoria.getId());
            convocatoriaIngresar.setAnyosMinimosExperiencia(convocatoria.getAnyosMinimosExperiencia());
            convocatoriaIngresar.setDescripcion(convocatoria.getDescripcion());
            convocatoriaIngresar.setFechaFin(convocatoria.getFechaFin());
            convocatoriaIngresar.setFechaInicio(convocatoria.getFechaInicio());
            convocatoriaIngresar.setNombre(convocatoria.getNombre());
            convocatoriaIngresar.setFechaPublicacionResultados(convocatoria.getFechaPublicacionResultados());
            convocatoriaIngresar.setTipoConvocatoria(convocatoria.getTipoConvocatoria());
            convocatoriaIngresar.setIdProgramaCurso(convocatoria.getIdProgramaCurso());
            convocatoriaIngresar.setNombreCurso(convocatoria.getNombreCurso());
            convocatoriaIngresar.setTotalHorasSemestreCurso(convocatoria.getTotalHorasSemestreCurso());
            Documento documento = null;
            if (convocatoria.getDocumento() != null && convocatoria.getDocumento().getBytes().length > 0) {
                documento = new Documento();
                documento.setContenido(convocatoria.getDocumento().getBytes());
                documento.setNombre(convocatoria.getDocumento().getOriginalFilename());
                documento.setTipoContenido(convocatoria.getDocumento().getContentType());
                convocatoriaIngresar.setDocumento(documento);
            }
            Documento resultado = null;
            if (convocatoria.getResultado() != null && convocatoria.getResultado().getBytes().length > 0) {
                resultado = new Documento();
                resultado.setContenido(convocatoria.getResultado().getBytes());
                resultado.setNombre(convocatoria.getResultado().getOriginalFilename());
                resultado.setTipoContenido(convocatoria.getResultado().getContentType());
                convocatoriaIngresar.setResultado(resultado);
            }
            long idPersona = obtenerIdPersona();
            int id = convocatoriaIngresar.getId();
            if (convocatoriaIngresar.getId() == 0) {
                id = servicioConvocatoria.ingresarConvocatoria(idPersona, convocatoriaIngresar);
            } else {
                servicioConvocatoria.actualizarConvocatoria(convocatoriaIngresar);
            }

            return "{\"id\":" + id + "}";
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = {"/adenda"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdenda(@ModelAttribute(value = "adenda") co.edu.fnsp.buho.entidadesVista.Adenda adenda, Model model) throws Exception {
        String json = "";
        try {
            Adenda nuevaAdenda = new Adenda();
            nuevaAdenda.setId(adenda.getId());
            nuevaAdenda.setDescripcion(adenda.getDescripcion());
            nuevaAdenda.setFecha(Util.obtenerFecha(adenda.getFecha()));
            nuevaAdenda.setTipoAdenda(Util.obtenerEntero(adenda.getTipoAdenda()));
            nuevaAdenda.setDescripcion(adenda.getDescripcion());
            if (adenda.getDocumento() != null) {
                MultipartFile multipartFile = (MultipartFile) adenda.getDocumento();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaAdenda.setDocumento(documento);
                }
            }

            servicioConvocatoria.guardarAdenda(adenda.getIdConvocatoria(), obtenerIdPersona(), nuevaAdenda);
            List<Adenda> adendas = servicioConvocatoria.obtenerAdendas(adenda.getIdConvocatoria());
            Util.establecerConsecutivoAdendas(adendas);
            Gson gson = new Gson();
            json = gson.toJson(adendas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarAdenda/{idConvocatoria}/{idAdenda}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdenda(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idAdenda") int idAdenda, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarAdenda(idAdenda);
            List<Adenda> adendas = servicioConvocatoria.obtenerAdendas(idConvocatoria);
            Util.establecerConsecutivoAdendas(adendas);
            Gson gson = new Gson();
            json = gson.toJson(adendas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/anyosExperiencia"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAnyosExperiencia(@ModelAttribute(value = "anyosExperiencia") AnyosExperiencia anyosExperiencia, Model model) throws Exception {
        String json = "";
        try {
            servicioConvocatoria.guardarAnyosExperiencia(anyosExperiencia.getIdConvocatoria(), anyosExperiencia);
            List<AnyosExperiencia> anyosExperiencias = servicioConvocatoria.obtenerAnyosExperiencias(anyosExperiencia.getIdConvocatoria());
            Util.establecerConsecutivoAnyosExperiencias(anyosExperiencias);
            Gson gson = new Gson();
            json = gson.toJson(anyosExperiencias);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarAnyosExperiencia/{idConvocatoria}/{idAnyosExperiencia}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAnyosExperiencia(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idAnyosExperiencia") int idAnyosExperiencia, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarAnyosExperiencia(idAnyosExperiencia);
            List<AnyosExperiencia> anyosExperiencias = servicioConvocatoria.obtenerAnyosExperiencias(idConvocatoria);
            Util.establecerConsecutivoAnyosExperiencias(anyosExperiencias);
            Gson gson = new Gson();
            json = gson.toJson(anyosExperiencias);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
    
    @RequestMapping(value = {"/idioma"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarIdioma(@ModelAttribute(value = "idioma") IdiomaConvocatoria idioma, Model model) throws Exception {
        String json = "";
        try {
            servicioConvocatoria.guardarIdioma(idioma.getIdConvocatoria(), obtenerIdPersona(), idioma);
            List<IdiomaConvocatoria> idiomas = servicioConvocatoria.obtenerIdiomas(idioma.getIdConvocatoria());
            Util.establecerConsecutivoIdiomasConvocatoria(idiomas);
            Gson gson = new Gson();
            json = gson.toJson(idiomas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarIdioma/{idConvocatoria}/{idIdioma}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarIdioma(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idIdioma") int idIdioma, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarIdioma(idIdioma);
            List<IdiomaConvocatoria> idiomas = servicioConvocatoria.obtenerIdiomas(idConvocatoria);
            Util.establecerConsecutivoIdiomasConvocatoria(idiomas);
            Gson gson = new Gson();
            json = gson.toJson(idiomas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }    
    
    @RequestMapping(value = {"/programa"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarPrograma(@ModelAttribute(value = "programa") ProgramaConvocatoria programa, Model model) throws Exception {
        String json = "";
        try {
            servicioConvocatoria.guardarPrograma(programa.getIdConvocatoria(), obtenerIdPersona(), programa);
            List<ProgramaConvocatoria> programas = servicioConvocatoria.obtenerProgramas(programa.getIdConvocatoria());
            Util.establecerConsecutivoProgramasConvocatoria(programas);
            Gson gson = new Gson();
            json = gson.toJson(programas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarPrograma/{idConvocatoria}/{idPrograma}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarPrograma(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idPrograma") int idPrograma, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarPrograma(idPrograma);
            List<ProgramaConvocatoria> programas = servicioConvocatoria.obtenerProgramas(idConvocatoria);
            Util.establecerConsecutivoProgramasConvocatoria(programas);
            Gson gson = new Gson();
            json = gson.toJson(programas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }    

    @RequestMapping(value = {"/educacionContinua"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarEducacionContinua(@ModelAttribute(value = "educacionContinua") EducacionContinuaConvocatoria educacionContinua, Model model) throws Exception {
        String json = "";
        try {
            servicioConvocatoria.guardarEducacionContinua(educacionContinua.getIdConvocatoria(), obtenerIdPersona(), educacionContinua);
            List<EducacionContinuaConvocatoria> educacionesContinuas = servicioConvocatoria.obtenerEducacionesContinuas(educacionContinua.getIdConvocatoria());
            Util.establecerConsecutivoEducacionesContinuasConvocatoria(educacionesContinuas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesContinuas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarEducacionContinua/{idConvocatoria}/{idEducacionContinua}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarEducacionContinua(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idEducacionContinua") int idEducacionContinua, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarEducacionContinua(idEducacionContinua);
            List<EducacionContinuaConvocatoria> educacionesContinuas = servicioConvocatoria.obtenerEducacionesContinuas(idConvocatoria);
            Util.establecerConsecutivoEducacionesContinuasConvocatoria(educacionesContinuas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesContinuas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }    
    
    @RequestMapping(value = {"/criterioHabilitante"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCriterioHabilitante(@ModelAttribute(value = "criterioHabilitante") CriterioHabilitanteConvocatoria criterioHabilitante, Model model) throws Exception {
        String json = "";
        try {
            servicioConvocatoria.guardarCriterioHabilitante(criterioHabilitante.getIdConvocatoria(), obtenerIdPersona(), criterioHabilitante);
            List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = servicioConvocatoria.obtenerCriteriosHabilitantes(criterioHabilitante.getIdConvocatoria());
            Util.establecerConsecutivoCriteriosHabilitantesConvocatoria(criteriosHabilitantes);
            Gson gson = new Gson();
            json = gson.toJson(criteriosHabilitantes);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarCriterioHabilitante/{idConvocatoria}/{idCriterioHabilitante}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCriterioHabilitante(@PathVariable("idConvocatoria") int idConvocatoria, @PathVariable("idCriterioHabilitante") int idCriterioHabilitante, Model model) {
        String json = "";
        try {
            servicioConvocatoria.eliminarCriterioHabilitante(idCriterioHabilitante);
            List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = servicioConvocatoria.obtenerCriteriosHabilitantes(idConvocatoria);
            Util.establecerConsecutivoCriteriosHabilitantesConvocatoria(criteriosHabilitantes);
            Gson gson = new Gson();
            json = gson.toJson(criteriosHabilitantes);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }    

    @RequestMapping(value = "/editar/{idConvocatoria}", method = RequestMethod.GET)
    public String mostrarEdicionConvocatoria(@PathVariable int idConvocatoria, Model model) {
        Convocatoria convocatoria = servicioConvocatoria.obtenerConvocatoria(idConvocatoria);

        List<Maestro> tiposConvocatoria = servicioMaestro.obtenerTiposConvocatoria();
        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        List<Maestro> sedes = servicioMaestro.obtenerSedes();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesFormacion = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<CampoHojaVida> camposHojaVida = servicioMaestro.obtenerCamposHojaVida();
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnicos = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();

        model.addAttribute("tiposConvocatoria", tiposConvocatoria);
        model.addAttribute("nucleosBasicosConocimiento", nucleosBasicosConocimiento);
        model.addAttribute("tiposAdenda", tiposAdenda);
        model.addAttribute("sedes", sedes);
        model.addAttribute("idiomas", idiomas);
        model.addAttribute("tiposCertificacion", tiposCertificacion);
        model.addAttribute("convocatoria", convocatoria);
        model.addAttribute("nivelesFormacion", nivelesFormacion);
        model.addAttribute("tiposCapacitacion", tiposCapacitacion);
        model.addAttribute("camposHojaVida", camposHojaVida);
        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnicos", gruposEtnicos);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);

        if (convocatoria.getAdendas().size() > 0) {
            model.addAttribute("adendasJSON", Util.obtenerAdendasJSON(convocatoria.getAdendas()));
        }
        if (convocatoria.getAnyosExperiencias().size() > 0) {
            model.addAttribute("anyosExperienciasJSON", Util.obtenerAnyosExperienciaJSON(convocatoria.getAnyosExperiencias()));
        }
        if (convocatoria.getIdiomas().size() > 0) {
            model.addAttribute("idiomasJSON", Util.obtenerIdiomasConvocatoriaJSON(convocatoria.getIdiomas()));
        }
        if (convocatoria.getProgramas().size() > 0) {
            model.addAttribute("programasJSON", Util.obtenerProgramasConvocatoriaJSON(convocatoria.getProgramas()));
        }
        if (convocatoria.getEducacionesContinuas().size() > 0) {
            model.addAttribute("educacionesContinuasJSON", Util.obtenerEducacionesContinuasConvocatoriaJSON(convocatoria.getEducacionesContinuas()));
        }
        if (convocatoria.getCriteriosHabilitantes().size() > 0) {
            model.addAttribute("criteriosHabilitantesJSON", Util.obtenerCriteriosHabilitantesJSON(convocatoria.getCriteriosHabilitantes()));
        }

        return "convocatorias/crear";
    }

    @RequestMapping(value = "/ver/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerConvocatoria(@PathVariable int idConvocatoria, Model model) {
        Convocatoria convocatoria = servicioConvocatoria.obtenerConvocatoria(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(convocatoria);
    }

    @RequestMapping(value = "/eliminar/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarConvocatoria(@PathVariable int idConvocatoria, Model model) {
        try {
            servicioConvocatoria.eliminarConvocatoria(idConvocatoria);
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false}";
        }

        return "{\"resultado\":true}";
    }

    @RequestMapping(value = "/postular/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String postularConvocatoria(@PathVariable int idConvocatoria, Model model) {
        try {
            servicioConvocatoria.postularConvocatoria(obtenerIdPersona(), idConvocatoria);
        } catch (CriteriosHabilitacionException exc) {
            logger.error(exc);
            return "{\"resultado\":false, \"mensaje\":\"" + exc.getMessage() + "\"}";
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false, \"mensaje\":''}";
        }

        return "{\"resultado\":true}";
    }

    @RequestMapping(value = "/retirarPostulacion/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String retirarConvocatoria(@PathVariable int idConvocatoria, Model model) {
        try {
            servicioConvocatoria.retirarPostulacion(obtenerIdPersona(), idConvocatoria);
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false}";
        }

        return "{\"resultado\":true}";
    }

    @RequestMapping(value = "/documento/{idConvocatoria}", method = RequestMethod.GET)
    public void obtenerDocumentoConvocatoria(@PathVariable("idConvocatoria") int idConvocatoria, HttpServletResponse response) throws IOException {
        Documento documento = servicioConvocatoria.obtenerDocumentoConvocatoria(idConvocatoria);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/resultado/{idConvocatoria}", method = RequestMethod.GET)
    public void obtenerResultadoConvocatoria(@PathVariable("idConvocatoria") int idConvocatoria, HttpServletResponse response) throws IOException {
        Documento documento = servicioConvocatoria.obtenerResultadoConvocatoria(idConvocatoria);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/adenda/documento/{idAdenda}", method = RequestMethod.GET)
    public void obtenerDocumentoAdendaConvocatoria(@PathVariable("idAdenda") int idAdenda, HttpServletResponse response) throws IOException {
        Documento documento = servicioConvocatoria.obtenerDocumentoAdenda(idAdenda);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/programasSede/{idSede}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerProgramas(@ModelAttribute(value = "idSede") int idSede, Model model) {
        List<Maestro> programas = servicioMaestro.obtenerProgramas(idSede);
        Gson gson = new Gson();

        return gson.toJson(programas);
    }

    @RequestMapping(value = "/programas", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerProgramasInstitucion(@ModelAttribute(value = "nucleoBasicoConocimiento") int nucleoBasicoConocimiento,
            Model model) {

        List<Programa> programas = servicioMaestro.obtenerProgramasNucleoBasicoConocimiento(nucleoBasicoConocimiento);
        Gson gson = new Gson();

        return gson.toJson(programas);
    }

    @RequestMapping(value = "/capacitaciones", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerCapacitaciones(@ModelAttribute(value = "tipoCapacitacion") String tipoCapacitacion,
            @ModelAttribute(value = "nucleoBasicoConocimiento") String nucleoBasicoConocimiento,
            Model model) {

        Integer idTipoCapacitacion = null;
        Integer idNucleoBasicoConocimiento = null;
        if (tipoCapacitacion != null && tipoCapacitacion.length() > 0) {
            idTipoCapacitacion = Util.obtenerEntero(tipoCapacitacion);
        }
        if (nucleoBasicoConocimiento != null && nucleoBasicoConocimiento.length() > 0) {
            idNucleoBasicoConocimiento = Util.obtenerEntero(nucleoBasicoConocimiento);
        }
        List<Maestro> capacitaciones = servicioMaestro.obtenerCapacitaciones(idTipoCapacitacion, idNucleoBasicoConocimiento);
        Gson gson = new Gson();

        return gson.toJson(capacitaciones);
    }

    @RequestMapping(value = "/postulados", method = RequestMethod.GET)
    public String verPostulados(Model model) {

        List<ListadoConvocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriaValidar();
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/postulados";
    }

    @RequestMapping(value = "/preseleccionados", method = RequestMethod.GET)
    public String verPreseleccionados(Model model) {

        List<ListadoConvocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriaValidar();
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/preseleccionados";
    }

    @RequestMapping(value = "/evaluar", method = RequestMethod.GET)
    public String evaluarPreseleccionados(Model model) {

        List<ListadoConvocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriaValidar();
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/evaluar";
    }

    @RequestMapping(value = "/postulados/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerPostuladosConvocatoria(@ModelAttribute(value = "idConvocatoria") int idConvocatoria, Model model) {
        List<HojaVida> hojasVida = servicioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(hojasVida);
    }

    @RequestMapping(value = "/preseleccionados/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerPreseleccionados(@ModelAttribute(value = "idConvocatoria") int idConvocatoria, Model model) {
        List<Preseleccionado> preseleccionados = servicioConvocatoria.obtenerPreseleccionados(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(preseleccionados);
    }

    @RequestMapping(value = "/evaluaciones/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerEvaluaciones(@ModelAttribute(value = "idConvocatoria") int idConvocatoria, Model model) {
        List<Evaluacion> evaluaciones = servicioConvocatoria.obtenerEvaluaciones(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(evaluaciones);
    }

    @RequestMapping(value = "/descargarPostulados/{idConvocatoria}", method = RequestMethod.GET)
    public ModelAndView descargarPostulados(@PathVariable("idConvocatoria") int idConvocatoria, HttpServletResponse response) throws IOException {
        List<HojaVida> hojasVida = servicioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
        return new ModelAndView(new PostuladosExcelReportView(), "postulados", hojasVida);
    }

    @RequestMapping(value = "/descargarPreseleccionados/{idConvocatoria}", method = RequestMethod.GET)
    public ModelAndView descargarPreseleccionados(@PathVariable("idConvocatoria") int idConvocatoria, HttpServletResponse response) throws IOException {
        List<Preseleccionado> preseleccionados = servicioConvocatoria.obtenerPreseleccionados(idConvocatoria);
        return new ModelAndView(new PreseleccionadosExcelReportView(), "preseleccionados", preseleccionados);
    }

    @RequestMapping(value = "/descargarEvaluaciones/{idConvocatoria}", method = RequestMethod.GET)
    public ModelAndView descargarEvaluaciones(@PathVariable("idConvocatoria") int idConvocatoria, HttpServletResponse response) throws IOException {
        List<Evaluacion> evaluaciones = servicioConvocatoria.obtenerEvaluaciones(idConvocatoria);
        return new ModelAndView(new EvaluacionExcelReportView(), "evaluaciones", evaluaciones);
    }

    private boolean esAdministrador() {
        boolean administrador = false;
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            DetalleUsuario detalleUsuario = (DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            for (GrantedAuthority authority : detalleUsuario.getAuthorities()) {
                if (authority.getAuthority().equalsIgnoreCase("ADMINISTRADOR")
                        || authority.getAuthority().equalsIgnoreCase("SUPER_ADMINISTRADOR")) {
                    administrador = true;
                    break;
                }
            }
        }

        return administrador;
    }

    private boolean esAutenticado() {
        boolean autenticado = false;
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            autenticado = true;
        }

        return autenticado;
    }

    private long obtenerIdPersona() {
        long idPersona = 0;
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
        }

        return idPersona;
    }
}
