/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioConvocatoria {

    void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria);

    void actualizarConvocatoria(Convocatoria convocatoria);

    Convocatoria obtenerConvocatoria(int idConvocatoria);

    void eliminarConvocatoria(int idConvocatoria);

    List<Convocatoria> obtenerConvocatorias();

    Documento obtenerDocumentoConvocatoria(int idConvocatoria);

    Documento obtenerDocumentoAdenda(int idAdenda);
}
