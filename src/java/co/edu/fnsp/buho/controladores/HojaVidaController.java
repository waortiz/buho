/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

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
import co.edu.fnsp.buho.entidadesVista.HojaVida;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
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
        List<Maestro> tiposDocumento = servicioMaestro.obtenerTiposDocumento();
        List<Maestro> nivelesIdioma = servicioMaestro.obtenerNivelesIdioma();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesEstudio = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> institucionesEducativas = servicioMaestro.obtenerInstitucionesEducativas();
        List<Maestro> areasSaber = servicioMaestro.obtenerAreasSaber();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<Maestro> tiposInstitucion = servicioMaestro.obtenerTiposInstitucion();
        List<Maestro> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<Maestro> tiposExperiencia = servicioMaestro.obtenerTiposExperiencia();
        List<Maestro> naturalezasCargo = servicioMaestro.obtenerNaturalezasCargo();
        List<Maestro> modalidadesCurso = servicioMaestro.obtenerModalidadesCurso();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnico", gruposEtnico);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposTelefono", tiposTelefono);
        model.addAttribute("tiposDocumento", tiposDocumento);
        model.addAttribute("nivelesIdioma", nivelesIdioma);
        model.addAttribute("idiomas", idiomas);
        model.addAttribute("tiposCertificacion", tiposCertificacion);
        model.addAttribute("nivelesEstudio", nivelesEstudio);
        model.addAttribute("institucionesEducativas", institucionesEducativas);
        model.addAttribute("areasSaber", areasSaber);
        model.addAttribute("tiposCapacitacion", tiposCapacitacion);
        model.addAttribute("tiposInstitucion", tiposInstitucion);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("tiposExperiencia", tiposExperiencia);
        model.addAttribute("naturalezasCargo", naturalezasCargo);
        model.addAttribute("modalidadesCurso", modalidadesCurso);

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
            hojaVidaIngresar.setTelefonos(hojaVida.getTelefonos());
            hojaVidaIngresar.setTipoIdentificacion(hojaVida.getTipoIdentificacion());
            hojaVidaIngresar.setTipoVinculacion(hojaVida.getTipoVinculacion());
            hojaVidaIngresar.setPerfil(hojaVida.getPerfil());

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
            for (co.edu.fnsp.buho.entidadesVista.DocumentoSoporte documentoSoporte : hojaVida.getDocumentosSoporte()) {
                DocumentoSoporte nuevoDocumentoSoporte = new DocumentoSoporte();
                nuevoDocumentoSoporte.setId(documentoSoporte.getId());
                nuevoDocumentoSoporte.setTipoDocumento(Util.obtenerEntero(documentoSoporte.getTipoDocumento()));
                if (documentoSoporte.getDocumento() != null && documentoSoporte.getDocumento().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(documentoSoporte.getDocumento().getBytes());
                    documento.setNombre(documentoSoporte.getDocumento().getOriginalFilename());
                    documento.setTipoContenido(documentoSoporte.getDocumento().getContentType());
                    nuevoDocumentoSoporte.setDocumento(documento);
                }
                hojaVidaIngresar.getDocumentosSoporte().add(nuevoDocumentoSoporte);
            }
            hojaVidaIngresar.setTelefonos(hojaVida.getTelefonos());
            hojaVidaIngresar.setCuentasBancarias(hojaVida.getCuentasBancarias());
            hojaVidaIngresar.setCorreosElectronicos(hojaVida.getCorreosElectronicos());

            for (co.edu.fnsp.buho.entidadesVista.Idioma idioma : hojaVida.getIdiomas()) {
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

                if (idioma.getCertificado() != null && idioma.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(idioma.getCertificado().getBytes());
                    documento.setNombre(idioma.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(idioma.getCertificado().getContentType());
                    nuevoIdioma.setCertificado(documento);
                }
                hojaVidaIngresar.getIdiomas().add(nuevoIdioma);
            }

            for (co.edu.fnsp.buho.entidadesVista.EducacionBasica educacionBasica : hojaVida.getEducacionesBasicas()) {
                EducacionBasica nuevaEducacionBasica = new EducacionBasica();
                nuevaEducacionBasica.setId(educacionBasica.getId());
                nuevaEducacionBasica.setInstitucion(Util.obtenerEntero(educacionBasica.getInstitucion()));
                if (!"".equals(educacionBasica.getAnyoFinalizacion())) {
                    nuevaEducacionBasica.setAnyoFinalizacion(Util.obtenerEntero(educacionBasica.getAnyoFinalizacion()));
                }
                nuevaEducacionBasica.setAnyoInicio(Util.obtenerEntero(educacionBasica.getAnyoInicio()));
                nuevaEducacionBasica.setNivel(Util.obtenerEntero(educacionBasica.getNivel()));
                nuevaEducacionBasica.setGraduado(educacionBasica.isGraduado());
                nuevaEducacionBasica.setTitulo(educacionBasica.getTitulo());
                if (educacionBasica.getCertificado() != null && educacionBasica.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(educacionBasica.getCertificado().getBytes());
                    documento.setNombre(educacionBasica.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(educacionBasica.getCertificado().getContentType());
                    nuevaEducacionBasica.setCertificado(documento);
                }
                hojaVidaIngresar.getEducacionesBasicas().add(nuevaEducacionBasica);
            }

            for (co.edu.fnsp.buho.entidadesVista.EducacionSuperior educacionSuperior : hojaVida.getEducacionesSuperiores()) {
                EducacionSuperior nuevaEducacionSuperior = new EducacionSuperior();
                nuevaEducacionSuperior.setId(educacionSuperior.getId());
                nuevaEducacionSuperior.setTituloExterior(educacionSuperior.isTituloExterior());
                if (educacionSuperior.isTituloExterior()) {
                    nuevaEducacionSuperior.setPaisTituloExterior(Util.obtenerEntero(educacionSuperior.getPaisTituloExterior()));
                    if (educacionSuperior.getCertificadoHomologado() != null && educacionSuperior.getCertificadoHomologado().getBytes().length > 0) {
                        documento = new Documento();
                        documento.setContenido(educacionSuperior.getCertificadoHomologado().getBytes());
                        documento.setNombre(educacionSuperior.getCertificadoHomologado().getOriginalFilename());
                        documento.setTipoContenido(educacionSuperior.getCertificadoHomologado().getContentType());
                        nuevaEducacionSuperior.setCertificadoHomologado(documento);
                    }
                }
                nuevaEducacionSuperior.setInstitucion(Util.obtenerEntero(educacionSuperior.getInstitucion()));
                nuevaEducacionSuperior.setTitulo(educacionSuperior.getTitulo());
                nuevaEducacionSuperior.setPrograma(educacionSuperior.getPrograma());
                nuevaEducacionSuperior.setAreaSaber(Util.obtenerEntero(educacionSuperior.getAreaSaber()));
                nuevaEducacionSuperior.setFechaTitulo(Util.obtenerFecha(educacionSuperior.getFechaTitulo()));
                if (!"".equals(educacionSuperior.getAnyoFinalizacion())) {
                    nuevaEducacionSuperior.setAnyoFinalizacion(Util.obtenerEntero(educacionSuperior.getAnyoFinalizacion()));
                }
                nuevaEducacionSuperior.setAnyoInicio(Util.obtenerEntero(educacionSuperior.getAnyoInicio()));
                nuevaEducacionSuperior.setNivel(Util.obtenerEntero(educacionSuperior.getNivel()));
                nuevaEducacionSuperior.setGraduado(educacionSuperior.isGraduado());
                if (educacionSuperior.getCertificado() != null && educacionSuperior.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(educacionSuperior.getCertificado().getBytes());
                    documento.setNombre(educacionSuperior.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(educacionSuperior.getCertificado().getContentType());
                    nuevaEducacionSuperior.setCertificado(documento);
                }
                hojaVidaIngresar.getEducacionesSuperiores().add(nuevaEducacionSuperior);
            }

            for (co.edu.fnsp.buho.entidadesVista.EducacionContinua educacionContinua : hojaVida.getEducacionesContinuas()) {
                EducacionContinua nuevaEducacionContinua = new EducacionContinua();
                nuevaEducacionContinua.setId(educacionContinua.getId());
                nuevaEducacionContinua.setTipoCapacitacion(Util.obtenerEntero(educacionContinua.getTipoCapacitacion()));
                nuevaEducacionContinua.setInstitucion(Util.obtenerEntero(educacionContinua.getInstitucion()));
                nuevaEducacionContinua.setNombreCapacitacion(educacionContinua.getNombreCapacitacion());
                nuevaEducacionContinua.setAreaSaber(Util.obtenerEntero(educacionContinua.getAreaSaber()));
                nuevaEducacionContinua.setNumeroHoras(Util.obtenerEntero(educacionContinua.getNumeroHoras()));
                nuevaEducacionContinua.setAnyo(Util.obtenerEntero(educacionContinua.getAnyo()));
                if (educacionContinua.getCertificado() != null && educacionContinua.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(educacionContinua.getCertificado().getBytes());
                    documento.setNombre(educacionContinua.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(educacionContinua.getCertificado().getContentType());
                    nuevaEducacionContinua.setCertificado(documento);
                }
                hojaVidaIngresar.getEducacionesContinuas().add(nuevaEducacionContinua);
            }

            for (co.edu.fnsp.buho.entidadesVista.Distincion distincion : hojaVida.getDistinciones()) {
                Distincion nuevaDistincion = new Distincion();
                nuevaDistincion.setId(distincion.getId());
                nuevaDistincion.setDescripcion(distincion.getDescripcion());
                nuevaDistincion.setFechaDistincion(Util.obtenerFecha(distincion.getFechaDistincion()));
                nuevaDistincion.setInstitucionOtorga(distincion.getInstitucionOtorga());
                if (distincion.getCertificado() != null && distincion.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(distincion.getCertificado().getBytes());
                    documento.setNombre(distincion.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(distincion.getCertificado().getContentType());
                    nuevaDistincion.setCertificado(documento);
                }
                hojaVidaIngresar.getDistinciones().add(nuevaDistincion);
            }

            for (co.edu.fnsp.buho.entidadesVista.ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
                ExperienciaLaboral nuevaExperienciaLaboral = new ExperienciaLaboral();
                nuevaExperienciaLaboral.setId(experienciaLaboral.getId());
                nuevaExperienciaLaboral.setActividadEconomica(Util.obtenerEntero(experienciaLaboral.getActividadEconomica()));
                nuevaExperienciaLaboral.setAreaSaber(Util.obtenerEntero(experienciaLaboral.getAreaSaber()));
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

                if (experienciaLaboral.getCertificado() != null && experienciaLaboral.getCertificado().getBytes().length > 0) {
                    documento = new Documento();
                    documento.setContenido(experienciaLaboral.getCertificado().getBytes());
                    documento.setNombre(experienciaLaboral.getCertificado().getOriginalFilename());
                    documento.setTipoContenido(experienciaLaboral.getCertificado().getContentType());
                    nuevaExperienciaLaboral.setCertificado(documento);
                }
                hojaVidaIngresar.getExperienciasLaborales().add(nuevaExperienciaLaboral);
            }

            for (co.edu.fnsp.buho.entidadesVista.ExperienciaDocencia experienciaDocencia : hojaVida.getExperienciasDocencia()) {
                ExperienciaDocencia nuevaExperienciaDocencia = new ExperienciaDocencia();
                nuevaExperienciaDocencia.setId(experienciaDocencia.getId());
                nuevaExperienciaDocencia.setFnsp(experienciaDocencia.isFnsp());
                nuevaExperienciaDocencia.setTrabajoActual(experienciaDocencia.isTrabajoActual());
                nuevaExperienciaDocencia.setInstitucion(Util.obtenerEntero(experienciaDocencia.getInstitucion()));
                for (co.edu.fnsp.buho.entidadesVista.CursoExperienciaDocencia cursoExperienciaDocencia : experienciaDocencia.getCursosExperienciaDocencia()) {
                    CursoExperienciaDocencia nuevoCursoExperienciaDocencia = new CursoExperienciaDocencia();
                    nuevoCursoExperienciaDocencia.setId(cursoExperienciaDocencia.getId());
                    nuevoCursoExperienciaDocencia.setAnyo(Util.obtenerEntero(cursoExperienciaDocencia.getAnyo()));
                    nuevoCursoExperienciaDocencia.setAreaSaber(Util.obtenerEntero(cursoExperienciaDocencia.getAreaSaber()));
                    nuevoCursoExperienciaDocencia.setModalidad(Util.obtenerEntero(cursoExperienciaDocencia.getModalidad()));
                    nuevoCursoExperienciaDocencia.setNivelEstudio(Util.obtenerEntero(cursoExperienciaDocencia.getNivelEstudio()));
                    nuevoCursoExperienciaDocencia.setNumeroHoras(Util.obtenerEntero(cursoExperienciaDocencia.getNumeroHoras()));
                    nuevoCursoExperienciaDocencia.setNombreCurso(cursoExperienciaDocencia.getNombreCurso());
                    if (cursoExperienciaDocencia.getCertificado() != null && cursoExperienciaDocencia.getCertificado().getBytes().length > 0) {
                        documento = new Documento();
                        documento.setContenido(cursoExperienciaDocencia.getCertificado().getBytes());
                        documento.setNombre(cursoExperienciaDocencia.getCertificado().getOriginalFilename());
                        documento.setTipoContenido(cursoExperienciaDocencia.getCertificado().getContentType());
                        nuevoCursoExperienciaDocencia.setCertificado(documento);
                    }
                    nuevaExperienciaDocencia.getCursosExperienciaDocencia().add(nuevoCursoExperienciaDocencia);
                }
                hojaVidaIngresar.getExperienciasDocencia().add(nuevaExperienciaDocencia);
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
        } catch (IOException exc) {
            logger.error(exc);
            throw exc;
        }
    }

    @RequestMapping(value = "/editar/{idPersona}", method = RequestMethod.GET)
    public String editar(@PathVariable long idPersona, Model model
    ) {
        List<Maestro> paises = servicioMaestro.obtenerPaises();
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Maestro> gruposEtnico = servicioMaestro.obtenerGruposEtnicos();
        List<Maestro> discapacidades = servicioMaestro.obtenerDiscapacidades();
        List<Maestro> actividadesEconomicas = servicioMaestro.obtenerActividadesEconomicas();
        List<Maestro> tiposVinculacion = servicioMaestro.obtenerTiposVinculacionUdeA();
        List<Maestro> tiposTelefono = servicioMaestro.obtenerTiposTelefono();
        List<Maestro> tiposDocumento = servicioMaestro.obtenerTiposDocumento();
        List<Maestro> nivelesIdioma = servicioMaestro.obtenerNivelesIdioma();
        List<Maestro> idiomas = servicioMaestro.obtenerIdiomas();
        List<Maestro> tiposCertificacion = servicioMaestro.obtenerTiposCertificacionIdioma();
        List<Maestro> nivelesEstudio = servicioMaestro.obtenerNivelesFormacion();
        List<Maestro> institucionesEducativas = servicioMaestro.obtenerInstitucionesEducativas();
        List<Maestro> areasSaber = servicioMaestro.obtenerAreasSaber();
        List<Maestro> tiposCapacitacion = servicioMaestro.obtenerTiposCapacitacion();
        List<Maestro> tiposInstitucion = servicioMaestro.obtenerTiposInstitucion();
        List<Maestro> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<Maestro> tiposExperiencia = servicioMaestro.obtenerTiposExperiencia();
        List<Maestro> naturalezasCargo = servicioMaestro.obtenerNaturalezasCargo();
        List<Maestro> modalidadesCurso = servicioMaestro.obtenerModalidadesCurso();

        model.addAttribute("paises", paises);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("gruposEtnico", gruposEtnico);
        model.addAttribute("discapacidades", discapacidades);
        model.addAttribute("actividadesEconomicas", actividadesEconomicas);
        model.addAttribute("tiposVinculacion", tiposVinculacion);
        model.addAttribute("tiposTelefono", tiposTelefono);
        model.addAttribute("tiposDocumento", tiposDocumento);
        model.addAttribute("nivelesIdioma", nivelesIdioma);
        model.addAttribute("idiomas", idiomas);
        model.addAttribute("tiposCertificacion", tiposCertificacion);
        model.addAttribute("nivelesEstudio", nivelesEstudio);
        model.addAttribute("institucionesEducativas", institucionesEducativas);
        model.addAttribute("areasSaber", areasSaber);
        model.addAttribute("tiposCapacitacion", tiposCapacitacion);
        model.addAttribute("tiposInstitucion", tiposInstitucion);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("tiposExperiencia", tiposExperiencia);
        model.addAttribute("naturalezasCargo", naturalezasCargo);
        model.addAttribute("modalidadesCurso", modalidadesCurso);

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
        if (hojaVida.getDocumentosSoporte().size() > 0) {
            model.addAttribute("documentosSoporteJSON", Util.obtenerDocumentosSoporteJSON(hojaVida.getDocumentosSoporte()));
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

        model.addAttribute("hojaVida", hojaVida);

        return "hojasVida/crear";
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

    @RequestMapping(value = "/certificadoEducacionContinua/{idEducacionContinua}", method = RequestMethod.GET)
    public void obtenerCertificadoEducacionContinua(@PathVariable("idEducacionContinua") int idEducacionContinua, HttpServletResponse response) throws IOException {
        Documento documento = servicioHojaVida.obtenerCertificadoEducacionContinua(idEducacionContinua);
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

    @RequestMapping(value = "/eliminar/{idPersona}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarHojaVida(@PathVariable long idPersona, Model model
    ) {
        try {
            servicioHojaVida.eliminarHojaVida(idPersona);
        } catch (Exception exc) {
            logger.error(exc);
            return "{\"resultado\":false}";
        }

        return "{\"resultado\":true}";
    }
}
