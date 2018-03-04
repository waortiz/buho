/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Maestro;
import java.util.ArrayList;
import java.util.HashMap;
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
@Repository("repositorioMaestro")
public class RepositorioMaestro implements IRepositorioMaestro {

    private SimpleJdbcCall obtenerTiposIdentificacion;
    private SimpleJdbcCall obtenerActividadesEconomicas;
    private SimpleJdbcCall obtenerAreasSaber;
    private SimpleJdbcCall obtenerAreas;
    private SimpleJdbcCall obtenerCargos;
    private SimpleJdbcCall obtenerDedicaciones;
    private SimpleJdbcCall obtenerDepartamentos;
    private SimpleJdbcCall obtenerDiscapacidades;
    private SimpleJdbcCall obtenerGruposEtnicos;
    private SimpleJdbcCall obtenerIdiomas;
    private SimpleJdbcCall obtenerInstitucionesEducativas;
    private SimpleJdbcCall obtenerMunicipios;
    private SimpleJdbcCall obtenerNivelesFormacion;
    private SimpleJdbcCall obtenerPaises;
    private SimpleJdbcCall obtenerTiposAdenda;
    private SimpleJdbcCall obtenerTiposCapacitacion;
    private SimpleJdbcCall obtenerTiposContrato;
    private SimpleJdbcCall obtenerTiposConvocatoria;
    private SimpleJdbcCall obtenerTiposDocumento;
    private SimpleJdbcCall obtenerTiposExperiencia;
    private SimpleJdbcCall obtenerTiposInstitucion;
    private SimpleJdbcCall obtenerTiposTelefono;
    private SimpleJdbcCall obtenerTiposVinculacionUdeA;
    private SimpleJdbcCall obtenerSedes;
    private SimpleJdbcCall obtenerProgramas;
    private SimpleJdbcCall obtenerCriteriosHabilitantes;
    private SimpleJdbcCall obtenerCriteriosEvaluacion;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerTiposIdentificacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposIdentificacion").returningResultSet("tiposIdentificacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerActividadesEconomicas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerActividadesEconomicas").returningResultSet("actividadesEconomicas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerAreasSaber = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAreasSaber").returningResultSet("areasSaber", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerAreas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAreas").returningResultSet("areas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCargos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCargos").returningResultSet("cargos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDedicaciones = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDedicaciones").returningResultSet("dedicaciones", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDepartamentos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDepartamentos").returningResultSet("departamentos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDiscapacidades = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDiscapacidades").returningResultSet("discapacidades", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerGruposEtnicos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerGruposEtnicos").returningResultSet("gruposEtnicos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerIdiomas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerIdiomas").returningResultSet("idiomas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerInstitucionesEducativas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerInstitucionesEducativas").returningResultSet("institucionesEducativas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerMunicipios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerMunicipios").returningResultSet("municipios", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerNivelesFormacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNivelesFormacion").returningResultSet("nivelesFormacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerPaises = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPaises").returningResultSet("paises", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposAdenda").returningResultSet("tiposAdenda", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposCapacitacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposCapacitacion").returningResultSet("tiposCapacitacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposContrato = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposContrato").returningResultSet("tiposContrato", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposConvocatoria").returningResultSet("tiposConvocatoria", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposDocumento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposDocumento").returningResultSet("tiposDocumento", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposExperiencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposExperiencia").returningResultSet("tiposExperiencia", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposInstitucion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposInstitucion").returningResultSet("tiposInstitucion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposTelefono = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposTelefono").returningResultSet("tiposTelefono", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposVinculacionUdeA = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposVinculacionUdeA").returningResultSet("tiposVinculacionUdeA", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerSedes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerSedes").returningResultSet("sedes", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerProgramas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProgramas").returningResultSet("programas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCriteriosHabilitantes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosHabilitantes").returningResultSet("criteriosHabilitantes", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCriteriosEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosEvaluacion").returningResultSet("criteriosEvaluacion", BeanPropertyRowMapper.newInstance(Maestro.class));
    }

    @Override
    public List<Maestro> obtenerTiposIdentificacion() {
        Map resultado = obtenerTiposIdentificacion.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposIdentificacion");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerActividadesEconomicas() {
        Map resultado = obtenerActividadesEconomicas.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("actividadesEconomicas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerAreasSaber() {
        Map resultado = obtenerAreasSaber.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("areasSaber");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerAreas() {
        Map resultado = obtenerAreas.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("areas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerCargos() {
        Map resultado = obtenerCargos.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("cargos");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerDedicaciones() {
        Map resultado = obtenerDedicaciones.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("dedicaciones");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerDepartamentos(int idPais) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPais", idPais);
        Map resultado = obtenerDepartamentos.execute(parametros);
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("departamentos");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerDiscapacidades() {
        Map resultado = obtenerDiscapacidades.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("discapacidades");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerGruposEtnicos() {
        Map resultado = obtenerGruposEtnicos.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("gruposEtnicos");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerIdiomas() {
        Map resultado = obtenerIdiomas.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("idiomas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativas() {
        Map resultado = obtenerInstitucionesEducativas.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("institucionesEducativas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerMunicipios(String codigoDepartamento) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varCodigoDepartamento", codigoDepartamento);
        Map resultado = obtenerMunicipios.execute(parametros);
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("municipios");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerNivelesFormacion() {
        Map resultado = obtenerNivelesFormacion.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("nivelesFormacion");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerPaises() {
        Map resultado = obtenerPaises.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("paises");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposAdenda() {
        Map resultado = obtenerTiposAdenda.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposAdenda");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposCapacitacion() {
        Map resultado = obtenerTiposCapacitacion.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposCapacitacion");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposContrato() {
        Map resultado = obtenerTiposContrato.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposContrato");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposConvocatoria() {
        Map resultado = obtenerTiposConvocatoria.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposConvocatoria");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposDocumento() {
        Map resultado = obtenerTiposDocumento.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposDocumento");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposExperiencia() {
        Map resultado = obtenerTiposExperiencia.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposExperiencia");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposInstitucion() {
        Map resultado = obtenerTiposInstitucion.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposInstitucion");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposTelefono() {
        Map resultado = obtenerTiposTelefono.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposTelefono");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposVinculacionUdeA() {
        Map resultado = obtenerTiposVinculacionUdeA.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposVinculacionUdeA");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerSedes() {
        Map resultado = obtenerSedes.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("sedes");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerProgramas(int idSede) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdSede", idSede);
        Map resultado = obtenerProgramas.execute(parametros);
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("programas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerCriteriosHabilitantes() {
       Map resultado = obtenerCriteriosHabilitantes.execute(new HashMap<>());
       List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("criteriosHabilitantes");

       return coleccion;
    }

    @Override
    public List<Maestro> obtenerCriteriosEvaluacion() {
       Map resultado = obtenerCriteriosEvaluacion.execute(new HashMap<>());
       List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("criteriosEvaluacion");

       return coleccion;
    }

}
