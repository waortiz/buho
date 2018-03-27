/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Adenda;
import co.edu.fnsp.buho.entidades.Persona;
import co.edu.fnsp.buho.entidades.Persona;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.Persona;
import co.edu.fnsp.buho.entidades.Persona;
import co.edu.fnsp.buho.utilidades.Util;
import java.text.ParseException;
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
@Repository("repositorioPersona")
public class RepositorioPersona implements IRepositorioPersona {

    private SimpleJdbcCall ingresarPersona;
    private SimpleJdbcCall eliminarPersona;
    private SimpleJdbcCall actualizarPersona;
    private SimpleJdbcCall obtenerPersona;
    private SimpleJdbcCall obtenerPersonas;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPersona");
        this.eliminarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarPersona");
        this.actualizarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarPersona");
        this.obtenerPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersona");
        this.obtenerPersonas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersonas").returningResultSet("personas", BeanPropertyRowMapper.newInstance(Persona.class));
    }

    @Override
    public void ingresarPersona(long idUsuario, Persona persona) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        Map resultado = ingresarPersona.execute(parametros);
        int idPersona = (int) resultado.get("varIdPersona");
    }

    @Override
    public void actualizarPersona(long idUsuario, Persona persona) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        actualizarPersona.execute(parametros);
    }

    @Override
    public Persona obtenerPersona(int idPersona) {
        Persona persona = new Persona();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);

        Map resultado = obtenerPersona.execute(parametros);

        return persona;
    }

    @Override
    public void eliminarPersona(int idPersona) {
        MapSqlParameterSource parametrosEliminacionPersona = new MapSqlParameterSource();
        parametrosEliminacionPersona.addValue("varIdPersona", idPersona);
        eliminarPersona.execute(parametrosEliminacionPersona);
    }

    @Override
    public List<Persona> obtenerPersonas() {
        Map resultado = obtenerPersonas.execute();
        List<Persona> personas = (List<Persona>) resultado.get("personas");

        return personas;
    }
}
