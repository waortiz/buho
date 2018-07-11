/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.CampoHojaVida;
import co.edu.fnsp.buho.entidades.Ciudad;
import co.edu.fnsp.buho.entidades.Institucion;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Programa;
import co.edu.fnsp.buho.repositorios.IRepositorioMaestro;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */

@Service("servicioMaestro")
public class ServicioMaestro implements IServicioMaestro {

    @Autowired
    private IRepositorioMaestro repositorioMaestro;

    @Override
    public List<Maestro> obtenerTiposIdentificacion() {
        return repositorioMaestro.obtenerTiposIdentificacion();
    }

    @Override
    public List<Maestro> obtenerActividadesEconomicas() {
        return repositorioMaestro.obtenerActividadesEconomicas();
    }

    @Override
    public List<Maestro> obtenerNucleosBasicosConocimiento() {
        return repositorioMaestro.obtenerNucleosBasicosConocimiento();
    }

    @Override
    public List<Maestro> obtenerCargos() {
        return repositorioMaestro.obtenerCargos();
    }

    @Override
    public List<Maestro> obtenerDedicaciones() {
        return repositorioMaestro.obtenerDedicaciones();
    }

    @Override
    public List<Maestro> obtenerDepartamentos(int idPais) {
        return repositorioMaestro.obtenerDepartamentos(idPais);
    }

    @Override
    public List<Maestro> obtenerDiscapacidades() {
        return repositorioMaestro.obtenerDiscapacidades();
    }

    @Override
    public List<Maestro> obtenerGruposEtnicos() {
        return repositorioMaestro.obtenerGruposEtnicos();
    }

    @Override
    public List<Maestro> obtenerIdiomas() {
        return repositorioMaestro.obtenerIdiomas();
    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativas() {
        return repositorioMaestro.obtenerInstitucionesEducativas();
    }

    @Override
    public List<Maestro> obtenerMunicipios(String codigoDepartamento) {
        return repositorioMaestro.obtenerMunicipios(codigoDepartamento);
    }

    @Override
    public List<Maestro> obtenerNivelesFormacion() {
        return repositorioMaestro.obtenerNivelesFormacion();
    }

    @Override
    public List<Maestro> obtenerPaises() {
        return repositorioMaestro.obtenerPaises();
    }

    @Override
    public List<Maestro> obtenerTiposAdenda() {
        return repositorioMaestro.obtenerTiposAdenda();
    }

    @Override
    public List<Maestro> obtenerTiposCapacitacion() {
        return repositorioMaestro.obtenerTiposCapacitacion();
    }

    @Override
    public List<Maestro> obtenerTiposContrato() {
        return repositorioMaestro.obtenerTiposContrato();
    }

    @Override
    public List<Maestro> obtenerTiposConvocatoria() {
        return repositorioMaestro.obtenerTiposConvocatoria();
    }

    @Override
    public List<Maestro> obtenerTiposDocumento() {
        return repositorioMaestro.obtenerTiposDocumento();
    }

    @Override
    public List<Maestro> obtenerTiposExperiencia() {
        return repositorioMaestro.obtenerTiposExperiencia();
    }

    @Override
    public List<Maestro> obtenerTiposInstitucion() {
        return repositorioMaestro.obtenerTiposInstitucion();
    }

    @Override
    public List<Maestro> obtenerTiposTelefono() {
        return repositorioMaestro.obtenerTiposTelefono();
    }

    @Override
    public List<Maestro> obtenerTiposVinculacionUdeA() {
        return repositorioMaestro.obtenerTiposVinculacionUdeA();
    }

    @Override
    public List<Maestro> obtenerSedes() {
        return repositorioMaestro.obtenerSedes();
    }

    @Override
    public List<Maestro> obtenerProgramas(int idSede) {
        return repositorioMaestro.obtenerProgramas(idSede);
    }

    @Override
    public List<Maestro> obtenerCriteriosHabilitantes() {
        return repositorioMaestro.obtenerCriteriosHabilitantes();
    }

    @Override
    public List<Maestro> obtenerCriteriosEvaluacion() {
        return repositorioMaestro.obtenerCriteriosEvaluacion();
    }

    @Override
    public List<Maestro> obtenerNivelesIdioma() {
        return repositorioMaestro.obtenerNivelesIdioma();
    }

    @Override
    public List<Maestro> obtenerTiposCertificacionIdioma() {
        return repositorioMaestro.obtenerTiposCertificacionIdioma();
    }

    @Override
    public List<Maestro> obtenerNaturalezasCargo() {
        return repositorioMaestro.obtenerNaturalezasCargo();
    }

    @Override
    public List<Maestro> obtenerModalidadesCurso() {
        return repositorioMaestro.obtenerModalidadesCurso();
    }

    @Override
    public List<Maestro> obtenerTiposInvestigador() {
        return repositorioMaestro.obtenerTiposInvestigador();
    }

    @Override
    public List<Maestro> obtenerTiposAutorArticulo() {
        return repositorioMaestro.obtenerTiposAutorArticulo();
    }

    @Override
    public List<Maestro> obtenerTiposPatente() {
       return repositorioMaestro.obtenerTiposPatente();
    }

    @Override
    public List<Maestro> obtenerTiposProductosConocimiento() {
        return repositorioMaestro.obtenerTiposProductosConocimiento();
    }

    @Override
    public List<Maestro> obtenerClasesPatente() {
        return repositorioMaestro.obtenerClasesPatente();
    }

    @Override
    public List<Programa> obtenerProgramasInstitucion(int institucion, int nivel) {
        return repositorioMaestro.obtenerProgramasInstitucion(institucion, nivel);
    }

    @Override
    public List<Maestro> obtenerCapacitaciones(Integer tipoCapacitacion, Integer nucleoBasicoConocimiento) {
        return repositorioMaestro.obtenerCapacitaciones(tipoCapacitacion, nucleoBasicoConocimiento);
    }

    @Override
    public List<CampoHojaVida> obtenerCamposHojaVida() {
        return repositorioMaestro.obtenerCamposHojaVida();
    }

    @Override
    public int ingresarProgramaInstitucion(Programa programa) {
        return repositorioMaestro.ingresarProgramaInstitucion(programa);
    }

    @Override
    public Ciudad ingresarCiudad(Ciudad ciudad) {
         return repositorioMaestro.ingresarCiudad(ciudad);
    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativasExterior() {
        List<Maestro> instituciones = repositorioMaestro.obtenerInstitucionesEducativasExterior();
        List<Maestro> nuevasInstituciones = new ArrayList<>();
        for(Maestro institucion : instituciones) {
            boolean existe = false;
            for(Maestro nuevaInstitucion : nuevasInstituciones) {
                if(nuevaInstitucion.getNombre().equalsIgnoreCase(institucion.getNombre())) {
                    existe = true;
                    break;
                }
            }
            if(!existe) {
                nuevasInstituciones.add(institucion);
            }
        }
        return nuevasInstituciones;
    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativasColombianas() {
        return repositorioMaestro.obtenerInstitucionesEducativasColombianas();
    }

    @Override
    public List<Programa> obtenerProgramasNucleoBasicoConocimiento(int nucleoBasicoConocimiento) {
        return repositorioMaestro.obtenerProgramasNucleoBasicoConocimiento(nucleoBasicoConocimiento);
    }

    @Override
    public int ingresarInstitucion(Institucion institucion) {
        return repositorioMaestro.ingresarInstitucion(institucion);
    }
    
    @Override
    public List<Maestro> obtenerProgramasEducacionesContinuas() {
        return repositorioMaestro.obtenerProgramasEducacionesContinuas();
    }

    @Override
    public List<Maestro> obtenerCursosDocencia() {
        return repositorioMaestro.obtenerCursosDocencia();
    }

    @Override
    public List<Maestro> obtenerInstitucionesDistinciones() {
        return repositorioMaestro.obtenerInstitucionesDistinciones();
    }

    @Override
    public List<Maestro> obtenerTitulos() {
        return repositorioMaestro.obtenerTitulos();
    }

}
