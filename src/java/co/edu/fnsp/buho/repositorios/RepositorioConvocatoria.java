/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Adenda;
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
    private SimpleJdbcCall postularAConvocatoria;
    private SimpleJdbcCall actualizarConvocatoria;
    private SimpleJdbcCall obtenerConvocatoria;
    private SimpleJdbcCall obtenerConvocatorias;
    private SimpleJdbcCall ingresarDocumentoConvocatoria;
    private SimpleJdbcCall actualizarDocumentoConvocatoria;
    private SimpleJdbcCall obtenerDocumentoConvocatoria;

    private SimpleJdbcCall ingresarAdenda;
    private SimpleJdbcCall eliminarAdenda;
    private SimpleJdbcCall actualizarAdenda;
    private SimpleJdbcCall obtenerAdenda;
    private SimpleJdbcCall obtenerAdendas;
    private SimpleJdbcCall obtenerDocumentoAdenda;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarConvocatoria");
        this.eliminarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarConvocatoria");
        this.postularAConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("postularAConvocatoria");
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
        this.obtenerAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAdenda");
        this.obtenerDocumentoAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoAdenda");
    }

    @Override
    public void ingresarConvocatoria(long idUsuario, Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        parametros.addValue("varTipoConvocatoria", convocatoria.getTipoConvocatoria());
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varArea", convocatoria.getArea());
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
                MapSqlParameterSource parametrosIngresoDocumentoConvocatoria = new MapSqlParameterSource();
                parametrosIngresoDocumentoConvocatoria.addValue("varIdAdenda", idAdenda);
                parametrosIngresoDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
                ingresarDocumentoConvocatoria.execute(parametrosIngresoDocumentoConvocatoria);
            }
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
    public void actualizarConvocatoria(Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varId", convocatoria.getId());
        parametros.addValue("varNombre", convocatoria.getNombre());
        parametros.addValue("varDescripcion", convocatoria.getDescripcion());
        parametros.addValue("varTipoConvocatoria", convocatoria.getTipoConvocatoria());
        parametros.addValue("varFechaFin", convocatoria.getFechaFin());
        parametros.addValue("varFechaInicio", convocatoria.getFechaInicio());
        parametros.addValue("varFechaResultados", convocatoria.getFechaPublicacionResultados());
        parametros.addValue("varArea", convocatoria.getArea());
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
        
        ActualizarAdenda(convocatoria.getId(), convocatoria.getAdendas());
    }

    @Override
    public Convocatoria obtenerConvocatoria(int idConvocatoria) {
        Convocatoria convocatoria = new Convocatoria();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdConvocatoria", idConvocatoria);

        Map resultado = obtenerConvocatoria.execute(parametros);
        convocatoria.setId(idConvocatoria);
        convocatoria.setArea((int) resultado.get("varArea"));
        convocatoria.setNombreArea((String) resultado.get("varNombreArea"));
        convocatoria.setDescripcion((String) resultado.get("varDescripcion"));
        convocatoria.setFechaFin((Date) resultado.get("varFechaFin"));
        convocatoria.setFechaFinFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaFin()));
        convocatoria.setFechaInicio((Date) resultado.get("varFechaInicio"));
        convocatoria.setFechaInicioFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaInicio()));
        convocatoria.setFechaPublicacionResultados((Date) resultado.get("varFechaResultados"));
        convocatoria.setFechaPublicacionResultadosFormateada(Util.obtenerFechaFormateada(convocatoria.getFechaPublicacionResultados()));
        convocatoria.setNombre((String) resultado.get("varNombre"));
        convocatoria.setTipoConvocatoria((int) resultado.get("varTipoConvocatoria"));
        convocatoria.setNombreTipoConvocatoria((String) resultado.get("varNombreTipoConvocatoria"));
        convocatoria.setTieneDocumento(((Boolean) resultado.get("varTieneDocumento")));

        Map resultadoAdenda = obtenerAdendas.execute(parametros);
        List<Adenda> adendas = (List<Adenda>) resultadoAdenda.get("adendas");
        convocatoria.setAdendas(adendas);

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

    private void ActualizarAdenda(int idConvocatoria, List<Adenda> adendas) {
        MapSqlParameterSource parametrosConsultaAdenda = new MapSqlParameterSource();
        parametrosConsultaAdenda.addValue("varIdConvocatoria", idConvocatoria);
        Map resultadoAdenda = obtenerAdenda.execute(parametrosConsultaAdenda);
        ArrayList<Adenda> entidadesInternacionalesActuales = (ArrayList<Adenda>) resultadoAdenda.get("entidadesInternacionalesProyecto");

        MapSqlParameterSource parametrosEliminacionAdenda = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionAdenda = new MapSqlParameterSource();
        for (Adenda adendaActual : entidadesInternacionalesActuales) {
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
                    MapSqlParameterSource parametrosIngresoDocumentoConvocatoria = new MapSqlParameterSource();
                    parametrosIngresoDocumentoConvocatoria.addValue("varIdAdenda", adendaModificado.getId());
                    parametrosIngresoDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
                    parametrosIngresoDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
                    actualizarDocumentoConvocatoria.execute(parametrosIngresoDocumentoConvocatoria);
                }                
            }
        }

        MapSqlParameterSource parametrosIngresoAdenda = new MapSqlParameterSource();
        parametrosIngresoAdenda.addValue("varIdConvocatoria", idConvocatoria);
        for (Adenda adenda : adendas) {
            if (adenda.getId() == 0) {
                parametrosIngresoAdenda.addValue("varDescripcion", adenda.getDescripcion());
                parametrosIngresoAdenda.addValue("varTipoAdenda", adenda.getTipoAdenda());
                parametrosIngresoAdenda.addValue("varFecha", adenda.getFecha());
                Map resultadoIngresoAdenda = ingresarAdenda.execute(parametrosIngresoAdenda);
                int idAdenda = (int) resultadoIngresoAdenda.get("varIdAdenda");
                Documento documento = adenda.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoDocumentoConvocatoria = new MapSqlParameterSource();
                    parametrosIngresoDocumentoConvocatoria.addValue("varIdAdenda", idAdenda);
                    parametrosIngresoDocumentoConvocatoria.addValue("varNombre", documento.getNombre());
                    parametrosIngresoDocumentoConvocatoria.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoDocumentoConvocatoria.addValue("varContenido", documento.getContenido());
                    ingresarDocumentoConvocatoria.execute(parametrosIngresoDocumentoConvocatoria);
                }
            }
        }
    }

    @Override
    public void postularConvocatoria(long idPersona, int idConvocatoria) {
        MapSqlParameterSource parametrosPostularAConvocatoria = new MapSqlParameterSource();
        parametrosPostularAConvocatoria.addValue("varIdPersona", idPersona);
        parametrosPostularAConvocatoria.addValue("varIdConvocatoria", idConvocatoria);
        postularAConvocatoria.execute(parametrosPostularAConvocatoria);
    }
}
