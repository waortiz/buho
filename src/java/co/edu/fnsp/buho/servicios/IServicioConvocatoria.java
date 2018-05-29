/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Evaluacion;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Preseleccionado;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioConvocatoria {

    void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria);

    Convocatoria obtenerConvocatoria(int idConvocatoria);

    void eliminarConvocatoria(int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriasCerradas();

    void actualizarConvocatoria(long idUsuario, Convocatoria convocatoria);

    Documento obtenerDocumentoConvocatoria(int idConvocatoria);

    Documento obtenerDocumentoAdenda(int idAdenda);

    void postularConvocatoria(long idPersona, int idConvocatoria) throws Exception;

    void retirarPostulacion(long idPersona, int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriasVigentes(long idPersona);

    Documento obtenerResultadoConvocatoria(int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriaValidar();

    List<HojaVida> obtenerPersonasConvocatoria(int idConvocatoria);

    List<Preseleccionado> obtenerPreseleccionados(int idConvocatoria);
    
    List<Evaluacion> obtenerEvaluaciones(int idConvocatoria);
}
