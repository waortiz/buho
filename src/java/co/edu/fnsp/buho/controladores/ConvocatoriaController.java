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
import co.edu.fnsp.buho.entidades.CampoHojaVida;
import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.Programa;
import co.edu.fnsp.buho.servicios.IServicioConvocatoria;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import co.edu.fnsp.buho.utilidades.Util;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
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
        if (esAdministrador()) {
            List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias(obtenerIdUsuario());
            model.addAttribute("convocatorias", convocatorias);

            return "convocatorias/index";
        } else {
            List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdUsuario());
            model.addAttribute("convocatorias", convocatorias);
            model.addAttribute("autenticado", esAutenticado());

            return "convocatorias/postular";
        }
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String obtenerConvocatorias(Model model) {
        if (esAdministrador()) {
            List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias(obtenerIdUsuario());
            model.addAttribute("convocatorias", convocatorias);

            return "convocatorias/index";
        } else {
            List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdUsuario());
            model.addAttribute("convocatorias", convocatorias);
            model.addAttribute("autenticado", esAutenticado());

            return "convocatorias/postular";
        }
    }

    @RequestMapping(value = "/postular", method = RequestMethod.GET)
    public String postular(Model model) {
        List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriasVigentes(obtenerIdUsuario());
        model.addAttribute("convocatorias", convocatorias);

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
        List<CampoHojaVida> camposHojaVida = servicioMaestro.obtenerCamposHojaVida();

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
            convocatoriaIngresar.setNucleoBasicoConocimiento(convocatoria.getNucleoBasicoConocimiento());
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
            convocatoriaIngresar.setProgramas(convocatoria.getProgramas());
            convocatoriaIngresar.setEducacionesContinuas(convocatoria.getEducacionesContinuas());
            convocatoriaIngresar.setCriteriosHabilitantes(convocatoria.getCriteriosHabilitantes());
            long idUsuario = obtenerIdUsuario();
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
        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        List<Maestro> sedes = servicioMaestro.obtenerSedes();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesFormacion = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<CampoHojaVida> camposHojaVida = servicioMaestro.obtenerCamposHojaVida();

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

    @RequestMapping(value = "/{idConvocatoria}", method = RequestMethod.GET)
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
            servicioConvocatoria.postularConvocatoria(obtenerIdUsuario(), idConvocatoria);
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
            servicioConvocatoria.retirarPostulacion(obtenerIdUsuario(), idConvocatoria);
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
    String obtenerProgramas(@ModelAttribute(value = "idSede") int idSede, Model model) {
        List<Maestro> programas = servicioMaestro.obtenerProgramas(idSede);
        Gson gson = new Gson();

        return gson.toJson(programas);
    }

    @RequestMapping(value = "/programas", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerProgramasInstitucion(@ModelAttribute(value = "nucleoBasicoConocimiento") String nucleoBasicoConocimiento,
            Model model) {

        Integer idInstitucion = null;
        Integer idNucleoBasicoConocimiento = null;
        if (nucleoBasicoConocimiento != null && nucleoBasicoConocimiento.length() > 0) {
            try {
                idNucleoBasicoConocimiento = Util.obtenerEntero(nucleoBasicoConocimiento);
            } catch (ParseException ex) {
                java.util.logging.Logger.getLogger(HojaVidaController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        List<Programa> programas = servicioMaestro.obtenerProgramasInstitucion(idInstitucion, idNucleoBasicoConocimiento);
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
            try {
                idTipoCapacitacion = Util.obtenerEntero(tipoCapacitacion);
            } catch (ParseException ex) {
                java.util.logging.Logger.getLogger(HojaVidaController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (nucleoBasicoConocimiento != null && nucleoBasicoConocimiento.length() > 0) {
            try {
                idNucleoBasicoConocimiento = Util.obtenerEntero(nucleoBasicoConocimiento);
            } catch (ParseException ex) {
                java.util.logging.Logger.getLogger(HojaVidaController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        List<Maestro> capacitaciones = servicioMaestro.obtenerCapacitaciones(idTipoCapacitacion, idNucleoBasicoConocimiento);
        Gson gson = new Gson();

        return gson.toJson(capacitaciones);
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

    private long obtenerIdUsuario() {
        long idUsuario = 0;
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            idUsuario = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario();
        }

        return idUsuario;
    }

}
