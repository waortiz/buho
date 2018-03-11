/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import java.util.List;
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

@Service("servicioHojaVida")
public class ServicioHojaVida implements IServicioHojaVida {
    @Autowired
    private PlatformTransactionManager transactionManager;
        
    @Autowired
    private IRepositorioHojaVida repositorioHojaVida;

    @Override
    public void ingresarHojaVida(long idUsuario, HojaVida hojaVida) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioHojaVida.ingresarHojaVida(idUsuario, hojaVida);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void actualizarHojaVida(long idUsuario, HojaVida hojaVida) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioHojaVida.actualizarHojaVida(idUsuario, hojaVida);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento) {
        return repositorioHojaVida.obtenerDocumentoSoporte(idPersona, idTipoDocumento);
    }

    @Override
    public List<HojaVida> obtenerHojasVida() {
        return repositorioHojaVida.obtenerHojaVida();
    }

    @Override
    public void eliminarHojaVida(long idPersona) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioHojaVida.eliminarHojaVida(idPersona);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }
    
    @Override
    public boolean existePersona(String numeroIdentificacion){
         return repositorioHojaVida.existePersona(numeroIdentificacion);
    }

    @Override
    public String obtenerNumeroIdentificacionPersona(long idPersona) {
        return repositorioHojaVida.obtenerNumeroIdentificacionPersona(idPersona);
    }

    @Override
    public HojaVida obtenerHojaVida(long idPersona) {
        return repositorioHojaVida.obtenerHojaVida(idPersona);
    }
}
