/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Maestro;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioMaestro {

    List<Maestro> obtenerTiposIdentificacion();
    List<Maestro> obtenerActividadesEconomicas();
    List<Maestro> obtenerAreasSaber();
    List<Maestro> obtenerAreas();
    List<Maestro> obtenerCargos();
    List<Maestro> obtenerDedicaciones();
    List<Maestro> obtenerDepartamentos(int idPais);
    List<Maestro> obtenerDiscapacidades();
    List<Maestro> obtenerGruposEtnicos();
    List<Maestro> obtenerIdiomas();
    List<Maestro> obtenerInstitucionesEducativas();
    List<Maestro> obtenerMunicipios(String codigoDepartamento);
    List<Maestro> obtenerNivelesFormacion();
    List<Maestro> obtenerNivelesIdioma();
    List<Maestro> obtenerPaises();
    List<Maestro> obtenerSedes();
    List<Maestro> obtenerProgramas(int idSede);
    List<Maestro> obtenerTiposAdenda();
    List<Maestro> obtenerTiposCapacitacion();
    List<Maestro> obtenerTiposContrato();
    List<Maestro> obtenerTiposConvocatoria();
    List<Maestro> obtenerTiposDocumento();
    List<Maestro> obtenerTiposExperiencia();
    List<Maestro> obtenerTiposInstitucion();
    List<Maestro> obtenerTiposTelefono();
    List<Maestro> obtenerTiposVinculacionUdeA();
    List<Maestro> obtenerCriteriosHabilitantes();
    List<Maestro> obtenerCriteriosEvaluacion();
    List<Maestro> obtenerTiposCertificacionIdioma() ;
    List<Maestro> obtenerNaturalezasCargo();
}
