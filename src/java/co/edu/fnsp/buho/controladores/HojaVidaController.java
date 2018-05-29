/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.Ciudad;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.CursoExperienciaDocencia;
import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.Distincion;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Institucion;
import co.edu.fnsp.buho.entidades.Investigacion;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import co.edu.fnsp.buho.entidades.Programa;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.Terminos;
import co.edu.fnsp.buho.entidades.TipoDocumentoValidarEnum;
import co.edu.fnsp.buho.entidades.ValidacionDocumento;
import co.edu.fnsp.buho.servicios.IServicioConvocatoria;
import co.edu.fnsp.buho.servicios.IServicioHojaVida;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import co.edu.fnsp.buho.utilidades.Util;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

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

    @Autowired
    private IServicioConvocatoria servicioConvocatoria;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        List<co.edu.fnsp.buho.entidades.HojaVida> hojasVida = servicioHojaVida.obtenerHojasVida();

        model.addAttribute("hojasVida", hojasVida);

        return "hojasVida/index";
    }

    @RequestMapping(value = "/terminos", method = RequestMethod.POST)
    public @ResponseBody
    String ingresarTerminos(@ModelAttribute Terminos terminos, Model model) throws ParseException, IOException {
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.ingresarTerminos(idPersona, terminos);

            return "";
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public @ResponseBody
    String editarHojaVida(@ModelAttribute co.edu.fnsp.buho.entidadesVista.HojaVida hojaVida, Model model) throws ParseException, IOException {
        try {
            co.edu.fnsp.buho.entidades.HojaVida hojaVidaIngresar = new co.edu.fnsp.buho.entidades.HojaVida();
            hojaVidaIngresar.setIdPersona(hojaVida.getIdPersona());
            hojaVidaIngresar.setActividadEconomica(hojaVida.getActividadEconomica());
            hojaVidaIngresar.setApellidos(hojaVida.getApellidos());
            hojaVidaIngresar.setCiudadResidencia(hojaVida.getCiudadResidencia());
            hojaVidaIngresar.setDireccion(hojaVida.getDireccion());
            hojaVidaIngresar.setDiscapacidad(hojaVida.getDiscapacidad());
            hojaVidaIngresar.setDisponeRUT(hojaVida.isDisponeRUT());
            hojaVidaIngresar.setEmpleadoUDEA(hojaVida.isEmpleadoUDEA());
            hojaVidaIngresar.setDisponibilidadViajar(hojaVida.isDisponibilidadViajar());
            hojaVidaIngresar.setDistritoClase(hojaVida.getDistritoClase());
            hojaVidaIngresar.setEgresadoUDEA(hojaVida.isEgresadoUDEA());
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
            hojaVidaIngresar.setTipoIdentificacion(hojaVida.getTipoIdentificacion());
            hojaVidaIngresar.setTipoVinculacion(hojaVida.getTipoVinculacion());
            hojaVidaIngresar.setPerfil(hojaVida.getPerfil());
            hojaVidaIngresar.setInvestigadorReconocidoColciencias(hojaVida.isInvestigadorReconocidoColciencias());
            hojaVidaIngresar.setUrlCVLAC(hojaVida.getUrlCVLAC());
            if (hojaVida.getTipoInvestigador() != null && !"".equals(hojaVida.getTipoInvestigador())) {
                hojaVidaIngresar.setTipoInvestigador(Util.obtenerEntero(hojaVida.getTipoInvestigador()));
            }
            hojaVidaIngresar.setCodigoORCID(hojaVida.getCodigoORCID());
            hojaVidaIngresar.setIdentificadorScopus(hojaVida.getIdentificadorScopus());
            hojaVidaIngresar.setResearcherId(hojaVida.getResearcherId());

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
            if (hojaVida.getCopiaLibretaMilitar() != null && hojaVida.getCopiaLibretaMilitar().getBytes().length > 0) {
                documento = new Documento();
                documento.setContenido(hojaVida.getCopiaLibretaMilitar().getBytes());
                documento.setNombre(hojaVida.getCopiaLibretaMilitar().getOriginalFilename());
                documento.setTipoContenido(hojaVida.getCopiaLibretaMilitar().getContentType());
                hojaVidaIngresar.setCopiaLibretaMilitar(documento);
            }

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
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = "/editar/{tab}", method = RequestMethod.GET)
    public String editarHojaVidaUsuarioActualConTab(@ModelAttribute(value = "tab") String tab, Model model) {
        long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
        boolean terminos = servicioHojaVida.existenTerminos(idPersona);
        if (!terminos) {
            return "hojasVida/terminos";
        }
        establecerHojaVida(model);
        if (tab != null && tab.length() > 0) {
            model.addAttribute("tab", tab);
        }

        return "hojasVida/editar";
    }

    @RequestMapping(value = "/editar", method = RequestMethod.GET)
    public String editarHojaVidaUsuarioActual(Model model) {
        long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
        boolean terminos = servicioHojaVida.existenTerminos(idPersona);
        if (!terminos) {
            return "hojasVida/terminos";
        }

        establecerHojaVida(model);

        return "hojasVida/editar";
    }

    @RequestMapping(value = "/departamentosPais/{idPais}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerDepartamentos(@ModelAttribute(value = "idPais") int idPais, Model model
    ) {
        List<Maestro> departamentos = servicioMaestro.obtenerDepartamentos(idPais);
        Gson gson = new Gson();

        return gson.toJson(departamentos);
    }

    @RequestMapping(value = "/ciudadesDepartamento/{codigoDepartamento}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerCiudades(@ModelAttribute(value = "codigoDepartamento") String codigoDepartamento, Model model
    ) {
        List<Maestro> ciudades = servicioMaestro.obtenerMunicipios(codigoDepartamento);
        Gson gson = new Gson();

        return gson.toJson(ciudades);
    }

    @RequestMapping(value = "/copiaCedula/{idPersona}", method = RequestMethod.GET)
    public void obtenerCopiaCedula(@PathVariable("idPersona") long idPersona, HttpServletResponse response) throws IOException {
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
    public void obtenerCopiaRut(@PathVariable("idPersona") long idPersona, HttpServletResponse response) throws IOException {
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
    public void obtenerCopiaLibretaMilitar(@PathVariable("idPersona") long idPersona, HttpServletResponse response) throws IOException {
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

    @RequestMapping(value = "/documentoSoporte/{idDocumentoSoporte}", method = RequestMethod.GET)
    public void obtenerDocumentoSoporte(@PathVariable("idDocumentoSoporte") long idDocumentoSoporte, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoSoporte(idDocumentoSoporte);
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

    @RequestMapping(value = "/documentoSoporteValidar/{idDocumentoSoporte}", method = RequestMethod.GET)
    public void obtenerDocumentoSoporteValidar(@PathVariable("idDocumentoSoporte") long idDocumentoSoporte, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoSoporte(idDocumentoSoporte);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoIdioma/{idIdioma}", method = RequestMethod.GET)
    public void obtenerCertificadoIdioma(@PathVariable("idIdioma") int idIdioma, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoIdioma(idIdioma);
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

    @RequestMapping(value = "/certificadoIdiomaValidar/{idIdioma}", method = RequestMethod.GET)
    public void obtenerCertificadoIdiomaValidar(@PathVariable("idIdioma") int idIdioma, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoIdioma(idIdioma);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoEducacionBasica/{idEducacionBasica}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionBasica(@PathVariable("idEducacionBasica") int idEducacionBasica, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionBasica(idEducacionBasica);
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

    @RequestMapping(value = "/certificadoEducacionBasicaValidar/{idEducacionBasica}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionBasicaValidar(@PathVariable("idEducacionBasica") int idEducacionBasica, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionBasica(idEducacionBasica);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoEducacionSuperior/{idEducacionSuperior}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionSuperior(@PathVariable("idEducacionSuperior") int idEducacionSuperior, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionSuperior(idEducacionSuperior);
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

    @RequestMapping(value = "/certificadoEducacionSuperiorValidar/{idEducacionSuperior}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionSuperiorValidar(@PathVariable("idEducacionSuperior") int idEducacionSuperior, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionSuperior(idEducacionSuperior);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoHomologadoEducacionSuperior/{idEducacionSuperior}", method = RequestMethod.GET)
    public void obtenerCertificadoHomologadoEducacionSuperior(@PathVariable("idEducacionSuperior") int idEducacionSuperior, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoHomologadoEducacionSuperior(idEducacionSuperior);
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

    @RequestMapping(value = "/certificadoHomologadoEducacionSuperiorValidar/{idEducacionSuperior}", method = RequestMethod.GET)
    public void certificadoHomologadoEducacionSuperiorValidar(@PathVariable("idEducacionSuperior") int idEducacionSuperior, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoHomologadoEducacionSuperior(idEducacionSuperior);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoEducacionContinuaValidar/{idEducacionContinua}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionContinuaValidar(@PathVariable("idEducacionContinua") int idEducacionContinua, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionContinua(idEducacionContinua);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoDistincion/{idDistincion}", method = RequestMethod.GET)
    public void obtenerCertificadoDistincion(@PathVariable("idDistincion") int idDistincion, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoDistincion(idDistincion);
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

    @RequestMapping(value = "/certificadoDistincionValidar/{idDistincion}", method = RequestMethod.GET)
    public void obtenerCertificadoDistincionValidar(@PathVariable("idDistincion") int idDistincion, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoDistincion(idDistincion);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoExperienciaLaboral/{idExperienciaLaboral}", method = RequestMethod.GET)
    public void obtenerCertificadoExperienciaLaboral(@PathVariable("idExperienciaLaboral") int idExperienciaLaboral, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoExperienciaLaboral(idExperienciaLaboral);
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

    @RequestMapping(value = "/certificadoExperienciaLaboralValidar/{idExperienciaLaboral}", method = RequestMethod.GET)
    public void obtenerCertificadoExperienciaLaboralValidar(@PathVariable("idExperienciaLaboral") int idExperienciaLaboral, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoExperienciaLaboral(idExperienciaLaboral);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/certificadoCursoExperienciaDocencia/{idCursoExperienciaDocencia}", method = RequestMethod.GET)
    public void obtenerCertificadoCursoExperienciaDocencia(@PathVariable("idCursoExperienciaDocencia") int idCursoExperienciaDocencia, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoCursoExperienciaDocencia(idCursoExperienciaDocencia);
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

    @RequestMapping(value = "/certificadoCursoExperienciaDocenciaValidar/{idCursoExperienciaDocencia}", method = RequestMethod.GET)
    public void obtenerCertificadoCursoExperienciaDocenciaValidar(@PathVariable("idCursoExperienciaDocencia") int idCursoExperienciaDocencia, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoCursoExperienciaDocencia(idCursoExperienciaDocencia);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/documentoPatente/{idPatente}", method = RequestMethod.GET)
    public void obtenerDocumentoPatente(@PathVariable("idPatente") int idPatente, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoPatente(idPatente);
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

    @RequestMapping(value = "/documentoPatenteValidar/{idPatente}", method = RequestMethod.GET)
    public void obtenerDocumentoPatenteValidar(@PathVariable("idPatente") int idPatente, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoPatente(idPatente);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
            FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
        }
    }

    @RequestMapping(value = "/documentoProductoConocimiento/{idProductoConocimiento}", method = RequestMethod.GET)
    public void obtenerDocumentoProductoConocimiento(@PathVariable("idProductoConocimiento") int idProductoConocimiento, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoProductoConocimiento(idProductoConocimiento);
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

    @RequestMapping(value = "/documentoProductoConocimientoValidar/{idProductoConocimiento}", method = RequestMethod.GET)
    public void obtenerDocumentoProductoConocimientoValidar(@PathVariable("idProductoConocimiento") int idProductoConocimiento, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerDocumentoProductoConocimiento(idProductoConocimiento);
        if (documento != null) {
            response.reset();
            response.resetBuffer();
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType(documento.getTipoContenido());
            response.setContentLength(documento.getContenido().length);
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

    @RequestMapping(value = "/programasInstitucion", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerProgramasInstitucion(@ModelAttribute(value = "institucion") int institucion, int nivel,
            Model model) {
        List<Programa> programas = servicioMaestro.obtenerProgramasInstitucion(institucion, nivel);
        Gson gson = new Gson();

        return gson.toJson(programas);
    }

    @RequestMapping(value = "/programa", method = RequestMethod.POST)
    public @ResponseBody
    String ingresarInstitucionPrograma(@ModelAttribute Programa programa, Model model) throws ParseException, IOException {
        try {
            int id = servicioMaestro.ingresarProgramaInstitucion(programa);

            return "{\"id\":" + id + "}";
        } catch (Exception exc) {
            logger.error(exc);
            return "";
        }
    }

    @RequestMapping(value = "/institucion", method = RequestMethod.POST)
    public @ResponseBody
    String ingresarInstitucionPrograma(@ModelAttribute Institucion institucion, Model model) throws ParseException, IOException {
        try {
            int id = servicioMaestro.ingresarInstitucion(institucion);

            return "{\"id\":" + id + "}";
        } catch (Exception exc) {
            logger.error(exc);
            return "";
        }
    }

    @RequestMapping(value = "/ciudad", method = RequestMethod.POST)
    public @ResponseBody
    String ingresarCiudad(@ModelAttribute Ciudad ciudad, Model model) throws ParseException, IOException {
        try {
            Ciudad nuevaCiudad = servicioMaestro.ingresarCiudad(ciudad);
            Gson gson = new Gson();
            return gson.toJson(nuevaCiudad);
        } catch (Exception exc) {
            logger.error(exc);
            return "";
        }
    }

    @RequestMapping(value = "/institucionesEducativasExtranjeras", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerInstitucionesEducativasExtranjeras(Model model) throws ParseException, IOException {
        try {
            List<Maestro> maestros = servicioMaestro.obtenerInstitucionesEducativasExtranjeras();
            Gson gson = new Gson();
            return gson.toJson(maestros);
        } catch (Exception exc) {
            logger.error(exc);
            return "";
        }
    }

    @RequestMapping(value = "/institucionesEducativasColombianas", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerInstitucionesEducativasColombianas(Model model) throws ParseException, IOException {
        try {
            List<Maestro> maestros = servicioMaestro.obtenerInstitucionesEducativasColombianas();
            Gson gson = new Gson();
            return gson.toJson(maestros);
        } catch (Exception exc) {
            logger.error(exc);
            return "";
        }
    }

    private void establecerHojaVida(Model model) {
        long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();

        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnicos = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        List<Maestro> tiposTelefono = servicioMaestro.obtenerTiposTelefono();
        List<Maestro> tiposDocumento = servicioMaestro.obtenerTiposDocumento();
        List<Maestro> nivelesIdioma = servicioMaestro.obtenerNivelesIdioma();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesFormacion = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> institucionesEducativas = servicioMaestro.obtenerInstitucionesEducativas();
        List<Maestro> institucionesEducativasColombianas = servicioMaestro.obtenerInstitucionesEducativasColombianas();
        List<Maestro> nucleosBasicosConocimiento = servicioMaestro.obtenerNucleosBasicosConocimiento();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<Maestro> tiposInstitucion = servicioMaestro.obtenerTiposInstitucion();
        List<Maestro> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<Maestro> tiposExperiencia = servicioMaestro.obtenerTiposExperiencia();
        List<Maestro> naturalezasCargo = servicioMaestro.obtenerNaturalezasCargo();
        List<Maestro> modalidadesCurso = servicioMaestro.obtenerModalidadesCurso();
        List<Maestro> tiposInvestigador = servicioMaestro.obtenerTiposInvestigador();
        List<Maestro> tiposAutorArticulo = servicioMaestro.obtenerTiposAutorArticulo();
        List<Maestro> tiposPatente = servicioMaestro.obtenerTiposPatente();
        List<Maestro> tiposProductosConocimiento = servicioMaestro.obtenerTiposProductosConocimiento();
        List<Maestro> clasesPatente = servicioMaestro.obtenerClasesPatente();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnicos", gruposEtnicos);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposTelefono", tiposTelefono);
        model.addAttribute("tiposDocumento", tiposDocumento);
        model.addAttribute("nivelesIdioma", nivelesIdioma);
        model.addAttribute("idiomas", idiomas);
        model.addAttribute("tiposCertificacion", tiposCertificacion);
        model.addAttribute("nivelesFormacion", nivelesFormacion);
        model.addAttribute("institucionesEducativas", institucionesEducativas);
        model.addAttribute("institucionesEducativasColombianas", institucionesEducativasColombianas);
        model.addAttribute("nucleosBasicosConocimiento", nucleosBasicosConocimiento);
        model.addAttribute("tiposCapacitacion", tiposCapacitacion);
        model.addAttribute("tiposInstitucion", tiposInstitucion);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("tiposExperiencia", tiposExperiencia);
        model.addAttribute("naturalezasCargo", naturalezasCargo);
        model.addAttribute("modalidadesCurso", modalidadesCurso);
        model.addAttribute("tiposInvestigador", tiposInvestigador);
        model.addAttribute("tiposAutorArticulo", tiposAutorArticulo);
        model.addAttribute("tiposPatente", tiposPatente);
        model.addAttribute("tiposProductosConocimiento", tiposProductosConocimiento);
        model.addAttribute("clasesPatente", clasesPatente);

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
        if (hojaVida.getDocumentosSoporteComplementarios().size() > 0) {
            model.addAttribute("documentosSoporteJSON", Util.obtenerDocumentosSoporteJSON(hojaVida.getDocumentosSoporteComplementarios()));
        }
        if (hojaVida.getIdiomas().size() > 0) {
            model.addAttribute("idiomasJSON", Util.obtenerIdiomasJSON(hojaVida.getIdiomas()));
        }
        if (hojaVida.getEducacionesBasicas().size() > 0) {
            model.addAttribute("educacionesBasicasJSON", Util.obtenerEducacionesBasicasJSON(hojaVida.getEducacionesBasicas()));
        }
        if (hojaVida.getEducacionesSuperiores().size() > 0) {
            model.addAttribute("educacionesSuperioresJSON", Util.obtenerEducacionesSuperioresJSON(hojaVida.getEducacionesSuperiores()));
        }
        if (hojaVida.getEducacionesContinuas().size() > 0) {
            model.addAttribute("educacionesContinuasJSON", Util.obtenerEducacionesContinuasJSON(hojaVida.getEducacionesContinuas()));
        }
        if (hojaVida.getDistinciones().size() > 0) {
            model.addAttribute("distincionesJSON", Util.obtenerDistincionesJSON(hojaVida.getDistinciones()));
        }
        if (hojaVida.getExperienciasLaborales().size() > 0) {
            model.addAttribute("experienciasLaboralesJSON", Util.obtenerExperienciasLaboralesJSON(hojaVida.getExperienciasLaborales()));
        }
        if (hojaVida.getExperienciasDocencia().size() > 0) {
            model.addAttribute("experienciasDocenciaJSON", Util.obtenerExperienciasDocenciaJSON(hojaVida.getExperienciasDocencia()));
        }
        if (hojaVida.getArticulos().size() > 0) {
            model.addAttribute("articulosJSON", Util.obtenerArticulosJSON(hojaVida.getArticulos()));
        }
        if (hojaVida.getPatentes().size() > 0) {
            model.addAttribute("patentesJSON", Util.obtenerPatentesJSON(hojaVida.getPatentes()));
        }
        if (hojaVida.getProductosConocimiento().size() > 0) {
            model.addAttribute("productosConocimientoJSON", Util.obtenerProductosConocimientoJSON(hojaVida.getProductosConocimiento()));
        }

        model.addAttribute("hojaVida", hojaVida);

    }

    @RequestMapping(value = {"/documentoSoporte"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarDocumentoSoporte(@ModelAttribute(value = "documentoSoporte") co.edu.fnsp.buho.entidadesVista.DocumentoSoporte documentoSoporte, Model model) throws Exception {
        String json = "";
        try {
            DocumentoSoporte nuevoDocumentoSoporte = new DocumentoSoporte();
            nuevoDocumentoSoporte.setId(documentoSoporte.getId());
            nuevoDocumentoSoporte.setTipoDocumento(Util.obtenerEntero(documentoSoporte.getTipoDocumento()));
            if (documentoSoporte.getDocumento() != null) {
                MultipartFile multipartFile = (MultipartFile) documentoSoporte.getDocumento();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevoDocumentoSoporte.setDocumento(documento);
                }
            }
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarDocumentoSoporte(idPersona, nuevoDocumentoSoporte);
            List<DocumentoSoporte> documentosSoporte = servicioHojaVida.obtenerDocumentosSoporteComplementarios(idPersona);
            Util.establecerConsecutivoDocumentoSoporte(documentosSoporte);
            Gson gson = new Gson();
            json = gson.toJson(documentosSoporte);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarDocumentoSoporte/{idDocumentoSoporte}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarDocumentoSoporte(@PathVariable("idDocumentoSoporte") int idDocumentoSoporte, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarDocumentoSoporte(idDocumentoSoporte);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<DocumentoSoporte> documentosSoporte = servicioHojaVida.obtenerDocumentosSoporteComplementarios(idPersona);
            Util.establecerConsecutivoDocumentoSoporte(documentosSoporte);
            Gson gson = new Gson();
            json = gson.toJson(documentosSoporte);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/educacionBasica"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarEducacionBasica(@ModelAttribute(value = "educacionBasica") co.edu.fnsp.buho.entidadesVista.EducacionBasica educacionBasica, Model model) throws Exception {
        String json = "";
        try {
            EducacionBasica nuevaEducacionBasica = new EducacionBasica();
            nuevaEducacionBasica.setId(educacionBasica.getId());
            nuevaEducacionBasica.setInstitucion(educacionBasica.getInstitucion());
            if (!"".equals(educacionBasica.getAnyoFinalizacion())) {
                nuevaEducacionBasica.setAnyoFinalizacion(Util.obtenerEntero(educacionBasica.getAnyoFinalizacion()));
            }
            nuevaEducacionBasica.setAnyoInicio(Util.obtenerEntero(educacionBasica.getAnyoInicio()));
            nuevaEducacionBasica.setNivel(Util.obtenerEntero(educacionBasica.getNivel()));
            nuevaEducacionBasica.setGraduado(educacionBasica.isGraduado());
            nuevaEducacionBasica.setTitulo(educacionBasica.getTitulo());
            if (educacionBasica.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) educacionBasica.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaEducacionBasica.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarEducacionBasica(idPersona, nuevaEducacionBasica);
            List<EducacionBasica> educacionesBasicas = servicioHojaVida.obtenerEducacionesBasicas(idPersona);
            Util.establecerConsecutivoEducacionBasica(educacionesBasicas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesBasicas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarEducacionBasica/{idEducacionBasica}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarEducacionBasica(@PathVariable("idEducacionBasica") int idEducacionBasica, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarEducacionBasica(idEducacionBasica);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<EducacionBasica> educacionesBasicas = servicioHojaVida.obtenerEducacionesBasicas(idPersona);
            Util.establecerConsecutivoEducacionBasica(educacionesBasicas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesBasicas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/educacionSuperior"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarEducacionSuperior(@ModelAttribute(value = "educacionSuperior") co.edu.fnsp.buho.entidadesVista.EducacionSuperior educacionSuperior, Model model) throws Exception {
        String json = "";
        try {
            EducacionSuperior nuevaEducacionSuperior = new EducacionSuperior();
            nuevaEducacionSuperior.setId(educacionSuperior.getId());
            nuevaEducacionSuperior.setTituloExterior(educacionSuperior.isTituloExterior());
            if (educacionSuperior.isTituloExterior()) {
                nuevaEducacionSuperior.setPaisTituloExterior(Util.obtenerEntero(educacionSuperior.getPaisTituloExterior()));
                if (educacionSuperior.getCertificadoHomologado() != null) {
                    MultipartFile multipartFile = (MultipartFile) educacionSuperior.getCertificado();
                    if (multipartFile.getBytes().length > 0) {
                        Documento documento = new Documento();
                        documento.setContenido(multipartFile.getBytes());
                        documento.setNombre(multipartFile.getOriginalFilename());
                        documento.setTipoContenido(multipartFile.getContentType());
                        nuevaEducacionSuperior.setCertificadoHomologado(documento);
                    }
                }
            }
            nuevaEducacionSuperior.setTitulo(educacionSuperior.getTitulo());
            nuevaEducacionSuperior.setPrograma(Util.obtenerEntero(educacionSuperior.getPrograma()));
            nuevaEducacionSuperior.setFechaTitulo(Util.obtenerFecha(educacionSuperior.getFechaTitulo()));
            if (!"".equals(educacionSuperior.getAnyoFinalizacion())) {
                nuevaEducacionSuperior.setAnyoFinalizacion(Util.obtenerEntero(educacionSuperior.getAnyoFinalizacion()));
            }
            nuevaEducacionSuperior.setAnyoInicio(Util.obtenerEntero(educacionSuperior.getAnyoInicio()));
            nuevaEducacionSuperior.setNivel(Util.obtenerEntero(educacionSuperior.getNivel()));
            nuevaEducacionSuperior.setGraduado(educacionSuperior.isGraduado());
            if (educacionSuperior.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) educacionSuperior.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaEducacionSuperior.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarEducacionSuperior(idPersona, nuevaEducacionSuperior);
            List<EducacionSuperior> educacionesSuperiores = servicioHojaVida.obtenerEducacionesSuperiores(idPersona);
            Util.establecerConsecutivoEducacionSuperior(educacionesSuperiores);
            Gson gson = new Gson();
            json = gson.toJson(educacionesSuperiores);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarEducacionSuperior/{idEducacionSuperior}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarEducacionSuperior(@PathVariable("idEducacionSuperior") int idEducacionSuperior, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarEducacionSuperior(idEducacionSuperior);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<EducacionSuperior> educacionesSuperiores = servicioHojaVida.obtenerEducacionesSuperiores(idPersona);
            Util.establecerConsecutivoEducacionSuperior(educacionesSuperiores);
            Gson gson = new Gson();
            json = gson.toJson(educacionesSuperiores);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/correoElectronico"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCorreoElectronico(@ModelAttribute(value = "correoElectronico") CorreoElectronico correoElectronico, Model model) throws Exception {
        String json = "";
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarCorreoElectronico(idPersona, correoElectronico);
            List<CorreoElectronico> correosElectronicos = servicioHojaVida.obtenerCorreosElectronicos(idPersona);
            Util.establecerConsecutivoCorreoElectronico(correosElectronicos);
            Gson gson = new Gson();
            json = gson.toJson(correosElectronicos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarCorreoElectronico/{idCorreoElectronico}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCorreoElectronico(@PathVariable("idCorreoElectronico") int idCorreoElectronico, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarCorreoElectronico(idCorreoElectronico);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<CorreoElectronico> correosElectronicos = servicioHojaVida.obtenerCorreosElectronicos(idPersona);
            Util.establecerConsecutivoCorreoElectronico(correosElectronicos);
            Gson gson = new Gson();
            json = gson.toJson(correosElectronicos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/telefono"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarTelefono(@ModelAttribute(value = "telefono") Telefono telefono, Model model) throws Exception {
        String json = "";
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarTelefono(idPersona, telefono);
            List<Telefono> telefonos = servicioHojaVida.obtenerTelefonos(idPersona);
            Util.establecerConsecutivoTelefono(telefonos);
            Gson gson = new Gson();
            json = gson.toJson(telefonos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarTelefono/{idTelefono}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarTelefono(@PathVariable("idTelefono") int idTelefono, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarTelefono(idTelefono);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<Telefono> telefonos = servicioHojaVida.obtenerTelefonos(idPersona);
            Util.establecerConsecutivoTelefono(telefonos);
            Gson gson = new Gson();
            json = gson.toJson(telefonos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/cuentaBancaria"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCuentaBancaria(@ModelAttribute(value = "cuentaBancaria") CuentaBancaria cuentaBancaria, Model model) throws Exception {
        String json = "";
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarCuentaBancaria(idPersona, cuentaBancaria);
            List<CuentaBancaria> cuentasBancarias = servicioHojaVida.obtenerCuentasBancarias(idPersona);
            Util.establecerConsecutivoCuentaBancaria(cuentasBancarias);
            Gson gson = new Gson();
            json = gson.toJson(cuentasBancarias);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarCuentaBancaria/{idCuentaBancaria}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCuentaBancaria(@PathVariable("idCuentaBancaria") int idCuentaBancaria, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarCuentaBancaria(idCuentaBancaria);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<CuentaBancaria> cuentasBancarias = servicioHojaVida.obtenerCuentasBancarias(idPersona);
            Util.establecerConsecutivoCuentaBancaria(cuentasBancarias);
            Gson gson = new Gson();
            json = gson.toJson(cuentasBancarias);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/educacionContinua"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarEducacionContinua(@ModelAttribute(value = "educacionContinua") co.edu.fnsp.buho.entidadesVista.EducacionContinua educacionContinua, Model model) throws Exception {
        String json = "";
        try {
            EducacionContinua nuevaEducacionContinua = new EducacionContinua();
            nuevaEducacionContinua.setId(educacionContinua.getId());
            nuevaEducacionContinua.setEstudioExterior(educacionContinua.isEstudioExterior());
            nuevaEducacionContinua.setTipoCapacitacion(Util.obtenerEntero(educacionContinua.getTipoCapacitacion()));
            nuevaEducacionContinua.setInstitucion(Util.obtenerEntero(educacionContinua.getInstitucion()));
            nuevaEducacionContinua.setNombreCapacitacion(educacionContinua.getNombreCapacitacion());
            nuevaEducacionContinua.setNucleoBasicoConocimiento(Util.obtenerEntero(educacionContinua.getNucleoBasicoConocimiento()));
            nuevaEducacionContinua.setNumeroHoras(Util.obtenerEntero(educacionContinua.getNumeroHoras()));
            nuevaEducacionContinua.setAnyo(Util.obtenerEntero(educacionContinua.getAnyo()));
            if (educacionContinua.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) educacionContinua.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaEducacionContinua.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarEducacionContinua(idPersona, nuevaEducacionContinua);
            List<EducacionContinua> educacionesContinuas = servicioHojaVida.obtenerEducacionesContinuas(idPersona);
            Util.establecerConsecutivoEducacionContinua(educacionesContinuas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesContinuas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarEducacionContinua/{idEducacionContinua}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarEducacionContinua(@PathVariable("idEducacionContinua") int idEducacionContinua, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarEducacionContinua(idEducacionContinua);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<EducacionContinua> educacionesContinuas = servicioHojaVida.obtenerEducacionesContinuas(idPersona);
            Util.establecerConsecutivoEducacionContinua(educacionesContinuas);
            Gson gson = new Gson();
            json = gson.toJson(educacionesContinuas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/idioma"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarIdioma(@ModelAttribute(value = "idioma") co.edu.fnsp.buho.entidadesVista.Idioma idioma, Model model) throws Exception {
        String json = "";
        try {
            Idioma nuevoIdioma = new Idioma();
            nuevoIdioma.setId(idioma.getId());
            nuevoIdioma.setIdioma(Util.obtenerEntero(idioma.getIdioma()));
            nuevoIdioma.setNivelConversacion(idioma.getNivelConversacion());
            nuevoIdioma.setNivelLectura(idioma.getNivelLectura());
            nuevoIdioma.setNivelEscritura(idioma.getNivelEscritura());
            nuevoIdioma.setNivelEscucha(idioma.getNivelEscucha());
            nuevoIdioma.setOtraCertificacion(idioma.getOtraCertificacion());
            nuevoIdioma.setTipoCertificacion(idioma.getTipoCertificacion());
            nuevoIdioma.setPuntajeCertificacion(Util.obtenerNumeroDoble(idioma.getPuntajeCertificacion()));
            if (idioma.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) idioma.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevoIdioma.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarIdioma(idPersona, nuevoIdioma);
            List<Idioma> idiomas = servicioHojaVida.obtenerIdiomas(idPersona);
            Util.establecerConsecutivoIdioma(idiomas);
            Gson gson = new Gson();
            json = gson.toJson(idiomas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarIdioma/{idIdioma}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarIdioma(@PathVariable("idIdioma") int idIdioma, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarIdioma(idIdioma);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<Idioma> idiomas = servicioHojaVida.obtenerIdiomas(idPersona);
            Util.establecerConsecutivoIdioma(idiomas);
            Gson gson = new Gson();
            json = gson.toJson(idiomas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/distincion"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarDistincion(@ModelAttribute(value = "distincion") co.edu.fnsp.buho.entidadesVista.Distincion distincion, Model model) throws Exception {
        String json = "";
        try {
            Distincion nuevaDistincion = new Distincion();
            nuevaDistincion.setId(distincion.getId());
            nuevaDistincion.setDescripcion(distincion.getDescripcion());
            nuevaDistincion.setFechaDistincion(Util.obtenerFecha(distincion.getFechaDistincion()));
            nuevaDistincion.setInstitucionOtorga(distincion.getInstitucionOtorga());
            if (distincion.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) distincion.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaDistincion.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarDistincion(idPersona, nuevaDistincion);
            List<Distincion> distincions = servicioHojaVida.obtenerDistinciones(idPersona);
            Util.establecerConsecutivoDistincion(distincions);
            Gson gson = new Gson();
            json = gson.toJson(distincions);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarDistincion/{idDistincion}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarDistincion(@PathVariable("idDistincion") int idDistincion, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarDistincion(idDistincion);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<Distincion> distincions = servicioHojaVida.obtenerDistinciones(idPersona);
            Util.establecerConsecutivoDistincion(distincions);
            Gson gson = new Gson();
            json = gson.toJson(distincions);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/experienciaLaboral"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarExperienciaLaboral(@ModelAttribute(value = "experienciaLaboral") co.edu.fnsp.buho.entidadesVista.ExperienciaLaboral experienciaLaboral, Model model) throws Exception {
        String json = "";
        try {
            ExperienciaLaboral nuevaExperienciaLaboral = new ExperienciaLaboral();
            nuevaExperienciaLaboral.setId(experienciaLaboral.getId());
            nuevaExperienciaLaboral.setActividadEconomica(Util.obtenerEntero(experienciaLaboral.getActividadEconomica()));
            nuevaExperienciaLaboral.setNucleoBasicoConocimiento(Util.obtenerEntero(experienciaLaboral.getNucleoBasicoConocimiento()));
            nuevaExperienciaLaboral.setCargo(experienciaLaboral.getCargo());
            nuevaExperienciaLaboral.setNaturalezaCargo(Util.obtenerEntero(experienciaLaboral.getNaturalezaCargo()));
            nuevaExperienciaLaboral.setTipoContrato(Util.obtenerEntero(experienciaLaboral.getTipoContrato()));
            nuevaExperienciaLaboral.setTipoEmpresa(Util.obtenerEntero(experienciaLaboral.getTipoEmpresa()));
            nuevaExperienciaLaboral.setTipoExperiencia(Util.obtenerEntero(experienciaLaboral.getTipoExperiencia()));
            nuevaExperienciaLaboral.setFnsp(experienciaLaboral.isFnsp());
            nuevaExperienciaLaboral.setTrabajoActual(experienciaLaboral.isTrabajoActual());
            nuevaExperienciaLaboral.setFechaIngreso(Util.obtenerFecha(experienciaLaboral.getFechaIngreso()));
            nuevaExperienciaLaboral.setFechaRetiro(Util.obtenerFecha(experienciaLaboral.getFechaRetiro()));
            nuevaExperienciaLaboral.setNombreEmpresa(experienciaLaboral.getNombreEmpresa());
            if (experienciaLaboral.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) experienciaLaboral.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaExperienciaLaboral.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarExperienciaLaboral(idPersona, nuevaExperienciaLaboral);
            List<ExperienciaLaboral> experienciasLaborales = servicioHojaVida.obtenerExperienciasLaborales(idPersona);
            Util.establecerConsecutivoExperienciaLaboral(experienciasLaborales);
            Gson gson = new Gson();
            json = gson.toJson(experienciasLaborales);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarExperienciaLaboral/{idExperienciaLaboral}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarExperienciaLaboral(@PathVariable("idExperienciaLaboral") int idExperienciaLaboral, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarExperienciaLaboral(idExperienciaLaboral);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<ExperienciaLaboral> experienciasLaborales = servicioHojaVida.obtenerExperienciasLaborales(idPersona);
            Util.establecerConsecutivoExperienciaLaboral(experienciasLaborales);
            Gson gson = new Gson();
            json = gson.toJson(experienciasLaborales);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/experienciaDocencia"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarExperienciaDocencia(@ModelAttribute(value = "experienciaDocencia") co.edu.fnsp.buho.entidadesVista.ExperienciaDocencia experienciaDocencia, Model model) throws Exception {
        String json = "";
        try {
            ExperienciaDocencia nuevaExperienciaDocencia = new ExperienciaDocencia();
            nuevaExperienciaDocencia.setId(experienciaDocencia.getId());
            nuevaExperienciaDocencia.setFnsp(experienciaDocencia.isFnsp());
            nuevaExperienciaDocencia.setTrabajoActual(experienciaDocencia.isTrabajoActual());
            nuevaExperienciaDocencia.setInstitucion(Util.obtenerEntero(experienciaDocencia.getInstitucion()));
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            int id = servicioHojaVida.guardarExperienciaDocencia(idPersona, nuevaExperienciaDocencia);
            List<ExperienciaDocencia> experienciasDocencia = servicioHojaVida.obtenerExperienciasDocencia(idPersona);
            Util.establecerConsecutivoExperienciaDocencia(experienciasDocencia);
            Gson gson = new Gson();
            json = gson.toJson(experienciasDocencia);
            json = "{\"id\":" + id + ",\"experienciasDocencia\":" + json + "}";

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarExperienciaDocencia/{idExperienciaDocencia}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarExperienciaDocencia(@PathVariable("idExperienciaDocencia") int idExperienciaDocencia, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarExperienciaDocencia(idExperienciaDocencia);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<ExperienciaDocencia> experienciasDocencia = servicioHojaVida.obtenerExperienciasDocencia(idPersona);
            Util.establecerConsecutivoExperienciaDocencia(experienciasDocencia);
            Gson gson = new Gson();
            json = gson.toJson(experienciasDocencia);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/cursoExperienciaDocencia"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCursoExperienciaDocencia(@ModelAttribute(value = "cursoExperienciaDocencia") co.edu.fnsp.buho.entidadesVista.CursoExperienciaDocencia cursoExperienciaDocencia, Model model) throws Exception {
        String json = "";
        try {
            CursoExperienciaDocencia nuevoCursoExperienciaDocencia = new CursoExperienciaDocencia();
            nuevoCursoExperienciaDocencia.setId(cursoExperienciaDocencia.getId());
            nuevoCursoExperienciaDocencia.setIdExperienciaDocencia(cursoExperienciaDocencia.getIdExperienciaDocencia());
            nuevoCursoExperienciaDocencia.setAnyo(Util.obtenerEntero(cursoExperienciaDocencia.getAnyo()));
            nuevoCursoExperienciaDocencia.setNucleoBasicoConocimiento(Util.obtenerEntero(cursoExperienciaDocencia.getNucleoBasicoConocimiento()));
            nuevoCursoExperienciaDocencia.setModalidad(Util.obtenerEntero(cursoExperienciaDocencia.getModalidad()));
            nuevoCursoExperienciaDocencia.setNivelEstudio(Util.obtenerEntero(cursoExperienciaDocencia.getNivelEstudio()));
            nuevoCursoExperienciaDocencia.setNumeroHoras(Util.obtenerEntero(cursoExperienciaDocencia.getNumeroHoras()));
            nuevoCursoExperienciaDocencia.setNombreCurso(cursoExperienciaDocencia.getNombreCurso());
            if (cursoExperienciaDocencia.getCertificado() != null) {
                MultipartFile multipartFile = (MultipartFile) cursoExperienciaDocencia.getCertificado();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevoCursoExperienciaDocencia.setCertificado(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarCursoExperienciaDocencia(idPersona, nuevoCursoExperienciaDocencia);
            List<ExperienciaDocencia> experienciasDocencia = servicioHojaVida.obtenerExperienciasDocencia(idPersona);
            Util.establecerConsecutivoExperienciaDocencia(experienciasDocencia);
            Gson gson = new Gson();
            json = gson.toJson(experienciasDocencia);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarCursoExperienciaDocencia/{idCursoExperienciaDocencia}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCursoExperienciaDocencia(@PathVariable("idCursoExperienciaDocencia") int idCursoExperienciaDocencia, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarCursoExperienciaDocencia(idCursoExperienciaDocencia);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<ExperienciaDocencia> experienciasDocencia = servicioHojaVida.obtenerExperienciasDocencia(idPersona);
            Util.establecerConsecutivoExperienciaDocencia(experienciasDocencia);
            Gson gson = new Gson();
            json = gson.toJson(experienciasDocencia);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/articulo"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarArticulo(@ModelAttribute(value = "articulo") Articulo articulo, Model model) throws Exception {
        String json = "";
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarArticulo(idPersona, articulo);
            List<Articulo> telefonos = servicioHojaVida.obtenerArticulos(idPersona);
            Util.establecerConsecutivoArticulo(telefonos);
            Gson gson = new Gson();
            json = gson.toJson(telefonos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarArticulo/{idArticulo}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarArticulo(@PathVariable("idArticulo") int idArticulo, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarArticulo(idArticulo);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<Articulo> telefonos = servicioHojaVida.obtenerArticulos(idPersona);
            Util.establecerConsecutivoArticulo(telefonos);
            Gson gson = new Gson();
            json = gson.toJson(telefonos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/patente"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarPatente(@ModelAttribute(value = "patente") co.edu.fnsp.buho.entidadesVista.Patente patente, Model model) throws Exception {
        String json = "";
        try {

            Patente nuevaPatente = new Patente();
            nuevaPatente.setId(patente.getId());
            nuevaPatente.setDescripcion(patente.getDescripcion());
            nuevaPatente.setClase(patente.getClase());
            nuevaPatente.setTipo(patente.getTipo());
            nuevaPatente.setFecha(Util.obtenerFecha(patente.getFecha()));
            nuevaPatente.setPropiedadCompartida(patente.isPropiedadCompartida());
            if (patente.getDocumento() != null) {
                MultipartFile multipartFile = (MultipartFile) patente.getDocumento();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevaPatente.setDocumento(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarPatente(idPersona, nuevaPatente);
            List<Patente> patentes = servicioHojaVida.obtenerPatentes(idPersona);
            Util.establecerConsecutivoPatente(patentes);
            Gson gson = new Gson();
            json = gson.toJson(patentes);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarPatente/{idPatente}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarPatente(@PathVariable("idPatente") int idPatente, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarPatente(idPatente);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<Patente> patentes = servicioHojaVida.obtenerPatentes(idPersona);
            Util.establecerConsecutivoPatente(patentes);
            Gson gson = new Gson();
            json = gson.toJson(patentes);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/productoConocimiento"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarProductoConocimiento(@ModelAttribute(value = "productoConocimiento") co.edu.fnsp.buho.entidadesVista.ProductoConocimiento productoConocimiento, Model model) throws Exception {
        String json = "";
        try {

            ProductoConocimiento nuevoProductoConocimiento = new ProductoConocimiento();
            nuevoProductoConocimiento.setId(productoConocimiento.getId());
            nuevoProductoConocimiento.setDescripcion(productoConocimiento.getDescripcion());
            nuevoProductoConocimiento.setNucleoBasicoConocimiento(productoConocimiento.getNucleoBasicoConocimiento());
            nuevoProductoConocimiento.setTipo(productoConocimiento.getTipo());
            nuevoProductoConocimiento.setUrl(productoConocimiento.getUrl());
            if (productoConocimiento.getDocumento() != null) {
                MultipartFile multipartFile = (MultipartFile) productoConocimiento.getDocumento();
                if (multipartFile.getBytes().length > 0) {
                    Documento documento = new Documento();
                    documento.setContenido(multipartFile.getBytes());
                    documento.setNombre(multipartFile.getOriginalFilename());
                    documento.setTipoContenido(multipartFile.getContentType());
                    nuevoProductoConocimiento.setDocumento(documento);
                }
            }

            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.guardarProductoConocimiento(idPersona, nuevoProductoConocimiento);
            List<ProductoConocimiento> productoConocimientos = servicioHojaVida.obtenerProductoConocimientos(idPersona);
            Util.establecerConsecutivoProductoConocimiento(productoConocimientos);
            Gson gson = new Gson();
            json = gson.toJson(productoConocimientos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/eliminarProductoConocimiento/{idProductoConocimiento}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarProductoConocimiento(@PathVariable("idProductoConocimiento") int idProductoConocimiento, Model model) {
        String json = "";
        try {
            servicioHojaVida.eliminarProductoConocimiento(idProductoConocimiento);
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            List<ProductoConocimiento> productoConocimientos = servicioHojaVida.obtenerProductoConocimientos(idPersona);
            Util.establecerConsecutivoProductoConocimiento(productoConocimientos);
            Gson gson = new Gson();
            json = gson.toJson(productoConocimientos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/validar", method = RequestMethod.GET)
    public String validarDocumentos(Model model) {

        List<ListadoConvocatoria> convocatorias = servicioConvocatoria.obtenerConvocatoriaValidar();
        model.addAttribute("convocatorias", convocatorias);

        return "hojasVida/validar";
    }

    @RequestMapping(value = "/personas/{idConvocatoria}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerPersonasConvocatoria(@ModelAttribute(value = "idConvocatoria") int idConvocatoria, Model model) {
        List<HojaVida> hojasVida = servicioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
        Gson gson = new Gson();

        return gson.toJson(hojasVida);
    }

    @RequestMapping(value = "/datos/{idPersona}", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerHojaVida(@ModelAttribute(value = "idPersona") long idPersona, Model model) {
        try {
            HojaVida hojaVida = servicioHojaVida.obtenerHojaVida(idPersona);
            Gson gson = new Gson();

            return gson.toJson(hojaVida);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = {"/validarDocumento"}, method = RequestMethod.POST)
    public @ResponseBody
    String validarDocumento(@ModelAttribute(value = "validacionDocumento") ValidacionDocumento validacionDocumento, Model model) throws Exception {
        try {
            long idPersona = ((DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getIdPersona();
            servicioHojaVida.validarDocumento(idPersona, validacionDocumento);

            Gson gson = new Gson();
            if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.SOPORTE.getId()) {
                List<DocumentoSoporte> documentosSoporte = servicioHojaVida.obtenerDocumentosSoporteValidar(validacionDocumento.getIdPersona());
                return gson.toJson(documentosSoporte);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.CURSO_EXPERIENCIA_DOCENCIA.getId()) {
                List<CursoExperienciaDocencia> cursosExperienciaDocencia = servicioHojaVida.obtenerCursosExperienciaDocencia(validacionDocumento.getIdPersona());
                return gson.toJson(cursosExperienciaDocencia);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.ARTICULO.getId()) {
                List<Articulo> articulos = servicioHojaVida.obtenerArticulos(validacionDocumento.getIdPersona());
                return gson.toJson(articulos);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.DISTINCION.getId()) {
                List<Distincion> disticiones = servicioHojaVida.obtenerDistinciones(validacionDocumento.getIdPersona());
                return gson.toJson(disticiones);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.EDUCACION_BASICA.getId()) {
                List<EducacionBasica> educacionesBasicas = servicioHojaVida.obtenerEducacionesBasicas(validacionDocumento.getIdPersona());
                return gson.toJson(educacionesBasicas);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.EDUCACION_CONTINUA.getId()) {
                List<EducacionContinua> educacionesContinuas = servicioHojaVida.obtenerEducacionesContinuas(validacionDocumento.getIdPersona());
                return gson.toJson(educacionesContinuas);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.EDUCACION_SUPERIOR.getId()
                    || validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.EDUCACION_HOMOLOGADO_SUPERIOR.getId()) {
                List<EducacionSuperior> educacionesSuperiores = servicioHojaVida.obtenerEducacionesSuperiores(validacionDocumento.getIdPersona());
                return gson.toJson(educacionesSuperiores);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.EXPERIENCIA_LABORAL.getId()) {
                List<ExperienciaLaboral> experienciasLaborales = servicioHojaVida.obtenerExperienciasLaborales(validacionDocumento.getIdPersona());
                return gson.toJson(experienciasLaborales);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.IDIOMA.getId()) {
                List<Idioma> idiomas = servicioHojaVida.obtenerIdiomas(validacionDocumento.getIdPersona());
                return gson.toJson(idiomas);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.PATENTE.getId()) {
                List<Patente> patentes = servicioHojaVida.obtenerPatentes(validacionDocumento.getIdPersona());
                return gson.toJson(patentes);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.PRODUCTO_CONOCIMIENTO.getId()) {
                List<ProductoConocimiento> productosConocimiento = servicioHojaVida.obtenerProductoConocimientos(validacionDocumento.getIdPersona());
                return gson.toJson(productosConocimiento);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.CVLAC.getId()) {
                Investigacion investigacion = servicioHojaVida.obtenerInvestigacion(validacionDocumento.getIdPersona());
                List<Investigacion> investigaciones = new ArrayList<>();
                investigaciones.add(investigacion);
                return gson.toJson(investigaciones);
            } else if (validacionDocumento.getTipoDocumento() == TipoDocumentoValidarEnum.PROPUESTA_INVESTIGACION.getId()) {
                List<DocumentoSoporte> documentosSoporte = servicioHojaVida.obtenerPropuestasInvestigacion(validacionDocumento.getIdPersona());
                return gson.toJson(documentosSoporte);
            }
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return "";
    }
}
