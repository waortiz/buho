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
    private SimpleJdbcCall obtenerTipoIdentificacion;
    private SimpleJdbcCall obtenerActividadesEconomicas;
    private SimpleJdbcCall obtenerActividadEconomica;
    private SimpleJdbcCall obtenerNucleosBasicosConocimiento;
    private SimpleJdbcCall obtenerCargos;
    private SimpleJdbcCall obtenerDedicaciones;
    private SimpleJdbcCall obtenerDepartamentos;
    private SimpleJdbcCall obtenerDiscapacidades;
    private SimpleJdbcCall obtenerDiscapacidad;
    private SimpleJdbcCall obtenerGruposEtnicos;
    private SimpleJdbcCall obtenerGrupoEtnico;
    private SimpleJdbcCall obtenerIdiomas;
    private SimpleJdbcCall obtenerInstitucionesEducativas;
    private SimpleJdbcCall obtenerInstitucionesEducativasExtranjeras;
    private SimpleJdbcCall obtenerInstitucionesEducativasColombianas;
    private SimpleJdbcCall obtenerMunicipios;
    private SimpleJdbcCall obtenerMunicipio;
    private SimpleJdbcCall obtenerNivelesFormacion;
    private SimpleJdbcCall obtenerNivelesIdioma;
    private SimpleJdbcCall obtenerPaises;
    private SimpleJdbcCall obtenerPais;
    private SimpleJdbcCall obtenerTiposAdenda;
    private SimpleJdbcCall obtenerTiposCapacitacion;
    private SimpleJdbcCall obtenerTiposContrato;
    private SimpleJdbcCall obtenerTiposConvocatoria;
    private SimpleJdbcCall obtenerTiposCertificacionIdioma;
    private SimpleJdbcCall obtenerTiposDocumento;
    private SimpleJdbcCall obtenerTiposExperiencia;
    private SimpleJdbcCall obtenerTiposInstitucion;
    private SimpleJdbcCall obtenerTiposTelefono;
    private SimpleJdbcCall obtenerTiposVinculacionUdeA;
    private SimpleJdbcCall obtenerTipoVinculacionUdeA;
    private SimpleJdbcCall obtenerSedes;
    private SimpleJdbcCall obtenerProgramasSede;
    private SimpleJdbcCall obtenerProgramasInstitucion;
    private SimpleJdbcCall obtenerProgramasNucleoBasicoConocimiento;
    private SimpleJdbcCall obtenerCriteriosHabilitantes;
    private SimpleJdbcCall obtenerCriteriosEvaluacion;
    private SimpleJdbcCall obtenerModalidadesCurso;
    private SimpleJdbcCall obtenerNaturalezasCargo;
    private SimpleJdbcCall obtenerTiposInvestigador;
    private SimpleJdbcCall obtenerTiposAutorArticulo;
    private SimpleJdbcCall obtenerClasesPatente;
    private SimpleJdbcCall obtenerTiposProductosConocimiento;
    private SimpleJdbcCall obtenerTiposPatente;
    private SimpleJdbcCall obtenerCapacitaciones;
    private SimpleJdbcCall obtenerCamposHojaVida;

    private SimpleJdbcCall ingresarPrograma;
    private SimpleJdbcCall ingresarInstitucion;
    private SimpleJdbcCall ingresarDepartamento;
    private SimpleJdbcCall ingresarMunicipio;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerTiposIdentificacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposIdentificacion").returningResultSet("tiposIdentificacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTipoIdentificacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTipoIdentificacion");
        this.obtenerActividadesEconomicas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerActividadesEconomicas").returningResultSet("actividadesEconomicas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerActividadEconomica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerActividadEconomica");
        this.obtenerNucleosBasicosConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNucleosBasicosConocimiento").returningResultSet("nucleosBasicoConocimiento", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCargos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCargos").returningResultSet("cargos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDedicaciones = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDedicaciones").returningResultSet("dedicaciones", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDepartamentos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDepartamentos").returningResultSet("departamentos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDiscapacidades = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDiscapacidades").returningResultSet("discapacidades", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerDiscapacidad = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDiscapacidad");
        this.obtenerGruposEtnicos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerGruposEtnicos").returningResultSet("gruposEtnicos", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerGrupoEtnico = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerGrupoEtnico");
        this.obtenerIdiomas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerIdiomas").returningResultSet("idiomas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerInstitucionesEducativas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerInstitucionesEducativas").returningResultSet("institucionesEducativas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerInstitucionesEducativasExtranjeras = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerInstitucionesEducativasExtranjeras").returningResultSet("institucionesEducativas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerInstitucionesEducativasColombianas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerInstitucionesEducativasColombianas").returningResultSet("institucionesEducativas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerMunicipios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerMunicipios").returningResultSet("municipios", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerMunicipio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerMunicipio");
        this.obtenerNivelesFormacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNivelesFormacion").returningResultSet("nivelesFormacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerPaises = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPaises").returningResultSet("paises", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerPais = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPais");
        this.obtenerTiposAdenda = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposAdenda").returningResultSet("tiposAdenda", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposCapacitacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposCapacitacion").returningResultSet("tiposCapacitacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposContrato = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposContrato").returningResultSet("tiposContrato", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposConvocatoria").returningResultSet("tiposConvocatoria", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposCertificacionIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposCertificacionIdioma").returningResultSet("tiposCertificacionIdioma", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerNivelesIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNivelesIdioma").returningResultSet("nivelesIdioma", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposDocumento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposDocumento").returningResultSet("tiposDocumento", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposExperiencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposExperiencia").returningResultSet("tiposExperiencia", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposInstitucion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposInstitucion").returningResultSet("tiposInstitucion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposTelefono = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposTelefono").returningResultSet("tiposTelefono", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposVinculacionUdeA = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposVinculacionUdeA").returningResultSet("tiposVinculacionUdeA", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTipoVinculacionUdeA = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTipoVinculacionUdeA");
        this.obtenerSedes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerSedes").returningResultSet("sedes", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerProgramasSede = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProgramasSede").returningResultSet("programas", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerProgramasInstitucion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProgramasInstitucion").returningResultSet("programas", BeanPropertyRowMapper.newInstance(Programa.class));
        this.obtenerProgramasNucleoBasicoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProgramasNucleoBasicoConocimiento").returningResultSet("programas", BeanPropertyRowMapper.newInstance(Programa.class));
        this.obtenerCriteriosHabilitantes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosHabilitantes").returningResultSet("criteriosHabilitantes", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCriteriosEvaluacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCriteriosEvaluacion").returningResultSet("criteriosEvaluacion", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerNaturalezasCargo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNaturalezasCargo").returningResultSet("naturalezasCargo", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerModalidadesCurso = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerModalidadesCurso").returningResultSet("modalidadesCurso", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposInvestigador = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposInvestigador").returningResultSet("tiposInvestigador", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposAutorArticulo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposAutorArticulo").returningResultSet("tiposAutorArticulo", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposPatente").returningResultSet("tiposPatente", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerTiposProductosConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTiposProductosConocimiento").returningResultSet("tiposProductosConocimiento", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerClasesPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerClasesPatente").returningResultSet("clasesPatente", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCapacitaciones = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCapacitaciones").returningResultSet("capacitaciones", BeanPropertyRowMapper.newInstance(Maestro.class));
        this.obtenerCamposHojaVida = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCamposHojaVida").returningResultSet("camposHojaVida", BeanPropertyRowMapper.newInstance(CampoHojaVida.class));
        this.ingresarPrograma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPrograma");
        this.ingresarInstitucion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarInstitucion");
        this.ingresarDepartamento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDepartamento");
        this.ingresarMunicipio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarMunicipio");
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
    public List<Maestro> obtenerNucleosBasicosConocimiento() {
        Map resultado = obtenerNucleosBasicosConocimiento.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("nucleosBasicoConocimiento");

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
    public List<Maestro> obtenerNivelesIdioma() {
        Map resultado = obtenerNivelesIdioma.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("nivelesIdioma");

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
        Map resultado = obtenerProgramasSede.execute(parametros);
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

    @Override
    public List<Maestro> obtenerTiposCertificacionIdioma() {
        Map resultado = obtenerTiposCertificacionIdioma.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposCertificacionIdioma");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerNaturalezasCargo() {
        Map resultado = obtenerNaturalezasCargo.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("naturalezasCargo");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerModalidadesCurso() {
        Map resultado = obtenerModalidadesCurso.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("modalidadesCurso");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposInvestigador() {
        Map resultado = obtenerTiposInvestigador.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposInvestigador");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposAutorArticulo() {
        Map resultado = obtenerTiposAutorArticulo.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposAutorArticulo");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerClasesPatente() {
        Map resultado = obtenerClasesPatente.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("clasesPatente");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposProductosConocimiento() {
        Map resultado = obtenerTiposProductosConocimiento.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposProductosConocimiento");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerTiposPatente() {
        Map resultado = obtenerTiposPatente.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("tiposPatente");

        return coleccion;
    }

    @Override
    public List<Programa> obtenerProgramasInstitucion(int institucion, int nivel) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varInstitucion", institucion);
        parametros.addValue("varNivel", nivel);
        Map resultado = obtenerProgramasInstitucion.execute(parametros);
        List<Programa> coleccion = (ArrayList<Programa>) resultado.get("programas");

        return coleccion;
    }

    @Override
    public List<Programa> obtenerProgramasNucleoBasicoConocimiento(int nucleoBasicoConocimiento) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNucleoBasicoConocimiento", nucleoBasicoConocimiento);
        Map resultado = obtenerProgramasNucleoBasicoConocimiento.execute(parametros);
        List<Programa> coleccion = (ArrayList<Programa>) resultado.get("programas");

        return coleccion;
    }
    
    @Override
    public List<Maestro> obtenerCapacitaciones(Integer tipoCapacitacion, Integer nucleoBasicoConocimiento) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varTipoCapacitacion", tipoCapacitacion);
        parametros.addValue("varNucleoBasicoConocimiento", nucleoBasicoConocimiento);
        Map resultado = obtenerCapacitaciones.execute(parametros);
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("capacitaciones");

        return coleccion;
    }

    @Override
    public List<CampoHojaVida> obtenerCamposHojaVida() {
        Map resultado = obtenerCamposHojaVida.execute(new HashMap<>());
        List<CampoHojaVida> coleccion = (ArrayList<CampoHojaVida>) resultado.get("camposHojaVida");

        return coleccion;
    }

    @Override
    public int ingresarProgramaInstitucion(Programa programa) {
        MapSqlParameterSource parametrosIngresoInstitucion = new MapSqlParameterSource();
        parametrosIngresoInstitucion.addValue("varNombre", programa.getInstitucion());
        Map resultadoIngresoInstitucion = ingresarInstitucion.execute(parametrosIngresoInstitucion);
        int idInstitucion = (int) resultadoIngresoInstitucion.get("varId");

        MapSqlParameterSource parametrosIngresoPrograma = new MapSqlParameterSource();
        parametrosIngresoPrograma.addValue("varinstitucion", idInstitucion);
        parametrosIngresoPrograma.addValue("varnucleobasicoconocimiento", programa.getNucleoBasicoConocimiento());
        parametrosIngresoPrograma.addValue("varnombre", programa.getNombre());
        parametrosIngresoPrograma.addValue("vartitulo", programa.getTitulo());
        parametrosIngresoPrograma.addValue("varnivel", programa.getNivel());

        Map resultadoIngresoPrograma = ingresarPrograma.execute(parametrosIngresoPrograma);
        int idPrograma = (int) resultadoIngresoPrograma.get("varId");

        return idPrograma;
    }

    @Override
    public Ciudad ingresarCiudad(Ciudad ciudad) {
        String codigoDepartamento = ciudad.getDepartamento();
        if (ciudad.getDepartamento() == null || ciudad.getDepartamento().trim().length() == 0) {
            MapSqlParameterSource parametrosIngresoDepartamento = new MapSqlParameterSource();
            parametrosIngresoDepartamento.addValue("varNombre", null);
            parametrosIngresoDepartamento.addValue("varPais", ciudad.getPais());
            Map resultadoIngresoDepartamento = ingresarDepartamento.execute(parametrosIngresoDepartamento);
            codigoDepartamento = (String) resultadoIngresoDepartamento.get("varCodigo");
        }

        MapSqlParameterSource parametrosIngresoMunicipio = new MapSqlParameterSource();
        parametrosIngresoMunicipio.addValue("varDepartamento", codigoDepartamento);
        parametrosIngresoMunicipio.addValue("varnombre", ciudad.getNombre());

        Map resultadoIngresoMunicipio = ingresarMunicipio.execute(parametrosIngresoMunicipio);
        String codigoCiudad = (String) resultadoIngresoMunicipio.get("varCodigo");

        Ciudad nuevaCiudad = new Ciudad();
        nuevaCiudad.setId(codigoCiudad);
        nuevaCiudad.setDepartamento(codigoDepartamento);
        
        return nuevaCiudad;

    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativasExtranjeras() {
        Map resultado = obtenerInstitucionesEducativasExtranjeras.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("institucionesEducativas");

        return coleccion;
    }

    @Override
    public List<Maestro> obtenerInstitucionesEducativasColombianas() {
        Map resultado = obtenerInstitucionesEducativasColombianas.execute(new HashMap<>());
        List<Maestro> coleccion = (ArrayList<Maestro>) resultado.get("institucionesEducativas");

        return coleccion;
    }

    @Override
    public int ingresarInstitucion(Institucion institucion) {
        MapSqlParameterSource parametrosIngresoInstitucion = new MapSqlParameterSource();
        parametrosIngresoInstitucion.addValue("varNombre", institucion.getNombre());
        Map resultadoIngresoInstitucion = ingresarInstitucion.execute(parametrosIngresoInstitucion);
        int idInstitucion = (int) resultadoIngresoInstitucion.get("varId");
        
        return idInstitucion;
    }

    @Override
    public Maestro obtenerMunicipio(String codigoMunicipio) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varCodigoMunicipio", codigoMunicipio);
        Map resultadoConsulta = obtenerMunicipio.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(codigoMunicipio);
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerActividadEconomica(int id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerActividadEconomica.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(Integer.toString(id));
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerTipoVinculacionUdeA(int id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerTipoVinculacionUdeA.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(Integer.toString(id));
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerPais(int id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerPais.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(Integer.toString(id));
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerGrupoEtnico(int id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerGrupoEtnico.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(Integer.toString(id));
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerDiscapacidad(int id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerDiscapacidad.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(Integer.toString(id));
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }

    @Override
    public Maestro obtenerTipoIdentificacion(String id) {
        MapSqlParameterSource parametrosConsulta = new MapSqlParameterSource();
        parametrosConsulta.addValue("varId", id);
        Map resultadoConsulta = obtenerTipoIdentificacion.execute(parametrosConsulta);
        Maestro maestro = new Maestro();
        maestro.setId(id);
        maestro.setNombre((String) resultadoConsulta.get("varNombre"));
        
        return maestro;
    }
}
