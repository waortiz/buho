/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.CampoHojaVida;
import co.edu.fnsp.buho.entidades.Ciudad;
import co.edu.fnsp.buho.entidades.Institucion;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Programa;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioMaestro {
    List<Maestro> obtenerTiposIdentificacion();
    List<Maestro> obtenerActividadesEconomicas();
    List<Maestro> obtenerNucleosBasicosConocimiento();
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
    List<Maestro> obtenerTiposAdenda();
    List<Maestro> obtenerTiposCapacitacion();
    List<Maestro> obtenerTiposCertificacionIdioma();
    List<Maestro> obtenerTiposContrato();
    List<Maestro> obtenerTiposConvocatoria();
    List<Maestro> obtenerTiposDocumento();
    List<Maestro> obtenerTiposExperiencia();
    List<Maestro> obtenerTiposInstitucion();
    List<Maestro> obtenerTiposTelefono();
    List<Maestro> obtenerTiposVinculacionUdeA();
    List<Maestro> obtenerSedes();
    List<Maestro> obtenerProgramas(int idSede);
    List<Maestro> obtenerCriteriosHabilitantes();
    List<Maestro> obtenerCriteriosEvaluacion();
    List<Maestro> obtenerNaturalezasCargo();
    List<Maestro> obtenerModalidadesCurso();
    List<Maestro> obtenerTiposInvestigador();
    List<Maestro> obtenerTiposAutorArticulo();
    List<Maestro> obtenerClasesPatente();
    List<Maestro> obtenerTiposProductosConocimiento();
    List<Maestro> obtenerTiposPatente();
    List<Programa> obtenerProgramasInstitucion(int institucion, int nivel);
    List<Maestro> obtenerCapacitaciones(Integer tipoCapacitacion, Integer nucleoBasicoConocimiento);
    List<CampoHojaVida> obtenerCamposHojaVida();
    int ingresarProgramaInstitucion(Programa programa);
    Ciudad ingresarCiudad(Ciudad ciudad);
    List<Maestro> obtenerInstitucionesEducativasExterior();
    List<Maestro> obtenerInstitucionesEducativasColombianas();
    List<Programa> obtenerProgramasNucleoBasicoConocimiento(int nucleoBasicoConocimiento);
    int ingresarInstitucion(Institucion institucion);
    Maestro obtenerMunicipio(String codigoMunicipio);
    Maestro obtenerActividadEconomica(int id);
    Maestro obtenerTipoVinculacionUdeA(int id);
    Maestro obtenerPais(int id);
    Maestro obtenerGrupoEtnico(int id);
    Maestro obtenerDiscapacidad(int id);
    Maestro obtenerTipoIdentificacion(String id);
    List<Maestro> obtenerProgramasEducacionesContinuas();
    List<Maestro> obtenerCursosDocencia();
    List<Maestro> obtenerInstitucionesDistinciones();
    List<Maestro> obtenerTitulos();
}
