/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.entidadesVista.HojaVida;
import co.edu.fnsp.buho.servicios.IServicioHojaVida;
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
@RequestMapping(value = "/hojasVida")
public class HojaVidaController {

    private static final Logger logger = LogManager.getLogger(HojaVidaController.class.getName());

    @Autowired
    private IServicioHojaVida servicioHojaVida;

    @Autowired
    private IServicioMaestro servicioMaestro;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        List<co.edu.fnsp.buho.entidades.HojaVida> hojasVida = servicioHojaVida.obtenerHojasVida();
        model.addAttribute("hojasVida", hojasVida);

        return "hojasVida/index";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnico = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        List<Maestro> tiposTelefono = servicioMaestro.obtenerTiposTelefono();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnico", gruposEtnico);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposTelefono", tiposTelefono);

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
            hojaVidaIngresar.setCorreosElectronicos(hojaVida.getCorreosElectronicos());
            hojaVidaIngresar.setCuentasBancarias(hojaVida.getCuentasBancarias());
            hojaVidaIngresar.setDireccion(hojaVida.getDireccion());
            hojaVidaIngresar.setDiscapacidad(hojaVida.getDiscapacidad());
            hojaVidaIngresar.setDisponeRUT(Boolean.parseBoolean(hojaVida.getDisponeRUT()));
            hojaVidaIngresar.setEmpleadoUDEA(Boolean.parseBoolean(hojaVida.getEmpleadoUDEA()));
            hojaVidaIngresar.setDisponibilidadViajar(Boolean.parseBoolean(hojaVida.getDisponibilidadViajar()));
            hojaVidaIngresar.setDistritoClase(hojaVida.getDistritoClase());
            hojaVidaIngresar.setEgresadoUDEA(Boolean.parseBoolean(hojaVida.getEgresadoUDEA()));
            hojaVidaIngresar.setFechaExpedicion(Util.obtenerFecha(hojaVida.getFechaExpedicion()));
            hojaVidaIngresar.setFechaNacimiento(Util.obtenerFecha(hojaVida.getFechaNacimiento()));
            hojaVidaIngresar.setGrupoEtnico(hojaVida.getGrupoEtnico());
            hojaVidaIngresar.setLibretaMilitar(hojaVida.getLibretaMilitar());
            hojaVidaIngresar.setLugarExpedicion(hojaVida.getLugarExpedicion());
            hojaVidaIngresar.setLugarNacimiento(hojaVida.getLugarNacimiento());
            hojaVidaIngresar.setNacionalidad(hojaVida.getNacionalidad());
            hojaVidaIngresar.setNombres(hojaVida.getNombres());
            hojaVidaIngresar.setNumeroIdentificacion(hojaVida.getNumeroIdentificacion());
            hojaVidaIngresar.setSexo(hojaVida.getSexo());
            hojaVidaIngresar.setTelefonos(hojaVida.getTelefonos());
            hojaVidaIngresar.setTipoIdentificacion(hojaVida.getTipoIdentificacion());
            hojaVidaIngresar.setTipoVinculacion(hojaVida.getTipoVinculacion());

            Documento documento = null;
            if (hojaVida.getCopiaDocumentoIdentificacion() != null && hojaVida.getCopiaDocumentoIdentificacion().getBytes().length > 0) {
                documento = new Documento();
                documento.setContenido(hojaVida.getCopiaDocumentoIdentificacion().getBytes());
                documento.setNombre(hojaVida.getCopiaDocumentoIdentificacion().getOriginalFilename());
                documento.setTipoContenido(hojaVida.getCopiaDocumentoIdentificacion().getContentType());
                hojaVidaIngresar.setCopiaDocumentoIdentificacion(documento);
            }
            if (hojaVida.getDocumentoRUT() != null && hojaVida.getDocumentoRUT().getBytes().length > 0) {
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
                if (!servicioHojaVida.existePersona(hojaVidaIngresar.getNumeroIdentificacion())) {
                    servicioHojaVida.ingresarHojaVida(idUsuario, hojaVidaIngresar);
                } else {
                    return "El documento ya ha sido asignado a otra persona";
                }
            } else {
                String numeroIdentificacion = servicioHojaVida.obtenerNumeroIdentificacionPersona(hojaVidaIngresar.getIdPersona());
                if (!numeroIdentificacion.equalsIgnoreCase(hojaVidaIngresar.getNumeroIdentificacion())) {
                    if (servicioHojaVida.existePersona(hojaVidaIngresar.getNumeroIdentificacion())) {
                        return "El documento ya ha sido asignado a otra persona";
                    }
                }
                servicioHojaVida.actualizarHojaVida(idUsuario, hojaVidaIngresar);
            }

            return "";
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = "/editar/{idPersona}", method = RequestMethod.GET)
    public String editar(@PathVariable long idPersona, Model model) {
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnico = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        List<Maestro> tiposTelefono = servicioMaestro.obtenerTiposTelefono();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnico", gruposEtnico);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposTelefono", tiposTelefono);

        co.edu.fnsp.buho.entidades.HojaVida hojaVida = servicioHojaVida.obtenerHojaVida(idPersona);

        if (hojaVida.getTelefonos().size() > 0) {
            model.addAttribute("telefonosJSON", Util.obtenerTelefonosJSON(hojaVida.getTelefonos()));
        }
        if (hojaVida.getCuentasBancarias().size() > 0) {
            model.addAttribute("cuentasBancariasJSON", Util.obtenerCuentasBancariasJSON(hojaVida.getCuentasBancarias()));
        }
        if (hojaVida.getCorreosElectronicos().size() > 0) {
            model.addAttribute("correosElectronicosJSON", Util.obtenerCorreosElectronicosJSON(hojaVida.getCorreosElectronicos()));
        }

        model.addAttribute("hojaVida", hojaVida);

        return "hojasVida/crear";
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

    @RequestMapping(value = "/copiaCedula/{idPersona}", method = RequestMethod.GET)
    public void obtenerCopiaCedula(@PathVariable("idPersona") int idPersona, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoSoporte(idPersona, TipoDocumento.COPIA_CEDULA.getId());
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

    @RequestMapping(value = "/copiaRUT/{idPersona}", method = RequestMethod.GET)
    public void obtenerCopiaRut(@PathVariable("idPersona") int idPersona, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoSoporte(idPersona, TipoDocumento.RUT.getId());
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

    @RequestMapping(value = "/copiaLibretaMilitar/{idPersona}", method = RequestMethod.GET)
    public void obtenerCopiaLibretaMilitar(@PathVariable("idPersona") int idPersona, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoSoporte(idPersona, TipoDocumento.LIBRETA_MILITAR.getId());
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

    @RequestMapping(value = "/eliminar/{idPersona}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarHojaVida(@PathVariable long idPersona, Model model) {
        try {
            servicioHojaVida.eliminarHojaVida(idPersona);
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false}";
        }

        return "{\"resultado\":true}";
    }
}
