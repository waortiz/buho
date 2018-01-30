/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioConvocatoria {

    void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria);

    Convocatoria obtenerConvocatoria(int idConvocatoria);

    void eliminarConvocatoria(int idConvocatoria);

    List<Convocatoria> obtenerConvocatorias();

    void actualizarConvocatoria(Convocatoria convocatoria);

    Documento obtenerDocumentoConvocatoria(int idConvocatoria);

    Documento obtenerDocumentoAdenda(int idAdenda);
}
