/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Persona;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

/**
 *
 * @author William
 */

@Repository("repositorioHojaVida")
public class RepositorioHojaVida implements IRepositorioHojaVida {
    
    private SimpleJdbcCall ingresarPersona;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPersona");
    }
    
    @Override
    public void ingresarPersona(Persona persona) {
         MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroId", persona.getNumeroId());
        parametros.addValue("varTipoId", persona.getTipoId());
        parametros.addValue("varLugarExpedicion", persona.getLugarExpedicion());
        parametros.addValue("varFechaExpedicion", persona.getFechaExpedicion());
        parametros.addValue("varLibretaMilitar", persona.getLibretaMilitar());
        parametros.addValue("varDistritoClase", persona.getDistritoClase());
        parametros.addValue("varNombres", persona.getNombres());
        parametros.addValue("varApellidos", persona.getApellidos());
        parametros.addValue("varFechaNacimiento", persona.getFechaNacimiento());
        parametros.addValue("varLugarNacimiento", persona.getLugarNacimiento());
        parametros.addValue("varNacionalidad", persona.getNacionalidad());
        parametros.addValue("varSexo", persona.getSexo());
        parametros.addValue("varCiudadResidencia", persona.getCiudadResidencia());
        parametros.addValue("varDireccion", persona.getDireccion());
        parametros.addValue("varEgresadoUdea", persona.isEgresadoUdea());
        parametros.addValue("varGrupoEtnico", persona.getGrupoEtnico());
        parametros.addValue("varDiscapacidad", persona.getDiscapacidad());
        parametros.addValue("varDisponeRut", persona.isDisponeRut());
        parametros.addValue("varActividadEconomica", persona.getActividadEconomica());
        parametros.addValue("varDisponibilidadViajar", persona.isDisponibilidadViajar());
        parametros.addValue("varTipoVinculacion", persona.getTipoVinculacion());
        
        ingresarPersona.execute(parametros);
    }
}
