/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.repositorios.IRepositorioConvocatoria;
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
@Service("servicioConvocatoria")
public class ServicioConvocatoria implements IServicioConvocatoria {
    @Autowired
    private PlatformTransactionManager transactionManager;

    @Autowired
    private IRepositorioConvocatoria repositorioConvocatoria;

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
    public void postularConvocatoria(long idPersona, int idConvocatoria) {
        repositorioConvocatoria.postularConvocatoria(idPersona, idConvocatoria);
    }

    @Override
    public void retirarPostulacion(long idPersona, int idConvocatoria) {
        repositorioConvocatoria.retirarPostulacion(idPersona, idConvocatoria);
    }
}
