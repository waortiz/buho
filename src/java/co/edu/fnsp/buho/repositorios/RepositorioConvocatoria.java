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
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import co.edu.fnsp.buho.utilidades.Util;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private SimpleJdbcCall ingresarDocumentoConvocatoria;
    private SimpleJdbcCall actualizarDocumentoConvocatoria;
    private SimpleJdbcCall obtenerDocumentoConvocatoria;

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
        this.obtenerConvocatoriasCerradas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoriasCerradas").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(Convocatoria.class));
        this.obtenerConvocatoriasVigentes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatoriasVigentes").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(Convocatoria.class));
        this.obtenerDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoConvocatoria");
        this.ingresarDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoConvocatoria");
        this.actualizarDocumentoConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoConvocatoria");

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
    public void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        try {
            parametros.addValue("varTipoConvocatoria", Util.obtenerEntero(convocatoria.getTipoConvocatoria()));
        } catch (ParseException ex) {
            Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varCurso", convocatoria.getNombreCurso());
        if (convocatoria.getTotalHorasSemestreCurso() != null
                && convocatoria.getTotalHorasSemestreCurso().length() > 0) {
            try {
                parametros.addValue("varNumeroHoras", Util.obtenerEntero(convocatoria.getTotalHorasSemestreCurso()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varNumeroHoras", 0);
        }
        if (convocatoria.getIdProgramaCurso() != null
                && convocatoria.getIdProgramaCurso().length() > 0) {
            try {
                parametros.addValue("varPrograma", Util.obtenerEntero(convocatoria.getIdProgramaCurso()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varPrograma", null);
        }
        if (convocatoria.getAnyosMinimosExperiencia() != null
                && convocatoria.getAnyosMinimosExperiencia().length() > 0) {
            try {
                parametros.addValue("varanyosminimosexperiencia", Util.obtenerEntero(convocatoria.getAnyosMinimosExperiencia()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varanyosminimosexperiencia", null);
        }
        parametros.addValue("varPersonaRegistra", idUsuario);
        Map resultado = ingresarConvocatoria.execute(parametros);
        int idConvocatoria = (int) resultado.get("varIdConvocatoria");

        MapSqlParameterSource parametrosIngresoAdenda = new MapSqlParameterSource();
        parametrosIngresoAdenda.addValue("varIdConvocatoria", idConvocatoria);
        parametrosIngresoAdenda.addValue("varPersonaRegistra", idUsuario);
        for (Adenda adenda : convocatoria.getAdendas()) {
            parametrosIngresoAdenda.addValue("varDescripcion", adenda.getDescripcion());
            parametrosIngresoAdenda.addValue("varTipoAdenda", adenda.getTipoAdenda());
            parametrosIngresoAdenda.addValue("varFecha", adenda.getFecha());
            Map resultadoAdenda = ingresarAdenda.execute(parametrosIngresoAdenda);
            int idAdenda = (int) resultadoAdenda.get("varIdAdenda");
            Documento documento = adenda.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoAdenda = new MapSqlParameterSource();
                parametrosIngresoDocumentoAdenda.addValue("varIdAdenda", idAdenda);
                parametrosIngresoDocumentoAdenda.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoAdenda.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoAdenda.addValue("varContenido", documento.getContenido());
                ingresarDocumentoAdenda.execute(parametrosIngresoDocumentoAdenda);
            }
        }

        MapSqlParameterSource parametrosIngresoAnyosExperiencia = new MapSqlParameterSource();
        parametrosIngresoAnyosExperiencia.addValue("varIdConvocatoria", idConvocatoria);
        for (AnyosExperiencia anyosExperiencia : convocatoria.getAnyosExperiencias()) {
            parametrosIngresoAnyosExperiencia.addValue("varNucleoBasicoConocimiento", anyosExperiencia.getNucleoBasicoConocimiento());
            parametrosIngresoAnyosExperiencia.addValue("varAnyos", anyosExperiencia.getAnyos());
            ingresarAnyosExperiencia.execute(parametrosIngresoAnyosExperiencia);
        }

        MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
        parametrosIngresoIdioma.addValue("varIdConvocatoria", idConvocatoria);
        for (IdiomaConvocatoria idioma : convocatoria.getIdiomas()) {
            parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosIngresoIdioma.addValue("varPersonaRegistra", idUsuario);
            parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosIngresoIdioma.addValue("varPuntajeMinimoCertificacion", idioma.getPuntajeMinimoCertificacion());
            ingresarIdiomaConvocatoria.execute(parametrosIngresoIdioma);
        }

        MapSqlParameterSource parametrosIngresoPrograma = new MapSqlParameterSource();
        parametrosIngresoPrograma.addValue("varIdConvocatoria", idConvocatoria);
        for (ProgramaConvocatoria programa : convocatoria.getProgramas()) {
            parametrosIngresoPrograma.addValue("varPrograma", programa.getPrograma());
            parametrosIngresoPrograma.addValue("varPersonaRegistra", idUsuario);
            parametrosIngresoPrograma.addValue("varNivelFormacion", programa.getNivelFormacion());
            ingresarProgramaConvocatoria.execute(parametrosIngresoPrograma);
        }

        MapSqlParameterSource parametrosIngresoCriterio = new MapSqlParameterSource();
        parametrosIngresoCriterio.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioHabilitanteConvocatoria criterio : convocatoria.getCriteriosHabilitantes()) {
            parametrosIngresoCriterio.addValue("varCampoHojaVida", criterio.getCampoHojaVida());
            parametrosIngresoCriterio.addValue("varValor", criterio.getValor());
            parametrosIngresoCriterio.addValue("varPersonaRegistra", idUsuario);
            ingresarCriterioHabilitanteConvocatoria.execute(parametrosIngresoCriterio);
        }

        MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
        parametrosIngresoEducacionContinua.addValue("varIdConvocatoria", idConvocatoria);
        for (EducacionContinuaConvocatoria educacionContinua : convocatoria.getEducacionesContinuas()) {
            parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosIngresoEducacionContinua.addValue("varPersonaRegistra", idUsuario);
            ingresarEducacionContinuaConvocatoria.execute(parametrosIngresoEducacionContinua);
        }

        Documento documento = convocatoria.getDocumento();
        if (documento != null) {
            MapSqlParameterSource parametrosIngresoDocumentoConvocatoria = new MapSqlParameterSource();
            parametrosIngresoDocumentoConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
            parametrosIngresoDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
            ingresarDocumentoConvocatoria.execute(parametrosIngresoDocumentoConvocatoria);
        }
    }

    @Override
    public void actualizarConvocatoria(long idUsuario, Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidConvocatoria", convocatoria.getId());
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        parametros.addValue("varTipoConvocatoria", convocatoria.getTipoConvocatoria());
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varCurso", convocatoria.getNombreCurso());
        if (convocatoria.getTotalHorasSemestreCurso() != null
                && convocatoria.getTotalHorasSemestreCurso().length() > 0) {
            try {
                parametros.addValue("varNumeroHoras", Util.obtenerEntero(convocatoria.getTotalHorasSemestreCurso()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varNumeroHoras", 0);
        }
        if (convocatoria.getIdProgramaCurso() != null
                && convocatoria.getIdProgramaCurso().length() > 0) {
            try {
                parametros.addValue("varPrograma", Util.obtenerEntero(convocatoria.getIdProgramaCurso()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varPrograma", null);
        }
        if (convocatoria.getAnyosMinimosExperiencia() != null
                && convocatoria.getAnyosMinimosExperiencia().length() > 0) {
            try {
                parametros.addValue("varanyosminimosexperiencia", Util.obtenerEntero(convocatoria.getAnyosMinimosExperiencia()));
            } catch (ParseException ex) {
                Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            parametros.addValue("varanyosminimosexperiencia", null);
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

        actualizarAdendas(convocatoria.getId(), idUsuario, convocatoria.getAdendas());
        actualizarAnyosExperiencias(convocatoria.getId(), convocatoria.getAnyosExperiencias());
        actualizarIdiomas(convocatoria.getId(), idUsuario, convocatoria.getIdiomas());
        actualizarProgramas(convocatoria.getId(), idUsuario, convocatoria.getProgramas());
        actualizarEducacionesContinuas(convocatoria.getId(), idUsuario, convocatoria.getEducacionesContinuas());
        actualizarCriterios(convocatoria.getId(), idUsuario, convocatoria.getCriteriosHabilitantes());
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

        Map resultadoAdendas = obtenerAdendas.execute(parametros);
        List<Adenda> adendas = (List<Adenda>) resultadoAdendas.get("adendas");
        convocatoria.setAdendas(adendas);

        Map resultadoAnyosExperiencias = obtenerAnyosExperiencias.execute(parametros);
        List<AnyosExperiencia> anyosExperiencias = (List<AnyosExperiencia>) resultadoAnyosExperiencias.get("anyosExperiencias");
        convocatoria.setAnyosExperiencias(anyosExperiencias);

        Map resultadoIdiomas = obtenerIdiomasConvocatoria.execute(parametros);
        List<IdiomaConvocatoria> idiomas = (List<IdiomaConvocatoria>) resultadoIdiomas.get("idiomasConvocatoria");
        convocatoria.setIdiomas(idiomas);

        Map resultadoProgramas = obtenerProgramasConvocatoria.execute(parametros);
        List<ProgramaConvocatoria> programas = (List<ProgramaConvocatoria>) resultadoProgramas.get("programasConvocatoria");
        convocatoria.setProgramas(programas);

        Map resultadoEducacionesContinuas = obtenerEducacionesContinuasConvocatoria.execute(parametros);
        List<EducacionContinuaConvocatoria> educacionesContinuas = (List<EducacionContinuaConvocatoria>) resultadoEducacionesContinuas.get("educacionesContinuas");
        convocatoria.setEducacionesContinuas(educacionesContinuas);

        Map resultadoCriteriosHabilitantes = obtenerCriteriosHabilitantesConvocatoria.execute(parametros);
        List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = (List<CriterioHabilitanteConvocatoria>) resultadoCriteriosHabilitantes.get("criteriosHabilitantes");
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
    public List<Convocatoria> obtenerConvocatoriasCerradas() {
        Map resultado = obtenerConvocatoriasCerradas.execute(new MapSqlParameterSource());
        List<Convocatoria> convocatorias = (List<Convocatoria>) resultado.get("convocatorias");
        for (Convocatoria convocatoria : convocatorias) {
            convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
        }

        return convocatorias;
    }

    @Override
    public List<Convocatoria> obtenerConvocatoriasVigentes(long idUsuario) {
        MapSqlParameterSource parametrosConsultaConvocatorias = new MapSqlParameterSource();
        parametrosConsultaConvocatorias.addValue("varIdUsuario", idUsuario);
        Map resultado = obtenerConvocatoriasVigentes.execute(parametrosConsultaConvocatorias);
        List<Convocatoria> convocatorias = (List<Convocatoria>) resultado.get("convocatorias");
        for (Convocatoria convocatoria : convocatorias) {
            convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
        }

        return convocatorias;
    }

    private void actualizarAdendas(int idConvocatoria, long idUsuario, List<Adenda> adendas) {
        MapSqlParameterSource parametrosConsultaAdenda = new MapSqlParameterSource();
        parametrosConsultaAdenda.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoAdendas = obtenerAdendas.execute(parametrosConsultaAdenda);
        ArrayList<Adenda> adendasActuales = (ArrayList<Adenda>) resultadoAdendas.get("adendas");

        MapSqlParameterSource parametrosEliminacionAdenda = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionAdenda = new MapSqlParameterSource();
        for (Adenda adendaActual : adendasActuales) {
            Adenda adendaModificado = null;
            for (Adenda adenda : adendas) {
                if (adenda.getId() == adendaActual.getId()) {
                    adendaModificado = adenda;
                    break;
                }
            }
            if (adendaModificado == null) {
                parametrosEliminacionAdenda.addValue("varIdAdenda", adendaActual.getId());
                eliminarAdenda.execute(parametrosEliminacionAdenda);
            } else {
                parametrosActualizacionAdenda.addValue("varIdAdenda", adendaModificado.getId());
                parametrosActualizacionAdenda.addValue("varDescripcion", adendaModificado.getDescripcion());
                parametrosActualizacionAdenda.addValue("varTipoAdenda", adendaModificado.getTipoAdenda());
                parametrosActualizacionAdenda.addValue("varFecha", adendaModificado.getFecha());
                actualizarAdenda.execute(parametrosActualizacionAdenda);
                Documento documento = adendaModificado.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarDocumentoAdenda = new MapSqlParameterSource();
                    parametrosActualizarDocumentoAdenda.addValue("varIdAdenda", adendaModificado.getId());
                    parametrosActualizarDocumentoAdenda.addValue("varNombre", documento.getNombre());
                    parametrosActualizarDocumentoAdenda.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarDocumentoAdenda.addValue("varContenido", documento.getContenido());
                    actualizarDocumentoAdenda.execute(parametrosActualizarDocumentoAdenda);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoAdenda = new MapSqlParameterSource();
        parametrosIngresoAdenda.addValue("varIdConvocatoria", idConvocatoria);
        for (Adenda adenda : adendas) {
            if (adenda.getId() == 0) {
                parametrosIngresoAdenda.addValue("varPersonaRegistra", idUsuario);
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
            }
        }
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

    private void actualizarAnyosExperiencias(int idConvocatoria, List<AnyosExperiencia> anyosExperiencias) {
        MapSqlParameterSource parametrosConsultaAnyosExperiencias = new MapSqlParameterSource();
        parametrosConsultaAnyosExperiencias.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoAnyosExperiencias = obtenerAnyosExperiencias.execute(parametrosConsultaAnyosExperiencias);
        ArrayList<AnyosExperiencia> anyosExperienciasActuales = (ArrayList<AnyosExperiencia>) resultadoAnyosExperiencias.get("anyosExperiencias");

        MapSqlParameterSource parametrosEliminacionAnyosExperiencia = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionAnyosExperiencia = new MapSqlParameterSource();
        for (AnyosExperiencia anyosExperienciaActual : anyosExperienciasActuales) {
            AnyosExperiencia anyosExperienciaModificado = null;
            for (AnyosExperiencia anyosExperiencia : anyosExperiencias) {
                if (anyosExperiencia.getId() == anyosExperienciaActual.getId()) {
                    anyosExperienciaModificado = anyosExperiencia;
                    break;
                }
            }
            if (anyosExperienciaModificado == null) {
                parametrosEliminacionAnyosExperiencia.addValue("varId", anyosExperienciaActual.getId());
                eliminarAnyosExperiencia.execute(parametrosEliminacionAnyosExperiencia);
            } else {
                parametrosActualizacionAnyosExperiencia.addValue("varId", anyosExperienciaModificado.getId());
                parametrosActualizacionAnyosExperiencia.addValue("varNucleoBasicoConocimiento", anyosExperienciaModificado.getNucleoBasicoConocimiento());
                parametrosActualizacionAnyosExperiencia.addValue("varAnyos", anyosExperienciaModificado.getAnyos());
                actualizarAnyosExperiencia.execute(parametrosActualizacionAnyosExperiencia);
            }
        }

        MapSqlParameterSource parametrosIngresoAnyosExperiencia = new MapSqlParameterSource();
        parametrosIngresoAnyosExperiencia.addValue("varIdConvocatoria", idConvocatoria);
        for (AnyosExperiencia anyosExperiencia : anyosExperiencias) {
            if (anyosExperiencia.getId() == 0) {
                parametrosIngresoAnyosExperiencia.addValue("varNucleoBasicoConocimiento", anyosExperiencia.getNucleoBasicoConocimiento());
                parametrosIngresoAnyosExperiencia.addValue("varAnyos", anyosExperiencia.getAnyos());
                ingresarAnyosExperiencia.execute(parametrosIngresoAnyosExperiencia);
            }
        }
    }

    private void actualizarIdiomas(long idConvocatoria, long idUsuario, List<IdiomaConvocatoria> idiomas) {
        MapSqlParameterSource parametrosConsultaIdioma = new MapSqlParameterSource();
        parametrosConsultaIdioma.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoIdiomas = obtenerIdiomasConvocatoria.execute(parametrosConsultaIdioma);
        ArrayList<IdiomaConvocatoria> idiomasActuales = (ArrayList<IdiomaConvocatoria>) resultadoIdiomas.get("idiomasConvocatoria");

        MapSqlParameterSource parametrosEliminacionIdioma = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionIdioma = new MapSqlParameterSource();
        for (IdiomaConvocatoria idiomaActual : idiomasActuales) {
            IdiomaConvocatoria idiomaModificado = null;
            for (IdiomaConvocatoria idioma : idiomas) {
                if (idioma.getId() == idiomaActual.getId()) {
                    idiomaModificado = idioma;
                    break;
                }
            }
            if (idiomaModificado == null) {
                parametrosEliminacionIdioma.addValue("varId", idiomaActual.getId());
                eliminarIdiomaConvocatoria.execute(parametrosEliminacionIdioma);
            } else {
                parametrosActualizacionIdioma.addValue("varId", idiomaModificado.getId());
                parametrosActualizacionIdioma.addValue("varIdioma", idiomaModificado.getIdioma());
                parametrosActualizacionIdioma.addValue("varTipoCertificacion", idiomaModificado.getTipoCertificacion());
                parametrosActualizacionIdioma.addValue("varOtraCertificacion", idiomaModificado.getOtraCertificacion());
                parametrosActualizacionIdioma.addValue("varPuntajeMinimoCertificacion", idiomaModificado.getPuntajeMinimoCertificacion());
                actualizarIdiomaConvocatoria.execute(parametrosActualizacionIdioma);
            }
        }

        MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
        parametrosIngresoIdioma.addValue("varIdConvocatoria", idConvocatoria);
        for (IdiomaConvocatoria idioma : idiomas) {
            if (idioma.getId() == 0) {
                parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
                parametrosIngresoIdioma.addValue("varPersonaRegistra", idUsuario);
                parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
                parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
                parametrosIngresoIdioma.addValue("varPuntajeMinimoCertificacion", idioma.getPuntajeMinimoCertificacion());
                ingresarIdiomaConvocatoria.execute(parametrosIngresoIdioma);
            }
        }
    }

    private void actualizarProgramas(long idConvocatoria, long idUsuario, List<ProgramaConvocatoria> programas) {
        MapSqlParameterSource parametrosConsultaPrograma = new MapSqlParameterSource();
        parametrosConsultaPrograma.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoProgramas = obtenerProgramasConvocatoria.execute(parametrosConsultaPrograma);
        ArrayList<ProgramaConvocatoria> programasActuales = (ArrayList<ProgramaConvocatoria>) resultadoProgramas.get("programasConvocatoria");

        MapSqlParameterSource parametrosEliminacionPrograma = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionPrograma = new MapSqlParameterSource();
        for (ProgramaConvocatoria programaActual : programasActuales) {
            ProgramaConvocatoria programaModificado = null;
            for (ProgramaConvocatoria programa : programas) {
                if (programa.getId() == programaActual.getId()) {
                    programaModificado = programa;
                    break;
                }
            }
            if (programaModificado == null) {
                parametrosEliminacionPrograma.addValue("varId", programaActual.getId());
                eliminarProgramaConvocatoria.execute(parametrosEliminacionPrograma);
            } else {
                parametrosActualizacionPrograma.addValue("varId", programaModificado.getId());
                parametrosActualizacionPrograma.addValue("varPrograma", programaModificado.getPrograma());
                parametrosActualizacionPrograma.addValue("varNivelFormacion", programaModificado.getNivelFormacion());
                actualizarProgramaConvocatoria.execute(parametrosActualizacionPrograma);
            }
        }

        MapSqlParameterSource parametrosIngresoPrograma = new MapSqlParameterSource();
        parametrosIngresoPrograma.addValue("varIdConvocatoria", idConvocatoria);
        for (ProgramaConvocatoria programa : programas) {
            if (programa.getId() == 0) {
                parametrosIngresoPrograma.addValue("varPrograma", programa.getPrograma());
                parametrosIngresoPrograma.addValue("varPersonaRegistra", idUsuario);
                parametrosIngresoPrograma.addValue("varNivelFormacion", programa.getNivelFormacion());
                ingresarProgramaConvocatoria.execute(parametrosIngresoPrograma);
            }
        }
    }

    private void actualizarEducacionesContinuas(long idConvocatoria, long idUsuario, List<EducacionContinuaConvocatoria> educacionesContinuas) {
        MapSqlParameterSource parametrosConsultaEducacionContinua = new MapSqlParameterSource();
        parametrosConsultaEducacionContinua.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoEducacionContinuas = obtenerEducacionesContinuasConvocatoria.execute(parametrosConsultaEducacionContinua);
        ArrayList<EducacionContinuaConvocatoria> educacionesContinuasActuales = (ArrayList<EducacionContinuaConvocatoria>) resultadoEducacionContinuas.get("educacionesContinuas");

        MapSqlParameterSource parametrosEliminacionEducacionContinua = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionContinua = new MapSqlParameterSource();
        for (EducacionContinuaConvocatoria educacionContinuaActual : educacionesContinuasActuales) {
            EducacionContinuaConvocatoria educacionContinuaModificada = null;
            for (EducacionContinuaConvocatoria educacionContinua : educacionesContinuas) {
                if (educacionContinua.getId() == educacionContinuaActual.getId()) {
                    educacionContinuaModificada = educacionContinua;
                    break;
                }
            }
            if (educacionContinuaModificada == null) {
                parametrosEliminacionEducacionContinua.addValue("varId", educacionContinuaActual.getId());
                eliminarEducacionContinuaConvocatoria.execute(parametrosEliminacionEducacionContinua);
            } else {
                parametrosActualizacionEducacionContinua.addValue("varId", educacionContinuaModificada.getId());
                parametrosActualizacionEducacionContinua.addValue("varTipoCapacitacion", educacionContinuaModificada.getTipoCapacitacion());
                parametrosActualizacionEducacionContinua.addValue("varNombreCapacitacion", educacionContinuaModificada.getNombreCapacitacion());
                parametrosActualizacionEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinuaModificada.getNucleoBasicoConocimiento());
                actualizarEducacionContinuaConvocatoria.execute(parametrosActualizacionEducacionContinua);
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
        parametrosIngresoEducacionContinua.addValue("varIdConvocatoria", idConvocatoria);
        for (EducacionContinuaConvocatoria educacionContinua : educacionesContinuas) {
            if (educacionContinua.getId() == 0) {
                parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
                parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
                parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
                parametrosIngresoEducacionContinua.addValue("varPersonaRegistra", idUsuario);
                ingresarEducacionContinuaConvocatoria.execute(parametrosIngresoEducacionContinua);
            }
        }
    }

    private void actualizarCriterios(long idConvocatoria, long idUsuario, List<CriterioHabilitanteConvocatoria> criterios) {
        MapSqlParameterSource parametrosConsultaCriterio = new MapSqlParameterSource();
        parametrosConsultaCriterio.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoCriterios = obtenerCriteriosHabilitantesConvocatoria.execute(parametrosConsultaCriterio);
        ArrayList<CriterioHabilitanteConvocatoria> criteriosActuales = (ArrayList<CriterioHabilitanteConvocatoria>) resultadoCriterios.get("criteriosHabilitantes");

        MapSqlParameterSource parametrosEliminacionCriterio = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionCriterio = new MapSqlParameterSource();
        for (CriterioHabilitanteConvocatoria criterioActual : criteriosActuales) {
            CriterioHabilitanteConvocatoria criterioModificado = null;
            for (CriterioHabilitanteConvocatoria criterio : criterios) {
                if (criterio.getId() == criterioActual.getId()) {
                    criterioModificado = criterio;
                    break;
                }
            }
            if (criterioModificado == null) {
                parametrosEliminacionCriterio.addValue("varId", criterioActual.getId());
                eliminarCriterioHabilitanteConvocatoria.execute(parametrosEliminacionCriterio);
            } else {
                parametrosActualizacionCriterio.addValue("varId", criterioModificado.getId());
                parametrosActualizacionCriterio.addValue("varValor", criterioModificado.getValor());
                parametrosActualizacionCriterio.addValue("varCampoHojaVida", criterioModificado.getCampoHojaVida());
                actualizarCriterioHabilitanteConvocatoria.execute(parametrosActualizacionCriterio);
            }
        }

        MapSqlParameterSource parametrosIngresoCriterio = new MapSqlParameterSource();
        parametrosIngresoCriterio.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioHabilitanteConvocatoria criterio : criterios) {
            if (criterio.getId() == 0) {
                parametrosIngresoCriterio.addValue("varValor", criterio.getValor());
                parametrosIngresoCriterio.addValue("varCampoHojaVida", criterio.getCampoHojaVida());
                parametrosIngresoCriterio.addValue("varPersonaRegistra", idUsuario);
                ingresarCriterioHabilitanteConvocatoria.execute(parametrosIngresoCriterio);
            }
        }
    }

}
