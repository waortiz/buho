/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidadesVista.HojaVida;
import co.edu.fnsp.buho.servicios.IServicioHojaVida;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import com.google.gson.Gson;
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
@RequestMapping(value = "/hojasVida")
public class HojaVidaController {
    private static final Logger logger = LogManager.getLogger(HojaVidaController.class.getName());

    @Autowired
    private IServicioHojaVida servicioHojaVida;

    @Autowired
    private IServicioMaestro servicioMaestro;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        return "hojasVida/index";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion= servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnico = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        
        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnico", gruposEtnico);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        
        model.addAttribute("hojaVida", new HojaVida());

        return "hojasVida/crear";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearHojaVida(@ModelAttribute co.edu.fnsp.buho.entidadesVista.HojaVida hojaVida, Model model) throws ParseException, IOException {
        try {
            co.edu.fnsp.buho.entidades.HojaVida hojaVidaIngresar = new co.edu.fnsp.buho.entidades.HojaVida();
            hojaVidaIngresar.setIdPersona(hojaVida.getIdPersona());
            hojaVidaIngresar.setActividadEconomica(hojaVida.getActividadEconomica());
            hojaVidaIngresar.setApellidos(hojaVida.getApellidos());
            hojaVidaIngresar.setCiudadResidencia(hojaVida.getCiudadResidencia());
            hojaVidaIngresar.setDireccion(hojaVida.getDireccion());
            hojaVidaIngresar.setDiscapacidad(hojaVida.getDiscapacidad());
            hojaVidaIngresar.setDisponeRUT(Boolean.getBoolean(hojaVida.getDisponeRUT()));
            hojaVidaIngresar.setDisponibilidadViajar(Boolean.getBoolean(hojaVida.getDisponibilidadViajar()));
            hojaVidaIngresar.setDistritoClase(hojaVida.getDistritoClase());
            hojaVidaIngresar.setEgresadoUDEA(Boolean.getBoolean(hojaVida.getEgresadoUDEA()));
            hojaVidaIngresar.setFechaExpedicion(hojaVida.getFechaExpedicion());
            hojaVidaIngresar.setFechaNacimiento(hojaVida.getFechaNacimiento());
            Documento documento = null;
            if (hojaVida.getCopiaDocumentoIdentificacion()!= null && hojaVida.getCopiaDocumentoIdentificacion().getBytes().length > 0) {
                documento = new Documento();
                documento.setContenido(hojaVida.getCopiaDocumentoIdentificacion().getBytes());
                documento.setNombre(hojaVida.getCopiaDocumentoIdentificacion().getOriginalFilename());
                documento.setTipoContenido(hojaVida.getCopiaDocumentoIdentificacion().getContentType());
                hojaVidaIngresar.setCopiaDocumentoIdentificacion(documento);
            }
            if (hojaVida.getDocumentoRUT()!= null && hojaVida.getDocumentoRUT().getBytes().length > 0) {
                documento = new Documento();
                documento.setContenido(hojaVida.getDocumentoRUT().getBytes());
                documento.setNombre(hojaVida.getDocumentoRUT().getOriginalFilename());
                documento.setTipoContenido(hojaVida.getDocumentoRUT().getContentType());
                hojaVidaIngresar.setDocumentoRUT(documento);
            }
            hojaVidaIngresar.setTelefonos(hojaVida.getTelefonos());
            hojaVidaIngresar.setCuentasBancarias(hojaVida.getCuentasBancarias());
            hojaVidaIngresar.setCorreosElectronicos(hojaVida.getCorreosElectronicos());
            long idUsuario = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdUsuario();
            if (hojaVidaIngresar.getIdPersona() == 0) {
                servicioHojaVida.ingresarHojaVida(idUsuario, hojaVidaIngresar);
            } else {
                servicioHojaVida.actualizarHojaVida(idUsuario, hojaVidaIngresar);
            }

            return "";
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }
    
    @RequestMapping(value = "/departamentosPais/{idPais}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerDepartamentos(@ModelAttribute(value = "idPais") int idPais, Model model) {
        List<Maestro> departamentos = servicioMaestro.obtenerDepartamentos(idPais);
        Gson gson = new Gson();

        return gson.toJson(departamentos);
    }

    @RequestMapping(value = "/ciudadesDepartamento/{codigoDepartamento}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerCiudades(@ModelAttribute(value = "codigoDepartamento") String codigoDepartamento, Model model) {
        List<Maestro> ciudades = servicioMaestro.obtenerMunicipios(codigoDepartamento);
        Gson gson = new Gson();

        return gson.toJson(ciudades);
    }
}
