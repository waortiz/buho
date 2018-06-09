/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.CampoHojaVidaEnum;
import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.CursoExperienciaDocencia;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.Evaluacion;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Preseleccionado;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.entidades.TipoCertificacionEnum;
import co.edu.fnsp.buho.excepciones.CriteriosHabilitacionException;
import co.edu.fnsp.buho.repositorios.IRepositorioConvocatoria;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import co.edu.fnsp.buho.repositorios.IRepositorioMaestro;
import co.edu.fnsp.buho.utilidades.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */
@Service("servicioConvocatoria")
public class ServicioConvocatoria implements IServicioConvocatoria {

    @Autowired
    private IRepositorioConvocatoria repositorioConvocatoria;

    @Autowired
    private IRepositorioHojaVida repositorioHojaVida;

    @Autowired
    private IRepositorioMaestro repositorioMaestro;

    @Override
    public int ingresarConvocatoria(long idPersona, Convocatoria convocatoria) {
        return repositorioConvocatoria.ingresarConvocatoria(idPersona, convocatoria);
    }

    @Override
    public Convocatoria obtenerConvocatoria(int idConvocatoria) {
        Convocatoria convocatoria = repositorioConvocatoria.obtenerConvocatoria(idConvocatoria);
        this.estableverTextoCriteriosHabilitantes(convocatoria.getCriteriosHabilitantes());
        
        return convocatoria;
    }

    @Override
    public void eliminarConvocatoria(int idConvocatoria) {
        repositorioConvocatoria.eliminarConvocatoria(idConvocatoria);
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriasCerradas() {
        return repositorioConvocatoria.obtenerConvocatoriasCerradas();
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriasVigentes(long idPersona) {
        return repositorioConvocatoria.obtenerConvocatoriasVigentes(idPersona);
    }

    @Override
    public void actualizarConvocatoria(Convocatoria convocatoria) {
        repositorioConvocatoria.actualizarConvocatoria(convocatoria);
    }

    @Override
    public Documento obtenerDocumentoConvocatoria(int idConvocatoria) {
        return repositorioConvocatoria.obtenerDocumentoConvocatoria(idConvocatoria);
    }

    @Override
    public Documento obtenerDocumentoAdenda(int idAdenda) {
        return repositorioConvocatoria.obtenerDocumentoAdenda(idAdenda);
    }

    @Override
    public void postularConvocatoria(long idPersona, int idConvocatoria)
            throws CriteriosHabilitacionException {
        Convocatoria convocatoria = repositorioConvocatoria.obtenerConvocatoria(idConvocatoria);
        HojaVida hojaVida = repositorioHojaVida.obtenerHojaVida(idPersona);

        StringBuilder errores = new StringBuilder();

        //Validar tiempo mínimo experiencia
        if (convocatoria.getAnyosMinimosExperiencia() != null && convocatoria.getAnyosMinimosExperiencia().length() > 0) {
            int anyosMinimosExperiencia = Util.obtenerEntero(convocatoria.getAnyosMinimosExperiencia());
            int anyosExperiencia = 0;
            for (ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
                Date fechaRetiro = new Date();
                if (experienciaLaboral.getFechaRetiro() != null) {
                    fechaRetiro = experienciaLaboral.getFechaRetiro();
                }
                anyosExperiencia = Util.getAnyos(experienciaLaboral.getFechaIngreso(), fechaRetiro) + anyosExperiencia;
            }
            if (anyosExperiencia < anyosMinimosExperiencia) {
                errores.append("No cumple el tiempo mínimo de experiencia.\n");
            }
        }

        //Validar experiencia
        for (AnyosExperiencia anyoExperiencia : convocatoria.getAnyosExperiencias()) {
            int anyosExperiencia = 0;
            for (ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
                if (anyoExperiencia.getNucleoBasicoConocimiento() == experienciaLaboral.getNucleoBasicoConocimiento()) {
                    Date fechaRetiro = new Date();
                    if (experienciaLaboral.getFechaRetiro() != null) {
                        fechaRetiro = experienciaLaboral.getFechaRetiro();
                    }
                    anyosExperiencia = Util.getAnyos(experienciaLaboral.getFechaIngreso(), fechaRetiro) + anyosExperiencia;
                }
            }
            if (anyosExperiencia < anyoExperiencia.getAnyos()) {
                errores.append("No cumple los años de experiencia.\n");
            }
        }

        //Validar Idiomas
        for (IdiomaConvocatoria idiomaConvocatoria : convocatoria.getIdiomas()) {
            double puntaje = 0;
            for (Idioma idioma : hojaVida.getIdiomas()) {
                if (idiomaConvocatoria.getIdioma() == idioma.getIdioma()
                        && idiomaConvocatoria.getTipoCertificacion() == idioma.getTipoCertificacion()) {
                    if (idiomaConvocatoria.getTipoCertificacion() == TipoCertificacionEnum.TIPO_CERTIFICACION_OTRO.tipoCertificacion()) {
                        if (idiomaConvocatoria.getOtraCertificacion().equalsIgnoreCase(idioma.getOtraCertificacion())) {
                            puntaje = idioma.getPuntajeCertificacion();
                        }
                    } else {
                        puntaje = idioma.getPuntajeCertificacion();
                    }
                }
            }
            if (puntaje < idiomaConvocatoria.getPuntajeMinimoCertificacion()) {
                errores.append("No cumple los idiomas.\n");
            }
        }

        //Validar Formación
        for (ProgramaConvocatoria programaConvocatoria : convocatoria.getProgramas()) {
            boolean existe = false;
            for (EducacionSuperior educacionSuperior : hojaVida.getEducacionesSuperiores()) {
                if (programaConvocatoria.getNivelFormacion() == educacionSuperior.getNivel()
                        && programaConvocatoria.getNucleoBasicoConocimiento() == educacionSuperior.getNucleoBasicoConocimiento()
                        && programaConvocatoria.getPrograma() == educacionSuperior.getPrograma()) {
                    existe = true;
                }
            }
            if (!existe) {
                errores.append("No cumple la formación.\n");
            }
        }

        //Validar Formación Continua
        for (EducacionContinuaConvocatoria educacionContinuaConvocatoria : convocatoria.getEducacionesContinuas()) {
            boolean existe = false;
            for (EducacionContinua educacionContinua : hojaVida.getEducacionesContinuas()) {
                if (educacionContinuaConvocatoria.getNucleoBasicoConocimiento() == educacionContinua.getNucleoBasicoConocimiento()
                        && educacionContinuaConvocatoria.getTipoCapacitacion() == educacionContinua.getTipoCapacitacion()) {
                    existe = true;
                }
            }
            if (!existe) {
                errores.append("No cumple la educación continua.\n");
            }
        }

        //Validar Otros Criterios
        for (CriterioHabilitanteConvocatoria criterioHabilitanteConvocatoria : convocatoria.getCriteriosHabilitantes()) {
            if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_ACTIVIDAD_ECONOMICA.campoHojaVida()) {
                if (hojaVida.getActividadEconomica() == null || !hojaVida.getActividadEconomica().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple la actividad económica.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_APELLIDOS.campoHojaVida()) {
                if (hojaVida.getApellidos() == null || !hojaVida.getApellidos().toLowerCase().contains(criterioHabilitanteConvocatoria.getValor().toLowerCase())) {
                    errores.append("No cumple los apellido.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_NOMBRES.campoHojaVida()) {
                if (hojaVida.getNombres() == null || !hojaVida.getNombres().toLowerCase().contains(criterioHabilitanteConvocatoria.getValor().toLowerCase())) {
                    errores.append("No cumple el nombre.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_CIUDAD_RESIDENCIA.campoHojaVida()) {
                if (hojaVida.getCiudadResidencia() == null || !hojaVida.getCiudadResidencia().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple la ciudad de residencia.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DIRECCION.campoHojaVida()) {
                if (hojaVida.getDireccion() == null || !hojaVida.getDireccion().toLowerCase().contains(criterioHabilitanteConvocatoria.getValor().toLowerCase())) {
                    errores.append("No cumple la dirección.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISCAPACIDAD.campoHojaVida()) {
                if (hojaVida.getDiscapacidad() == null || !hojaVida.getDiscapacidad().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple la discapacidad.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISPONE_RUT.campoHojaVida()) {
                if (hojaVida.isDisponeRUT() != Boolean.getBoolean(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el RUT.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISPONIBILIDAD_VIAJAR.campoHojaVida()) {
                if (hojaVida.isDisponibilidadViajar() != Boolean.getBoolean(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple la disponibilida de viajar.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_EGRESADO_UDEA.campoHojaVida()) {
                if (hojaVida.isEgresadoUDEA() != Boolean.getBoolean(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple egresado de la U. de A.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_EMPLEADO_UDEA.campoHojaVida()) {
                if (hojaVida.isEmpleadoUDEA() != Boolean.getBoolean(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple empleado U. de A.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_FECHA_EXPEDICION.campoHojaVida()) {
                if (hojaVida.getFechaExpedicion().compareTo(Util.obtenerFecha(criterioHabilitanteConvocatoria.getValor())) <= 0) {
                    errores.append("No cumple la fecha de expedición.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_FECHA_NACIMIENTO.campoHojaVida()) {
                if (hojaVida.getFechaNacimiento().compareTo(Util.obtenerFecha(criterioHabilitanteConvocatoria.getValor())) <= 0) {
                    errores.append("No cumple la fecha de nacimiento.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_GRUPO_ETNICO.campoHojaVida()) {
                if (hojaVida.getGrupoEtnico() == null || !hojaVida.getGrupoEtnico().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el grupo étnico.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_LIBRETA_MILITAR.campoHojaVida()) {
                if (hojaVida.getLibretaMilitar() == null || !hojaVida.getLibretaMilitar().toLowerCase().contains(criterioHabilitanteConvocatoria.getValor().toLowerCase())) {
                    errores.append("No cumple la libreta militar.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_LUGAR_EXPEDICION.campoHojaVida()) {
                if (hojaVida.getLugarExpedicion() == null || !hojaVida.getLugarExpedicion().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el lugar de nacimiento.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_LUGAR_NACIMIENTO.campoHojaVida()) {
                if (hojaVida.getLugarNacimiento() == null || !hojaVida.getLugarNacimiento().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple lugar de nacimiento.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_NACIONALIDAD.campoHojaVida()) {
                if (hojaVida.getNacionalidad() == null || !hojaVida.getNacionalidad().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple la nacionalidad.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_SEXO.campoHojaVida()) {
                if (hojaVida.getSexo() == null || !hojaVida.getSexo().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el sexo.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_ID.campoHojaVida()) {
                if (!hojaVida.getTipoIdentificacion().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el tipo de identificación.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_VINCULACION.campoHojaVida()) {
                if (hojaVida.getTipoVinculacion() == null || !hojaVida.getTipoVinculacion().equalsIgnoreCase(criterioHabilitanteConvocatoria.getValor())) {
                    errores.append("No cumple el tipo de vinculación.\n");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_NUMERO_ID.campoHojaVida()) {
                if (hojaVida.getNumeroIdentificacion() == null || !hojaVida.getNumeroIdentificacion().toLowerCase().contains(criterioHabilitanteConvocatoria.getValor().toLowerCase())) {
                    errores.append("No cumple el número de identificación.\n");
                }
            }
        }

        if (errores.length() > 0) {
            throw new CriteriosHabilitacionException(errores.toString());
        }

        repositorioConvocatoria.postularConvocatoria(idPersona, idConvocatoria);
    }

    @Override
    public void retirarPostulacion(long idPersona, int idConvocatoria) {
        repositorioConvocatoria.retirarPostulacion(idPersona, idConvocatoria);
    }

    @Override
    public Documento obtenerResultadoConvocatoria(int idConvocatoria) {
        return repositorioConvocatoria.obtenerResultadoConvocatoria(idConvocatoria);
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriaValidar() {
        return repositorioConvocatoria.obtenerConvocatoriaValidar();
    }

    @Override
    public List<HojaVida> obtenerPersonasConvocatoria(int idConvocatoria) {
        return repositorioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
    }

    @Override
    public List<Preseleccionado> obtenerPreseleccionados(int idConvocatoria) {
        List<Preseleccionado> preselecionados = new ArrayList<>();
        List<HojaVida> hojasVida = repositorioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
        for (HojaVida hojaVida : hojasVida) {
            HojaVida hojaVidaEvaluar = repositorioHojaVida.obtenerHojaVida(hojaVida.getIdPersona());
            int tiempoExperienciaLaboralSectorSalud = 0;
            int tiempoExperienciaDocente = 0;
            for (ExperienciaLaboral experienciaLaboral : hojaVidaEvaluar.getExperienciasLaborales()) {
                if (experienciaLaboral.isCertificadoValidado() && experienciaLaboral.getNucleoBasicoConocimiento() == 52) {
                    Date fechaRetiro = new Date();
                    if (experienciaLaboral.getFechaRetiro() != null) {
                        fechaRetiro = experienciaLaboral.getFechaRetiro();
                    }
                    tiempoExperienciaLaboralSectorSalud = Util.getAnyos(experienciaLaboral.getFechaIngreso(), fechaRetiro) + tiempoExperienciaLaboralSectorSalud;
                }
            }
            for (ExperienciaDocencia experienciaDocencia : hojaVidaEvaluar.getExperienciasDocencia()) {
                for (CursoExperienciaDocencia cursoExperienciaDocencia : experienciaDocencia.getCursosExperienciaDocencia()) {
                    if (cursoExperienciaDocencia.isCertificadoValidado()) {
                        tiempoExperienciaDocente = cursoExperienciaDocencia.getNumeroHoras() + tiempoExperienciaDocente;
                    }
                }
            }
            Preseleccionado preseleccionado = new Preseleccionado();
            preseleccionado.setIdPersona(hojaVida.getIdPersona());
            preseleccionado.setNumeroIdentificacion(hojaVida.getNumeroIdentificacion());
            preseleccionado.setSexo(hojaVida.getNombreSexo());
            preseleccionado.setPerfil(hojaVida.getPerfil());
            preseleccionado.setTiempoExperienciaLaboral(tiempoExperienciaLaboralSectorSalud);
            preseleccionado.setTiempoExperienciaDocente(tiempoExperienciaDocente);
            preselecionados.add(preseleccionado);
        }

        return preselecionados;
    }

    @Override
    public List<Evaluacion> obtenerEvaluaciones(int idConvocatoria) {
        List<Evaluacion> evaluaciones = new ArrayList<>();
        List<HojaVida> hojasVida = repositorioConvocatoria.obtenerPersonasConvocatoria(idConvocatoria);
        for (HojaVida hojaVida : hojasVida) {
            HojaVida hojaVidaEvaluar = repositorioHojaVida.obtenerHojaVida(hojaVida.getIdPersona());
            int formacionAcademica = 0;
            int capacitacionDocenciaPedagogia = 0;
            int experienciaDocenciaInstitucionesEducacionSuperior = 0;
            int tiempoExperienciaDocencia = 0;
            int experienciaExtension = 0;
            int experienciaInvestigacion = 0;
            int experienciaProfesionalSectorSalud = 0;
            int tiempoExperienciaLaboralSectorSalud = 0;

            //1. Formación Académica
            for (EducacionSuperior educacionSuperior : hojaVidaEvaluar.getEducacionesSuperiores()) {
                if (educacionSuperior.isCertificadoValidado()) {
                    if (educacionSuperior.getNivel() == 6) {
                        if (formacionAcademica < 15) {
                            formacionAcademica = 15;
                        }
                    } else if (educacionSuperior.getNivel() == 7) {
                        if (formacionAcademica < 25) {
                            formacionAcademica = 25;
                        }
                    }
                    if (educacionSuperior.getNivel() == 8 || educacionSuperior.getNivel() == 9) {
                        formacionAcademica = 30;
                        break;
                    }

                    if (educacionSuperior.getNucleoBasicoConocimiento() == 17) {
                        capacitacionDocenciaPedagogia = 10;
                    }
                }
            }

            //2. Capacitación docencia
            for (EducacionContinua educacionContinua : hojaVidaEvaluar.getEducacionesContinuas()) {
                if (educacionContinua.isCertificadoValidado()) {
                    if (educacionContinua.getNucleoBasicoConocimiento() == 17) {
                        capacitacionDocenciaPedagogia = 10;
                        break;
                    }
                }
            }

            //3. Experiencia docencia
            for (ExperienciaDocencia experienciaDocencia : hojaVidaEvaluar.getExperienciasDocencia()) {
                for (CursoExperienciaDocencia cursoExperienciaDocencia : experienciaDocencia.getCursosExperienciaDocencia()) {
                    if (cursoExperienciaDocencia.isCertificadoValidado()) {
                        tiempoExperienciaDocencia = cursoExperienciaDocencia.getNumeroHoras() + tiempoExperienciaDocencia;
                    }
                }
            }
            if (tiempoExperienciaDocencia >= 64 && tiempoExperienciaDocencia <= 200) {
                experienciaDocenciaInstitucionesEducacionSuperior = 20;
            } else if (tiempoExperienciaDocencia >= 201 && tiempoExperienciaDocencia <= 500) {
                experienciaDocenciaInstitucionesEducacionSuperior = 30;
            }
            if (tiempoExperienciaDocencia > 500) {
                experienciaDocenciaInstitucionesEducacionSuperior = 40;
            }

            //Experiencia en investigación
            if (hojaVida.isInvestigadorReconocidoColciencias() && hojaVida.isUrlCVLACValidada()) {
                experienciaInvestigacion = 8;
            }

            //Experiencia Extensión
            for (ExperienciaLaboral experienciaLaboral : hojaVidaEvaluar.getExperienciasLaborales()) {
                if (experienciaLaboral.isCertificadoValidado()) {
                    if (experienciaLaboral.getNucleoBasicoConocimiento() == 52) {
                        Date fechaRetiro = new Date();
                        if (experienciaLaboral.getFechaRetiro() != null) {
                            fechaRetiro = experienciaLaboral.getFechaRetiro();
                        }
                        tiempoExperienciaLaboralSectorSalud = Util.getAnyos(experienciaLaboral.getFechaIngreso(), fechaRetiro) + tiempoExperienciaLaboralSectorSalud;
                    }
                    if (experienciaLaboral.isExtension()) {
                        experienciaExtension = 7;
                    }
                }
            }
            if (tiempoExperienciaLaboralSectorSalud >= 1 && tiempoExperienciaLaboralSectorSalud <= 3) {
                experienciaProfesionalSectorSalud = 2;
            }
            if (tiempoExperienciaLaboralSectorSalud >= 4 && tiempoExperienciaLaboralSectorSalud <= 6) {
                experienciaProfesionalSectorSalud = 3;
            }
            if (tiempoExperienciaLaboralSectorSalud > 6) {
                experienciaProfesionalSectorSalud = 5;
            }

            Evaluacion evaluacion = new Evaluacion();
            evaluacion.setIdPersona(hojaVida.getIdPersona());
            evaluacion.setNumeroIdentificacion(hojaVida.getNumeroIdentificacion());
            evaluacion.setFormacionAcademica(formacionAcademica);
            evaluacion.setCapacitacionDocenciaPedagogia(capacitacionDocenciaPedagogia);
            evaluacion.setExperienciaDocenciaInstitucionesEducacionSuperior(experienciaDocenciaInstitucionesEducacionSuperior);
            evaluacion.setExperienciaInvestigacion(experienciaInvestigacion);
            evaluacion.setExperienciaExtension(experienciaExtension);
            evaluacion.setExperienciaProfesionalSectorSalud(experienciaProfesionalSectorSalud);
            evaluacion.setTotal(formacionAcademica
                    + capacitacionDocenciaPedagogia
                    + experienciaDocenciaInstitucionesEducacionSuperior
                    + experienciaInvestigacion
                    + experienciaExtension
                    + experienciaProfesionalSectorSalud);
            evaluaciones.add(evaluacion);
        }

        Collections.sort(evaluaciones, new Comparator<Evaluacion>() {
            @Override
            public int compare(Evaluacion o1, Evaluacion o2) {
                return o2.getTotal() - o1.getTotal();
            }
        });
        
        return evaluaciones;
    }

    @Override
    public void guardarAdenda(int idConvocatoria, long idPersona, Adenda adenda) {
        repositorioConvocatoria.guardarAdenda(idConvocatoria, idPersona, adenda);
    }

    @Override
    public List<Adenda> obtenerAdendas(int idConvocatoria) {
        return repositorioConvocatoria.obtenerAdendas(idConvocatoria);
    }

    @Override
    public void eliminarAdenda(int idAdenda) {
        repositorioConvocatoria.eliminarAdenda(idAdenda);
    }

    @Override
    public void guardarAnyosExperiencia(int idConvocatoria, AnyosExperiencia anyosExperiencia) {
        repositorioConvocatoria.guardarAnyosExperiencia(idConvocatoria, anyosExperiencia);
    }

    @Override
    public List<AnyosExperiencia> obtenerAnyosExperiencias(int idConvocatoria) {
        return repositorioConvocatoria.obtenerAnyosExperiencias(idConvocatoria);
    }

    @Override
    public void eliminarAnyosExperiencia(int idAnyosExperiencia) {
        repositorioConvocatoria.eliminarAnyosExperiencia(idAnyosExperiencia);
    }

    @Override
    public void guardarIdioma(int idConvocatoria, long idPersona, IdiomaConvocatoria idiomaConvocatoria) {
        repositorioConvocatoria.guardarIdioma(idConvocatoria, idPersona, idiomaConvocatoria);
    }

    @Override
    public List<IdiomaConvocatoria> obtenerIdiomas(int idConvocatoria) {
        return repositorioConvocatoria.obtenerIdiomas(idConvocatoria);
    }

    @Override
    public void eliminarIdioma(int idIdioma) {
        repositorioConvocatoria.eliminarIdioma(idIdioma);
    }

    @Override
    public void guardarPrograma(int idConvocatoria, long idPersona, ProgramaConvocatoria programaConvocatoria) {
        repositorioConvocatoria.guardarPrograma(idConvocatoria, idPersona, programaConvocatoria);
    }

    @Override
    public List<ProgramaConvocatoria> obtenerProgramas(int idConvocatoria) {
        return repositorioConvocatoria.obtenerProgramas(idConvocatoria);
    }

    @Override
    public void eliminarPrograma(int idPrograma) {
        repositorioConvocatoria.eliminarPrograma(idPrograma);
    }

    @Override
    public void guardarEducacionContinua(int idConvocatoria, long idPersona, EducacionContinuaConvocatoria educacionContinuaConvocatoria) {
        repositorioConvocatoria.guardarEducacionContinua(idConvocatoria, idPersona, educacionContinuaConvocatoria);
    }

    @Override
    public List<EducacionContinuaConvocatoria> obtenerEducacionesContinuas(int idConvocatoria) {
        return repositorioConvocatoria.obtenerEducacionesContinuas(idConvocatoria);
    }

    @Override
    public void eliminarEducacionContinua(int idEducacionContinua) {
        repositorioConvocatoria.eliminarEducacionContinua(idEducacionContinua);
    }

    @Override
    public void guardarCriterioHabilitante(int idConvocatoria, long idPersona, CriterioHabilitanteConvocatoria criterioHabilitanteConvocatoria) {
        repositorioConvocatoria.guardarCriterioHabilitante(idConvocatoria, idPersona, criterioHabilitanteConvocatoria);
    }

    @Override
    public List<CriterioHabilitanteConvocatoria> obtenerCriteriosHabilitantes(int idConvocatoria) {
        List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = repositorioConvocatoria.obtenerCriteriosHabilitantes(idConvocatoria);
        this.estableverTextoCriteriosHabilitantes(criteriosHabilitantes);
        
        return criteriosHabilitantes;
    }

    @Override
    public void eliminarCriterioHabilitante(int idCriterioHabilitante) {
        repositorioConvocatoria.eliminarCriterioHabilitante(idCriterioHabilitante);
    }
    
    private void estableverTextoCriteriosHabilitantes(List<CriterioHabilitanteConvocatoria> criteriosHabilitantes) {
        Maestro maestro = null;
        for (CriterioHabilitanteConvocatoria criterioHabilitanteConvocatoria : criteriosHabilitantes) {
            criterioHabilitanteConvocatoria.setTexto(criterioHabilitanteConvocatoria.getValor());
            if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_ACTIVIDAD_ECONOMICA.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_VINCULACION.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_NACIONALIDAD.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_GRUPO_ETNICO.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISCAPACIDAD.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_ID.campoHojaVida()) {

                if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_ACTIVIDAD_ECONOMICA.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerActividadEconomica(Util.obtenerEntero(criterioHabilitanteConvocatoria.getValor()));
                } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_VINCULACION.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerTipoVinculacionUdeA(Util.obtenerEntero(criterioHabilitanteConvocatoria.getValor()));
                } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_NACIONALIDAD.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerPais(Util.obtenerEntero(criterioHabilitanteConvocatoria.getValor()));
                } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_GRUPO_ETNICO.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerGrupoEtnico(Util.obtenerEntero(criterioHabilitanteConvocatoria.getValor()));
                } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISCAPACIDAD.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerDiscapacidad(Util.obtenerEntero(criterioHabilitanteConvocatoria.getValor()));
                } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_TIPO_ID.campoHojaVida()) {
                    maestro = repositorioMaestro.obtenerTipoIdentificacion(criterioHabilitanteConvocatoria.getValor());
                }
                if (maestro != null) {
                    criterioHabilitanteConvocatoria.setTexto(maestro.getNombre());
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_LUGAR_EXPEDICION.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_CIUDAD_RESIDENCIA.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_LUGAR_NACIMIENTO.campoHojaVida()) {
                maestro = repositorioMaestro.obtenerMunicipio(criterioHabilitanteConvocatoria.getValor());
                if (maestro != null) {
                    criterioHabilitanteConvocatoria.setTexto(maestro.getNombre());
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_EGRESADO_UDEA.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISPONE_RUT.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_DISPONIBILIDAD_VIAJAR.campoHojaVida()
                    || criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_EMPLEADO_UDEA.campoHojaVida()) {
                if (Boolean.parseBoolean(criterioHabilitanteConvocatoria.getValor())) {
                    criterioHabilitanteConvocatoria.setTexto("Sí");
                } else {
                    criterioHabilitanteConvocatoria.setTexto("No");
                }
            } else if (criterioHabilitanteConvocatoria.getCampoHojaVida() == CampoHojaVidaEnum.PE_SEXO.campoHojaVida()) {
                if (criterioHabilitanteConvocatoria.getValor().equalsIgnoreCase("1")) {
                    criterioHabilitanteConvocatoria.setTexto("Masculino");
                } else {
                    criterioHabilitanteConvocatoria.setTexto("Femenino");
                }
            }
        }

    }
}
