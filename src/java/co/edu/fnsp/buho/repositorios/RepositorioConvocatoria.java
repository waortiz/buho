/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.AnyosMinimosExperiencia;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ListadoConvocatoria;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.entidades.ResultadoConvocatoria;
import co.edu.fnsp.buho.utilidades.Util;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

/**
 *
 * @author William
 */
@Repository("repositorioConvocatoria")
public class RepositorioConvocatoria implements IRepositorioConvocatoria {

    private SimpleJdbcCall ingresarConvocatoria;
    private SimpleJdbcCall eliminarConvocatoria;
    private SimpleJdbcCall postularConvocatoria;
    private SimpleJdbcCall retirarPostulacionConvocatoria;
    private SimpleJdbcCall actualizarConvocatoria;
    private SimpleJdbcCall obtenerConvocatoria;
    private SimpleJdbcCall obtenerConvocatoriasCerradas;
    private SimpleJdbcCall obtenerConvocatoriasVigentes;
    private SimpleJdbcCall obtenerConvocatoriasValidar;
    private SimpleJdbcCall ingresarDocumentoConvocatoria;
    private SimpleJdbcCall actualizarDocumentoConvocatoria;
    private SimpleJdbcCall obtenerDocumentoConvocatoria;
    private SimpleJdbcCall obtenerResultadoConvocatoria;
    private SimpleJdbcCall actualizarResultadoConvocatoria;
    private SimpleJdbcCall actualizarAnyosMinimosExperienciaConvocatoria;
    private SimpleJdbcCall obtenerPersonasConvocatoria;

    private SimpleJdbcCall ingresarAdenda;
    private SimpleJdbcCall eliminarAdenda;
    private SimpleJdbcCall actualizarAdenda;
    private SimpleJdbcCall obtenerAdendas;
    private SimpleJdbcCall obtenerDocumentoAdenda;
    private SimpleJdbcCall ingresarDocumentoAdenda;
    private SimpleJdbcCall actualizarDocumentoAdenda;

    private SimpleJdbcCall ingresarAnyosExperiencia;
    private SimpleJdbcCall eliminarAnyosExperiencia;
    private SimpleJdbcCall actualizarAnyosExperiencia;
    private SimpleJdbcCall obtenerAnyosExperiencias;

    private SimpleJdbcCall ingresarIdiomaConvocatoria;
    private SimpleJdbcCall eliminarIdiomaConvocatoria;
    private SimpleJdbcCall actualizarIdiomaConvocatoria;
    private SimpleJdbcCall obtenerIdiomasConvocatoria;

    private SimpleJdbcCall ingresarProgramaConvocatoria;
    private SimpleJdbcCall eliminarProgramaConvocatoria;
    private SimpleJdbcCall actualizarProgramaConvocatoria;
    private SimpleJdbcCall obtenerProgramasConvocatoria;

    private SimpleJdbcCall ingresarEducacionContinuaConvocatoria;
    private SimpleJdbcCall obtenerEducacionesContinuasConvocatoria;
    private SimpleJdbcCall actualizarEducacionContinuaConvocatoria;
    private SimpleJdbcCall eliminarEducacionContinuaConvocatoria;

    private SimpleJdbcCall ingresarCriterioHabilitanteConvocatoria;
    private SimpleJdbcCall eliminarCriterioHabilitanteConvocatoria;
    private SimpleJdbcCall actualizarCriterioHabilitanteConvocatoria;
    private SimpleJdbcCall obtenerCriteriosHabilitantesConvocatoria;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarConvocatoria");
        this.eliminarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarConvocatoria");
        this.postularConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("postularConvocatoria");
        this.retirarPostulacionConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("retirarPostulacionConvocatoria");
        this.actualizarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarConvocatoria");
        this.obtenerConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoria");
        this.obtenerConvocatoriasCerradas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoriasCerradas").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(ListadoConvocatoria.class));
        this.obtenerConvocatoriasValidar = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoriasValidar").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(ListadoConvocatoria.class));
        this.obtenerConvocatoriasVigentes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoriasVigentes").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(ListadoConvocatoria.class));
        this.obtenerPersonasConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersonasConvocatoria").returningResultSet("personas", BeanPropertyRowMapper.newInstance(HojaVida.class));
        this.obtenerDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoConvocatoria");
        this.ingresarDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoConvocatoria");
        this.actualizarDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoConvocatoria");
        this.obtenerResultadoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerResultadoConvocatoria");
        this.actualizarResultadoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarResultadoConvocatoria");
        this.actualizarAnyosMinimosExperienciaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarAnyosMinimosExperienciaConvocatoria");
        this.ingresarAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarAdenda");
        this.eliminarAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarAdenda");
        this.actualizarAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarAdenda");
        this.obtenerAdendas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAdendas").returningResultSet("adendas", BeanPropertyRowMapper.newInstance(Adenda.class));
        this.obtenerDocumentoAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoAdenda");
        this.ingresarDocumentoAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoAdenda");
        this.actualizarDocumentoAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoAdenda");

        this.ingresarAnyosExperiencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarAnyosExperiencia");
        this.eliminarAnyosExperiencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarAnyosExperiencia");
        this.actualizarAnyosExperiencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarAnyosExperiencia");
        this.obtenerAnyosExperiencias = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAnyosExperiencias").returningResultSet("anyosExperiencias", BeanPropertyRowMapper.newInstance(AnyosExperiencia.class));

        this.ingresarIdiomaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarIdiomaConvocatoria");
        this.eliminarIdiomaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarIdiomaConvocatoria");
        this.actualizarIdiomaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarIdiomaConvocatoria");
        this.obtenerIdiomasConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerIdiomasConvocatoria").returningResultSet("idiomasConvocatoria", BeanPropertyRowMapper.newInstance(IdiomaConvocatoria.class));

        this.ingresarProgramaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarProgramaConvocatoria");
        this.eliminarProgramaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarProgramaConvocatoria");
        this.actualizarProgramaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarProgramaConvocatoria");
        this.obtenerProgramasConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProgramasConvocatoria").returningResultSet("programasConvocatoria", BeanPropertyRowMapper.newInstance(ProgramaConvocatoria.class));

        this.ingresarEducacionContinuaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarEducacionContinuaConvocatoria");
        this.eliminarEducacionContinuaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarEducacionContinuaConvocatoria");
        this.actualizarEducacionContinuaConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarEducacionContinuaConvocatoria");
        this.obtenerEducacionesContinuasConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEducacionesContinuasConvocatoria").returningResultSet("educacionesContinuas", BeanPropertyRowMapper.newInstance(EducacionContinuaConvocatoria.class));

        this.ingresarCriterioHabilitanteConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCriterioHabilitanteConvocatoria");
        this.eliminarCriterioHabilitanteConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCriterioHabilitanteConvocatoria");
        this.actualizarCriterioHabilitanteConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCriterioHabilitanteConvocatoria");
        this.obtenerCriteriosHabilitantesConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosHabilitantesConvocatoria").returningResultSet("criteriosHabilitantes", BeanPropertyRowMapper.newInstance(CriterioHabilitanteConvocatoria.class));
    }

    @Override
    public int ingresarConvocatoria(long idPersona, Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        parametros.addValue("varTipoConvocatoria", Util.obtenerEntero(convocatoria.getTipoConvocatoria()));
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varCurso", convocatoria.getNombreCurso());
        if (convocatoria.getTotalHorasSemestreCurso() != null && convocatoria.getTotalHorasSemestreCurso().length() > 0) {
            parametros.addValue("varNumeroHoras", Util.obtenerEntero(convocatoria.getTotalHorasSemestreCurso()));
        } else {
            parametros.addValue("varNumeroHoras", 0);
        }
        if (convocatoria.getIdProgramaCurso() != null && convocatoria.getIdProgramaCurso().length() > 0) {
            parametros.addValue("varPrograma", Util.obtenerEntero(convocatoria.getIdProgramaCurso()));
        } else {
            parametros.addValue("varPrograma", null);
        }
        parametros.addValue("varPersonaRegistra", idPersona);
        Map resultadoIngresoConvocatoria = ingresarConvocatoria.execute(parametros);
        int idConvocatoria = (int) resultadoIngresoConvocatoria.get("varIdConvocatoria");
        Documento documento = convocatoria.getDocumento();
        if (documento != null) {
            MapSqlParameterSource parametrosIngresoDocumentoConvocatoria = new MapSqlParameterSource();
            parametrosIngresoDocumentoConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
            ingresarDocumentoConvocatoria.execute(parametrosIngresoDocumentoConvocatoria);
        }

        return idConvocatoria;
    }

    @Override
    public void actualizarConvocatoria(Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", convocatoria.getId());
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        parametros.addValue("varTipoConvocatoria", convocatoria.getTipoConvocatoria());
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varCurso", convocatoria.getNombreCurso());
        if (convocatoria.getTotalHorasSemestreCurso() != null && convocatoria.getTotalHorasSemestreCurso().length() > 0) {
            parametros.addValue("varNumeroHoras", Util.obtenerEntero(convocatoria.getTotalHorasSemestreCurso()));
        } else {
            parametros.addValue("varNumeroHoras", 0);
        }
        if (convocatoria.getIdProgramaCurso() != null && convocatoria.getIdProgramaCurso().length() > 0) {
            parametros.addValue("varPrograma", Util.obtenerEntero(convocatoria.getIdProgramaCurso()));
        } else {
            parametros.addValue("varPrograma", null);
        }

        actualizarConvocatoria.execute(parametros);

        Documento documento = convocatoria.getDocumento();
        if (documento != null) {
            MapSqlParameterSource parametrosActualizacionDocumentoConvocatoria = new MapSqlParameterSource();
            parametrosActualizacionDocumentoConvocatoria.addValue("varIdConvocatoria", convocatoria.getId());
            parametrosActualizacionDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
            parametrosActualizacionDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosActualizacionDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
            actualizarDocumentoConvocatoria.execute(parametrosActualizacionDocumentoConvocatoria);
        }
    }

    @Override
    public void actualizarAnyosMinimosExperiencia(AnyosMinimosExperiencia anyosMinimosExperiencia) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", anyosMinimosExperiencia.getIdConvocatoria());
        if (anyosMinimosExperiencia.getAnyosMinimosExperiencia() != null && anyosMinimosExperiencia.getAnyosMinimosExperiencia().length() > 0) {
            parametros.addValue("varanyosminimosexperiencia", Util.obtenerEntero(anyosMinimosExperiencia.getAnyosMinimosExperiencia()));
        } else {
            parametros.addValue("varanyosminimosexperiencia", null);
        }

        actualizarAnyosMinimosExperienciaConvocatoria.execute(parametros);
    }

    @Override
    public void actualizarResultado(ResultadoConvocatoria resultadoConvocatoria) {
        Documento resultado = resultadoConvocatoria.getResultado();
        if (resultado != null) {
            MapSqlParameterSource parametrosActualizacionResultadoConvocatoria = new MapSqlParameterSource();
            parametrosActualizacionResultadoConvocatoria.addValue("varIdConvocatoria", resultadoConvocatoria.getIdConvocatoria());
            parametrosActualizacionResultadoConvocatoria.addValue("varNombre", resultado.getNombre());
            parametrosActualizacionResultadoConvocatoria.addValue("varTipoContenido", resultado.getTipoContenido());
            parametrosActualizacionResultadoConvocatoria.addValue("varContenido", resultado.getContenido());
            actualizarResultadoConvocatoria.execute(parametrosActualizacionResultadoConvocatoria);
        }
    }

    @Override
    public Convocatoria obtenerConvocatoria(int idConvocatoria) {
        Convocatoria convocatoria = new Convocatoria();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);

        Map resultado = obtenerConvocatoria.execute(parametros);
        convocatoria.setId(idConvocatoria);
        convocatoria.setDescripcion((String) resultado.get("varDescripcion"));
        convocatoria.setFechaFin((Date) resultado.get("varFechaFin"));
        convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
        convocatoria.setFechaInicio((Date) resultado.get("varFechaInicio"));
        convocatoria.setFechaInicioFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaInicio()));
        convocatoria.setFechaPublicacionResultados((Date) resultado.get("varFechaResultados"));
        convocatoria.setFechaPublicacionResultadosFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaPublicacionResultados()));
        convocatoria.setNombre((String) resultado.get("varNombre"));
        convocatoria.setTipoConvocatoria(((Integer) resultado.get("varTipoConvocatoria")).toString());
        convocatoria.setNombreTipoConvocatoria((String) resultado.get("varNombreTipoConvocatoria"));
        convocatoria.setTieneDocumento(((Boolean) resultado.get("varTieneDocumento")));
        if (convocatoria.getTipoConvocatoria().equalsIgnoreCase("3")
                || convocatoria.getTipoConvocatoria().equalsIgnoreCase("4")) {
            convocatoria.setIdSedeCurso(((Integer) resultado.get("varIdSede")).toString());
            convocatoria.setSedeCurso((String) resultado.get("varSede"));
            convocatoria.setIdProgramaCurso(((Integer) resultado.get("varIdPrograma")).toString());
            convocatoria.setProgramaCurso((String) resultado.get("varPrograma"));
            convocatoria.setNombreCurso((String) resultado.get("varCurso"));
            convocatoria.setTotalHorasSemestreCurso(((Integer) resultado.get("varNumeroHoras")).toString());
        }
        if (resultado.get("varanyosminimosexperiencia") != null) {
            convocatoria.setAnyosMinimosExperiencia(((Integer) resultado.get("varanyosminimosexperiencia")).toString());
        }

        List<Adenda> adendas = this.obtenerAdendas(idConvocatoria);
        convocatoria.setAdendas(adendas);

        List<AnyosExperiencia> anyosExperiencias = this.obtenerAnyosExperiencias(idConvocatoria);
        convocatoria.setAnyosExperiencias(anyosExperiencias);

        List<IdiomaConvocatoria> idiomas = this.obtenerIdiomas(idConvocatoria);
        convocatoria.setIdiomas(idiomas);

        List<ProgramaConvocatoria> programas = this.obtenerProgramas(idConvocatoria);
        convocatoria.setProgramas(programas);

        List<EducacionContinuaConvocatoria> educacionesContinuas = this.obtenerEducacionesContinuas(idConvocatoria);
        convocatoria.setEducacionesContinuas(educacionesContinuas);

        List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = this.obtenerCriteriosHabilitantes(idConvocatoria);
        convocatoria.setCriteriosHabilitantes(criteriosHabilitantes);

        return convocatoria;
    }

    @Override
    public void eliminarConvocatoria(int idConvocatoria) {
        MapSqlParameterSource parametrosEliminacionConvocatoria = new MapSqlParameterSource();
        parametrosEliminacionConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
        eliminarConvocatoria.execute(parametrosEliminacionConvocatoria);
    }

    @Override
    public Documento obtenerDocumentoConvocatoria(int idConvocatoria) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);

        Map resultado = obtenerDocumentoConvocatoria.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerDocumentoAdenda(int idAdenda) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);

        Map resultado = obtenerDocumentoAdenda.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriasCerradas() {
        Map resultado = obtenerConvocatoriasCerradas.execute(new MapSqlParameterSource());
        List<ListadoConvocatoria> convocatorias = (List<ListadoConvocatoria>) resultado.get("convocatorias");
        for (ListadoConvocatoria convocatoria : convocatorias) {
            convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
            convocatoria.setFechaPostulacionFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaPostulacion()));
        }

        return convocatorias;
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriasVigentes(long idPersona) {
        MapSqlParameterSource parametrosConsultaConvocatorias = new MapSqlParameterSource();
        parametrosConsultaConvocatorias.addValue("varIdPersona", idPersona);
        Map resultado = obtenerConvocatoriasVigentes.execute(parametrosConsultaConvocatorias);
        List<ListadoConvocatoria> convocatorias = (List<ListadoConvocatoria>) resultado.get("convocatorias");
        for (ListadoConvocatoria convocatoria : convocatorias) {
            convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
            convocatoria.setFechaPostulacionFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaPostulacion()));
        }

        return convocatorias;
    }

    @Override
    public void guardarAdenda(int idConvocatoria, long idPersona, Adenda adenda) {
        if (adenda.getId() == 0) {
            MapSqlParameterSource parametrosIngresoAdenda = new MapSqlParameterSource();
            parametrosIngresoAdenda.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoAdenda.addValue("varPersonaRegistra", idPersona);
            parametrosIngresoAdenda.addValue("varDescripcion", adenda.getDescripcion());
            parametrosIngresoAdenda.addValue("varTipoAdenda", adenda.getTipoAdenda());
            parametrosIngresoAdenda.addValue("varFecha", adenda.getFecha());
            Map resultadoIngresoAdenda = ingresarAdenda.execute(parametrosIngresoAdenda);
            int idAdenda = (int) resultadoIngresoAdenda.get("varIdAdenda");
            Documento documento = adenda.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoAdenda = new MapSqlParameterSource();
                parametrosIngresoDocumentoAdenda.addValue("varIdAdenda", idAdenda);
                parametrosIngresoDocumentoAdenda.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoAdenda.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoAdenda.addValue("varContenido", documento.getContenido());
                ingresarDocumentoAdenda.execute(parametrosIngresoDocumentoAdenda);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionAdenda = new MapSqlParameterSource();
            parametrosActualizacionAdenda.addValue("varIdAdenda", adenda.getId());
            parametrosActualizacionAdenda.addValue("varDescripcion", adenda.getDescripcion());
            parametrosActualizacionAdenda.addValue("varTipoAdenda", adenda.getTipoAdenda());
            parametrosActualizacionAdenda.addValue("varFecha", adenda.getFecha());
            actualizarAdenda.execute(parametrosActualizacionAdenda);
            Documento documento = adenda.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarDocumentoAdenda = new MapSqlParameterSource();
                parametrosActualizarDocumentoAdenda.addValue("varIdAdenda", adenda.getId());
                parametrosActualizarDocumentoAdenda.addValue("varNombre", documento.getNombre());
                parametrosActualizarDocumentoAdenda.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarDocumentoAdenda.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdenda.execute(parametrosActualizarDocumentoAdenda);
            }
        }
    }

    @Override
    public void eliminarAdenda(int idAdenda) {
        MapSqlParameterSource parametrosEliminacionAdenda = new MapSqlParameterSource();
        parametrosEliminacionAdenda.addValue("varIdAdenda", idAdenda);
        eliminarAdenda.execute(parametrosEliminacionAdenda);
    }

    @Override
    public List<Adenda> obtenerAdendas(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoAdendas = obtenerAdendas.execute(parametros);
        List<Adenda> adendas = (List<Adenda>) resultadoAdendas.get("adendas");
        return adendas;
    }

    @Override
    public void postularConvocatoria(long idPersona, int idConvocatoria) {
        MapSqlParameterSource parametrosPostularConvocatoria = new MapSqlParameterSource();
        parametrosPostularConvocatoria.addValue("varIdPersona", idPersona);
        parametrosPostularConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
        postularConvocatoria.execute(parametrosPostularConvocatoria);
    }

    @Override
    public void retirarPostulacion(long idPersona, int idConvocatoria) {
        MapSqlParameterSource parametrosRetirarPostulacionConvocatoria = new MapSqlParameterSource();
        parametrosRetirarPostulacionConvocatoria.addValue("varIdPersona", idPersona);
        parametrosRetirarPostulacionConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
        retirarPostulacionConvocatoria.execute(parametrosRetirarPostulacionConvocatoria);
    }

    @Override
    public void guardarAnyosExperiencia(int idConvocatoria, AnyosExperiencia anyosExperiencia) {
        if (anyosExperiencia.getId() == 0) {
            MapSqlParameterSource parametrosIngresoAnyosExperiencia = new MapSqlParameterSource();
            parametrosIngresoAnyosExperiencia.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoAnyosExperiencia.addValue("varNucleoBasicoConocimiento", anyosExperiencia.getNucleoBasicoConocimiento());
            parametrosIngresoAnyosExperiencia.addValue("varAnyos", anyosExperiencia.getAnyos());
            ingresarAnyosExperiencia.execute(parametrosIngresoAnyosExperiencia);
        } else {
            MapSqlParameterSource parametrosActualizacionAnyosExperiencia = new MapSqlParameterSource();
            parametrosActualizacionAnyosExperiencia.addValue("varId", anyosExperiencia.getId());
            parametrosActualizacionAnyosExperiencia.addValue("varNucleoBasicoConocimiento", anyosExperiencia.getNucleoBasicoConocimiento());
            parametrosActualizacionAnyosExperiencia.addValue("varAnyos", anyosExperiencia.getAnyos());
            actualizarAnyosExperiencia.execute(parametrosActualizacionAnyosExperiencia);
        }
    }

    @Override
    public void eliminarAnyosExperiencia(int idAnyosExperiencia) {
        MapSqlParameterSource parametrosEliminacionAnyosExperiencia = new MapSqlParameterSource();
        parametrosEliminacionAnyosExperiencia.addValue("varId", idAnyosExperiencia);
        eliminarAnyosExperiencia.execute(parametrosEliminacionAnyosExperiencia);
    }

    @Override
    public List<AnyosExperiencia> obtenerAnyosExperiencias(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoAnyosExperiencias = obtenerAnyosExperiencias.execute(parametros);
        List<AnyosExperiencia> anyosExperiencias = (List<AnyosExperiencia>) resultadoAnyosExperiencias.get("anyosExperiencias");
        return anyosExperiencias;
    }

    @Override
    public void guardarIdioma(int idConvocatoria, long idPersona, IdiomaConvocatoria idioma) {
        if (idioma.getId() == 0) {
            MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
            parametrosIngresoIdioma.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosIngresoIdioma.addValue("varPersonaRegistra", idPersona);
            parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosIngresoIdioma.addValue("varPuntajeMinimoCertificacion", idioma.getPuntajeMinimoCertificacion());
            ingresarIdiomaConvocatoria.execute(parametrosIngresoIdioma);
        } else {

            MapSqlParameterSource parametrosActualizacionIdioma = new MapSqlParameterSource();
            parametrosActualizacionIdioma.addValue("varId", idioma.getId());
            parametrosActualizacionIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosActualizacionIdioma.addValue("varPersonaRegistra", idPersona);
            parametrosActualizacionIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosActualizacionIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosActualizacionIdioma.addValue("varPuntajeMinimoCertificacion", idioma.getPuntajeMinimoCertificacion());
            actualizarIdiomaConvocatoria.execute(parametrosActualizacionIdioma);
        }
    }

    @Override
    public List<IdiomaConvocatoria> obtenerIdiomas(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoIdiomas = obtenerIdiomasConvocatoria.execute(parametros);
        List<IdiomaConvocatoria> idiomas = (List<IdiomaConvocatoria>) resultadoIdiomas.get("idiomasConvocatoria");
        return idiomas;
    }


    @Override
    public void eliminarIdioma(int idIdioma) {
        MapSqlParameterSource parametrosEliminacionIdioma = new MapSqlParameterSource();
        parametrosEliminacionIdioma.addValue("varId", idIdioma);
        eliminarIdiomaConvocatoria.execute(parametrosEliminacionIdioma);
    }

    @Override
    public void guardarPrograma(int idConvocatoria, long idPersona, ProgramaConvocatoria programa) {
        if (programa.getId() == 0) {
            MapSqlParameterSource parametrosIngresoPrograma = new MapSqlParameterSource();
            parametrosIngresoPrograma.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoPrograma.addValue("varPrograma", programa.getPrograma());
            parametrosIngresoPrograma.addValue("varPersonaRegistra", idPersona);
            parametrosIngresoPrograma.addValue("varNivelFormacion", programa.getNivelFormacion());
            ingresarProgramaConvocatoria.execute(parametrosIngresoPrograma);
        } else {
            MapSqlParameterSource parametrosActualizacionPrograma = new MapSqlParameterSource();
            parametrosActualizacionPrograma.addValue("varId", programa.getId());
            parametrosActualizacionPrograma.addValue("varPrograma", programa.getPrograma());
            parametrosActualizacionPrograma.addValue("varNivelFormacion", programa.getNivelFormacion());
            parametrosActualizacionPrograma.addValue("varPersonaRegistra", idPersona);
            actualizarProgramaConvocatoria.execute(parametrosActualizacionPrograma);
        }
    }

    @Override
    public List<ProgramaConvocatoria> obtenerProgramas(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoProgramas = obtenerProgramasConvocatoria.execute(parametros);
        List<ProgramaConvocatoria> programas = (List<ProgramaConvocatoria>) resultadoProgramas.get("programasConvocatoria");
        return programas;
    }


    @Override
    public void eliminarPrograma(int idPrograma) {

        MapSqlParameterSource parametrosEliminacionPrograma = new MapSqlParameterSource();
        parametrosEliminacionPrograma.addValue("varId", idPrograma);
        eliminarProgramaConvocatoria.execute(parametrosEliminacionPrograma);
    }

    @Override
    public void guardarEducacionContinua(int idConvocatoria, long idPersona, EducacionContinuaConvocatoria educacionContinua) {
        if (educacionContinua.getId() == 0) {
            MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
            parametrosIngresoEducacionContinua.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosIngresoEducacionContinua.addValue("varPersonaRegistra", idPersona);
            ingresarEducacionContinuaConvocatoria.execute(parametrosIngresoEducacionContinua);
        } else {
            MapSqlParameterSource parametrosActualizacionEducacionContinua = new MapSqlParameterSource();
            parametrosActualizacionEducacionContinua.addValue("varId", educacionContinua.getId());
            parametrosActualizacionEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosActualizacionEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosActualizacionEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosActualizacionEducacionContinua.addValue("varPersonaRegistra", idPersona);
            actualizarEducacionContinuaConvocatoria.execute(parametrosActualizacionEducacionContinua);
        }
    }

    @Override
    public void eliminarEducacionContinua(int idEducacionContinuaConvocatoria) {
        MapSqlParameterSource parametrosEliminacionEducacionContinua = new MapSqlParameterSource();
        parametrosEliminacionEducacionContinua.addValue("varId", idEducacionContinuaConvocatoria);
        eliminarEducacionContinuaConvocatoria.execute(parametrosEliminacionEducacionContinua);
    }

    @Override
    public List<EducacionContinuaConvocatoria> obtenerEducacionesContinuas(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoEducacionesContinuas = obtenerEducacionesContinuasConvocatoria.execute(parametros);
        List<EducacionContinuaConvocatoria> educacionesContinuas = (List<EducacionContinuaConvocatoria>) resultadoEducacionesContinuas.get("educacionesContinuas");
        return educacionesContinuas;
    }

    @Override
    public void guardarCriterioHabilitante(int idConvocatoria, long idPersona, CriterioHabilitanteConvocatoria criterioHabilitante) {
        if (criterioHabilitante.getId() == 0) {
            MapSqlParameterSource parametrosIngresoCriterio = new MapSqlParameterSource();
            parametrosIngresoCriterio.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoCriterio.addValue("varValor", criterioHabilitante.getValor());
            parametrosIngresoCriterio.addValue("varCampoHojaVida", criterioHabilitante.getCampoHojaVida());
            parametrosIngresoCriterio.addValue("varPersonaRegistra", idPersona);
            ingresarCriterioHabilitanteConvocatoria.execute(parametrosIngresoCriterio);
        } else {
            MapSqlParameterSource parametrosActualizacionCriterio = new MapSqlParameterSource();
            parametrosActualizacionCriterio.addValue("varId", criterioHabilitante.getId());
            parametrosActualizacionCriterio.addValue("varValor", criterioHabilitante.getValor());
            parametrosActualizacionCriterio.addValue("varCampoHojaVida", criterioHabilitante.getCampoHojaVida());
            parametrosActualizacionCriterio.addValue("varPersonaRegistra", idPersona);
            actualizarCriterioHabilitanteConvocatoria.execute(parametrosActualizacionCriterio);
        }
    }

    @Override
    public void eliminarCriterioHabilitante(int idCriterioHabilitante) {
        MapSqlParameterSource parametrosEliminacionCriterio = new MapSqlParameterSource();
        parametrosEliminacionCriterio.addValue("varId", idCriterioHabilitante);
        eliminarCriterioHabilitanteConvocatoria.execute(parametrosEliminacionCriterio);
    }

    @Override
    public List<CriterioHabilitanteConvocatoria> obtenerCriteriosHabilitantes(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoCriteriosHabilitantes = obtenerCriteriosHabilitantesConvocatoria.execute(parametros);
        List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = (List<CriterioHabilitanteConvocatoria>) resultadoCriteriosHabilitantes.get("criteriosHabilitantes");
        
        return criteriosHabilitantes;
    }

    @Override
    public Documento obtenerResultadoConvocatoria(int idConvocatoria) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);

        Map resultado = obtenerResultadoConvocatoria.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public List<ListadoConvocatoria> obtenerConvocatoriaValidar() {
        Map resultado = obtenerConvocatoriasValidar.execute(new MapSqlParameterSource());
        List<ListadoConvocatoria> convocatorias = (List<ListadoConvocatoria>) resultado.get("convocatorias");

        return convocatorias;
    }

    @Override
    public List<HojaVida> obtenerPersonasConvocatoria(int idConvocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoCriterios = obtenerPersonasConvocatoria.execute(parametros);
        ArrayList<HojaVida> hojasVida = (ArrayList<HojaVida>) resultadoCriterios.get("personas");

        return hojasVida;
    }
}
