/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.entidades.TipoCertificacionEnum;
import co.edu.fnsp.buho.repositorios.IRepositorioConvocatoria;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import co.edu.fnsp.buho.utilidades.Util;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 *
 * @author William
 */
@Service("servicioConvocatoria")
public class ServicioConvocatoria implements IServicioConvocatoria {

    @Autowired
    private PlatformTransactionManager transactionManager;

    @Autowired
    private IRepositorioConvocatoria repositorioConvocatoria;

    @Autowired
    private IRepositorioHojaVida repositorioHojaVida;

    @Override
    public void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioConvocatoria.ingresarConvocatoria(idUsuario, convocatoria);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public Convocatoria obtenerConvocatoria(int idConvocatoria) {
        return repositorioConvocatoria.obtenerConvocatoria(idConvocatoria);
    }

    @Override
    public void eliminarConvocatoria(int idConvocatoria) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioConvocatoria.eliminarConvocatoria(idConvocatoria);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public List<Convocatoria> obtenerConvocatorias(long idUsuario) {
        return repositorioConvocatoria.obtenerConvocatorias(idUsuario);
    }

    @Override
    public void actualizarConvocatoria(long idUsuario, Convocatoria convocatoria) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioConvocatoria.actualizarConvocatoria(idUsuario, convocatoria);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
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
            throws Exception {
        Convocatoria convocatoria = repositorioConvocatoria.obtenerConvocatoria(idConvocatoria);
        HojaVida hojaVida = repositorioHojaVida.obtenerHojaVida(idPersona);

        //Validar tiempo mínimo experiencia
        if (convocatoria.getAnyosMinimosExperiencia() != null && convocatoria.getAnyosMinimosExperiencia().length() > 0) {
            try {
                int anyosMinimosExperiencia = Util.obtenerEntero(convocatoria.getAnyosMinimosExperiencia());
                int anyosExperiencia = 0;
                for (ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
                    Date fechaRetiro = new Date();
                    if (experienciaLaboral.getFechaRetiro() != null) {
                        fechaRetiro = experienciaLaboral.getFechaRetiro();
                    }
                    anyosExperiencia = Util.getAnyos(fechaRetiro, experienciaLaboral.getFechaIngreso()) + anyosExperiencia;
                }
                if (anyosExperiencia < anyosMinimosExperiencia) {
                    throw new Exception();
                }
            } catch (ParseException ex) {
                Logger.getLogger(ServicioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
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
                    anyosExperiencia = Util.getAnyos(fechaRetiro, experienciaLaboral.getFechaIngreso()) + anyosExperiencia;
                }
            }
            if (anyosExperiencia < anyoExperiencia.getAnyos()) {
                throw new Exception();
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
                throw new Exception();
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
                throw new Exception();
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
                throw new Exception();
            }
        }

        repositorioConvocatoria.postularConvocatoria(idPersona, idConvocatoria);
    }

    @Override
    public void retirarPostulacion(long idPersona, int idConvocatoria) {
        repositorioConvocatoria.retirarPostulacion(idPersona, idConvocatoria);
    }
}
