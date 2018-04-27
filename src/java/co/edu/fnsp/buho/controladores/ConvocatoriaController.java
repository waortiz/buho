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
import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.servicios.IServicioConvocatoria;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import co.edu.fnsp.buho.utilidades.Util;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias(((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario());
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/index";
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String obtenerConvocatorias(Model model) {
        List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias(((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario());
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/index";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {

        List<Maestro> tiposConvocatoria = servicioMaestro.obtenerTiposConvocatoria();
        model.addAttribute("tiposConvocatoria", tiposConvocatoria);

        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        model.addAttribute("nucleosBasicosConocimiento", nucleosBasicosConocimiento);

        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        model.addAttribute("tiposAdenda", tiposAdenda);

        List<Maestro> sedes = servicioMaestro.obtenerSedes();
        model.addAttribute("sedes", sedes);

        model.addAttribute("convocatoria", new Convocatoria());

        return "convocatorias/crear";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearConvocatoria(@ModelAttribute co.edu.fnsp.buho.entidadesVista.Convocatoria convocatoria, Model model) throws ParseException, IOException {
        try {
            Convocatoria convocatoriaIngresar = new Convocatoria();
            convocatoriaIngresar.setId(convocatoria.getId());
            convocatoriaIngresar.setNucleoBasicoConocimiento(convocatoria.getNucleoBasicoConocimiento());
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
            for (co.edu.fnsp.buho.entidadesVista.Adenda adenda : convocatoria.getAdendas()) {
                Adenda nuevaAdenda = new Adenda();
                nuevaAdenda.setId(adenda.getId());
                nuevaAdenda.setDescripcion(adenda.getDescripcion());
                nuevaAdenda.setFecha(Util.obtenerFecha(adenda.getFecha()));
                nuevaAdenda.setTipoAdenda(Util.obtenerEntero(adenda.getTipoAdenda()));
                nuevaAdenda.setDescripcion(adenda.getDescripcion());
                if (adenda.getDocumento() != null && adenda.getDocumento().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(adenda.getDocumento().getBytes());
                    documento.setNombre(adenda.getDocumento().getOriginalFilename());
                    documento.setTipoContenido(adenda.getDocumento().getContentType());
                    nuevaAdenda.setDocumento(documento);
                }
                convocatoriaIngresar.getAdendas().add(nuevaAdenda);
            }
            convocatoriaIngresar.setAnyosExperiencias(convocatoria.getAnyosExperiencias());
            convocatoriaIngresar.setIdiomas(convocatoria.getIdiomas());
            long idUsuario = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario();
            if (convocatoriaIngresar.getId() == 0) {
                servicioConvocatoria.ingresarConvocatoria(idUsuario, convocatoriaIngresar);
            } else {
                servicioConvocatoria.actualizarConvocatoria(idUsuario, convocatoriaIngresar);
            }

            return "";
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = "/editar/{idConvocatoria}", method = RequestMethod.GET)
    public String mostrarEdicionConvocatoria(@PathVariable int idConvocatoria, Model model) {

        Convocatoria convocatoria = servicioConvocatoria.obtenerConvocatoria(idConvocatoria);

        List<Maestro> tiposConvocatoria = servicioMaestro.obtenerTiposConvocatoria();
        model.addAttribute("tiposConvocatoria", tiposConvocatoria);

        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        model.addAttribute("nucleosBasicosConocimiento", nucleosBasicosConocimiento);

        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        model.addAttribute("tiposAdenda", tiposAdenda);

        List<Maestro> sedes = servicioMaestro.obtenerSedes();
        model.addAttribute("sedes", sedes);

        model.addAttribute("convocatoria", convocatoria);
        if (convocatoria.getAdendas().size() > 0) {
            model.addAttribute("adendasJSON", Util.obtenerAdendasJSON(convocatoria.getAdendas()));
        }
        if (convocatoria.getAnyosExperiencias().size() > 0) {
            model.addAttribute("anyosExperienciasJSON", Util.obtenerAnyosExperienciaJSON(convocatoria.getAnyosExperiencias()));
        }

        return "convocatorias/crear";
    }

    @RequestMapping(value = "/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerConvocatoria(@PathVariable int idConvocatoria, Model model) {
        Convocatoria ofertaEmpleo = servicioConvocatoria.obtenerConvocatoria(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(ofertaEmpleo);
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
            servicioConvocatoria.postularConvocatoria(((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario(),
                    idConvocatoria);
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false}";
        }

        return "{\"resultado\":true}";
    }

    @RequestMapping(value = "/retirarPostulacion/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String retirarConvocatoria(@PathVariable int idConvocatoria, Model model) {
        try {
            servicioConvocatoria.retirarPostulacion(((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario(),
                    idConvocatoria);
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
    String obtenerSedes(@ModelAttribute(value = "idSede") int idSede, Model model) {
        List<Maestro> sedes = servicioMaestro.obtenerProgramas(idSede);
        Gson gson = new Gson();

        return gson.toJson(sedes);
    }
}
