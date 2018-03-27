/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.CriterioEvaluacion;
import co.edu.fnsp.buho.entidades.CriterioHabilitante;
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
    private SimpleJdbcCall obtenerConvocatorias;
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
    
    private SimpleJdbcCall ingresarCriterioEvaluacion;
    private SimpleJdbcCall actualizarCriterioEvaluacion;
    private SimpleJdbcCall eliminarCriterioEvaluacion;
    private SimpleJdbcCall obtenerCriteriosEvaluacion;
    
    private SimpleJdbcCall ingresarCriterioHabilitante;
    private SimpleJdbcCall eliminarCriterioHabilitante;
    private SimpleJdbcCall obtenerCriteriosHabilitantes;

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
        this.obtenerConvocatorias = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerConvocatorias").returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(Convocatoria.class));
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

        this.ingresarCriterioEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCriterioEvaluacionConvocatoria");
        this.actualizarCriterioEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCriterioEvaluacionConvocatoria");
        this.eliminarCriterioEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCriterioEvaluacionConvocatoria");
        this.obtenerCriteriosEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosEvaluacionConvocatoria").returningResultSet("criteriosEvaluacion", BeanPropertyRowMapper.newInstance(CriterioEvaluacion.class));

        this.ingresarCriterioHabilitante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCriterioHabilitanteConvocatoria");
        this.eliminarCriterioHabilitante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCriterioHabilitanteConvocatoria");
        this.obtenerCriteriosHabilitantes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosHabilitantesConvocatoria").returningResultSet("criteriosHabilitantes", BeanPropertyRowMapper.newInstance(CriterioHabilitante.class));
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
        try {
            parametros.addValue("varArea", Util.obtenerEntero(convocatoria.getArea()));
        } catch (ParseException ex) {
            Logger.getLogger(RepositorioConvocatoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        parametros.addValue("varPrograma", convocatoria.getIdProgramaCurso());
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

        MapSqlParameterSource parametrosIngresoCriterioEvaluacion = new MapSqlParameterSource();
        parametrosIngresoCriterioEvaluacion.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioEvaluacion criterioEvaluacion : convocatoria.getCriteriosEvaluacion()) {
            parametrosIngresoCriterioEvaluacion.addValue("varIdCriterioEvaluacion", criterioEvaluacion.getId());
            if (criterioEvaluacion.getPeso().length() > 0) {
                parametrosIngresoCriterioEvaluacion.addValue("varPeso", Double.parseDouble(criterioEvaluacion.getPeso()));
            } else {
                parametrosIngresoCriterioEvaluacion.addValue("varPeso", 0);
            }
            ingresarCriterioEvaluacion.execute(parametrosIngresoCriterioEvaluacion);
        }

        MapSqlParameterSource parametrosIngresoCriterioHabilitante = new MapSqlParameterSource();
        parametrosIngresoCriterioHabilitante.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioHabilitante criterioHabilitante : convocatoria.getCriteriosHabilitantes()) {
            parametrosIngresoCriterioHabilitante.addValue("varIdCriterioHabilitante", criterioHabilitante.getId());
            if (criterioHabilitante.getValor().length() > 0) {
                parametrosIngresoCriterioHabilitante.addValue("varValor", Integer.parseInt(criterioHabilitante.getValor()));
            } else {
                parametrosIngresoCriterioHabilitante.addValue("varvalor", 0);
            }
            ingresarCriterioHabilitante.execute(parametrosIngresoCriterioHabilitante);
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
        parametros.addValue("varArea", convocatoria.getArea());
        parametros.addValue("varPrograma", convocatoria.getIdProgramaCurso());
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

        actualizarAdenda(convocatoria.getId(), idUsuario, convocatoria.getAdendas());
        actualizarCriterioEvaluacion(convocatoria.getId(), convocatoria.getCriteriosEvaluacion());
        actualizarCriterioHabilitante(convocatoria.getId(), convocatoria.getCriteriosHabilitantes());
    }

    @Override
    public Convocatoria obtenerConvocatoria(int idConvocatoria) {
        Convocatoria convocatoria = new Convocatoria();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);

        Map resultado = obtenerConvocatoria.execute(parametros);
        convocatoria.setId(idConvocatoria);
        convocatoria.setArea(((Integer) resultado.get("varArea")).toString());
        convocatoria.setNombreArea((String) resultado.get("varNombreArea"));
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

        Map resultadoAdendas = obtenerAdendas.execute(parametros);
        List<Adenda> adendas = (List<Adenda>) resultadoAdendas.get("adendas");

        Map resultadoCriteriosHabilitantes = obtenerCriteriosHabilitantes.execute(parametros);
        List<CriterioHabilitante> criteriosHabilitantes = (List<CriterioHabilitante>) resultadoCriteriosHabilitantes.get("criteriosHabilitantes");

        Map resultadoCriteriosEvaluacion = obtenerCriteriosEvaluacion.execute(parametros);
        List<CriterioEvaluacion> criteriosEvaluacion = (List<CriterioEvaluacion>) resultadoCriteriosEvaluacion.get("criteriosEvaluacion");

        convocatoria.setAdendas(adendas);
        convocatoria.setCriteriosHabilitantes(criteriosHabilitantes);
        convocatoria.setCriteriosEvaluacion(criteriosEvaluacion);

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
    public List<Convocatoria> obtenerConvocatorias(long idUsuario) {
        MapSqlParameterSource parametrosConsultaConvocatorias = new MapSqlParameterSource();
        parametrosConsultaConvocatorias.addValue("varIdUsuario", idUsuario);
        Map resultado = obtenerConvocatorias.execute(parametrosConsultaConvocatorias);
        List<Convocatoria> convocatorias = (List<Convocatoria>) resultado.get("convocatorias");
        for (Convocatoria convocatoria : convocatorias) {
            convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
        }

        return convocatorias;
    }

    private void actualizarAdenda(int idConvocatoria, long idUsuario, List<Adenda> adendas) {
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

    private void actualizarCriterioEvaluacion(int idConvocatoria, List<CriterioEvaluacion> criteriosEvaluacion) {
        MapSqlParameterSource parametrosConsultaCriterioEvaluacion = new MapSqlParameterSource();
        parametrosConsultaCriterioEvaluacion.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoCriterioEvaluacions = obtenerCriteriosEvaluacion.execute(parametrosConsultaCriterioEvaluacion);
        ArrayList<CriterioEvaluacion> criteriosEvaluacionActuales = (ArrayList<CriterioEvaluacion>) resultadoCriterioEvaluacions.get("criteriosEvaluacion");

        MapSqlParameterSource parametrosActualizacionCriterioEvaluacion = new MapSqlParameterSource();
        MapSqlParameterSource parametrosEliminacionCriterioEvaluacion = new MapSqlParameterSource();
        for (CriterioEvaluacion criterioEvaluacionActual : criteriosEvaluacionActuales) {
            CriterioEvaluacion criterioEvaluacionModificado = null;
            for (CriterioEvaluacion criterioEvaluacion : criteriosEvaluacion) {
                if (criterioEvaluacion.getId() == criterioEvaluacionActual.getId()) {
                    criterioEvaluacionModificado = criterioEvaluacion;
                    break;
                }
            }
            if (criterioEvaluacionModificado == null) {
                parametrosEliminacionCriterioEvaluacion.addValue("varIdCriterioEvaluacion", criterioEvaluacionActual.getId());
                eliminarCriterioEvaluacion.execute(parametrosEliminacionCriterioEvaluacion);
            } else {
                parametrosActualizacionCriterioEvaluacion.addValue("varIdCriterioEvaluacion", criterioEvaluacionModificado.getId());
                if (criterioEvaluacionModificado.getPeso().length() > 0) {
                    parametrosActualizacionCriterioEvaluacion.addValue("varPeso", Double.parseDouble(criterioEvaluacionModificado.getPeso()));
                } else {
                    parametrosActualizacionCriterioEvaluacion.addValue("varPeso", 0);
                }
                actualizarCriterioEvaluacion.execute(parametrosActualizacionCriterioEvaluacion);
            }
        }

        MapSqlParameterSource parametrosIngresoCriterioEvaluacion = new MapSqlParameterSource();
        parametrosIngresoCriterioEvaluacion.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioEvaluacion criterioEvaluacion : criteriosEvaluacion) {
            if (criterioEvaluacion.getId() == 0) {
                parametrosIngresoCriterioEvaluacion.addValue("varIdCriterioEvaluacion", criterioEvaluacion.getId());
                if (criterioEvaluacion.getPeso().length() > 0) {
                    parametrosIngresoCriterioEvaluacion.addValue("varPeso", Double.parseDouble(criterioEvaluacion.getPeso()));
                } else {
                    parametrosActualizacionCriterioEvaluacion.addValue("varPeso", 0);
                }
                ingresarCriterioEvaluacion.execute(parametrosIngresoCriterioEvaluacion);
            }
        }
    }

    private void actualizarCriterioHabilitante(int idConvocatoria, List<CriterioHabilitante> criteriosHabilitantes) {
        MapSqlParameterSource parametrosConsultaCriteriosHabilitantes = new MapSqlParameterSource();
        parametrosConsultaCriteriosHabilitantes.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoCriteriosHabilitantes = obtenerCriteriosHabilitantes.execute(parametrosConsultaCriteriosHabilitantes);
        ArrayList<CriterioHabilitante> criteriosHabilitantesActuales = (ArrayList<CriterioHabilitante>) resultadoCriteriosHabilitantes.get("criteriosHabilitantes");

        MapSqlParameterSource parametrosActualizacionCriterioHabilitante = new MapSqlParameterSource();
        MapSqlParameterSource parametrosEliminacionCriterioHabilitante = new MapSqlParameterSource();
        for (CriterioHabilitante criterioHabilitanteActual : criteriosHabilitantesActuales) {
            CriterioHabilitante criterioHabilitanteModificado = null;
            for (CriterioHabilitante criterioHabilitante : criteriosHabilitantes) {
                if (criterioHabilitante.getId() == criterioHabilitanteActual.getId()) {
                    criterioHabilitanteModificado = criterioHabilitante;
                    break;
                }
            }
            if (criterioHabilitanteModificado == null) {
                parametrosEliminacionCriterioHabilitante.addValue("varIdCriterioHabilitante", criterioHabilitanteActual.getId());
                eliminarCriterioHabilitante.execute(parametrosEliminacionCriterioHabilitante);
            } else {
                parametrosActualizacionCriterioHabilitante.addValue("varIdCriterioHabilitante", criterioHabilitanteModificado.getId());
                if (criterioHabilitanteModificado.getValor().length() > 0) {
                    parametrosActualizacionCriterioHabilitante.addValue("varValor", Integer.parseInt(criterioHabilitanteModificado.getValor()));
                } else {
                    parametrosActualizacionCriterioHabilitante.addValue("varvalor", 0);
                }
                actualizarCriterioEvaluacion.execute(parametrosActualizacionCriterioHabilitante);
            }
        }

        MapSqlParameterSource parametrosIngresoCriterioHabilitante = new MapSqlParameterSource();
        parametrosIngresoCriterioHabilitante.addValue("varIdConvocatoria", idConvocatoria);
        for (CriterioHabilitante criterioHabilitante : criteriosHabilitantes) {
            if (criterioHabilitante.getId() == 0) {
                parametrosIngresoCriterioHabilitante.addValue("varIdCriterioHabilitante", criterioHabilitante.getId());
                if (criterioHabilitante.getValor().length() > 0) {
                    parametrosIngresoCriterioHabilitante.addValue("varValor", Integer.parseInt(criterioHabilitante.getValor()));
                } else {
                    parametrosIngresoCriterioHabilitante.addValue("varvalor", 0);
                }
                ingresarCriterioHabilitante.execute(parametrosIngresoCriterioHabilitante);
            }
        }
    }
}
