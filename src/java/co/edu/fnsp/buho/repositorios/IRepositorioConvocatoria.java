/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.AnyosMinimosExperiencia;
import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.entidades.ResultadoConvocatoria;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioConvocatoria {

    int ingresarConvocatoria(long idPersona, Convocatoria convocatoria);

    void actualizarConvocatoria(Convocatoria convocatoria);

    Convocatoria obtenerConvocatoria(int idConvocatoria);

    void eliminarConvocatoria(int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriasCerradas();

    Documento obtenerDocumentoConvocatoria(int idConvocatoria);

    Documento obtenerDocumentoAdenda(int idAdenda);

    void postularConvocatoria(long idPersona, int idConvocatoria);

    void retirarPostulacion(long idPersona, int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriasVigentes(long idPersona);

    Documento obtenerResultadoConvocatoria(int idConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriaValidar();

    List<HojaVida> obtenerPersonasConvocatoria(int idConvocatoria);

    void guardarAdenda(int idConvocatoria, long idPersona, Adenda adenda);

    List<Adenda> obtenerAdendas(int idConvocatoria);

    public void eliminarAdenda(int idAdenda);
    
    void guardarAnyosExperiencia(int idConvocatoria, AnyosExperiencia anyosExperiencia);

    List<AnyosExperiencia> obtenerAnyosExperiencias(int idConvocatoria);

    void eliminarAnyosExperiencia(int idAnyosExperiencia);

    void guardarIdioma(int idConvocatoria, long idPersona, IdiomaConvocatoria idiomaConvocatoria);

    List<IdiomaConvocatoria> obtenerIdiomas(int idConvocatoria);

    void eliminarIdioma(int idIdioma);

    void guardarPrograma(int idConvocatoria, long idPersona, ProgramaConvocatoria programaConvocatoria);

    List<ProgramaConvocatoria> obtenerProgramas(int idConvocatoria);

    void eliminarPrograma(int idPrograma);
    
    void guardarEducacionContinua(int idConvocatoria, long idPersona, EducacionContinuaConvocatoria educacionContinuaConvocatoria);

    List<EducacionContinuaConvocatoria> obtenerEducacionesContinuas(int idConvocatoria);

    void eliminarEducacionContinua(int idEducacionContinua);

    void guardarCriterioHabilitante(int idConvocatoria, long idPersona, CriterioHabilitanteConvocatoria criterioHabilitanteConvocatoria);

    List<CriterioHabilitanteConvocatoria> obtenerCriteriosHabilitantes(int idConvocatoria);

    void eliminarCriterioHabilitante(int idCriterioHabilitante);

    void actualizarAnyosMinimosExperiencia(AnyosMinimosExperiencia anyosMinimosExperiencia);
    
    void actualizarResultado(ResultadoConvocatoria resultadoConvocatoria);

    List<ListadoConvocatoria> obtenerConvocatoriasVigentesExternas(long idPersona);

    List<ListadoConvocatoria> obtenerConvocatoriasCerradasExternas();
}
