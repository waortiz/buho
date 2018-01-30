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
import co.edu.fnsp.buho.entidades.Usuario;
import co.edu.fnsp.buho.servicios.IServicioConvocatoria;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
        List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias();
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/index";
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String obtenerConvocatorias(Model model) {
        List<Convocatoria> convocatorias = servicioConvocatoria.obtenerConvocatorias();
        model.addAttribute("convocatorias", convocatorias);

        return "convocatorias/index";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {

        List<Maestro> tiposConvocatoria = servicioMaestro.obtenerTiposConvocatoria();
        model.addAttribute("tiposConvocatoria", tiposConvocatoria);

        List<Maestro> areasConvocatoria = servicioMaestro.obtenerAreas();
        model.addAttribute("areasConvocatoria", areasConvocatoria);

        List<Maestro> tiposAdenda = servicioMaestro.obtenerTiposAdenda();
        model.addAttribute("tiposAdenda", tiposAdenda);

        model.addAttribute("convocatoria", new Convocatoria());
        
        return "convocatorias/crear";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearConvocatoria(@ModelAttribute co.edu.fnsp.buho.entidadesVista.Convocatoria convocatoria, Model model) throws ParseException, IOException {
        try {
            Convocatoria convocatoriaIngresar = new Convocatoria();
            convocatoriaIngresar.setArea(convocatoria.getArea());
            convocatoriaIngresar.setDescripcion(convocatoria.getDescripcion());
            convocatoriaIngresar.setFechaFin(convocatoria.getFechaFin());
            convocatoriaIngresar.setFechaInicio(convocatoria.getFechaInicio());
            convocatoriaIngresar.setNombre(convocatoria.getNombre());
            convocatoriaIngresar.setFechaPublicacionResultados(convocatoria.getFechaPublicacionResultados());
            convocatoriaIngresar.setTipoConvocatoria(convocatoria.getTipoConvocatoria());

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
                nuevaAdenda.setDescripcion(adenda.getDescripcion());
                nuevaAdenda.setFecha(adenda.getFecha());
                nuevaAdenda.setTipoAdenda(adenda.getTipoAdenda());
                nuevaAdenda.setDescripcion(adenda.getDescripcion());
                if (adenda.getDocumento() != null && adenda.getDocumento().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(adenda.getDocumento().getBytes());
                    documento.setNombre(adenda.getDocumento().getOriginalFilename());
                    documento.setTipoContenido(adenda.getDocumento().getContentType());
                    convocatoriaIngresar.setDocumento(documento);
                }
                convocatoriaIngresar.getAdendas().add(nuevaAdenda);
            }

            servicioConvocatoria.ingresarConvocatoria(((Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario(), convocatoriaIngresar);

            return "";
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }
}
