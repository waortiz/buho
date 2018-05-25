/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.CursoExperienciaDocencia;
import co.edu.fnsp.buho.entidades.Distincion;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import co.edu.fnsp.buho.entidades.Terminos;
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
@Repository("repositorioHojaVida")
public class RepositorioHojaVida implements IRepositorioHojaVida {

    private SimpleJdbcCall ingresarPersona;
    private SimpleJdbcCall actualizarPersona;
    private SimpleJdbcCall validarExistenciaPersona;
    private SimpleJdbcCall obtenerNumeroIdentificacionPersona;
    private SimpleJdbcCall obtenerHojasVida;
    private SimpleJdbcCall obtenerPersona;
    private SimpleJdbcCall eliminarHojaVida;

    private SimpleJdbcCall ingresarDocumentoSoporte;
    private SimpleJdbcCall obtenerDocumentoSoporte;
    private SimpleJdbcCall obtenerDocumentoSoportePorTipo;
    private SimpleJdbcCall actualizarDocumentoSoporte;
    private SimpleJdbcCall actualizarDocumentoSoportePorTipo;
    private SimpleJdbcCall eliminarDocumentoSoporte;
    private SimpleJdbcCall obtenerDocumentosSoporte;

    private SimpleJdbcCall ingresarTelefono;
    private SimpleJdbcCall eliminarTelefono;
    private SimpleJdbcCall actualizarTelefono;
    private SimpleJdbcCall obtenerTelefonos;

    private SimpleJdbcCall ingresarCuentaBancaria;
    private SimpleJdbcCall eliminarCuentaBancaria;
    private SimpleJdbcCall actualizarCuentaBancaria;
    private SimpleJdbcCall obtenerCuentasBancarias;

    private SimpleJdbcCall ingresarCorreoElectronico;
    private SimpleJdbcCall eliminarCorreoElectronico;
    private SimpleJdbcCall actualizarCorreoElectronico;
    private SimpleJdbcCall obtenerCorreosElectronicos;

    private SimpleJdbcCall ingresarIdioma;
    private SimpleJdbcCall obtenerIdiomas;
    private SimpleJdbcCall actualizarIdioma;
    private SimpleJdbcCall eliminarIdioma;
    private SimpleJdbcCall ingresarCertificadoIdioma;
    private SimpleJdbcCall actualizarCertificadoIdioma;
    private SimpleJdbcCall obtenerCertificadoIdioma;

    private SimpleJdbcCall ingresarEducacionBasica;
    private SimpleJdbcCall obtenerEducacionesBasicas;
    private SimpleJdbcCall actualizarEducacionBasica;
    private SimpleJdbcCall eliminarEducacionBasica;
    private SimpleJdbcCall ingresarCertificadoEducacionBasica;
    private SimpleJdbcCall actualizarCertificadoEducacionBasica;
    private SimpleJdbcCall obtenerCertificadoEducacionBasica;

    private SimpleJdbcCall ingresarEducacionSuperior;
    private SimpleJdbcCall obtenerEducacionesSuperiores;
    private SimpleJdbcCall actualizarEducacionSuperior;
    private SimpleJdbcCall eliminarEducacionSuperior;
    private SimpleJdbcCall ingresarCertificadoEducacionSuperior;
    private SimpleJdbcCall actualizarCertificadoEducacionSuperior;
    private SimpleJdbcCall obtenerCertificadoEducacionSuperior;
    private SimpleJdbcCall ingresarCertificadoHomologadoEducacionSuperior;
    private SimpleJdbcCall eliminarCertificadoHomologadoEducacionSuperior;
    private SimpleJdbcCall actualizarCertificadoHomologadoEducacionSuperior;
    private SimpleJdbcCall obtenerCertificadoHomologadoEducacionSuperior;

    private SimpleJdbcCall ingresarEducacionContinua;
    private SimpleJdbcCall obtenerEducacionesContinuas;
    private SimpleJdbcCall actualizarEducacionContinua;
    private SimpleJdbcCall eliminarEducacionContinua;
    private SimpleJdbcCall ingresarCertificadoEducacionContinua;
    private SimpleJdbcCall actualizarCertificadoEducacionContinua;
    private SimpleJdbcCall obtenerCertificadoEducacionContinua;

    private SimpleJdbcCall ingresarDistincion;
    private SimpleJdbcCall obtenerDistinciones;
    private SimpleJdbcCall actualizarDistincion;
    private SimpleJdbcCall eliminarDistincion;
    private SimpleJdbcCall ingresarCertificadoDistincion;
    private SimpleJdbcCall actualizarCertificadoDistincion;
    private SimpleJdbcCall obtenerCertificadoDistincion;

    private SimpleJdbcCall ingresarExperienciaLaboral;
    private SimpleJdbcCall obtenerExperienciasLaborales;
    private SimpleJdbcCall actualizarExperienciaLaboral;
    private SimpleJdbcCall eliminarExperienciaLaboral;
    private SimpleJdbcCall ingresarCertificadoExperienciaLaboral;
    private SimpleJdbcCall actualizarCertificadoExperienciaLaboral;
    private SimpleJdbcCall obtenerCertificadoExperienciaLaboral;

    private SimpleJdbcCall ingresarExperienciaDocencia;
    private SimpleJdbcCall obtenerExperienciasDocencia;
    private SimpleJdbcCall actualizarExperienciaDocencia;
    private SimpleJdbcCall eliminarExperienciaDocencia;
    private SimpleJdbcCall ingresarCursoExperienciaDocencia;
    private SimpleJdbcCall obtenerCursosExperienciaDocencia;
    private SimpleJdbcCall actualizarCursoExperienciaDocencia;
    private SimpleJdbcCall eliminarCursoExperienciaDocencia;
    private SimpleJdbcCall ingresarCertificadoCursoExperienciaDocencia;
    private SimpleJdbcCall actualizarCertificadoCursoExperienciaDocencia;
    private SimpleJdbcCall obtenerCertificadoCursoExperienciaDocencia;

    private SimpleJdbcCall ingresarInvestigador;
    private SimpleJdbcCall obtenerInvestigador;
    private SimpleJdbcCall actualizarInvestigador;

    private SimpleJdbcCall ingresarArticulo;
    private SimpleJdbcCall eliminarArticulo;
    private SimpleJdbcCall actualizarArticulo;
    private SimpleJdbcCall obtenerArticulos;

    private SimpleJdbcCall ingresarPatente;
    private SimpleJdbcCall obtenerPatentes;
    private SimpleJdbcCall actualizarPatente;
    private SimpleJdbcCall eliminarPatente;
    private SimpleJdbcCall ingresarDocumentoPatente;
    private SimpleJdbcCall actualizarDocumentoPatente;
    private SimpleJdbcCall obtenerDocumentoPatente;

    private SimpleJdbcCall ingresarProductoConocimiento;
    private SimpleJdbcCall obtenerProductosConocimiento;
    private SimpleJdbcCall actualizarProductoConocimiento;
    private SimpleJdbcCall eliminarProductoConocimiento;
    private SimpleJdbcCall ingresarDocumentoProductoConocimiento;
    private SimpleJdbcCall actualizarDocumentoProductoConocimiento;
    private SimpleJdbcCall obtenerDocumentoProductoConocimiento;

    private SimpleJdbcCall ingresarTerminos;
    private SimpleJdbcCall existenTerminos;

    private final int ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN = 1201;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL = 1219;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_ANDES = 1220;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA = 1221;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO = 1222;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_TURBO = 1223;
    private final int ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA = 9125;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPersona");
        this.actualizarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarPersona");
        this.validarExistenciaPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("validarExistenciaPersona");
        this.obtenerNumeroIdentificacionPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerNumeroIdentificacionPersona");
        this.obtenerPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersona");
        this.obtenerHojasVida = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerHojasVida").returningResultSet("hojasVida", BeanPropertyRowMapper.newInstance(HojaVida.class));
        this.eliminarHojaVida = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarHojaVida");

        this.ingresarDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoSoporte");
        this.eliminarDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarDocumentoSoporte");
        this.obtenerDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoSoporte");
        this.obtenerDocumentoSoportePorTipo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoSoportePorTipo");
        this.actualizarDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoSoporte");
        this.actualizarDocumentoSoportePorTipo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoSoportePorTipo");
        this.obtenerDocumentosSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentosSoporte").returningResultSet("documentosSoporte", BeanPropertyRowMapper.newInstance(DocumentoSoporte.class));

        this.ingresarTelefono = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarTelefono");
        this.eliminarTelefono = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarTelefono");
        this.actualizarTelefono = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarTelefono");
        this.obtenerTelefonos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerTelefonos").returningResultSet("telefonos", BeanPropertyRowMapper.newInstance(Telefono.class));

        this.ingresarCuentaBancaria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCuentaBancaria");
        this.eliminarCuentaBancaria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCuentaBancaria");
        this.actualizarCuentaBancaria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCuentaBancaria");
        this.obtenerCuentasBancarias = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCuentasBancarias").returningResultSet("cuentasBancarias", BeanPropertyRowMapper.newInstance(CuentaBancaria.class));

        this.ingresarCorreoElectronico = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCorreoElectronico");
        this.eliminarCorreoElectronico = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCorreoElectronico");
        this.actualizarCorreoElectronico = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCorreoElectronico");
        this.obtenerCorreosElectronicos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCorreosElectronicos").returningResultSet("correosElectronicos", BeanPropertyRowMapper.newInstance(CorreoElectronico.class));

        this.ingresarIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarIdiomaHojaVida");
        this.eliminarIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarIdiomaHojaVida");
        this.actualizarIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarIdiomaHojaVida");
        this.obtenerIdiomas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerIdiomasHojaVida").returningResultSet("idiomas", BeanPropertyRowMapper.newInstance(Idioma.class));
        this.obtenerCertificadoIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoIdiomaHojaVida");
        this.ingresarCertificadoIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoIdiomaHojaVida");
        this.actualizarCertificadoIdioma = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoIdiomaHojaVida");

        this.ingresarEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarEducacionBasica");
        this.eliminarEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarEducacionBasica");
        this.actualizarEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarEducacionBasica");
        this.obtenerEducacionesBasicas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEducacionesBasicas").returningResultSet("educacionesBasicas", BeanPropertyRowMapper.newInstance(EducacionBasica.class));
        this.obtenerCertificadoEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoEducacionBasica");
        this.ingresarCertificadoEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoEducacionBasica");
        this.actualizarCertificadoEducacionBasica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoEducacionBasica");

        this.ingresarEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarEducacionSuperior");
        this.eliminarEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarEducacionSuperior");
        this.actualizarEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarEducacionSuperior");
        this.obtenerEducacionesSuperiores = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEducacionesSuperiores").returningResultSet("educacionesSuperiores", BeanPropertyRowMapper.newInstance(EducacionSuperior.class));
        this.obtenerCertificadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoEducacionSuperior");
        this.ingresarCertificadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoEducacionSuperior");
        this.actualizarCertificadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoEducacionSuperior");
        this.obtenerCertificadoHomologadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoHomologadoEducacionSuperior");
        this.ingresarCertificadoHomologadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoHomologadoEducacionSuperior");
        this.actualizarCertificadoHomologadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoHomologadoEducacionSuperior");
        this.eliminarCertificadoHomologadoEducacionSuperior = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCertificadoHomologadoEducacionSuperior");

        this.ingresarEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarEducacionContinua");
        this.eliminarEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarEducacionContinua");
        this.actualizarEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarEducacionContinua");
        this.obtenerEducacionesContinuas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEducacionesContinuas").returningResultSet("educacionesContinuas", BeanPropertyRowMapper.newInstance(EducacionContinua.class));
        this.obtenerCertificadoEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoEducacionContinua");
        this.ingresarCertificadoEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoEducacionContinua");
        this.actualizarCertificadoEducacionContinua = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoEducacionContinua");

        this.ingresarDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDistincion");
        this.eliminarDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarDistincion");
        this.actualizarDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDistincion");
        this.obtenerDistinciones = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDistinciones").returningResultSet("distinciones", BeanPropertyRowMapper.newInstance(Distincion.class));
        this.obtenerCertificadoDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoDistincion");
        this.ingresarCertificadoDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoDistincion");
        this.actualizarCertificadoDistincion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoDistincion");

        this.ingresarExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarExperienciaLaboral");
        this.eliminarExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarExperienciaLaboral");
        this.actualizarExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarExperienciaLaboral");
        this.obtenerExperienciasLaborales = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerExperienciasLaborales").returningResultSet("experienciasLaborales", BeanPropertyRowMapper.newInstance(ExperienciaLaboral.class));
        this.obtenerCertificadoExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoExperienciaLaboral");
        this.ingresarCertificadoExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoExperienciaLaboral");
        this.actualizarCertificadoExperienciaLaboral = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoExperienciaLaboral");

        this.ingresarExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarExperienciaDocencia");
        this.eliminarExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarExperienciaDocencia");
        this.actualizarExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarExperienciaDocencia");
        this.obtenerExperienciasDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerExperienciasDocencia").returningResultSet("experienciasDocencia", BeanPropertyRowMapper.newInstance(ExperienciaDocencia.class));
        this.ingresarCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCursoExperienciaDocencia");
        this.eliminarCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarCursoExperienciaDocencia");
        this.actualizarCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCursoExperienciaDocencia");
        this.obtenerCursosExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCursosExperienciaDocencia").returningResultSet("cursosExperienciaDocencia", BeanPropertyRowMapper.newInstance(CursoExperienciaDocencia.class));
        this.obtenerCertificadoCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCertificadoCursoExperienciaDocencia");
        this.ingresarCertificadoCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarCertificadoCursoExperienciaDocencia");
        this.actualizarCertificadoCursoExperienciaDocencia = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarCertificadoCursoExperienciaDocencia");

        this.ingresarInvestigador = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarInvestigador");
        this.actualizarInvestigador = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarInvestigador");
        this.obtenerInvestigador = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerInvestigador");

        this.ingresarArticulo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarArticulo");
        this.eliminarArticulo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarArticulo");
        this.actualizarArticulo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarArticulo");
        this.obtenerArticulos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerArticulos").returningResultSet("articulos", BeanPropertyRowMapper.newInstance(Articulo.class));

        this.ingresarPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPatente");
        this.eliminarPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarPatente");
        this.actualizarPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarPatente");
        this.obtenerPatentes = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPatentes").returningResultSet("patentes", BeanPropertyRowMapper.newInstance(Patente.class));
        this.obtenerDocumentoPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoPatente");
        this.ingresarDocumentoPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoPatente");
        this.actualizarDocumentoPatente = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoPatente");

        this.ingresarProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarProductoConocimiento");
        this.eliminarProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarProductoConocimiento");
        this.actualizarProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarProductoConocimiento");
        this.obtenerProductosConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProductosConocimiento").returningResultSet("productosConocimiento", BeanPropertyRowMapper.newInstance(ProductoConocimiento.class));
        this.obtenerDocumentoProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoProductoConocimiento");
        this.ingresarDocumentoProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoProductoConocimiento");
        this.actualizarDocumentoProductoConocimiento = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoProductoConocimiento");

        this.ingresarTerminos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarTerminos");
        this.existenTerminos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("existenTerminos");
    }

    @Override
    public long ingresarHojaVida(long idUsuario, HojaVida hojaVida) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        parametros.addValue("varNumeroId", hojaVida.getNumeroIdentificacion());
        parametros.addValue("varTipoId", hojaVida.getTipoIdentificacion());
        parametros.addValue("varLugarExpedicion", hojaVida.getLugarExpedicion());
        parametros.addValue("varFechaExpedicion", hojaVida.getFechaExpedicion());
        parametros.addValue("varLibretaMilitar", hojaVida.getLibretaMilitar());
        parametros.addValue("varDistritoClase", hojaVida.getDistritoClase());
        parametros.addValue("varNombres", hojaVida.getNombres());
        parametros.addValue("varApellidos", hojaVida.getApellidos());
        parametros.addValue("varFechaNacimiento", hojaVida.getFechaNacimiento());
        parametros.addValue("varLugarNacimiento", hojaVida.getLugarNacimiento());
        parametros.addValue("varNacionalidad", hojaVida.getNacionalidad());
        parametros.addValue("varSexo", hojaVida.getSexo());
        parametros.addValue("varCiudadResidencia", hojaVida.getCiudadResidencia());
        parametros.addValue("varDireccion", hojaVida.getDireccion());
        parametros.addValue("varEgresadoUDEA", hojaVida.isEgresadoUDEA());
        parametros.addValue("varEmpleadoUDEA", hojaVida.isEmpleadoUDEA());
        parametros.addValue("varGrupoEtnico", hojaVida.getGrupoEtnico());
        parametros.addValue("varDiscapacidad", hojaVida.getDiscapacidad());
        parametros.addValue("varDisponeRut", hojaVida.isDisponeRUT());
        parametros.addValue("varPerfil", hojaVida.getPerfil());
        if (hojaVida.getActividadEconomica() != null && hojaVida.getActividadEconomica().length() > 0) {
            parametros.addValue("varActividadEconomica", hojaVida.getActividadEconomica());
        } else {
            parametros.addValue("varActividadEconomica", null);
        }
        parametros.addValue("varDisponibilidadViajar", hojaVida.isDisponibilidadViajar());
        if (hojaVida.getTipoVinculacion() != null && hojaVida.getTipoVinculacion().length() > 0) {
            parametros.addValue("varTipoVinculacion", hojaVida.getTipoVinculacion());
        } else {
            parametros.addValue("varTipoVinculacion", null);
        }
        Map resultado = ingresarPersona.execute(parametros);
        long idPersona = (long) resultado.get("varIdPersona");

        ingresarInvestigador(idPersona, hojaVida);

        MapSqlParameterSource parametrosIngresoTelefono = new MapSqlParameterSource();
        parametrosIngresoTelefono.addValue("varIdPersona", idPersona);
        for (Telefono telefono : hojaVida.getTelefonos()) {
            parametrosIngresoTelefono.addValue("varNumero", telefono.getNumero());
            parametrosIngresoTelefono.addValue("varTipo", telefono.getTipo());
            ingresarTelefono.execute(parametrosIngresoTelefono);
        }

        MapSqlParameterSource parametrosIngresoCuentaBancaria = new MapSqlParameterSource();
        parametrosIngresoCuentaBancaria.addValue("varIdPersona", idPersona);
        for (CuentaBancaria cuentaBancaria : hojaVida.getCuentasBancarias()) {
            parametrosIngresoCuentaBancaria.addValue("varNumero", cuentaBancaria.getNumero());
            parametrosIngresoCuentaBancaria.addValue("varTipo", cuentaBancaria.getTipo());
            parametrosIngresoCuentaBancaria.addValue("varEntidad", cuentaBancaria.getEntidad());
            ingresarCuentaBancaria.execute(parametrosIngresoCuentaBancaria);
        }

        MapSqlParameterSource parametrosIngresoCorreoElectronico = new MapSqlParameterSource();
        parametrosIngresoCorreoElectronico.addValue("varIdPersona", idPersona);
        for (CorreoElectronico correoElectronico : hojaVida.getCorreosElectronicos()) {
            parametrosIngresoCorreoElectronico.addValue("varCorreoElectronico", correoElectronico.getCorreoElectronico());
            ingresarCorreoElectronico.execute(parametrosIngresoCorreoElectronico);
        }

        Documento copiaDocumentoIdentificacion = hojaVida.getCopiaDocumentoIdentificacion();
        if (copiaDocumentoIdentificacion != null) {
            MapSqlParameterSource parametrosIngresoCopiaDocumentoIdentificacion = new MapSqlParameterSource();
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varIdPersona", idPersona);
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varIdTipoDocumento", TipoDocumento.COPIA_CEDULA.getId());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varNombre", copiaDocumentoIdentificacion.getNombre());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varTipoContenido", copiaDocumentoIdentificacion.getTipoContenido());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varContenido", copiaDocumentoIdentificacion.getContenido());
            ingresarDocumentoSoporte.execute(parametrosIngresoCopiaDocumentoIdentificacion);
        }

        Documento documentoRUT = hojaVida.getDocumentoRUT();
        if (documentoRUT != null) {
            MapSqlParameterSource parametrosIngresoDocumentoRUT = new MapSqlParameterSource();
            parametrosIngresoDocumentoRUT.addValue("varIdPersona", idPersona);
            parametrosIngresoDocumentoRUT.addValue("varIdTipoDocumento", TipoDocumento.RUT.getId());
            parametrosIngresoDocumentoRUT.addValue("varNombre", documentoRUT.getNombre());
            parametrosIngresoDocumentoRUT.addValue("varTipoContenido", documentoRUT.getTipoContenido());
            parametrosIngresoDocumentoRUT.addValue("varContenido", documentoRUT.getContenido());
            ingresarDocumentoSoporte.execute(parametrosIngresoDocumentoRUT);
        }

        Documento copiaLibretaMilitar = hojaVida.getCopiaLibretaMilitar();
        if (copiaLibretaMilitar != null) {
            MapSqlParameterSource parametrosIngresoCopiaLibretaMilitar = new MapSqlParameterSource();
            parametrosIngresoCopiaLibretaMilitar.addValue("varIdPersona", idPersona);
            parametrosIngresoCopiaLibretaMilitar.addValue("varIdTipoDocumento", TipoDocumento.LIBRETA_MILITAR.getId());
            parametrosIngresoCopiaLibretaMilitar.addValue("varNombre", copiaLibretaMilitar.getNombre());
            parametrosIngresoCopiaLibretaMilitar.addValue("varTipoContenido", copiaLibretaMilitar.getTipoContenido());
            parametrosIngresoCopiaLibretaMilitar.addValue("varContenido", copiaLibretaMilitar.getContenido());
            ingresarDocumentoSoporte.execute(parametrosIngresoCopiaLibretaMilitar);
        }

        for (DocumentoSoporte documentoSoporte : hojaVida.getDocumentosSoporte()) {
            if (documentoSoporte.getDocumento() != null) {
                MapSqlParameterSource parametrosIngresoDocumentoSoporte = new MapSqlParameterSource();
                parametrosIngresoDocumentoSoporte.addValue("varIdPersona", idPersona);
                parametrosIngresoDocumentoSoporte.addValue("varIdTipoDocumento", documentoSoporte.getTipoDocumento());
                parametrosIngresoDocumentoSoporte.addValue("varNombre", documentoSoporte.getDocumento().getNombre());
                parametrosIngresoDocumentoSoporte.addValue("varTipoContenido", documentoSoporte.getDocumento().getTipoContenido());
                parametrosIngresoDocumentoSoporte.addValue("varContenido", documentoSoporte.getDocumento().getContenido());
                ingresarDocumentoSoporte.execute(parametrosIngresoDocumentoSoporte);
            }
        }

        MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
        parametrosIngresoIdioma.addValue("varIdPersona", idPersona);
        for (Idioma idioma : hojaVida.getIdiomas()) {
            parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosIngresoIdioma.addValue("varNivelConversacion", idioma.getNivelConversacion());
            parametrosIngresoIdioma.addValue("varNivelLectura", idioma.getNivelLectura());
            parametrosIngresoIdioma.addValue("varNivelEscritura", idioma.getNivelEscritura());
            parametrosIngresoIdioma.addValue("varNivelEscucha", idioma.getNivelEscucha());
            parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosIngresoIdioma.addValue("varPuntajeCertificacion", idioma.getPuntajeCertificacion());
            Map resultadoIngresoIdioma = ingresarIdioma.execute(parametrosIngresoIdioma);
            int idIdioma = (int) resultadoIngresoIdioma.get("varId");
            Documento documento = idioma.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoIdioma = new MapSqlParameterSource();
                parametrosIngresoCertificadoIdioma.addValue("varIdIdioma", idIdioma);
                parametrosIngresoCertificadoIdioma.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoIdioma.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoIdioma.addValue("varContenido", documento.getContenido());
                ingresarCertificadoIdioma.execute(parametrosIngresoCertificadoIdioma);
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionBasica = new MapSqlParameterSource();
        parametrosIngresoEducacionBasica.addValue("varIdPersona", idPersona);
        for (EducacionBasica educacionBasica : hojaVida.getEducacionesBasicas()) {
            parametrosIngresoEducacionBasica.addValue("varNivel", educacionBasica.getNivel());
            parametrosIngresoEducacionBasica.addValue("varInstitucion", educacionBasica.getInstitucion());
            parametrosIngresoEducacionBasica.addValue("varAnyoFinalizacion", educacionBasica.getAnyoFinalizacion());
            parametrosIngresoEducacionBasica.addValue("varAnyoInicio", educacionBasica.getAnyoInicio());
            parametrosIngresoEducacionBasica.addValue("varTitulo", educacionBasica.getTitulo());
            parametrosIngresoEducacionBasica.addValue("varGraduado", educacionBasica.isGraduado());
            Map resultadoIngresoEducacionBasica = ingresarEducacionBasica.execute(parametrosIngresoEducacionBasica);
            int idEducacionBasica = (int) resultadoIngresoEducacionBasica.get("varId");
            Documento documento = educacionBasica.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionBasica = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionBasica.addValue("varIdEducacionBasica", idEducacionBasica);
                parametrosIngresoCertificadoEducacionBasica.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionBasica.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionBasica.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionBasica.execute(parametrosIngresoCertificadoEducacionBasica);
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionSuperior = new MapSqlParameterSource();
        parametrosIngresoEducacionSuperior.addValue("varIdPersona", idPersona);
        for (EducacionSuperior educacionSuperior : hojaVida.getEducacionesSuperiores()) {
            parametrosIngresoEducacionSuperior.addValue("varNivel", educacionSuperior.getNivel());
            parametrosIngresoEducacionSuperior.addValue("varTituloExterior", educacionSuperior.isTituloExterior());
            parametrosIngresoEducacionSuperior.addValue("varPrograma", educacionSuperior.getPrograma());
            if (educacionSuperior.getPaisTituloExterior() != null) {
                parametrosIngresoEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperior.getPaisTituloExterior());
            }
            parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosIngresoEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
            parametrosIngresoEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
            parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosIngresoEducacionSuperior.addValue("varGraduado", educacionSuperior.isGraduado());
            Map resultadoIngresoEducacionSuperior = ingresarEducacionSuperior.execute(parametrosIngresoEducacionSuperior);
            int idEducacionSuperior = (int) resultadoIngresoEducacionSuperior.get("varId");
            Documento documento = educacionSuperior.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionSuperior = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                parametrosIngresoCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionSuperior.execute(parametrosIngresoCertificadoEducacionSuperior);
            }
            Documento documentoHomologado = educacionSuperior.getCertificadoHomologado();
            if (documentoHomologado != null) {
                MapSqlParameterSource parametrosIngresoCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                ingresarCertificadoHomologadoEducacionSuperior.execute(parametrosIngresoCertificadoHomologadoEducacionSuperior);
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
        parametrosIngresoEducacionContinua.addValue("varIdPersona", idPersona);
        for (EducacionContinua educacionContinua : hojaVida.getEducacionesContinuas()) {
            parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosIngresoEducacionContinua.addValue("varInstitucion", educacionContinua.getInstitucion());
            parametrosIngresoEducacionContinua.addValue("varAnyo", educacionContinua.getAnyo());
            parametrosIngresoEducacionContinua.addValue("varNumeroHoras", educacionContinua.getNumeroHoras());
            Map resultadoIngresoEducacionContinua = ingresarEducacionContinua.execute(parametrosIngresoEducacionContinua);
            int idEducacionContinua = (int) resultadoIngresoEducacionContinua.get("varId");
            Documento documento = educacionContinua.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionContinua = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionContinua.addValue("varIdEducacionContinua", idEducacionContinua);
                parametrosIngresoCertificadoEducacionContinua.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionContinua.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionContinua.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionContinua.execute(parametrosIngresoCertificadoEducacionContinua);
            }
        }

        MapSqlParameterSource parametrosIngresoDistincion = new MapSqlParameterSource();
        parametrosIngresoDistincion.addValue("varIdPersona", idPersona);
        for (Distincion distincion : hojaVida.getDistinciones()) {
            parametrosIngresoDistincion.addValue("varDescripcion", distincion.getDescripcion());
            parametrosIngresoDistincion.addValue("varFechaDistincion", distincion.getFechaDistincion());
            parametrosIngresoDistincion.addValue("varInstitucionOtorga", distincion.getInstitucionOtorga());
            Map resultadoIngresoDistincion = ingresarDistincion.execute(parametrosIngresoDistincion);
            int idDistincion = (int) resultadoIngresoDistincion.get("varId");
            Documento documento = distincion.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoDistincion = new MapSqlParameterSource();
                parametrosIngresoCertificadoDistincion.addValue("varIdDistincion", idDistincion);
                parametrosIngresoCertificadoDistincion.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoDistincion.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoDistincion.addValue("varContenido", documento.getContenido());
                ingresarCertificadoDistincion.execute(parametrosIngresoCertificadoDistincion);
            }
        }

        MapSqlParameterSource parametrosIngresoExperienciaLaboral = new MapSqlParameterSource();
        parametrosIngresoExperienciaLaboral.addValue("varIdPersona", idPersona);
        for (ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
            parametrosIngresoExperienciaLaboral.addValue("varActividadeconomica", experienciaLaboral.getActividadEconomica());
            parametrosIngresoExperienciaLaboral.addValue("varNucleoBasicoConocimiento", experienciaLaboral.getNucleoBasicoConocimiento());
            parametrosIngresoExperienciaLaboral.addValue("varCargo", experienciaLaboral.getCargo());
            parametrosIngresoExperienciaLaboral.addValue("varFechaIngreso", experienciaLaboral.getFechaIngreso());
            parametrosIngresoExperienciaLaboral.addValue("varFechaRetiro", experienciaLaboral.getFechaRetiro());
            parametrosIngresoExperienciaLaboral.addValue("varNaturalezaCargo", experienciaLaboral.getNaturalezaCargo());
            parametrosIngresoExperienciaLaboral.addValue("varNombreEmpresa", experienciaLaboral.getNombreEmpresa());
            parametrosIngresoExperienciaLaboral.addValue("varTipoContrato", experienciaLaboral.getTipoContrato());
            parametrosIngresoExperienciaLaboral.addValue("varTipoEmpresa", experienciaLaboral.getTipoEmpresa());
            parametrosIngresoExperienciaLaboral.addValue("varTipoExperiencia", experienciaLaboral.getTipoExperiencia());
            parametrosIngresoExperienciaLaboral.addValue("varFnsp", experienciaLaboral.isFnsp());
            parametrosIngresoExperienciaLaboral.addValue("varTrabajoActual", experienciaLaboral.isTrabajoActual());
            Map resultadoIngresoExperienciaLaboral = ingresarExperienciaLaboral.execute(parametrosIngresoExperienciaLaboral);
            int idExperienciaLaboral = (int) resultadoIngresoExperienciaLaboral.get("varId");
            Documento documento = experienciaLaboral.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoExperienciaLaboral = new MapSqlParameterSource();
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varIdExperienciaLaboral", idExperienciaLaboral);
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varContenido", documento.getContenido());
                ingresarCertificadoExperienciaLaboral.execute(parametrosIngresoCertificadoExperienciaLaboral);
            }
        }

        MapSqlParameterSource parametrosIngresoExperienciaDocencia = new MapSqlParameterSource();
        parametrosIngresoExperienciaDocencia.addValue("varIdPersona", idPersona);
        for (ExperienciaDocencia experienciaDocencia : hojaVida.getExperienciasDocencia()) {
            parametrosIngresoExperienciaDocencia.addValue("varTrabajoActual", experienciaDocencia.isTrabajoActual());
            parametrosIngresoExperienciaDocencia.addValue("varFnsp", experienciaDocencia.isFnsp());
            parametrosIngresoExperienciaDocencia.addValue("varInstitucion", experienciaDocencia.getInstitucion());
            Map resultadoIngresoExperienciaDocencia = ingresarExperienciaDocencia.execute(parametrosIngresoExperienciaDocencia);
            int idExperienciaDocencia = (int) resultadoIngresoExperienciaDocencia.get("varId");
            for (CursoExperienciaDocencia cursoExperienciaDocencia : experienciaDocencia.getCursosExperienciaDocencia()) {
                MapSqlParameterSource parametrosIngresoCursoExperienciaDocencia = new MapSqlParameterSource();
                parametrosIngresoCursoExperienciaDocencia.addValue("varIdExperienciaDocencia", idExperienciaDocencia);
                parametrosIngresoCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocencia.getAnyo());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocencia.getNucleoBasicoConocimiento());
                parametrosIngresoCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocencia.getModalidad());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocencia.getNivelEstudio());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocencia.getNumeroHoras());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocencia.getNombreCurso());
                Map resultadoIngresoCursoExperienciaDocencia = ingresarCursoExperienciaDocencia.execute(parametrosIngresoCursoExperienciaDocencia);
                int idCursoExperienciaDocencia = (int) resultadoIngresoCursoExperienciaDocencia.get("varId");
                Documento documento = cursoExperienciaDocencia.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", idCursoExperienciaDocencia);
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoCursoExperienciaDocencia.execute(parametrosIngresoCertificadoCursoExperienciaDocencia);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoArticulo = new MapSqlParameterSource();
        parametrosIngresoArticulo.addValue("varIdPersona", idPersona);
        for (Articulo articulo : hojaVida.getArticulos()) {
            parametrosIngresoArticulo.addValue("varAnyo", articulo.getAnyo());
            parametrosIngresoArticulo.addValue("varNombreRevista", articulo.getNombreRevista());
            parametrosIngresoArticulo.addValue("varNombre", articulo.getNombre());
            parametrosIngresoArticulo.addValue("varTipoAutor", articulo.getTipoAutor());
            parametrosIngresoArticulo.addValue("varUrl", articulo.getUrl());
            parametrosIngresoArticulo.addValue("varNucleoBasicoConocimiento", articulo.getNucleoBasicoConocimiento());
            ingresarArticulo.execute(parametrosIngresoArticulo);
        }

        MapSqlParameterSource parametrosIngresoPatente = new MapSqlParameterSource();
        parametrosIngresoPatente.addValue("varIdPersona", idPersona);
        for (Patente patente : hojaVida.getPatentes()) {
            parametrosIngresoPatente.addValue("varDescripcion", patente.getDescripcion());
            parametrosIngresoPatente.addValue("varClase", patente.getClase());
            parametrosIngresoPatente.addValue("varFecha", patente.getFecha());
            parametrosIngresoPatente.addValue("vartipopatente", patente.getTipo());
            parametrosIngresoPatente.addValue("varpropiedadcompartida", patente.isPropiedadCompartida());
            Map resultadoIngresoPatente = ingresarPatente.execute(parametrosIngresoPatente);
            int idPatente = (int) resultadoIngresoPatente.get("varId");
            Documento documento = patente.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoPatente = new MapSqlParameterSource();
                parametrosIngresoDocumentoPatente.addValue("varIdPatente", idPatente);
                parametrosIngresoDocumentoPatente.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoPatente.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoPatente.addValue("varContenido", documento.getContenido());
                ingresarDocumentoPatente.execute(parametrosIngresoDocumentoPatente);
            }
        }

        MapSqlParameterSource parametrosIngresoProductoConocimiento = new MapSqlParameterSource();
        parametrosIngresoProductoConocimiento.addValue("varIdPersona", idPersona);
        for (ProductoConocimiento productoConocimiento : hojaVida.getProductosConocimiento()) {
            parametrosIngresoPatente.addValue("varDescripcion", productoConocimiento.getDescripcion());
            parametrosIngresoProductoConocimiento.addValue("varNucleoBasicoConocimiento", productoConocimiento.getNucleoBasicoConocimiento());
            parametrosIngresoProductoConocimiento.addValue("varUrl", productoConocimiento.getUrl());
            parametrosIngresoProductoConocimiento.addValue("varTipo", productoConocimiento.getTipo());
            Map resultadoIngresoProductoConocimiento = ingresarProductoConocimiento.execute(parametrosIngresoProductoConocimiento);
            int idProductoConocimiento = (int) resultadoIngresoProductoConocimiento.get("varId");
            Documento documento = productoConocimiento.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoProductoConocimiento = new MapSqlParameterSource();
                parametrosIngresoDocumentoProductoConocimiento.addValue("varIdProductoConocimiento", idProductoConocimiento);
                parametrosIngresoDocumentoProductoConocimiento.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoProductoConocimiento.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoProductoConocimiento.addValue("varContenido", documento.getContenido());
                ingresarDocumentoProductoConocimiento.execute(parametrosIngresoDocumentoProductoConocimiento);
            }
        }

        return idPersona;
    }

    @Override
    public void actualizarHojaVida(long idUsuario, HojaVida hojaVida) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", hojaVida.getIdPersona());
        parametros.addValue("varNumeroId", hojaVida.getNumeroIdentificacion());
        parametros.addValue("varTipoId", hojaVida.getTipoIdentificacion());
        if (hojaVida.getLugarExpedicion() != null && hojaVida.getLugarExpedicion().length() > 0) {
            parametros.addValue("varLugarExpedicion", hojaVida.getLugarExpedicion());
        } else {
            parametros.addValue("varLugarExpedicion", null);
        }
        parametros.addValue("varFechaExpedicion", hojaVida.getFechaExpedicion());
        parametros.addValue("varLibretaMilitar", hojaVida.getLibretaMilitar());
        parametros.addValue("varDistritoClase", hojaVida.getDistritoClase());
        parametros.addValue("varNombres", hojaVida.getNombres());
        parametros.addValue("varApellidos", hojaVida.getApellidos());
        if (hojaVida.getLugarNacimiento() != null && hojaVida.getLugarNacimiento().length() > 0) {
            parametros.addValue("varLugarNacimiento", hojaVida.getLugarNacimiento());
        } else {
            parametros.addValue("varLugarNacimiento", null);
        }
        parametros.addValue("varFechaNacimiento", hojaVida.getFechaNacimiento());
        parametros.addValue("varNacionalidad", hojaVida.getNacionalidad());
        if (hojaVida.getSexo() != null && hojaVida.getSexo().length() > 0) {
            parametros.addValue("varSexo", hojaVida.getSexo());
        } else {
            parametros.addValue("varSexo", null);
        }
        if (hojaVida.getCiudadResidencia() != null && hojaVida.getCiudadResidencia().length() > 0) {
            parametros.addValue("varCiudadResidencia", hojaVida.getCiudadResidencia());
        } else {
            parametros.addValue("varCiudadResidencia", null);
        }
        parametros.addValue("varDireccion", hojaVida.getDireccion());
        parametros.addValue("varEgresadoUDEA", hojaVida.isEgresadoUDEA());
        parametros.addValue("varEmpleadoUDEA", hojaVida.isEmpleadoUDEA());
        parametros.addValue("varGrupoEtnico", hojaVida.getGrupoEtnico());
        parametros.addValue("varDiscapacidad", hojaVida.getDiscapacidad());
        parametros.addValue("varDisponeRut", hojaVida.isDisponeRUT());
        parametros.addValue("varDisponibilidadViajar", hojaVida.isDisponibilidadViajar());
        parametros.addValue("varPerfil", hojaVida.getPerfil());
        if (hojaVida.getActividadEconomica() != null && hojaVida.getActividadEconomica().length() > 0) {
            parametros.addValue("varActividadEconomica", hojaVida.getActividadEconomica());
        } else {
            parametros.addValue("varActividadEconomica", null);
        }
        parametros.addValue("varDisponibilidadViajar", hojaVida.isDisponibilidadViajar());
        if (hojaVida.getTipoVinculacion() != null && hojaVida.getTipoVinculacion().length() > 0) {
            parametros.addValue("varTipoVinculacion", hojaVida.getTipoVinculacion());
        } else {
            parametros.addValue("varTipoVinculacion", null);
        }

        actualizarPersona.execute(parametros);

        actualizarInvestigador(hojaVida);
        Documento copiaDocumentoIdentificacion = hojaVida.getCopiaDocumentoIdentificacion();
        if (copiaDocumentoIdentificacion != null) {
            MapSqlParameterSource parametrosActualizacionCopiaDocumentoIdentificacion = new MapSqlParameterSource();
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varIdPersona", hojaVida.getIdPersona());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varIdTipoDocumento", TipoDocumento.COPIA_CEDULA.getId());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varNombre", copiaDocumentoIdentificacion.getNombre());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varTipoContenido", copiaDocumentoIdentificacion.getTipoContenido());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varContenido", copiaDocumentoIdentificacion.getContenido());
            actualizarDocumentoSoportePorTipo.execute(parametrosActualizacionCopiaDocumentoIdentificacion);
        }

        Documento documentoRUT = hojaVida.getDocumentoRUT();
        if (documentoRUT != null) {
            MapSqlParameterSource parametrosActualizacionDocumentoRUT = new MapSqlParameterSource();
            parametrosActualizacionDocumentoRUT.addValue("varIdPersona", hojaVida.getIdPersona());
            parametrosActualizacionDocumentoRUT.addValue("varIdTipoDocumento", TipoDocumento.RUT.getId());
            parametrosActualizacionDocumentoRUT.addValue("varNombre", documentoRUT.getNombre());
            parametrosActualizacionDocumentoRUT.addValue("varTipoContenido", documentoRUT.getTipoContenido());
            parametrosActualizacionDocumentoRUT.addValue("varContenido", documentoRUT.getContenido());
            actualizarDocumentoSoportePorTipo.execute(parametrosActualizacionDocumentoRUT);
        }

        Documento copiaLibretaMilitar = hojaVida.getCopiaLibretaMilitar();
        if (copiaLibretaMilitar != null) {
            MapSqlParameterSource parametrosActualizacionCopiaLibretaMilitar = new MapSqlParameterSource();
            parametrosActualizacionCopiaLibretaMilitar.addValue("varIdPersona", hojaVida.getIdPersona());
            parametrosActualizacionCopiaLibretaMilitar.addValue("varIdTipoDocumento", TipoDocumento.LIBRETA_MILITAR.getId());
            parametrosActualizacionCopiaLibretaMilitar.addValue("varNombre", copiaLibretaMilitar.getNombre());
            parametrosActualizacionCopiaLibretaMilitar.addValue("varTipoContenido", copiaLibretaMilitar.getTipoContenido());
            parametrosActualizacionCopiaLibretaMilitar.addValue("varContenido", copiaLibretaMilitar.getContenido());
            actualizarDocumentoSoportePorTipo.execute(parametrosActualizacionCopiaLibretaMilitar);
        }
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);
        parametros.addValue("varIdTipoDocumento", idTipoDocumento);

        Map resultado = obtenerDocumentoSoportePorTipo.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idDocumentoSoporte) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdDocumentoSoporte", idDocumentoSoporte);

        Map resultado = obtenerDocumentoSoporte.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public List<HojaVida> obtenerHojasVida() {
        Map resultadoCorreosElectronicos = obtenerHojasVida.execute(new MapSqlParameterSource());
        ArrayList<HojaVida> hojasVida = (ArrayList<HojaVida>) resultadoCorreosElectronicos.get("hojasVida");
        for (HojaVida hojaVida : hojasVida) {
            hojaVida.setFechaNacimientoFormateada(Util.obtenerFechaFormateada(hojaVida.getFechaNacimiento()));
        }

        return hojasVida;
    }

    @Override
    public void eliminarHojaVida(long idPersona) {
        MapSqlParameterSource parametrosEliminacionHojaVida = new MapSqlParameterSource();
        parametrosEliminacionHojaVida.addValue("varIdPersona", idPersona);
        eliminarHojaVida.execute(parametrosEliminacionHojaVida);
    }

    @Override
    public boolean existePersona(String numeroIdentificacion) {
        boolean existe;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);

        Map resultado = validarExistenciaPersona.execute(parametros);
        existe = ((boolean) resultado.get("varExiste"));

        return existe;
    }

    @Override
    public String obtenerNumeroIdentificacionPersona(long idPersona) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);

        Map resultado = obtenerNumeroIdentificacionPersona.execute(parametros);
        return (String) resultado.get("varNumeroId");
    }

    @Override
    public HojaVida obtenerHojaVida(long idPersona) {
        HojaVida hojaVida = new HojaVida();

        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);

        Map resultado = obtenerPersona.execute(parametros);
        hojaVida.setIdPersona(idPersona);
        hojaVida.setNumeroIdentificacion((String) resultado.get("varNumeroId"));
        hojaVida.setTipoIdentificacion((String) resultado.get("varTipoId"));
        hojaVida.setLugarExpedicion((String) resultado.get("varLugarExpedicion"));
        hojaVida.setNombreLugarExpedicion((String) resultado.get("varNombreLugarExpedicion"));
        if (resultado.get("varFechaExpedicion") != null) {
            hojaVida.setFechaExpedicion((Date) resultado.get("varFechaExpedicion"));
        }
        hojaVida.setLibretaMilitar((String) resultado.get("varLibretaMilitar"));
        hojaVida.setDistritoClase((String) resultado.get("varDistritoClase"));
        hojaVida.setNombres((String) resultado.get("varNombres"));
        hojaVida.setApellidos((String) resultado.get("varApellidos"));
        if (resultado.get("varFechaNacimiento") != null) {
            hojaVida.setFechaNacimiento((Date) resultado.get("varFechaNacimiento"));
        }
        hojaVida.setLugarNacimiento((String) resultado.get("varLugarNacimiento"));
        hojaVida.setNombreLugarNacimiento((String) resultado.get("varNombreLugarNacimiento"));
        if (resultado.get("varNacionalidad") != null) {
            hojaVida.setNacionalidad(((Integer) resultado.get("varNacionalidad")).toString());
        }
        hojaVida.setNombreNacionalidad((String) resultado.get("varNombreNacionalidad"));
        if (resultado.get("varSexo") != null) {
            hojaVida.setSexo(((Integer) resultado.get("varSexo")).toString());
        }
        hojaVida.setNombreSexo(((String) resultado.get("varNombreSexo")));
        hojaVida.setCiudadResidencia((String) resultado.get("varCiudadResidencia"));
        hojaVida.setNombreCiudadResidencia((String) resultado.get("varNombreCiudadResidencia"));
        hojaVida.setDireccion((String) resultado.get("varDireccion"));
        hojaVida.setPerfil((String) resultado.get("varPerfil"));

        if (resultado.get("varEmpleadoUdea") != null) {
            hojaVida.setEmpleadoUDEA((Boolean) resultado.get("varEmpleadoUdea"));
        }
        if (resultado.get("varGrupoEtnico") != null) {
            hojaVida.setGrupoEtnico(((Integer) resultado.get("varGrupoEtnico")).toString());
            hojaVida.setNombreGrupoEtnico((String) resultado.get("varNombreGrupoEtnico"));
        }
        if (resultado.get("varDiscapacidad") != null) {
            hojaVida.setDiscapacidad(((Integer) resultado.get("varDiscapacidad")).toString());
            hojaVida.setNombreDiscapacidad((String) resultado.get("varNombreDiscapacidad"));
        }
        if (resultado.get("varDisponeRut") != null) {
            hojaVida.setDisponeRUT((Boolean) resultado.get("varDisponeRut"));
        }
        if (resultado.get("varActividadEconomica") != null) {
            hojaVida.setActividadEconomica(((Integer) resultado.get("varActividadEconomica")).toString());
            hojaVida.setNombreActividadEconomica((String) resultado.get("varNombreActividadEconomica"));
        }
        if (resultado.get("varDisponibilidadViajar") != null) {
            hojaVida.setDisponibilidadViajar((Boolean) resultado.get("varDisponibilidadViajar"));
        }
        if (resultado.get("varTipoVinculacion") != null) {
            hojaVida.setTipoVinculacion(((Integer) resultado.get("varTipoVinculacion")).toString());
            hojaVida.setNombreTipoVinculacion((String) resultado.get("varNombreTipoVinculacion"));
        }
        if (resultado.get("varTieneCopiaDocumentoIdentificacion") != null) {
            hojaVida.setTieneCopiaDocumentoIdentificacion((Boolean) resultado.get("varTieneCopiaDocumentoIdentificacion"));
        }
        if (resultado.get("varTieneCopiaLibretaMilitar") != null) {
            hojaVida.setTieneCopiaLibretaMilitar((Boolean) resultado.get("varTieneCopiaLibretaMilitar"));
        }
        if (resultado.get("varTieneDocumentoRUT") != null) {
            hojaVida.setTieneDocumentoRUT((Boolean) resultado.get("varTieneDocumentoRUT"));
        }

        hojaVida.setNombreCopiaDocumentoIdentificacion((String) resultado.get("varnombrecopiaDocumentoIdentificacion"));
        hojaVida.setNombreCopiaLibretaMilitar((String) resultado.get("varNombreCopiaLibretaMilitar"));
        hojaVida.setNombreDocumentoRUT((String) resultado.get("varNombreDocumentoRUT"));

        Map resultadoInvestigador = obtenerInvestigador.execute(parametros);
        if (resultadoInvestigador.get("varInvestigadorReconocidoColciencias") != null) {
            hojaVida.setInvestigadorReconocidoColciencias((Boolean) resultadoInvestigador.get("varInvestigadorReconocidoColciencias"));
        }
        if (resultadoInvestigador.get("varTipoInvestigador") != null) {
            hojaVida.setTipoInvestigador((Integer) resultadoInvestigador.get("varTipoInvestigador"));
        }
       
        hojaVida.setNombreTipoInvestigador((String) resultadoInvestigador.get("varNombreTipoInvestigador"));
        hojaVida.setUrlCVLAC((String) resultadoInvestigador.get("varUrlCVLAC"));
        hojaVida.setCodigoORCID((String) resultadoInvestigador.get("varCodigoORCID"));
        hojaVida.setIdentificadorScopus((String) resultadoInvestigador.get("varIdentificadorScopus"));
        hojaVida.setResearcherId((String) resultadoInvestigador.get("varResearcherId"));

        Map resultadoTelefonos = obtenerTelefonos.execute(parametros);
        List<Telefono> telefonos = (List<Telefono>) resultadoTelefonos.get("telefonos");

        Map resultadoCorreosElectronicos = obtenerCorreosElectronicos.execute(parametros);
        List<CorreoElectronico> correosElectronicos = (List<CorreoElectronico>) resultadoCorreosElectronicos.get("correosElectronicos");

        Map resultadoCuentasBancarias = obtenerCuentasBancarias.execute(parametros);
        List<CuentaBancaria> cuentasBancarias = (List<CuentaBancaria>) resultadoCuentasBancarias.get("cuentasBancarias");

        Map resultadoDocumentosSoporte = obtenerDocumentosSoporte.execute(parametros);
        List<DocumentoSoporte> documentosSoporte = (List<DocumentoSoporte>) resultadoDocumentosSoporte.get("documentosSoporte");

        Map resultadoIdiomas = obtenerIdiomas.execute(parametros);
        List<Idioma> idiomas = (List<Idioma>) resultadoIdiomas.get("idiomas");

        Map resultadoEducacionesBasicas = obtenerEducacionesBasicas.execute(parametros);
        List<EducacionBasica> educacionesBasicas = (List<EducacionBasica>) resultadoEducacionesBasicas.get("educacionesBasicas");

        Map resultadoEducacionesSuperiores = obtenerEducacionesSuperiores.execute(parametros);
        List<EducacionSuperior> educacionesSuperiores = (List<EducacionSuperior>) resultadoEducacionesSuperiores.get("educacionesSuperiores");

        Map resultadoEducacionesContinuas = obtenerEducacionesContinuas.execute(parametros);
        List<EducacionContinua> educacionesContinuas = (List<EducacionContinua>) resultadoEducacionesContinuas.get("educacionesContinuas");

        Map resultadoDistinciones = obtenerDistinciones.execute(parametros);
        List<Distincion> distinciones = (List<Distincion>) resultadoDistinciones.get("distinciones");

        Map resultadoExperienciaLaborales = obtenerExperienciasLaborales.execute(parametros);
        List<ExperienciaLaboral> experienciasLaborales = (List<ExperienciaLaboral>) resultadoExperienciaLaborales.get("experienciasLaborales");

        Map resultadoExperienciaDocencia = obtenerExperienciasDocencia.execute(parametros);
        List<ExperienciaDocencia> experienciasDocencia = (List<ExperienciaDocencia>) resultadoExperienciaDocencia.get("experienciasDocencia");
        for (ExperienciaDocencia experienciaDocencia : experienciasDocencia) {
            MapSqlParameterSource parametrosConsultaCursosExperienciaDocencia = new MapSqlParameterSource();
            parametrosConsultaCursosExperienciaDocencia.addValue("varIdExperienciaDocencia", experienciaDocencia.getId());
            Map resultadoCursosExperienciaDocencia = obtenerCursosExperienciaDocencia.execute(parametrosConsultaCursosExperienciaDocencia);
            List<CursoExperienciaDocencia> cursoExperienciaDocencia = (List<CursoExperienciaDocencia>) resultadoCursosExperienciaDocencia.get("cursosExperienciaDocencia");
            experienciaDocencia.setCursosExperienciaDocencia(cursoExperienciaDocencia);
        }

        Map resultadoArticulos = obtenerArticulos.execute(parametros);
        List<Articulo> articulos = (List<Articulo>) resultadoArticulos.get("articulos");

        Map resultadoPatentes = obtenerPatentes.execute(parametros);
        List<Patente> patentes = (List<Patente>) resultadoPatentes.get("patentes");

        Map resultadoProductosConocimiento = obtenerProductosConocimiento.execute(parametros);
        List<ProductoConocimiento> productosConocimiento = (List<ProductoConocimiento>) resultadoProductosConocimiento.get("productosConocimiento");

        hojaVida.setTelefonos(telefonos);
        hojaVida.setCorreosElectronicos(correosElectronicos);
        hojaVida.setCuentasBancarias(cuentasBancarias);
        hojaVida.setDocumentosSoporte(documentosSoporte);
        hojaVida.setIdiomas(idiomas);
        hojaVida.setEducacionesBasicas(educacionesBasicas);
        hojaVida.setEducacionesSuperiores(educacionesSuperiores);
        hojaVida.setEducacionesContinuas(educacionesContinuas);
        hojaVida.setDistinciones(distinciones);
        hojaVida.setExperienciasLaborales(experienciasLaborales);
        hojaVida.setExperienciasDocencia(experienciasDocencia);
        hojaVida.setArticulos(articulos);
        hojaVida.setPatentes(patentes);
        hojaVida.setProductosConocimiento(productosConocimiento);

        boolean egresadoUdeA = false;
        for (int i = 0; i < hojaVida.getEducacionesSuperiores().size(); i++) {
            if (hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_MEDELLIN
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_EL_CARMEN_DE_VIBORAL
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_ANDES
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_CAUCASIA
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_PUERTO_BERRIO
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_TURBO
                    || hojaVida.getEducacionesSuperiores().get(i).getInstitucion() == ID_UNIVERSIDAD_ANTIOQUIA_SANTAFE_DE_ANTIOQUIA) {

                egresadoUdeA = true;
                break;
            }
        }
        hojaVida.setEgresadoUDEA(egresadoUdeA);

        return hojaVida;
    }

    @Override
    public Documento obtenerCertificadoIdioma(int idIdioma) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdIdioma", idIdioma);

        Map resultado = obtenerCertificadoIdioma.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoEducacionBasica(int idEducacionBasica) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdEducacionBasica", idEducacionBasica);

        Map resultado = obtenerCertificadoEducacionBasica.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoEducacionSuperior(int idEducacionSuperior) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdEducacionSuperior", idEducacionSuperior);

        Map resultado = obtenerCertificadoEducacionSuperior.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoHomologadoEducacionSuperior(int idEducacionSuperior) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdEducacionSuperior", idEducacionSuperior);

        Map resultado = obtenerCertificadoHomologadoEducacionSuperior.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoEducacionContinua(int idEducacionContinua) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdEducacionContinua", idEducacionContinua);

        Map resultado = obtenerCertificadoEducacionContinua.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoDistincion(int idDistincion) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidDistincion", idDistincion);

        Map resultado = obtenerCertificadoDistincion.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoExperienciaLaboral(int idExperienciaLaboral) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidExperienciaLaboral", idExperienciaLaboral);

        Map resultado = obtenerCertificadoExperienciaLaboral.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerCertificadoCursoExperienciaDocencia(int idCursoExperienciaDocencia) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidCursoExperienciaDocencia", idCursoExperienciaDocencia);

        Map resultado = obtenerCertificadoCursoExperienciaDocencia.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerDocumentoProductoConocimiento(int idProductoConocimiento) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidProductoConocimiento", idProductoConocimiento);

        Map resultado = obtenerDocumentoProductoConocimiento.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public Documento obtenerDocumentoPatente(int idPatente) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varidPatente", idPatente);

        Map resultado = obtenerDocumentoPatente.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    @Override
    public void ingresarTerminos(long idPersona, Terminos terminos) {
        MapSqlParameterSource parametrosIngresoTerminos = new MapSqlParameterSource();
        parametrosIngresoTerminos.addValue("varIdPersona", idPersona);
        parametrosIngresoTerminos.addValue("varActualizacionInformacion", terminos.isActualizacionInformacion());
        parametrosIngresoTerminos.addValue("varConectividadUso", terminos.isConectividadUso());
        parametrosIngresoTerminos.addValue("varDanyosExternos", terminos.isDanyosExternos());
        parametrosIngresoTerminos.addValue("varDanyosPerjuicios", terminos.isDanyosPerjuicios());
        parametrosIngresoTerminos.addValue("varDerechosReservados", terminos.isDerechosReservados());
        parametrosIngresoTerminos.addValue("varDisposicionesFinales", terminos.isDisposicionesFinales());
        parametrosIngresoTerminos.addValue("varEntrevista", terminos.isEntrevista());
        parametrosIngresoTerminos.addValue("varHabeasData", terminos.isHabeasData());
        parametrosIngresoTerminos.addValue("varIngresoIlegal", terminos.isIngresoIlegal());
        parametrosIngresoTerminos.addValue("varInterconectividad", terminos.isInterconectividad());
        parametrosIngresoTerminos.addValue("varInterrupcionServicio", terminos.isInterrupcionServicio());
        parametrosIngresoTerminos.addValue("varModificacionCondiciones", terminos.isModificacionCondiciones());
        parametrosIngresoTerminos.addValue("varOtrasExoneraciones", terminos.isOtrasExoneraciones());
        parametrosIngresoTerminos.addValue("varPostulacion", terminos.isPostulacion());
        parametrosIngresoTerminos.addValue("varPresenciaVirus", terminos.isPresenciaVirus());
        parametrosIngresoTerminos.addValue("varPublicidad", terminos.isPublicidad());
        parametrosIngresoTerminos.addValue("varRacionalidad", terminos.isRacionalidad());
        parametrosIngresoTerminos.addValue("varReservaEstadistica", terminos.isReservaEstadistica());
        parametrosIngresoTerminos.addValue("varResponsabilidad", terminos.isResponsabilidad());
        parametrosIngresoTerminos.addValue("varSeguridad", terminos.isSeguridad());
        parametrosIngresoTerminos.addValue("varTitulos", terminos.isTitulos());
        parametrosIngresoTerminos.addValue("varConsentimientoTerminosEstablecidos", terminos.isConsentimientoTerminosEstablecidos());
        parametrosIngresoTerminos.addValue("varUsoIlegal", terminos.isUsoIlegal());
        parametrosIngresoTerminos.addValue("varVeracidad", terminos.isVeracidad());
        parametrosIngresoTerminos.addValue("varVinculacionLaboral", terminos.isVinculacionLaboral());
        parametrosIngresoTerminos.addValue("varreconocimientoInformacionSuministrada", terminos.isReconocimientoInformacionSuministrada());
        parametrosIngresoTerminos.addValue("varaceptoTratamientoDatosPersonales", terminos.isAceptoTratamientoDatosPersonales());

        ingresarTerminos.execute(parametrosIngresoTerminos);
    }

    @Override
    public boolean existenTerminos(long idPersona) {
        MapSqlParameterSource parametrosExistenTerminos = new MapSqlParameterSource();
        parametrosExistenTerminos.addValue("varIdPersona", idPersona);
        Map resultado = existenTerminos.execute(parametrosExistenTerminos);

        return (boolean) resultado.get("varExistenTerminos");
    }

    private void actualizarTelefonos(long idPersona, List<Telefono> telefonos) {
        MapSqlParameterSource parametrosConsultaTelefono = new MapSqlParameterSource();
        parametrosConsultaTelefono.addValue("varIdPersona", idPersona);
        Map resultadoTelefonos = obtenerTelefonos.execute(parametrosConsultaTelefono);
        ArrayList<Telefono> telefonosActuales = (ArrayList<Telefono>) resultadoTelefonos.get("telefonos");

        MapSqlParameterSource parametrosEliminacionTelefono = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionTelefono = new MapSqlParameterSource();
        for (Telefono telefonoActual : telefonosActuales) {
            Telefono telefonoModificado = null;
            for (Telefono telefono : telefonos) {
                if (telefono.getId() == telefonoActual.getId()) {
                    telefonoModificado = telefono;
                    break;
                }
            }
            if (telefonoModificado == null) {
                parametrosEliminacionTelefono.addValue("varId", telefonoActual.getId());
                eliminarTelefono.execute(parametrosEliminacionTelefono);
            } else {
                parametrosActualizacionTelefono.addValue("varId", telefonoModificado.getId());
                parametrosActualizacionTelefono.addValue("varNumero", telefonoModificado.getNumero());
                parametrosActualizacionTelefono.addValue("varTipo", telefonoModificado.getTipo());
                actualizarTelefono.execute(parametrosActualizacionTelefono);
            }
        }

        MapSqlParameterSource parametrosIngresoTelefono = new MapSqlParameterSource();
        parametrosIngresoTelefono.addValue("varIdPersona", idPersona);
        for (Telefono telefono : telefonos) {
            if (telefono.getId() == 0) {
                parametrosIngresoTelefono.addValue("varNumero", telefono.getNumero());
                parametrosIngresoTelefono.addValue("varTipo", telefono.getTipo());
                ingresarTelefono.execute(parametrosIngresoTelefono);
            }
        }
    }

    private void actualizarCuentasBancarias(long idPersona, List<CuentaBancaria> cuentasBancarias) {
        MapSqlParameterSource parametrosConsultaCuentaBancaria = new MapSqlParameterSource();
        parametrosConsultaCuentaBancaria.addValue("varIdPersona", idPersona);
        Map resultadoCuentasBancarias = obtenerCuentasBancarias.execute(parametrosConsultaCuentaBancaria);
        ArrayList<CuentaBancaria> cuentasBancariasActuales = (ArrayList<CuentaBancaria>) resultadoCuentasBancarias.get("cuentasBancarias");

        MapSqlParameterSource parametrosEliminacionCuentaBancaria = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionCuentaBancaria = new MapSqlParameterSource();
        for (CuentaBancaria cuentaBancariaActual : cuentasBancariasActuales) {
            CuentaBancaria cuentaBancariaModificado = null;
            for (CuentaBancaria cuentaBancaria : cuentasBancarias) {
                if (cuentaBancaria.getId() == cuentaBancariaActual.getId()) {
                    cuentaBancariaModificado = cuentaBancaria;
                    break;
                }
            }
            if (cuentaBancariaModificado == null) {
                parametrosEliminacionCuentaBancaria.addValue("varId", cuentaBancariaActual.getId());
                eliminarCuentaBancaria.execute(parametrosEliminacionCuentaBancaria);
            } else {
                parametrosActualizacionCuentaBancaria.addValue("varId", cuentaBancariaModificado.getId());
                parametrosActualizacionCuentaBancaria.addValue("varNumero", cuentaBancariaModificado.getNumero());
                parametrosActualizacionCuentaBancaria.addValue("varTipo", cuentaBancariaModificado.getTipo());
                parametrosActualizacionCuentaBancaria.addValue("varEntidad", cuentaBancariaModificado.getEntidad());
                actualizarCuentaBancaria.execute(parametrosActualizacionCuentaBancaria);
            }
        }

        MapSqlParameterSource parametrosIngresoCuentaBancaria = new MapSqlParameterSource();
        parametrosIngresoCuentaBancaria.addValue("varIdPersona", idPersona);
        for (CuentaBancaria cuentaBancaria : cuentasBancarias) {
            if (cuentaBancaria.getId() == 0) {
                parametrosIngresoCuentaBancaria.addValue("varNumero", cuentaBancaria.getNumero());
                parametrosIngresoCuentaBancaria.addValue("varTipo", cuentaBancaria.getTipo());
                parametrosIngresoCuentaBancaria.addValue("varEntidad", cuentaBancaria.getEntidad());
                ingresarCuentaBancaria.execute(parametrosIngresoCuentaBancaria);
            }
        }
    }

    private void actualizarCorreosElectronicos(long idPersona, List<CorreoElectronico> correosElectronicos) {
        MapSqlParameterSource parametrosConsultaCorreoElectronico = new MapSqlParameterSource();
        parametrosConsultaCorreoElectronico.addValue("varIdPersona", idPersona);
        Map resultadoCorreosElectronicos = obtenerCorreosElectronicos.execute(parametrosConsultaCorreoElectronico);
        ArrayList<CorreoElectronico> correosElectronicosActuales = (ArrayList<CorreoElectronico>) resultadoCorreosElectronicos.get("correosElectronicos");

        MapSqlParameterSource parametrosEliminacionCorreoElectronico = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionCorreoElectronico = new MapSqlParameterSource();
        for (CorreoElectronico correosElectronicoActual : correosElectronicosActuales) {
            CorreoElectronico correosElectronicoModificado = null;
            for (CorreoElectronico correosElectronico : correosElectronicos) {
                if (correosElectronico.getId() == correosElectronicoActual.getId()) {
                    correosElectronicoModificado = correosElectronico;
                    break;
                }
            }
            if (correosElectronicoModificado == null) {
                parametrosEliminacionCorreoElectronico.addValue("varId", correosElectronicoActual.getId());
                eliminarCorreoElectronico.execute(parametrosEliminacionCorreoElectronico);
            } else {
                parametrosActualizacionCorreoElectronico.addValue("varId", correosElectronicoModificado.getId());
                parametrosActualizacionCorreoElectronico.addValue("varCorreoElectronico", correosElectronicoModificado.getCorreoElectronico());
                actualizarCorreoElectronico.execute(parametrosActualizacionCorreoElectronico);
            }
        }

        MapSqlParameterSource parametrosIngresoCorreoElectronico = new MapSqlParameterSource();
        parametrosIngresoCorreoElectronico.addValue("varIdPersona", idPersona);
        for (CorreoElectronico correosElectronico : correosElectronicos) {
            if (correosElectronico.getId() == 0) {
                parametrosIngresoCorreoElectronico.addValue("varCorreoElectronico", correosElectronico.getCorreoElectronico());
                ingresarCorreoElectronico.execute(parametrosIngresoCorreoElectronico);
            }
        }
    }

    private void actualizarDocumentosSoporte(long idPersona, List<DocumentoSoporte> documentosSoporte) {
        MapSqlParameterSource parametrosConsultaDocumentosSoporte = new MapSqlParameterSource();
        parametrosConsultaDocumentosSoporte.addValue("varIdPersona", idPersona);
        Map resultadoDocumentosSoporte = obtenerDocumentosSoporte.execute(parametrosConsultaDocumentosSoporte);
        ArrayList<DocumentoSoporte> documentosSoporteActuales = (ArrayList<DocumentoSoporte>) resultadoDocumentosSoporte.get("documentosSoporte");

        MapSqlParameterSource parametrosEliminacionDocumentoSoporte = new MapSqlParameterSource();
        for (DocumentoSoporte documentoSoporteActual : documentosSoporteActuales) {
            DocumentoSoporte documentoSoporteModificado = null;
            for (DocumentoSoporte documentoSoporte : documentosSoporte) {
                if (documentoSoporte.getId() == documentoSoporteActual.getId()) {
                    documentoSoporteModificado = documentoSoporte;
                    break;
                }
            }
            if (documentoSoporteModificado == null) {
                parametrosEliminacionDocumentoSoporte.addValue("varIdDocumentoSoporte", documentoSoporteActual.getId());
                eliminarDocumentoSoporte.execute(parametrosEliminacionDocumentoSoporte);
            } else {
                Documento documento = documentoSoporteModificado.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarDocumentoSoporte = new MapSqlParameterSource();
                    parametrosActualizarDocumentoSoporte.addValue("varIdDocumentoSoporte", documentoSoporteModificado.getId());
                    parametrosActualizarDocumentoSoporte.addValue("varIdTipoDocumento", documentoSoporteModificado.getTipoDocumento());
                    parametrosActualizarDocumentoSoporte.addValue("varIdDocumentoSoporte", documentoSoporteModificado.getId());
                    parametrosActualizarDocumentoSoporte.addValue("varNombre", documento.getNombre());
                    parametrosActualizarDocumentoSoporte.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarDocumentoSoporte.addValue("varContenido", documento.getContenido());
                    actualizarDocumentoSoporte.execute(parametrosActualizarDocumentoSoporte);
                }
            }
        }

        for (DocumentoSoporte documentoSoporte : documentosSoporte) {
            if (documentoSoporte.getId() == 0) {
                Documento documento = documentoSoporte.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoDocumentoSoporte = new MapSqlParameterSource();
                    parametrosIngresoDocumentoSoporte.addValue("varIdPersona", idPersona);
                    parametrosIngresoDocumentoSoporte.addValue("varIdTipoDocumento", documentoSoporte.getTipoDocumento());
                    parametrosIngresoDocumentoSoporte.addValue("varNombre", documento.getNombre());
                    parametrosIngresoDocumentoSoporte.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoDocumentoSoporte.addValue("varContenido", documento.getContenido());
                    ingresarDocumentoSoporte.execute(parametrosIngresoDocumentoSoporte);
                }
            }
        }
    }

    private void actualizarIdiomas(long idPersona, List<Idioma> idiomas) {
        MapSqlParameterSource parametrosConsultaIdioma = new MapSqlParameterSource();
        parametrosConsultaIdioma.addValue("varIdPersona", idPersona);
        Map resultadoIdiomas = obtenerIdiomas.execute(parametrosConsultaIdioma);
        ArrayList<Idioma> idiomasActuales = (ArrayList<Idioma>) resultadoIdiomas.get("idiomas");

        MapSqlParameterSource parametrosEliminacionIdioma = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionIdioma = new MapSqlParameterSource();
        for (Idioma idiomaActual : idiomasActuales) {
            Idioma idiomaModificado = null;
            for (Idioma idioma : idiomas) {
                if (idioma.getId() == idiomaActual.getId()) {
                    idiomaModificado = idioma;
                    break;
                }
            }
            if (idiomaModificado == null) {
                parametrosEliminacionIdioma.addValue("varId", idiomaActual.getId());
                eliminarIdioma.execute(parametrosEliminacionIdioma);
            } else {
                parametrosActualizacionIdioma.addValue("varId", idiomaModificado.getId());
                parametrosActualizacionIdioma.addValue("varIdioma", idiomaModificado.getIdioma());
                parametrosActualizacionIdioma.addValue("varNivelConversacion", idiomaModificado.getNivelConversacion());
                parametrosActualizacionIdioma.addValue("varNivelLectura", idiomaModificado.getNivelLectura());
                parametrosActualizacionIdioma.addValue("varNivelEscritura", idiomaModificado.getNivelEscritura());
                parametrosActualizacionIdioma.addValue("varNivelEscucha", idiomaModificado.getNivelEscucha());
                parametrosActualizacionIdioma.addValue("varTipoCertificacion", idiomaModificado.getTipoCertificacion());
                parametrosActualizacionIdioma.addValue("varOtraCertificacion", idiomaModificado.getOtraCertificacion());
                parametrosActualizacionIdioma.addValue("varPuntajeCertificacion", idiomaModificado.getPuntajeCertificacion());
                actualizarIdioma.execute(parametrosActualizacionIdioma);
                Documento documento = idiomaModificado.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoIdioma = new MapSqlParameterSource();
                    parametrosActualizarCertificadoIdioma.addValue("varIdIdioma", idiomaModificado.getId());
                    parametrosActualizarCertificadoIdioma.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoIdioma.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoIdioma.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoIdioma.execute(parametrosActualizarCertificadoIdioma);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
        parametrosIngresoIdioma.addValue("varIdPersona", idPersona);
        for (Idioma idioma : idiomas) {
            if (idioma.getId() == 0) {
                parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
                parametrosIngresoIdioma.addValue("varNivelConversacion", idioma.getNivelConversacion());
                parametrosIngresoIdioma.addValue("varNivelLectura", idioma.getNivelLectura());
                parametrosIngresoIdioma.addValue("varNivelEscritura", idioma.getNivelEscritura());
                parametrosIngresoIdioma.addValue("varNivelEscucha", idioma.getNivelEscucha());
                parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
                parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
                parametrosIngresoIdioma.addValue("varPuntajeCertificacion", idioma.getPuntajeCertificacion());
                Map resultadoIngresoIdioma = ingresarIdioma.execute(parametrosIngresoIdioma);
                int idIdioma = (int) resultadoIngresoIdioma.get("varId");
                Documento documento = idioma.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoIdioma = new MapSqlParameterSource();
                    parametrosIngresoCertificadoIdioma.addValue("varIdIdioma", idIdioma);
                    parametrosIngresoCertificadoIdioma.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoIdioma.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoIdioma.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoIdioma.execute(parametrosIngresoCertificadoIdioma);
                }
            }
        }
    }

    private void actualizarEducacionesBasicas(long idPersona, List<EducacionBasica> educacionesBasicas) {
        MapSqlParameterSource parametrosConsultaEducacionBasica = new MapSqlParameterSource();
        parametrosConsultaEducacionBasica.addValue("varIdPersona", idPersona);
        Map resultadoEducacionBasicas = obtenerEducacionesBasicas.execute(parametrosConsultaEducacionBasica);
        ArrayList<EducacionBasica> educacionesBasicasActuales = (ArrayList<EducacionBasica>) resultadoEducacionBasicas.get("educacionesBasicas");

        MapSqlParameterSource parametrosEliminacionEducacionBasica = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionBasica = new MapSqlParameterSource();
        for (EducacionBasica educacionBasicaActual : educacionesBasicasActuales) {
            EducacionBasica educacionBasicaModificada = null;
            for (EducacionBasica educacionBasica : educacionesBasicas) {
                if (educacionBasica.getId() == educacionBasicaActual.getId()) {
                    educacionBasicaModificada = educacionBasica;
                    break;
                }
            }
            if (educacionBasicaModificada == null) {
                parametrosEliminacionEducacionBasica.addValue("varId", educacionBasicaActual.getId());
                eliminarEducacionBasica.execute(parametrosEliminacionEducacionBasica);
            } else {
                parametrosActualizacionEducacionBasica.addValue("varId", educacionBasicaModificada.getId());
                parametrosActualizacionEducacionBasica.addValue("varNivel", educacionBasicaModificada.getNivel());
                parametrosActualizacionEducacionBasica.addValue("varInstitucion", educacionBasicaModificada.getInstitucion());
                parametrosActualizacionEducacionBasica.addValue("varAnyoFinalizacion", educacionBasicaModificada.getAnyoFinalizacion());
                parametrosActualizacionEducacionBasica.addValue("varAnyoInicio", educacionBasicaModificada.getAnyoInicio());
                parametrosActualizacionEducacionBasica.addValue("varTitulo", educacionBasicaModificada.getTitulo());
                parametrosActualizacionEducacionBasica.addValue("varGraduado", educacionBasicaModificada.isGraduado());
                actualizarEducacionBasica.execute(parametrosActualizacionEducacionBasica);
                Documento documento = educacionBasicaModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoEducacionBasica = new MapSqlParameterSource();
                    parametrosActualizarCertificadoEducacionBasica.addValue("varIdEducacionBasica", educacionBasicaModificada.getId());
                    parametrosActualizarCertificadoEducacionBasica.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoEducacionBasica.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoEducacionBasica.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoEducacionBasica.execute(parametrosActualizarCertificadoEducacionBasica);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionBasica = new MapSqlParameterSource();
        parametrosIngresoEducacionBasica.addValue("varIdPersona", idPersona);
        for (EducacionBasica educacionBasica : educacionesBasicas) {
            if (educacionBasica.getId() == 0) {
                parametrosIngresoEducacionBasica.addValue("varNivel", educacionBasica.getNivel());
                parametrosIngresoEducacionBasica.addValue("varInstitucion", educacionBasica.getInstitucion());
                parametrosIngresoEducacionBasica.addValue("varAnyoFinalizacion", educacionBasica.getAnyoFinalizacion());
                parametrosIngresoEducacionBasica.addValue("varAnyoInicio", educacionBasica.getAnyoInicio());
                parametrosIngresoEducacionBasica.addValue("varTitulo", educacionBasica.getTitulo());
                parametrosIngresoEducacionBasica.addValue("varGraduado", educacionBasica.isGraduado());
                Map resultadoIngresoEducacionBasica = ingresarEducacionBasica.execute(parametrosIngresoEducacionBasica);
                int idEducacionBasica = (int) resultadoIngresoEducacionBasica.get("varId");
                Documento documento = educacionBasica.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoEducacionBasica = new MapSqlParameterSource();
                    parametrosIngresoCertificadoEducacionBasica.addValue("varIdEducacionBasica", idEducacionBasica);
                    parametrosIngresoCertificadoEducacionBasica.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoEducacionBasica.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoEducacionBasica.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoEducacionBasica.execute(parametrosIngresoCertificadoEducacionBasica);
                }
            }
        }
    }

    private void actualizarEducacionesSuperiores(long idPersona, List<EducacionSuperior> educacionesSuperiores) {
        MapSqlParameterSource parametrosConsultaEducacionSuperior = new MapSqlParameterSource();
        parametrosConsultaEducacionSuperior.addValue("varIdPersona", idPersona);
        Map resultadoEducacionSuperiores = obtenerEducacionesSuperiores.execute(parametrosConsultaEducacionSuperior);
        ArrayList<EducacionSuperior> educacionesSuperioresActuales = (ArrayList<EducacionSuperior>) resultadoEducacionSuperiores.get("educacionesSuperiores");

        MapSqlParameterSource parametrosEliminacionEducacionSuperior = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionSuperior = new MapSqlParameterSource();
        for (EducacionSuperior educacionSuperiorActual : educacionesSuperioresActuales) {
            EducacionSuperior educacionSuperiorModificada = null;
            for (EducacionSuperior educacionSuperior : educacionesSuperiores) {
                if (educacionSuperior.getId() == educacionSuperiorActual.getId()) {
                    educacionSuperiorModificada = educacionSuperior;
                    break;
                }
            }
            if (educacionSuperiorModificada == null) {
                parametrosEliminacionEducacionSuperior.addValue("varId", educacionSuperiorActual.getId());
                eliminarEducacionSuperior.execute(parametrosEliminacionEducacionSuperior);
            } else {
                parametrosActualizacionEducacionSuperior.addValue("varId", educacionSuperiorModificada.getId());
                parametrosActualizacionEducacionSuperior.addValue("varNivel", educacionSuperiorModificada.getNivel());
                parametrosActualizacionEducacionSuperior.addValue("varTituloExterior", educacionSuperiorModificada.isTituloExterior());
                parametrosActualizacionEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperiorModificada.getPaisTituloExterior());
                parametrosActualizacionEducacionSuperior.addValue("varPrograma", educacionSuperiorModificada.getPrograma());
                parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperiorModificada.getFechaTitulo());
                parametrosActualizacionEducacionSuperior.addValue("varNucleoBasicoConocimiento", educacionSuperiorModificada.getNucleoBasicoConocimiento());
                parametrosActualizacionEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperiorModificada.getAnyoFinalizacion());
                parametrosActualizacionEducacionSuperior.addValue("varAnyoInicio", educacionSuperiorModificada.getAnyoInicio());
                parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperiorModificada.getFechaTitulo());
                parametrosActualizacionEducacionSuperior.addValue("varGraduado", educacionSuperiorModificada.isGraduado());
                actualizarEducacionSuperior.execute(parametrosActualizacionEducacionSuperior);
                Documento documento = educacionSuperiorModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificada.getId());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoEducacionSuperior.execute(parametrosActualizarCertificadoEducacionSuperior);
                }
                if (educacionSuperiorModificada.isTituloExterior()) {
                    Documento documentoHomologado = educacionSuperiorModificada.getCertificadoHomologado();
                    if (documentoHomologado != null) {
                        MapSqlParameterSource parametrosActualizarCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificada.getId());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                        actualizarCertificadoHomologadoEducacionSuperior.execute(parametrosActualizarCertificadoHomologadoEducacionSuperior);
                    }
                } else {
                    MapSqlParameterSource parametrosEliminacionCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosEliminacionCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificada.getId());
                    eliminarCertificadoHomologadoEducacionSuperior.execute(parametrosEliminacionCertificadoHomologadoEducacionSuperior);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionSuperior = new MapSqlParameterSource();
        parametrosIngresoEducacionSuperior.addValue("varIdPersona", idPersona);
        for (EducacionSuperior educacionSuperior : educacionesSuperiores) {
            if (educacionSuperior.getId() == 0) {
                parametrosIngresoEducacionSuperior.addValue("varNivel", educacionSuperior.getNivel());
                parametrosIngresoEducacionSuperior.addValue("varTituloExterior", educacionSuperior.isTituloExterior());
                parametrosIngresoEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperior.getPaisTituloExterior());
                parametrosIngresoEducacionSuperior.addValue("varPrograma", educacionSuperior.getPrograma());
                parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
                parametrosIngresoEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
                parametrosIngresoEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
                parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
                parametrosIngresoEducacionSuperior.addValue("varGraduado", educacionSuperior.isGraduado());
                Map resultadoIngresoEducacionSuperior = ingresarEducacionSuperior.execute(parametrosIngresoEducacionSuperior);
                int idEducacionSuperior = (int) resultadoIngresoEducacionSuperior.get("varId");
                Documento documento = educacionSuperior.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosIngresoCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                    parametrosIngresoCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoEducacionSuperior.execute(parametrosIngresoCertificadoEducacionSuperior);
                }
                Documento documentoHomologado = educacionSuperior.getCertificadoHomologado();
                if (documentoHomologado != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                    parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                    parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                    parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                    ingresarCertificadoHomologadoEducacionSuperior.execute(parametrosIngresoCertificadoHomologadoEducacionSuperior);
                }
            }
        }
    }

    private void actualizarEducacionesContinuas(long idPersona, List<EducacionContinua> educacionesContinuas) {
        MapSqlParameterSource parametrosConsultaEducacionContinua = new MapSqlParameterSource();
        parametrosConsultaEducacionContinua.addValue("varIdPersona", idPersona);
        Map resultadoEducacionContinuas = obtenerEducacionesContinuas.execute(parametrosConsultaEducacionContinua);
        ArrayList<EducacionContinua> educacionesContinuasActuales = (ArrayList<EducacionContinua>) resultadoEducacionContinuas.get("educacionesContinuas");

        MapSqlParameterSource parametrosEliminacionEducacionContinua = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionContinua = new MapSqlParameterSource();
        for (EducacionContinua educacionContinuaActual : educacionesContinuasActuales) {
            EducacionContinua educacionContinuaModificada = null;
            for (EducacionContinua educacionContinua : educacionesContinuas) {
                if (educacionContinua.getId() == educacionContinuaActual.getId()) {
                    educacionContinuaModificada = educacionContinua;
                    break;
                }
            }
            if (educacionContinuaModificada == null) {
                parametrosEliminacionEducacionContinua.addValue("varId", educacionContinuaActual.getId());
                eliminarEducacionContinua.execute(parametrosEliminacionEducacionContinua);
            } else {
                parametrosActualizacionEducacionContinua.addValue("varId", educacionContinuaModificada.getId());
                parametrosActualizacionEducacionContinua.addValue("varTipoCapacitacion", educacionContinuaModificada.getTipoCapacitacion());
                parametrosActualizacionEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinuaModificada.getNucleoBasicoConocimiento());
                parametrosActualizacionEducacionContinua.addValue("varNombreCapacitacion", educacionContinuaModificada.getNombreCapacitacion());
                parametrosActualizacionEducacionContinua.addValue("varInstitucion", educacionContinuaModificada.getInstitucion());
                parametrosActualizacionEducacionContinua.addValue("varAnyo", educacionContinuaModificada.getAnyo());
                parametrosActualizacionEducacionContinua.addValue("varNumeroHoras", educacionContinuaModificada.getNumeroHoras());
                actualizarEducacionContinua.execute(parametrosActualizacionEducacionContinua);
                Documento documento = educacionContinuaModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoEducacionContinua = new MapSqlParameterSource();
                    parametrosActualizarCertificadoEducacionContinua.addValue("varIdEducacionContinua", educacionContinuaModificada.getId());
                    parametrosActualizarCertificadoEducacionContinua.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoEducacionContinua.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoEducacionContinua.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoEducacionContinua.execute(parametrosActualizarCertificadoEducacionContinua);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
        parametrosIngresoEducacionContinua.addValue("varIdPersona", idPersona);
        for (EducacionContinua educacionContinua : educacionesContinuas) {
            if (educacionContinua.getId() == 0) {
                parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
                parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
                parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
                parametrosIngresoEducacionContinua.addValue("varInstitucion", educacionContinua.getInstitucion());
                parametrosIngresoEducacionContinua.addValue("varAnyo", educacionContinua.getAnyo());
                parametrosIngresoEducacionContinua.addValue("varNumeroHoras", educacionContinua.getNumeroHoras());
                Map resultadoIngresoEducacionContinua = ingresarEducacionContinua.execute(parametrosIngresoEducacionContinua);
                int idEducacionContinua = (int) resultadoIngresoEducacionContinua.get("varId");
                Documento documento = educacionContinua.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoEducacionContinua = new MapSqlParameterSource();
                    parametrosIngresoCertificadoEducacionContinua.addValue("varIdEducacionContinua", idEducacionContinua);
                    parametrosIngresoCertificadoEducacionContinua.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoEducacionContinua.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoEducacionContinua.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoEducacionContinua.execute(parametrosIngresoCertificadoEducacionContinua);
                }
            }
        }
    }

    private void actualizarDistinciones(long idPersona, List<Distincion> distinciones) {
        MapSqlParameterSource parametrosConsultaDistincion = new MapSqlParameterSource();
        parametrosConsultaDistincion.addValue("varIdPersona", idPersona);
        Map resultadoDistincions = obtenerDistinciones.execute(parametrosConsultaDistincion);
        ArrayList<Distincion> distincionesActuales = (ArrayList<Distincion>) resultadoDistincions.get("distinciones");

        MapSqlParameterSource parametrosEliminacionDistincion = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionDistincion = new MapSqlParameterSource();
        for (Distincion distincionActual : distincionesActuales) {
            Distincion distincionModificada = null;
            for (Distincion distincion : distinciones) {
                if (distincion.getId() == distincionActual.getId()) {
                    distincionModificada = distincion;
                    break;
                }
            }
            if (distincionModificada == null) {
                parametrosEliminacionDistincion.addValue("varId", distincionActual.getId());
                eliminarDistincion.execute(parametrosEliminacionDistincion);
            } else {
                parametrosActualizacionDistincion.addValue("varId", distincionModificada.getId());
                parametrosActualizacionDistincion.addValue("varDescripcion", distincionModificada.getDescripcion());
                parametrosActualizacionDistincion.addValue("varFechaDistincion", distincionModificada.getFechaDistincion());
                parametrosActualizacionDistincion.addValue("varInstitucionOtorga", distincionModificada.getInstitucionOtorga());
                actualizarDistincion.execute(parametrosActualizacionDistincion);
                Documento documento = distincionModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoDistincion = new MapSqlParameterSource();
                    parametrosActualizarCertificadoDistincion.addValue("varIdDistincion", distincionModificada.getId());
                    parametrosActualizarCertificadoDistincion.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoDistincion.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoDistincion.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoDistincion.execute(parametrosActualizarCertificadoDistincion);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoDistincion = new MapSqlParameterSource();
        parametrosIngresoDistincion.addValue("varIdPersona", idPersona);
        for (Distincion distincion : distinciones) {
            if (distincion.getId() == 0) {
                parametrosIngresoDistincion.addValue("varDescripcion", distincion.getDescripcion());
                parametrosIngresoDistincion.addValue("varFechaDistincion", distincion.getFechaDistincion());
                parametrosIngresoDistincion.addValue("varInstitucionOtorga", distincion.getInstitucionOtorga());
                Map resultadoIngresoDistincion = ingresarDistincion.execute(parametrosIngresoDistincion);
                int idDistincion = (int) resultadoIngresoDistincion.get("varId");
                Documento documento = distincion.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoDistincion = new MapSqlParameterSource();
                    parametrosIngresoCertificadoDistincion.addValue("varIdDistincion", idDistincion);
                    parametrosIngresoCertificadoDistincion.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoDistincion.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoDistincion.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoDistincion.execute(parametrosIngresoCertificadoDistincion);
                }
            }
        }
    }

    private void actualizarExperienciasLaborales(long idPersona, List<ExperienciaLaboral> experienciasLaborales) {
        MapSqlParameterSource parametrosConsultaExperienciaLaboral = new MapSqlParameterSource();
        parametrosConsultaExperienciaLaboral.addValue("varIdPersona", idPersona);
        Map resultadoExperienciaLaborals = obtenerExperienciasLaborales.execute(parametrosConsultaExperienciaLaboral);
        ArrayList<ExperienciaLaboral> experienciasLaboralesActuales = (ArrayList<ExperienciaLaboral>) resultadoExperienciaLaborals.get("experienciasLaborales");

        MapSqlParameterSource parametrosEliminacionExperienciaLaboral = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionExperienciaLaboral = new MapSqlParameterSource();
        for (ExperienciaLaboral experienciaLaboralActual : experienciasLaboralesActuales) {
            ExperienciaLaboral experienciaLaboralModificada = null;
            for (ExperienciaLaboral experienciaLaboral : experienciasLaborales) {
                if (experienciaLaboral.getId() == experienciaLaboralActual.getId()) {
                    experienciaLaboralModificada = experienciaLaboral;
                    break;
                }
            }
            if (experienciaLaboralModificada == null) {
                parametrosEliminacionExperienciaLaboral.addValue("varId", experienciaLaboralActual.getId());
                eliminarExperienciaLaboral.execute(parametrosEliminacionExperienciaLaboral);
            } else {
                parametrosActualizacionExperienciaLaboral.addValue("varId", experienciaLaboralModificada.getId());
                parametrosActualizacionExperienciaLaboral.addValue("varActividadeconomica", experienciaLaboralModificada.getActividadEconomica());
                parametrosActualizacionExperienciaLaboral.addValue("varNucleoBasicoConocimiento", experienciaLaboralModificada.getNucleoBasicoConocimiento());
                parametrosActualizacionExperienciaLaboral.addValue("varCargo", experienciaLaboralModificada.getCargo());
                parametrosActualizacionExperienciaLaboral.addValue("varFechaIngreso", experienciaLaboralModificada.getFechaIngreso());
                parametrosActualizacionExperienciaLaboral.addValue("varFechaRetiro", experienciaLaboralModificada.getFechaRetiro());
                parametrosActualizacionExperienciaLaboral.addValue("varNaturalezaCargo", experienciaLaboralModificada.getNaturalezaCargo());
                parametrosActualizacionExperienciaLaboral.addValue("varNombreEmpresa", experienciaLaboralModificada.getNombreEmpresa());
                parametrosActualizacionExperienciaLaboral.addValue("varTipoContrato", experienciaLaboralModificada.getTipoContrato());
                parametrosActualizacionExperienciaLaboral.addValue("varTipoEmpresa", experienciaLaboralModificada.getTipoEmpresa());
                parametrosActualizacionExperienciaLaboral.addValue("varTipoExperiencia", experienciaLaboralModificada.getTipoExperiencia());
                parametrosActualizacionExperienciaLaboral.addValue("varFnsp", experienciaLaboralModificada.isFnsp());
                parametrosActualizacionExperienciaLaboral.addValue("varTrabajoActual", experienciaLaboralModificada.isTrabajoActual());
                actualizarExperienciaLaboral.execute(parametrosActualizacionExperienciaLaboral);
                Documento documento = experienciaLaboralModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoExperienciaLaboral = new MapSqlParameterSource();
                    parametrosActualizarCertificadoExperienciaLaboral.addValue("varIdExperienciaLaboral", experienciaLaboralModificada.getId());
                    parametrosActualizarCertificadoExperienciaLaboral.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoExperienciaLaboral.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoExperienciaLaboral.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoExperienciaLaboral.execute(parametrosActualizarCertificadoExperienciaLaboral);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoExperienciaLaboral = new MapSqlParameterSource();
        parametrosIngresoExperienciaLaboral.addValue("varIdPersona", idPersona);
        for (ExperienciaLaboral experienciaLaboral : experienciasLaborales) {
            if (experienciaLaboral.getId() == 0) {
                parametrosIngresoExperienciaLaboral.addValue("varActividadeconomica", experienciaLaboral.getActividadEconomica());
                parametrosIngresoExperienciaLaboral.addValue("varNucleoBasicoConocimiento", experienciaLaboral.getNucleoBasicoConocimiento());
                parametrosIngresoExperienciaLaboral.addValue("varCargo", experienciaLaboral.getCargo());
                parametrosIngresoExperienciaLaboral.addValue("varFechaIngreso", experienciaLaboral.getFechaIngreso());
                parametrosIngresoExperienciaLaboral.addValue("varFechaRetiro", experienciaLaboral.getFechaRetiro());
                parametrosIngresoExperienciaLaboral.addValue("varNaturalezaCargo", experienciaLaboral.getNaturalezaCargo());
                parametrosIngresoExperienciaLaboral.addValue("varNombreEmpresa", experienciaLaboral.getNombreEmpresa());
                parametrosIngresoExperienciaLaboral.addValue("varTipoContrato", experienciaLaboral.getTipoContrato());
                parametrosIngresoExperienciaLaboral.addValue("varTipoEmpresa", experienciaLaboral.getTipoEmpresa());
                parametrosIngresoExperienciaLaboral.addValue("varTipoExperiencia", experienciaLaboral.getTipoExperiencia());
                parametrosIngresoExperienciaLaboral.addValue("varFnsp", experienciaLaboral.isFnsp());
                parametrosIngresoExperienciaLaboral.addValue("varTrabajoActual", experienciaLaboral.isTrabajoActual());
                Map resultadoIngresoExperienciaLaboral = ingresarExperienciaLaboral.execute(parametrosIngresoExperienciaLaboral);
                int idExperienciaLaboral = (int) resultadoIngresoExperienciaLaboral.get("varId");
                Documento documento = experienciaLaboral.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoExperienciaLaboral = new MapSqlParameterSource();
                    parametrosIngresoCertificadoExperienciaLaboral.addValue("varIdExperienciaLaboral", idExperienciaLaboral);
                    parametrosIngresoCertificadoExperienciaLaboral.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoExperienciaLaboral.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoExperienciaLaboral.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoExperienciaLaboral.execute(parametrosIngresoCertificadoExperienciaLaboral);
                }
            }
        }
    }

    private void actualizarExperienciasDocencia(long idPersona, List<ExperienciaDocencia> experienciasDocencia) {
        MapSqlParameterSource parametrosConsultaExperienciaDocencia = new MapSqlParameterSource();
        parametrosConsultaExperienciaDocencia.addValue("varIdPersona", idPersona);
        Map resultadoExperienciasDocencia = obtenerExperienciasDocencia.execute(parametrosConsultaExperienciaDocencia);
        ArrayList<ExperienciaDocencia> experienciasDocenciaActuales = (ArrayList<ExperienciaDocencia>) resultadoExperienciasDocencia.get("experienciasDocencia");

        MapSqlParameterSource parametrosEliminacionExperienciaDocencia = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionExperienciaDocencia = new MapSqlParameterSource();
        for (ExperienciaDocencia experienciaDocenciaActual : experienciasDocenciaActuales) {
            ExperienciaDocencia experienciaDocenciaModificada = null;
            for (ExperienciaDocencia experienciaDocencia : experienciasDocencia) {
                if (experienciaDocencia.getId() == experienciaDocenciaActual.getId()) {
                    experienciaDocenciaModificada = experienciaDocencia;
                    break;
                }
            }
            if (experienciaDocenciaModificada == null) {
                parametrosEliminacionExperienciaDocencia.addValue("varId", experienciaDocenciaActual.getId());
                eliminarExperienciaDocencia.execute(parametrosEliminacionExperienciaDocencia);
            } else {
                parametrosActualizacionExperienciaDocencia.addValue("varId", experienciaDocenciaModificada.getId());
                parametrosActualizacionExperienciaDocencia.addValue("varTrabajoActual", experienciaDocenciaModificada.isTrabajoActual());
                parametrosActualizacionExperienciaDocencia.addValue("varFnsp", experienciaDocenciaModificada.isFnsp());
                parametrosActualizacionExperienciaDocencia.addValue("varInstitucion", experienciaDocenciaModificada.getInstitucion());
                actualizarExperienciaDocencia.execute(parametrosActualizacionExperienciaDocencia);
                actualizarCursosExperienciaDocencia(experienciaDocenciaModificada.getId(), experienciaDocenciaModificada.getCursosExperienciaDocencia());
            }
        }

        MapSqlParameterSource parametrosIngresoExperienciaDocencia = new MapSqlParameterSource();
        parametrosIngresoExperienciaDocencia.addValue("varIdPersona", idPersona);
        for (ExperienciaDocencia experienciaDocencia : experienciasDocencia) {
            if (experienciaDocencia.getId() == 0) {
                parametrosIngresoExperienciaDocencia.addValue("varTrabajoActual", experienciaDocencia.isTrabajoActual());
                parametrosIngresoExperienciaDocencia.addValue("varFnsp", experienciaDocencia.isFnsp());
                parametrosIngresoExperienciaDocencia.addValue("varInstitucion", experienciaDocencia.getInstitucion());
                Map resultadoIngresoExperienciaDocencia = ingresarExperienciaDocencia.execute(parametrosIngresoExperienciaDocencia);
                int idExperienciaDocencia = (int) resultadoIngresoExperienciaDocencia.get("varId");
                for (CursoExperienciaDocencia cursoExperienciaDocencia : experienciaDocencia.getCursosExperienciaDocencia()) {
                    MapSqlParameterSource parametrosIngresoCursoExperienciaDocencia = new MapSqlParameterSource();
                    parametrosIngresoCursoExperienciaDocencia.addValue("varIdExperienciaDocencia", idExperienciaDocencia);
                    parametrosIngresoCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocencia.getAnyo());
                    parametrosIngresoCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocencia.getNucleoBasicoConocimiento());
                    parametrosIngresoCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocencia.getModalidad());
                    parametrosIngresoCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocencia.getNivelEstudio());
                    parametrosIngresoCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocencia.getNumeroHoras());
                    parametrosIngresoCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocencia.getNombreCurso());
                    Map resultadoIngresoCursoExperienciaDocencia = ingresarCursoExperienciaDocencia.execute(parametrosIngresoCursoExperienciaDocencia);
                    int idCursoExperienciaDocencia = (int) resultadoIngresoCursoExperienciaDocencia.get("varId");
                    Documento documento = cursoExperienciaDocencia.getCertificado();
                    if (documento != null) {
                        MapSqlParameterSource parametrosIngresoCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                        parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", idCursoExperienciaDocencia);
                        parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                        parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                        parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                        ingresarCertificadoCursoExperienciaDocencia.execute(parametrosIngresoCertificadoCursoExperienciaDocencia);
                    }
                }
            }
        }
    }

    private void actualizarCursosExperienciaDocencia(long idExperienciaDocencia, List<CursoExperienciaDocencia> cursosExperienciaDocencia) {
        MapSqlParameterSource parametrosConsultaCursoExperienciaDocencia = new MapSqlParameterSource();
        parametrosConsultaCursoExperienciaDocencia.addValue("varidExperienciaDocencia", idExperienciaDocencia);
        Map resultadoCursoExperienciaDocencias = obtenerCursosExperienciaDocencia.execute(parametrosConsultaCursoExperienciaDocencia);
        ArrayList<CursoExperienciaDocencia> cursosExperienciasDocenciaActuales = (ArrayList<CursoExperienciaDocencia>) resultadoCursoExperienciaDocencias.get("cursosExperienciaDocencia");

        MapSqlParameterSource parametrosEliminacionCursoExperienciaDocencia = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionCursoExperienciaDocencia = new MapSqlParameterSource();
        for (CursoExperienciaDocencia cursoExperienciaDocenciaActual : cursosExperienciasDocenciaActuales) {
            CursoExperienciaDocencia cursoExperienciaDocenciaModificada = null;
            for (CursoExperienciaDocencia cursoExperienciaDocencia : cursosExperienciaDocencia) {
                if (cursoExperienciaDocencia.getId() == cursoExperienciaDocenciaActual.getId()) {
                    cursoExperienciaDocenciaModificada = cursoExperienciaDocencia;
                    break;
                }
            }
            if (cursoExperienciaDocenciaModificada == null) {
                parametrosEliminacionCursoExperienciaDocencia.addValue("varId", cursoExperienciaDocenciaActual.getId());
                eliminarCursoExperienciaDocencia.execute(parametrosEliminacionCursoExperienciaDocencia);
            } else {
                parametrosActualizacionCursoExperienciaDocencia.addValue("varId", cursoExperienciaDocenciaModificada.getId());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocenciaModificada.getAnyo());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocenciaModificada.getNucleoBasicoConocimiento());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocenciaModificada.getModalidad());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocenciaModificada.getNivelEstudio());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocenciaModificada.getNumeroHoras());
                parametrosActualizacionCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocenciaModificada.getNombreCurso());
                actualizarCursoExperienciaDocencia.execute(parametrosActualizacionCursoExperienciaDocencia);
                Documento documento = cursoExperienciaDocenciaModificada.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                    parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", cursoExperienciaDocenciaModificada.getId());
                    parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoCursoExperienciaDocencia.execute(parametrosActualizarCertificadoCursoExperienciaDocencia);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoCursoExperienciaDocencia = new MapSqlParameterSource();
        parametrosIngresoCursoExperienciaDocencia.addValue("varIdExperienciaDocencia", idExperienciaDocencia);
        for (CursoExperienciaDocencia cursoExperienciaDocencia : cursosExperienciaDocencia) {
            if (cursoExperienciaDocencia.getId() == 0) {
                parametrosIngresoCursoExperienciaDocencia.addValue("varIdExperienciaDocencia", idExperienciaDocencia);
                parametrosIngresoCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocencia.getAnyo());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocencia.getNucleoBasicoConocimiento());
                parametrosIngresoCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocencia.getModalidad());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocencia.getNivelEstudio());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocencia.getNumeroHoras());
                parametrosIngresoCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocencia.getNombreCurso());
                Map resultadoIngresoCursoExperienciaDocencia = ingresarCursoExperienciaDocencia.execute(parametrosIngresoCursoExperienciaDocencia);
                int idCursoExperienciaDocencia = (int) resultadoIngresoCursoExperienciaDocencia.get("varId");
                Documento documento = cursoExperienciaDocencia.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", idCursoExperienciaDocencia);
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                    ingresarCertificadoCursoExperienciaDocencia.execute(parametrosIngresoCertificadoCursoExperienciaDocencia);
                }
            }
        }
    }

    private void actualizarInvestigador(HojaVida hojaVida) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", hojaVida.getIdPersona());
        parametros.addValue("varInvestigadorReconocidoColciencias", hojaVida.isInvestigadorReconocidoColciencias());
        parametros.addValue("varTipoInvestigador", hojaVida.getTipoInvestigador());
        parametros.addValue("varUrlCVLAC", hojaVida.getUrlCVLAC());
        parametros.addValue("varCodigoORCID", hojaVida.getCodigoORCID());
        parametros.addValue("varIdentificadorScopus", hojaVida.getIdentificadorScopus());
        parametros.addValue("varResearcherId", hojaVida.getResearcherId());
        actualizarInvestigador.execute(parametros);
    }

    private void ingresarInvestigador(long idPersona, HojaVida hojaVida) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);
        parametros.addValue("varInvestigadorReconocidoColciencias", hojaVida.isInvestigadorReconocidoColciencias());
        parametros.addValue("varTipoInvestigador", hojaVida.getTipoInvestigador());
        parametros.addValue("varUrlCVLAC", hojaVida.getUrlCVLAC());
        parametros.addValue("varCodigoORCID", hojaVida.getCodigoORCID());
        parametros.addValue("varIdentificadorScopus", hojaVida.getIdentificadorScopus());
        parametros.addValue("varResearcherId", hojaVida.getResearcherId());
        ingresarInvestigador.execute(parametros);
    }

    private void actualizarArticulos(long idPersona, List<Articulo> articulos) {
        MapSqlParameterSource parametrosConsultaArticulo = new MapSqlParameterSource();
        parametrosConsultaArticulo.addValue("varIdPersona", idPersona);
        Map resultadoArticulos = obtenerArticulos.execute(parametrosConsultaArticulo);
        ArrayList<Articulo> articulosActuales = (ArrayList<Articulo>) resultadoArticulos.get("articulos");

        MapSqlParameterSource parametrosEliminacionArticulo = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionArticulo = new MapSqlParameterSource();
        for (Articulo articuloActual : articulosActuales) {
            Articulo articuloModificado = null;
            for (Articulo articulo : articulos) {
                if (articulo.getId() == articuloActual.getId()) {
                    articuloModificado = articulo;
                    break;
                }
            }
            if (articuloModificado == null) {
                parametrosEliminacionArticulo.addValue("varId", articuloActual.getId());
                eliminarArticulo.execute(parametrosEliminacionArticulo);
            } else {
                parametrosActualizacionArticulo.addValue("varId", articuloModificado.getId());
                parametrosActualizacionArticulo.addValue("varAnyo", articuloModificado.getAnyo());
                parametrosActualizacionArticulo.addValue("varNombreRevista", articuloModificado.getNombreRevista());
                parametrosActualizacionArticulo.addValue("varNombre", articuloModificado.getNombre());
                parametrosActualizacionArticulo.addValue("varTipoAutor", articuloModificado.getTipoAutor());
                parametrosActualizacionArticulo.addValue("varUrl", articuloModificado.getUrl());
                parametrosActualizacionArticulo.addValue("varNucleoBasicoConocimiento", articuloModificado.getNucleoBasicoConocimiento());
                actualizarArticulo.execute(parametrosActualizacionArticulo);
            }
        }

        MapSqlParameterSource parametrosIngresoArticulo = new MapSqlParameterSource();
        parametrosIngresoArticulo.addValue("varIdPersona", idPersona);
        for (Articulo articulo : articulos) {
            if (articulo.getId() == 0) {
                parametrosIngresoArticulo.addValue("varAnyo", articulo.getAnyo());
                parametrosIngresoArticulo.addValue("varNombreRevista", articulo.getNombreRevista());
                parametrosIngresoArticulo.addValue("varNombre", articulo.getNombre());
                parametrosIngresoArticulo.addValue("varTipoAutor", articulo.getTipoAutor());
                parametrosIngresoArticulo.addValue("varUrl", articulo.getUrl());
                parametrosIngresoArticulo.addValue("varNucleoBasicoConocimiento", articulo.getNucleoBasicoConocimiento());
                ingresarArticulo.execute(parametrosIngresoArticulo);
            }
        }
    }

    private void actualizarPatentes(long idPersona, List<Patente> patentes) {
        MapSqlParameterSource parametrosConsultaPatente = new MapSqlParameterSource();
        parametrosConsultaPatente.addValue("varIdPersona", idPersona);
        Map resultadoPatentes = obtenerPatentes.execute(parametrosConsultaPatente);
        ArrayList<Patente> patentesActuales = (ArrayList<Patente>) resultadoPatentes.get("patentes");

        MapSqlParameterSource parametrosEliminacionPatente = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionPatente = new MapSqlParameterSource();
        for (Patente patenteActual : patentesActuales) {
            Patente patenteModificado = null;
            for (Patente patente : patentes) {
                if (patente.getId() == patenteActual.getId()) {
                    patenteModificado = patente;
                    break;
                }
            }
            if (patenteModificado == null) {
                parametrosEliminacionPatente.addValue("varId", patenteActual.getId());
                eliminarPatente.execute(parametrosEliminacionPatente);
            } else {
                parametrosActualizacionPatente.addValue("varId", patenteModificado.getId());
                parametrosActualizacionPatente.addValue("varDescripcion", patenteModificado.getDescripcion());
                parametrosActualizacionPatente.addValue("varClase", patenteModificado.getClase());
                parametrosActualizacionPatente.addValue("varFecha", patenteModificado.getFecha());
                parametrosActualizacionPatente.addValue("vartipopatente", patenteModificado.getTipo());
                parametrosActualizacionPatente.addValue("varpropiedadcompartida", patenteModificado.isPropiedadCompartida());
                actualizarPatente.execute(parametrosActualizacionPatente);
                Documento documento = patenteModificado.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarDocumentoPatente = new MapSqlParameterSource();
                    parametrosActualizarDocumentoPatente.addValue("varIdPatente", patenteModificado.getId());
                    parametrosActualizarDocumentoPatente.addValue("varNombre", documento.getNombre());
                    parametrosActualizarDocumentoPatente.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarDocumentoPatente.addValue("varContenido", documento.getContenido());
                    actualizarDocumentoPatente.execute(parametrosActualizarDocumentoPatente);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoPatente = new MapSqlParameterSource();
        parametrosIngresoPatente.addValue("varIdPersona", idPersona);
        for (Patente patente : patentes) {
            if (patente.getId() == 0) {
                parametrosIngresoPatente.addValue("varDescripcion", patente.getDescripcion());
                parametrosIngresoPatente.addValue("varClase", patente.getClase());
                parametrosIngresoPatente.addValue("varFecha", patente.getFecha());
                parametrosIngresoPatente.addValue("vartipopatente", patente.getTipo());
                parametrosIngresoPatente.addValue("varpropiedadcompartida", patente.isPropiedadCompartida());
                Map resultadoIngresoPatente = ingresarPatente.execute(parametrosIngresoPatente);
                int idPatente = (int) resultadoIngresoPatente.get("varId");
                Documento documento = patente.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoDocumentoPatente = new MapSqlParameterSource();
                    parametrosIngresoDocumentoPatente.addValue("varIdPatente", idPatente);
                    parametrosIngresoDocumentoPatente.addValue("varNombre", documento.getNombre());
                    parametrosIngresoDocumentoPatente.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoDocumentoPatente.addValue("varContenido", documento.getContenido());
                    ingresarDocumentoPatente.execute(parametrosIngresoDocumentoPatente);
                }
            }
        }
    }

    private void actualizarProductosConocimiento(long idPersona, List<ProductoConocimiento> productosConocimiento) {
        MapSqlParameterSource parametrosConsultaProductoConocimiento = new MapSqlParameterSource();
        parametrosConsultaProductoConocimiento.addValue("varIdPersona", idPersona);
        Map resultadoProductosConocimiento = obtenerProductosConocimiento.execute(parametrosConsultaProductoConocimiento);
        ArrayList<ProductoConocimiento> productosConocimientoActuales = (ArrayList<ProductoConocimiento>) resultadoProductosConocimiento.get("productosConocimiento");

        MapSqlParameterSource parametrosEliminacionProductoConocimiento = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionProductoConocimiento = new MapSqlParameterSource();
        for (ProductoConocimiento productoConocimientoActual : productosConocimientoActuales) {
            ProductoConocimiento productoConocimientoModificado = null;
            for (ProductoConocimiento productoConocimiento : productosConocimiento) {
                if (productoConocimiento.getId() == productoConocimientoActual.getId()) {
                    productoConocimientoModificado = productoConocimiento;
                    break;
                }
            }
            if (productoConocimientoModificado == null) {
                parametrosEliminacionProductoConocimiento.addValue("varId", productoConocimientoActual.getId());
                eliminarProductoConocimiento.execute(parametrosEliminacionProductoConocimiento);
            } else {
                parametrosActualizacionProductoConocimiento.addValue("varId", productoConocimientoModificado.getId());
                parametrosActualizacionProductoConocimiento.addValue("varDescripcion", productoConocimientoModificado.getDescripcion());
                parametrosActualizacionProductoConocimiento.addValue("varNucleoBasicoConocimiento", productoConocimientoModificado.getNucleoBasicoConocimiento());
                parametrosActualizacionProductoConocimiento.addValue("varUrl", productoConocimientoModificado.getUrl());
                parametrosActualizacionProductoConocimiento.addValue("varTipo", productoConocimientoModificado.getTipo());
                actualizarProductoConocimiento.execute(parametrosActualizacionProductoConocimiento);
                Documento documento = productoConocimientoModificado.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarDocumentoProductoConocimiento = new MapSqlParameterSource();
                    parametrosActualizarDocumentoProductoConocimiento.addValue("varIdProductoConocimiento", productoConocimientoModificado.getId());
                    parametrosActualizarDocumentoProductoConocimiento.addValue("varNombre", documento.getNombre());
                    parametrosActualizarDocumentoProductoConocimiento.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarDocumentoProductoConocimiento.addValue("varContenido", documento.getContenido());
                    actualizarDocumentoProductoConocimiento.execute(parametrosActualizarDocumentoProductoConocimiento);
                }
            }
        }

        MapSqlParameterSource parametrosIngresoProductoConocimiento = new MapSqlParameterSource();
        parametrosIngresoProductoConocimiento.addValue("varIdPersona", idPersona);
        for (ProductoConocimiento productoConocimiento : productosConocimiento) {
            if (productoConocimiento.getId() == 0) {
                parametrosIngresoProductoConocimiento.addValue("varDescripcion", productoConocimiento.getDescripcion());
                parametrosIngresoProductoConocimiento.addValue("varNucleoBasicoConocimiento", productoConocimiento.getNucleoBasicoConocimiento());
                parametrosIngresoProductoConocimiento.addValue("varUrl", productoConocimiento.getUrl());
                parametrosIngresoProductoConocimiento.addValue("varTipo", productoConocimiento.getTipo());
                Map resultadoIngresoProductoConocimiento = ingresarProductoConocimiento.execute(parametrosIngresoProductoConocimiento);
                int idProductoConocimiento = (int) resultadoIngresoProductoConocimiento.get("varId");
                Documento documento = productoConocimiento.getDocumento();
                if (documento != null) {
                    MapSqlParameterSource parametrosIngresoDocumentoProductoConocimiento = new MapSqlParameterSource();
                    parametrosIngresoDocumentoProductoConocimiento.addValue("varIdProductoConocimiento", idProductoConocimiento);
                    parametrosIngresoDocumentoProductoConocimiento.addValue("varNombre", documento.getNombre());
                    parametrosIngresoDocumentoProductoConocimiento.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosIngresoDocumentoProductoConocimiento.addValue("varContenido", documento.getContenido());
                    ingresarDocumentoProductoConocimiento.execute(parametrosIngresoDocumentoProductoConocimiento);
                }
            }
        }
    }

    @Override
    public List<DocumentoSoporte> obtenerDocumentosSoporte(long idPersona) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);

        Map resultadoDocumentosSoporte = obtenerDocumentosSoporte.execute(parametros);
        List<DocumentoSoporte> documentosSoporte = (List<DocumentoSoporte>) resultadoDocumentosSoporte.get("documentosSoporte");

        return documentosSoporte;
    }

    @Override
    public void guardarDocumentoSoporte(long idPersona, DocumentoSoporte documentoSoporte) {
        if (documentoSoporte.getId() == 0) {
            Documento documento = documentoSoporte.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoSoporte = new MapSqlParameterSource();
                parametrosIngresoDocumentoSoporte.addValue("varIdPersona", idPersona);
                parametrosIngresoDocumentoSoporte.addValue("varIdTipoDocumento", documentoSoporte.getTipoDocumento());
                parametrosIngresoDocumentoSoporte.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoSoporte.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoSoporte.addValue("varContenido", documento.getContenido());
                ingresarDocumentoSoporte.execute(parametrosIngresoDocumentoSoporte);
            }
        } else {
            Documento documento = documentoSoporte.getDocumento();
            MapSqlParameterSource parametrosActualizarDocumentoSoporte = new MapSqlParameterSource();
            parametrosActualizarDocumentoSoporte.addValue("varIdDocumentoSoporte", documentoSoporte.getId());
            parametrosActualizarDocumentoSoporte.addValue("varIdTipoDocumento", documentoSoporte.getTipoDocumento());
            if (documento != null) {
                parametrosActualizarDocumentoSoporte.addValue("varNombre", documento.getNombre());
                parametrosActualizarDocumentoSoporte.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarDocumentoSoporte.addValue("varContenido", documento.getContenido());
            } else {
                parametrosActualizarDocumentoSoporte.addValue("varNombre", null);
                parametrosActualizarDocumentoSoporte.addValue("varTipoContenido", null);
                parametrosActualizarDocumentoSoporte.addValue("varContenido", null);
            }
            actualizarDocumentoSoporte.execute(parametrosActualizarDocumentoSoporte);
        }
    }

    @Override
    public void eliminarDocumentoSoporte(int idDocumentoSoporte) {
        MapSqlParameterSource parametrosEliminacionDocumentoSoporte = new MapSqlParameterSource();
        parametrosEliminacionDocumentoSoporte.addValue("varIdDocumentoSoporte", idDocumentoSoporte);
        eliminarDocumentoSoporte.execute(parametrosEliminacionDocumentoSoporte);
    }

    @Override
    public void guardarEducacionBasica(long idPersona, EducacionBasica educacionBasica) {
        if (educacionBasica.getId() == 0) {
            MapSqlParameterSource parametrosIngresoEducacionBasica = new MapSqlParameterSource();
            parametrosIngresoEducacionBasica.addValue("varIdPersona", idPersona);
            parametrosIngresoEducacionBasica.addValue("varNivel", educacionBasica.getNivel());
            parametrosIngresoEducacionBasica.addValue("varInstitucion", educacionBasica.getInstitucion());
            parametrosIngresoEducacionBasica.addValue("varAnyoFinalizacion", educacionBasica.getAnyoFinalizacion());
            parametrosIngresoEducacionBasica.addValue("varAnyoInicio", educacionBasica.getAnyoInicio());
            parametrosIngresoEducacionBasica.addValue("varTitulo", educacionBasica.getTitulo());
            parametrosIngresoEducacionBasica.addValue("varGraduado", educacionBasica.isGraduado());
            Map resultadoIngresoEducacionBasica = ingresarEducacionBasica.execute(parametrosIngresoEducacionBasica);
            int idEducacionBasica = (int) resultadoIngresoEducacionBasica.get("varId");
            Documento documento = educacionBasica.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionBasica = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionBasica.addValue("varIdEducacionBasica", idEducacionBasica);
                parametrosIngresoCertificadoEducacionBasica.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionBasica.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionBasica.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionBasica.execute(parametrosIngresoCertificadoEducacionBasica);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionEducacionBasica = new MapSqlParameterSource();
            parametrosActualizacionEducacionBasica.addValue("varId", educacionBasica.getId());
            parametrosActualizacionEducacionBasica.addValue("varNivel", educacionBasica.getNivel());
            parametrosActualizacionEducacionBasica.addValue("varInstitucion", educacionBasica.getInstitucion());
            parametrosActualizacionEducacionBasica.addValue("varAnyoFinalizacion", educacionBasica.getAnyoFinalizacion());
            parametrosActualizacionEducacionBasica.addValue("varAnyoInicio", educacionBasica.getAnyoInicio());
            parametrosActualizacionEducacionBasica.addValue("varTitulo", educacionBasica.getTitulo());
            parametrosActualizacionEducacionBasica.addValue("varGraduado", educacionBasica.isGraduado());
            actualizarEducacionBasica.execute(parametrosActualizacionEducacionBasica);
            Documento documento = educacionBasica.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoEducacionBasica = new MapSqlParameterSource();
                parametrosActualizarCertificadoEducacionBasica.addValue("varIdEducacionBasica", educacionBasica.getId());
                parametrosActualizarCertificadoEducacionBasica.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoEducacionBasica.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoEducacionBasica.addValue("varContenido", documento.getContenido());
                actualizarCertificadoEducacionBasica.execute(parametrosActualizarCertificadoEducacionBasica);
            }
        }
    }

    @Override
    public List<EducacionBasica> obtenerEducacionesBasicas(long idPersona) {
        MapSqlParameterSource parametrosConsultaEducacionBasica = new MapSqlParameterSource();
        parametrosConsultaEducacionBasica.addValue("varIdPersona", idPersona);
        Map resultadoEducacionBasicas = obtenerEducacionesBasicas.execute(parametrosConsultaEducacionBasica);
        ArrayList<EducacionBasica> educacionesBasicasActuales = (ArrayList<EducacionBasica>) resultadoEducacionBasicas.get("educacionesBasicas");

        return educacionesBasicasActuales;
    }

    @Override
    public void eliminarEducacionBasica(int idEducacionBasica) {
        MapSqlParameterSource parametrosEliminacionEducacionBasica = new MapSqlParameterSource();
        parametrosEliminacionEducacionBasica.addValue("varId", idEducacionBasica);
        eliminarEducacionBasica.execute(parametrosEliminacionEducacionBasica);
    }

    @Override
    public void guardarEducacionSuperior(long idPersona, EducacionSuperior educacionSuperior) {
        if (educacionSuperior.getId() == 0) {
            MapSqlParameterSource parametrosIngresoEducacionSuperior = new MapSqlParameterSource();
            parametrosIngresoEducacionSuperior.addValue("varIdPersona", idPersona);
            parametrosIngresoEducacionSuperior.addValue("varNivel", educacionSuperior.getNivel());
            parametrosIngresoEducacionSuperior.addValue("varTituloExterior", educacionSuperior.isTituloExterior());
            parametrosIngresoEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperior.getPaisTituloExterior());
            parametrosIngresoEducacionSuperior.addValue("varPrograma", educacionSuperior.getPrograma());
            parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosIngresoEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
            parametrosIngresoEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
            parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosIngresoEducacionSuperior.addValue("varGraduado", educacionSuperior.isGraduado());
            Map resultadoIngresoEducacionSuperior = ingresarEducacionSuperior.execute(parametrosIngresoEducacionSuperior);
            int idEducacionSuperior = (int) resultadoIngresoEducacionSuperior.get("varId");
            Documento documento = educacionSuperior.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionSuperior = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                parametrosIngresoCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionSuperior.execute(parametrosIngresoCertificadoEducacionSuperior);
            }
            Documento documentoHomologado = educacionSuperior.getCertificadoHomologado();
            if (documentoHomologado != null) {
                MapSqlParameterSource parametrosIngresoCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", idEducacionSuperior);
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                parametrosIngresoCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                ingresarCertificadoHomologadoEducacionSuperior.execute(parametrosIngresoCertificadoHomologadoEducacionSuperior);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionEducacionSuperior = new MapSqlParameterSource();
            parametrosActualizacionEducacionSuperior.addValue("varId", educacionSuperior.getId());
            parametrosActualizacionEducacionSuperior.addValue("varNivel", educacionSuperior.getNivel());
            parametrosActualizacionEducacionSuperior.addValue("varTituloExterior", educacionSuperior.isTituloExterior());
            parametrosActualizacionEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperior.getPaisTituloExterior());
            parametrosActualizacionEducacionSuperior.addValue("varPrograma", educacionSuperior.getPrograma());
            parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosActualizacionEducacionSuperior.addValue("varNucleoBasicoConocimiento", educacionSuperior.getNucleoBasicoConocimiento());
            parametrosActualizacionEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
            parametrosActualizacionEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
            parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
            parametrosActualizacionEducacionSuperior.addValue("varGraduado", educacionSuperior.isGraduado());
            actualizarEducacionSuperior.execute(parametrosActualizacionEducacionSuperior);
            Documento documento = educacionSuperior.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoEducacionSuperior = new MapSqlParameterSource();
                parametrosActualizarCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperior.getId());
                parametrosActualizarCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                actualizarCertificadoEducacionSuperior.execute(parametrosActualizarCertificadoEducacionSuperior);
            }
            if (educacionSuperior.isTituloExterior()) {
                Documento documentoHomologado = educacionSuperior.getCertificadoHomologado();
                if (documentoHomologado != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperior.getId());
                    parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                    parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                    parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                    actualizarCertificadoHomologadoEducacionSuperior.execute(parametrosActualizarCertificadoHomologadoEducacionSuperior);
                }
            } else {
                MapSqlParameterSource parametrosEliminacionCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                parametrosEliminacionCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperior.getId());
                eliminarCertificadoHomologadoEducacionSuperior.execute(parametrosEliminacionCertificadoHomologadoEducacionSuperior);
            }
        }
    }

    @Override
    public List<EducacionSuperior> obtenerEducacionesSuperiores(long idPersona) {
        MapSqlParameterSource parametrosConsultaEducacionSuperior = new MapSqlParameterSource();
        parametrosConsultaEducacionSuperior.addValue("varIdPersona", idPersona);
        Map resultadoEducacionSuperiores = obtenerEducacionesSuperiores.execute(parametrosConsultaEducacionSuperior);
        ArrayList<EducacionSuperior> educacionesSuperioresActuales = (ArrayList<EducacionSuperior>) resultadoEducacionSuperiores.get("educacionesSuperiores");

        for (EducacionSuperior educacionSuperior : educacionesSuperioresActuales) {
            educacionSuperior.setFechaTituloFormateada(Util.obtenerFechaFormateada(educacionSuperior.getFechaTitulo()));
        }

        return educacionesSuperioresActuales;
    }

    @Override
    public void eliminarEducacionSuperior(int idEducacionSuperior) {
        MapSqlParameterSource parametrosEliminacionEducacionSuperior = new MapSqlParameterSource();
        parametrosEliminacionEducacionSuperior.addValue("varId", idEducacionSuperior);
        eliminarEducacionSuperior.execute(parametrosEliminacionEducacionSuperior);
    }

    @Override
    public void guardarCorreoElectronico(long idPersona, CorreoElectronico correoElectronico) {
        if (correoElectronico.getId() == 0) {
            MapSqlParameterSource parametrosIngresoCorreoElectronico = new MapSqlParameterSource();
            parametrosIngresoCorreoElectronico.addValue("varIdPersona", idPersona);
            parametrosIngresoCorreoElectronico.addValue("varCorreoElectronico", correoElectronico.getCorreoElectronico());
            ingresarCorreoElectronico.execute(parametrosIngresoCorreoElectronico);
        } else {
            MapSqlParameterSource parametrosActualizacionCorreoElectronico = new MapSqlParameterSource();
            parametrosActualizacionCorreoElectronico.addValue("varId", correoElectronico.getId());
            parametrosActualizacionCorreoElectronico.addValue("varCorreoElectronico", correoElectronico.getCorreoElectronico());
            actualizarCorreoElectronico.execute(parametrosActualizacionCorreoElectronico);

        }
    }

    @Override
    public List<CorreoElectronico> obtenerCorreosElectronicos(long idPersona) {
        MapSqlParameterSource parametrosConsultaCorreoElectronico = new MapSqlParameterSource();
        parametrosConsultaCorreoElectronico.addValue("varIdPersona", idPersona);
        Map resultadoCorreosElectronicos = obtenerCorreosElectronicos.execute(parametrosConsultaCorreoElectronico);
        ArrayList<CorreoElectronico> correosElectronicos = (ArrayList<CorreoElectronico>) resultadoCorreosElectronicos.get("correosElectronicos");

        return correosElectronicos;
    }

    @Override
    public void eliminarCorreoElectronico(int idCorreoElectronico) {
        MapSqlParameterSource parametrosEliminacionCorreoElectronico = new MapSqlParameterSource();
        parametrosEliminacionCorreoElectronico.addValue("varId", idCorreoElectronico);
        eliminarCorreoElectronico.execute(parametrosEliminacionCorreoElectronico);
    }

    @Override
    public void guardarCuentaBancaria(long idPersona, CuentaBancaria cuentaBancaria) {
        if (cuentaBancaria.getId() == 0) {
            MapSqlParameterSource parametrosIngresoCuentaBancaria = new MapSqlParameterSource();
            parametrosIngresoCuentaBancaria.addValue("varIdPersona", idPersona);
            parametrosIngresoCuentaBancaria.addValue("varNumero", cuentaBancaria.getNumero());
            parametrosIngresoCuentaBancaria.addValue("varTipo", cuentaBancaria.getTipo());
            parametrosIngresoCuentaBancaria.addValue("varEntidad", cuentaBancaria.getEntidad());
            ingresarCuentaBancaria.execute(parametrosIngresoCuentaBancaria);
        } else {
            MapSqlParameterSource parametrosActualizacionCuentaBancaria = new MapSqlParameterSource();
            parametrosActualizacionCuentaBancaria.addValue("varId", cuentaBancaria.getId());
            parametrosActualizacionCuentaBancaria.addValue("varNumero", cuentaBancaria.getNumero());
            parametrosActualizacionCuentaBancaria.addValue("varTipo", cuentaBancaria.getTipo());
            parametrosActualizacionCuentaBancaria.addValue("varEntidad", cuentaBancaria.getEntidad());
            actualizarCuentaBancaria.execute(parametrosActualizacionCuentaBancaria);
        }
    }

    @Override
    public List<CuentaBancaria> obtenerCuentasBancarias(long idPersona) {
        MapSqlParameterSource parametrosConsultaCuentaBancaria = new MapSqlParameterSource();
        parametrosConsultaCuentaBancaria.addValue("varIdPersona", idPersona);
        Map resultadoCuentasBancarias = obtenerCuentasBancarias.execute(parametrosConsultaCuentaBancaria);
        ArrayList<CuentaBancaria> cuentasBancariasActuales = (ArrayList<CuentaBancaria>) resultadoCuentasBancarias.get("cuentasBancarias");

        return cuentasBancariasActuales;
    }

    @Override
    public void eliminarCuentaBancaria(int idCuentaBancaria) {
        MapSqlParameterSource parametrosEliminacionCuentaBancaria = new MapSqlParameterSource();
        parametrosEliminacionCuentaBancaria.addValue("varId", idCuentaBancaria);
        eliminarCuentaBancaria.execute(parametrosEliminacionCuentaBancaria);
    }

    @Override
    public void guardarTelefono(long idPersona, Telefono telefono) {
        if (telefono.getId() == 0) {
            MapSqlParameterSource parametrosIngresoTelefono = new MapSqlParameterSource();
            parametrosIngresoTelefono.addValue("varIdPersona", idPersona);
            parametrosIngresoTelefono.addValue("varNumero", telefono.getNumero());
            parametrosIngresoTelefono.addValue("varTipo", telefono.getTipo());
            ingresarTelefono.execute(parametrosIngresoTelefono);
        } else {
            MapSqlParameterSource parametrosActualizacionTelefono = new MapSqlParameterSource();
            parametrosActualizacionTelefono.addValue("varId", telefono.getId());
            parametrosActualizacionTelefono.addValue("varNumero", telefono.getNumero());
            parametrosActualizacionTelefono.addValue("varTipo", telefono.getTipo());
            actualizarTelefono.execute(parametrosActualizacionTelefono);
        }
    }

    @Override
    public List<Telefono> obtenerTelefonos(long idPersona) {
        MapSqlParameterSource parametrosConsultaTelefono = new MapSqlParameterSource();
        parametrosConsultaTelefono.addValue("varIdPersona", idPersona);
        Map resultadoTelefonos = obtenerTelefonos.execute(parametrosConsultaTelefono);
        ArrayList<Telefono> telefonosActuales = (ArrayList<Telefono>) resultadoTelefonos.get("telefonos");

        return telefonosActuales;
    }

    @Override
    public void eliminarTelefono(int idTelefono) {
        MapSqlParameterSource parametrosEliminacionTelefono = new MapSqlParameterSource();
        parametrosEliminacionTelefono.addValue("varId", idTelefono);
        eliminarTelefono.execute(parametrosEliminacionTelefono);
    }

    @Override
    public void guardarEducacionContinua(long idPersona, EducacionContinua educacionContinua) {
        if (educacionContinua.getId() == 0) {
            MapSqlParameterSource parametrosIngresoEducacionContinua = new MapSqlParameterSource();
            parametrosIngresoEducacionContinua.addValue("varIdPersona", idPersona);
            parametrosIngresoEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosIngresoEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosIngresoEducacionContinua.addValue("varInstitucion", educacionContinua.getInstitucion());
            parametrosIngresoEducacionContinua.addValue("varAnyo", educacionContinua.getAnyo());
            parametrosIngresoEducacionContinua.addValue("varNumeroHoras", educacionContinua.getNumeroHoras());
            Map resultadoIngresoEducacionContinua = ingresarEducacionContinua.execute(parametrosIngresoEducacionContinua);
            int idEducacionContinua = (int) resultadoIngresoEducacionContinua.get("varId");
            Documento documento = educacionContinua.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoEducacionContinua = new MapSqlParameterSource();
                parametrosIngresoCertificadoEducacionContinua.addValue("varIdEducacionContinua", idEducacionContinua);
                parametrosIngresoCertificadoEducacionContinua.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoEducacionContinua.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoEducacionContinua.addValue("varContenido", documento.getContenido());
                ingresarCertificadoEducacionContinua.execute(parametrosIngresoCertificadoEducacionContinua);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionEducacionContinua = new MapSqlParameterSource();
            parametrosActualizacionEducacionContinua.addValue("varId", educacionContinua.getId());
            parametrosActualizacionEducacionContinua.addValue("varTipoCapacitacion", educacionContinua.getTipoCapacitacion());
            parametrosActualizacionEducacionContinua.addValue("varNucleoBasicoConocimiento", educacionContinua.getNucleoBasicoConocimiento());
            parametrosActualizacionEducacionContinua.addValue("varNombreCapacitacion", educacionContinua.getNombreCapacitacion());
            parametrosActualizacionEducacionContinua.addValue("varInstitucion", educacionContinua.getInstitucion());
            parametrosActualizacionEducacionContinua.addValue("varAnyo", educacionContinua.getAnyo());
            parametrosActualizacionEducacionContinua.addValue("varNumeroHoras", educacionContinua.getNumeroHoras());
            actualizarEducacionContinua.execute(parametrosActualizacionEducacionContinua);
            Documento documento = educacionContinua.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoEducacionContinua = new MapSqlParameterSource();
                parametrosActualizarCertificadoEducacionContinua.addValue("varIdEducacionContinua", educacionContinua.getId());
                parametrosActualizarCertificadoEducacionContinua.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoEducacionContinua.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoEducacionContinua.addValue("varContenido", documento.getContenido());
                actualizarCertificadoEducacionContinua.execute(parametrosActualizarCertificadoEducacionContinua);
            }
        }
    }

    @Override
    public List<EducacionContinua> obtenerEducacionesContinuas(long idPersona) {
        MapSqlParameterSource parametrosConsultaEducacionContinua = new MapSqlParameterSource();
        parametrosConsultaEducacionContinua.addValue("varIdPersona", idPersona);
        Map resultadoEducacionContinuas = obtenerEducacionesContinuas.execute(parametrosConsultaEducacionContinua);
        ArrayList<EducacionContinua> educacionesContinuasActuales = (ArrayList<EducacionContinua>) resultadoEducacionContinuas.get("educacionesContinuas");

        return educacionesContinuasActuales;
    }

    @Override
    public void eliminarEducacionContinua(int idEducacionContinua) {
        MapSqlParameterSource parametrosEliminacionEducacionContinua = new MapSqlParameterSource();
        parametrosEliminacionEducacionContinua.addValue("varId", idEducacionContinua);
        eliminarEducacionContinua.execute(parametrosEliminacionEducacionContinua);
    }

    @Override
    public void eliminarIdioma(int idIdioma) {
        MapSqlParameterSource parametrosEliminacionIdioma = new MapSqlParameterSource();
        parametrosEliminacionIdioma.addValue("varId", idIdioma);
        eliminarIdioma.execute(parametrosEliminacionIdioma);
    }

    @Override
    public List<Idioma> obtenerIdiomas(long idPersona) {
        MapSqlParameterSource parametrosConsultaIdioma = new MapSqlParameterSource();
        parametrosConsultaIdioma.addValue("varIdPersona", idPersona);
        Map resultadoIdiomas = obtenerIdiomas.execute(parametrosConsultaIdioma);
        ArrayList<Idioma> idiomasActuales = (ArrayList<Idioma>) resultadoIdiomas.get("idiomas");

        return idiomasActuales;
    }

    @Override
    public void guardarIdioma(long idPersona, Idioma idioma) {
        if (idioma.getId() == 0) {
            MapSqlParameterSource parametrosIngresoIdioma = new MapSqlParameterSource();
            parametrosIngresoIdioma.addValue("varIdPersona", idPersona);
            parametrosIngresoIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosIngresoIdioma.addValue("varNivelConversacion", idioma.getNivelConversacion());
            parametrosIngresoIdioma.addValue("varNivelLectura", idioma.getNivelLectura());
            parametrosIngresoIdioma.addValue("varNivelEscritura", idioma.getNivelEscritura());
            parametrosIngresoIdioma.addValue("varNivelEscucha", idioma.getNivelEscucha());
            parametrosIngresoIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosIngresoIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosIngresoIdioma.addValue("varPuntajeCertificacion", idioma.getPuntajeCertificacion());
            Map resultadoIngresoIdioma = ingresarIdioma.execute(parametrosIngresoIdioma);
            int idIdioma = (int) resultadoIngresoIdioma.get("varId");
            Documento documento = idioma.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoIdioma = new MapSqlParameterSource();
                parametrosIngresoCertificadoIdioma.addValue("varIdIdioma", idIdioma);
                parametrosIngresoCertificadoIdioma.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoIdioma.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoIdioma.addValue("varContenido", documento.getContenido());
                ingresarCertificadoIdioma.execute(parametrosIngresoCertificadoIdioma);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionIdioma = new MapSqlParameterSource();
            parametrosActualizacionIdioma.addValue("varId", idioma.getId());
            parametrosActualizacionIdioma.addValue("varIdioma", idioma.getIdioma());
            parametrosActualizacionIdioma.addValue("varNivelConversacion", idioma.getNivelConversacion());
            parametrosActualizacionIdioma.addValue("varNivelLectura", idioma.getNivelLectura());
            parametrosActualizacionIdioma.addValue("varNivelEscritura", idioma.getNivelEscritura());
            parametrosActualizacionIdioma.addValue("varNivelEscucha", idioma.getNivelEscucha());
            parametrosActualizacionIdioma.addValue("varTipoCertificacion", idioma.getTipoCertificacion());
            parametrosActualizacionIdioma.addValue("varOtraCertificacion", idioma.getOtraCertificacion());
            parametrosActualizacionIdioma.addValue("varPuntajeCertificacion", idioma.getPuntajeCertificacion());
            actualizarIdioma.execute(parametrosActualizacionIdioma);
            Documento documento = idioma.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoIdioma = new MapSqlParameterSource();
                parametrosActualizarCertificadoIdioma.addValue("varIdIdioma", idioma.getId());
                parametrosActualizarCertificadoIdioma.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoIdioma.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoIdioma.addValue("varContenido", documento.getContenido());
                actualizarCertificadoIdioma.execute(parametrosActualizarCertificadoIdioma);
            }
        }
    }

    @Override
    public void eliminarDistincion(int idDistincion) {
        MapSqlParameterSource parametrosEliminacionDistincion = new MapSqlParameterSource();
        parametrosEliminacionDistincion.addValue("varId", idDistincion);
        eliminarDistincion.execute(parametrosEliminacionDistincion);
    }

    @Override
    public List<Distincion> obtenerDistinciones(long idPersona) {
        MapSqlParameterSource parametrosConsultaDistincion = new MapSqlParameterSource();
        parametrosConsultaDistincion.addValue("varIdPersona", idPersona);
        Map resultadoDistincions = obtenerDistinciones.execute(parametrosConsultaDistincion);
        ArrayList<Distincion> distincionesActuales = (ArrayList<Distincion>) resultadoDistincions.get("distinciones");

        for (Distincion distincion : distincionesActuales) {
            distincion.setFechaDistincionFormateada(Util.obtenerFechaFormateada(distincion.getFechaDistincion()));
        }

        return distincionesActuales;
    }

    @Override
    public void guardarDistincion(long idPersona, Distincion distincion) {
        if (distincion.getId() == 0) {
            MapSqlParameterSource parametrosIngresoDistincion = new MapSqlParameterSource();
            parametrosIngresoDistincion.addValue("varIdPersona", idPersona);
            parametrosIngresoDistincion.addValue("varDescripcion", distincion.getDescripcion());
            parametrosIngresoDistincion.addValue("varFechaDistincion", distincion.getFechaDistincion());
            parametrosIngresoDistincion.addValue("varInstitucionOtorga", distincion.getInstitucionOtorga());
            Map resultadoIngresoDistincion = ingresarDistincion.execute(parametrosIngresoDistincion);
            int idDistincion = (int) resultadoIngresoDistincion.get("varId");
            Documento documento = distincion.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoDistincion = new MapSqlParameterSource();
                parametrosIngresoCertificadoDistincion.addValue("varIdDistincion", idDistincion);
                parametrosIngresoCertificadoDistincion.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoDistincion.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoDistincion.addValue("varContenido", documento.getContenido());
                ingresarCertificadoDistincion.execute(parametrosIngresoCertificadoDistincion);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionDistincion = new MapSqlParameterSource();
            parametrosActualizacionDistincion.addValue("varId", distincion.getId());
            parametrosActualizacionDistincion.addValue("varDescripcion", distincion.getDescripcion());
            parametrosActualizacionDistincion.addValue("varFechaDistincion", distincion.getFechaDistincion());
            parametrosActualizacionDistincion.addValue("varInstitucionOtorga", distincion.getInstitucionOtorga());
            actualizarDistincion.execute(parametrosActualizacionDistincion);
            Documento documento = distincion.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoDistincion = new MapSqlParameterSource();
                parametrosActualizarCertificadoDistincion.addValue("varIdDistincion", distincion.getId());
                parametrosActualizarCertificadoDistincion.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoDistincion.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoDistincion.addValue("varContenido", documento.getContenido());
                actualizarCertificadoDistincion.execute(parametrosActualizarCertificadoDistincion);
            }
        }
    }

    @Override
    public List<ExperienciaLaboral> obtenerExperienciasLaborales(long idPersona) {
        MapSqlParameterSource parametrosConsultaExperienciaLaboral = new MapSqlParameterSource();
        parametrosConsultaExperienciaLaboral.addValue("varIdPersona", idPersona);
        Map resultadoExperienciaLaborals = obtenerExperienciasLaborales.execute(parametrosConsultaExperienciaLaboral);
        ArrayList<ExperienciaLaboral> experienciasLaboralesActuales = (ArrayList<ExperienciaLaboral>) resultadoExperienciaLaborals.get("experienciasLaborales");

        for (ExperienciaLaboral experienciaLaboral : experienciasLaboralesActuales) {
            experienciaLaboral.setFechaIngresoFormateada(Util.obtenerFechaFormateada(experienciaLaboral.getFechaIngreso()));
            if (experienciaLaboral.getFechaRetiro() != null) {
                experienciaLaboral.setFechaRetiroFormateada(Util.obtenerFechaFormateada(experienciaLaboral.getFechaRetiro()));
            }
        }

        return experienciasLaboralesActuales;
    }

    @Override
    public void eliminarExperienciaLaboral(int idExperienciaLaboral) {
        MapSqlParameterSource parametrosEliminacionExperienciaLaboral = new MapSqlParameterSource();
        parametrosEliminacionExperienciaLaboral.addValue("varId", idExperienciaLaboral);
        eliminarExperienciaLaboral.execute(parametrosEliminacionExperienciaLaboral);
    }

    @Override
    public void guardarExperienciaLaboral(long idPersona, ExperienciaLaboral experienciaLaboral) {
        if (experienciaLaboral.getId() == 0) {
            MapSqlParameterSource parametrosIngresoExperienciaLaboral = new MapSqlParameterSource();
            parametrosIngresoExperienciaLaboral.addValue("varIdPersona", idPersona);
            parametrosIngresoExperienciaLaboral.addValue("varActividadeconomica", experienciaLaboral.getActividadEconomica());
            parametrosIngresoExperienciaLaboral.addValue("varNucleoBasicoConocimiento", experienciaLaboral.getNucleoBasicoConocimiento());
            parametrosIngresoExperienciaLaboral.addValue("varCargo", experienciaLaboral.getCargo());
            parametrosIngresoExperienciaLaboral.addValue("varFechaIngreso", experienciaLaboral.getFechaIngreso());
            parametrosIngresoExperienciaLaboral.addValue("varFechaRetiro", experienciaLaboral.getFechaRetiro());
            parametrosIngresoExperienciaLaboral.addValue("varNaturalezaCargo", experienciaLaboral.getNaturalezaCargo());
            parametrosIngresoExperienciaLaboral.addValue("varNombreEmpresa", experienciaLaboral.getNombreEmpresa());
            parametrosIngresoExperienciaLaboral.addValue("varTipoContrato", experienciaLaboral.getTipoContrato());
            parametrosIngresoExperienciaLaboral.addValue("varTipoEmpresa", experienciaLaboral.getTipoEmpresa());
            parametrosIngresoExperienciaLaboral.addValue("varTipoExperiencia", experienciaLaboral.getTipoExperiencia());
            parametrosIngresoExperienciaLaboral.addValue("varFnsp", experienciaLaboral.isFnsp());
            parametrosIngresoExperienciaLaboral.addValue("varTrabajoActual", experienciaLaboral.isTrabajoActual());
            Map resultadoIngresoExperienciaLaboral = ingresarExperienciaLaboral.execute(parametrosIngresoExperienciaLaboral);
            int idExperienciaLaboral = (int) resultadoIngresoExperienciaLaboral.get("varId");
            Documento documento = experienciaLaboral.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoExperienciaLaboral = new MapSqlParameterSource();
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varIdExperienciaLaboral", idExperienciaLaboral);
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoExperienciaLaboral.addValue("varContenido", documento.getContenido());
                ingresarCertificadoExperienciaLaboral.execute(parametrosIngresoCertificadoExperienciaLaboral);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionExperienciaLaboral = new MapSqlParameterSource();
            parametrosActualizacionExperienciaLaboral.addValue("varId", experienciaLaboral.getId());
            parametrosActualizacionExperienciaLaboral.addValue("varActividadeconomica", experienciaLaboral.getActividadEconomica());
            parametrosActualizacionExperienciaLaboral.addValue("varNucleoBasicoConocimiento", experienciaLaboral.getNucleoBasicoConocimiento());
            parametrosActualizacionExperienciaLaboral.addValue("varCargo", experienciaLaboral.getCargo());
            parametrosActualizacionExperienciaLaboral.addValue("varFechaIngreso", experienciaLaboral.getFechaIngreso());
            parametrosActualizacionExperienciaLaboral.addValue("varFechaRetiro", experienciaLaboral.getFechaRetiro());
            parametrosActualizacionExperienciaLaboral.addValue("varNaturalezaCargo", experienciaLaboral.getNaturalezaCargo());
            parametrosActualizacionExperienciaLaboral.addValue("varNombreEmpresa", experienciaLaboral.getNombreEmpresa());
            parametrosActualizacionExperienciaLaboral.addValue("varTipoContrato", experienciaLaboral.getTipoContrato());
            parametrosActualizacionExperienciaLaboral.addValue("varTipoEmpresa", experienciaLaboral.getTipoEmpresa());
            parametrosActualizacionExperienciaLaboral.addValue("varTipoExperiencia", experienciaLaboral.getTipoExperiencia());
            parametrosActualizacionExperienciaLaboral.addValue("varFnsp", experienciaLaboral.isFnsp());
            parametrosActualizacionExperienciaLaboral.addValue("varTrabajoActual", experienciaLaboral.isTrabajoActual());
            actualizarExperienciaLaboral.execute(parametrosActualizacionExperienciaLaboral);
            Documento documento = experienciaLaboral.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoExperienciaLaboral = new MapSqlParameterSource();
                parametrosActualizarCertificadoExperienciaLaboral.addValue("varIdExperienciaLaboral", experienciaLaboral.getId());
                parametrosActualizarCertificadoExperienciaLaboral.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoExperienciaLaboral.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoExperienciaLaboral.addValue("varContenido", documento.getContenido());
                actualizarCertificadoExperienciaLaboral.execute(parametrosActualizarCertificadoExperienciaLaboral);
            }
        }
    }

    @Override
    public int guardarExperienciaDocencia(long idPersona, ExperienciaDocencia experienciaDocencia) {
        int idExperienciaDocencia = experienciaDocencia.getId();
        if (experienciaDocencia.getId() == 0) {
            MapSqlParameterSource parametrosIngresoExperienciaDocencia = new MapSqlParameterSource();
            parametrosIngresoExperienciaDocencia.addValue("varIdPersona", idPersona);
            parametrosIngresoExperienciaDocencia.addValue("varTrabajoActual", experienciaDocencia.isTrabajoActual());
            parametrosIngresoExperienciaDocencia.addValue("varFnsp", experienciaDocencia.isFnsp());
            parametrosIngresoExperienciaDocencia.addValue("varInstitucion", experienciaDocencia.getInstitucion());
            Map resultadoIngresoExperienciaDocencia = ingresarExperienciaDocencia.execute(parametrosIngresoExperienciaDocencia);
            idExperienciaDocencia = (int) resultadoIngresoExperienciaDocencia.get("varId");
        } else {
            MapSqlParameterSource parametrosActualizacionExperienciaDocencia = new MapSqlParameterSource();
            parametrosActualizacionExperienciaDocencia.addValue("varId", experienciaDocencia.getId());
            parametrosActualizacionExperienciaDocencia.addValue("varTrabajoActual", experienciaDocencia.isTrabajoActual());
            parametrosActualizacionExperienciaDocencia.addValue("varFnsp", experienciaDocencia.isFnsp());
            parametrosActualizacionExperienciaDocencia.addValue("varInstitucion", experienciaDocencia.getInstitucion());
            actualizarExperienciaDocencia.execute(parametrosActualizacionExperienciaDocencia);
        }

        return idExperienciaDocencia;
    }

    @Override
    public List<ExperienciaDocencia> obtenerExperienciasDocencia(long idPersona) {
        MapSqlParameterSource parametrosConsultaExperienciaDocencia = new MapSqlParameterSource();
        parametrosConsultaExperienciaDocencia.addValue("varIdPersona", idPersona);
        Map resultadoExperienciasDocencia = obtenerExperienciasDocencia.execute(parametrosConsultaExperienciaDocencia);
        ArrayList<ExperienciaDocencia> experienciasDocenciaActuales = (ArrayList<ExperienciaDocencia>) resultadoExperienciasDocencia.get("experienciasDocencia");
        for (ExperienciaDocencia experienciaDocencia : experienciasDocenciaActuales) {
            MapSqlParameterSource parametrosConsultaCursosExperienciaDocencia = new MapSqlParameterSource();
            parametrosConsultaCursosExperienciaDocencia.addValue("varIdExperienciaDocencia", experienciaDocencia.getId());
            Map resultadoCursosExperienciaDocencia = obtenerCursosExperienciaDocencia.execute(parametrosConsultaCursosExperienciaDocencia);
            List<CursoExperienciaDocencia> cursoExperienciaDocencia = (List<CursoExperienciaDocencia>) resultadoCursosExperienciaDocencia.get("cursosExperienciaDocencia");
            experienciaDocencia.setCursosExperienciaDocencia(cursoExperienciaDocencia);
        }

        return experienciasDocenciaActuales;
    }

    @Override
    public void eliminarExperienciaDocencia(int idExperienciaDocencia) {
        MapSqlParameterSource parametrosEliminacionExperienciaDocencia = new MapSqlParameterSource();
        parametrosEliminacionExperienciaDocencia.addValue("varId", idExperienciaDocencia);
        eliminarExperienciaDocencia.execute(parametrosEliminacionExperienciaDocencia);
    }

    @Override
    public void guardarCursoExperienciaDocencia(long idPersona, CursoExperienciaDocencia cursoExperienciaDocencia) {
        if (cursoExperienciaDocencia.getId() == 0) {
            MapSqlParameterSource parametrosIngresoCursoExperienciaDocencia = new MapSqlParameterSource();
            parametrosIngresoCursoExperienciaDocencia.addValue("varIdExperienciaDocencia", cursoExperienciaDocencia.getIdExperienciaDocencia());
            parametrosIngresoCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocencia.getAnyo());
            parametrosIngresoCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocencia.getNucleoBasicoConocimiento());
            parametrosIngresoCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocencia.getModalidad());
            parametrosIngresoCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocencia.getNivelEstudio());
            parametrosIngresoCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocencia.getNumeroHoras());
            parametrosIngresoCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocencia.getNombreCurso());
            Map resultadoIngresoCursoExperienciaDocencia = ingresarCursoExperienciaDocencia.execute(parametrosIngresoCursoExperienciaDocencia);
            int idCursoExperienciaDocencia = (int) resultadoIngresoCursoExperienciaDocencia.get("varId");
            Documento documento = cursoExperienciaDocencia.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", idCursoExperienciaDocencia);
                parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                ingresarCertificadoCursoExperienciaDocencia.execute(parametrosIngresoCertificadoCursoExperienciaDocencia);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionCursoExperienciaDocencia = new MapSqlParameterSource();
            parametrosActualizacionCursoExperienciaDocencia.addValue("varId", cursoExperienciaDocencia.getId());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varAnyo", cursoExperienciaDocencia.getAnyo());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varNucleoBasicoConocimiento", cursoExperienciaDocencia.getNucleoBasicoConocimiento());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varModalidad", cursoExperienciaDocencia.getModalidad());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varNivelEstudio", cursoExperienciaDocencia.getNivelEstudio());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varNumeroHoras", cursoExperienciaDocencia.getNumeroHoras());
            parametrosActualizacionCursoExperienciaDocencia.addValue("varNombreCurso", cursoExperienciaDocencia.getNombreCurso());
            actualizarCursoExperienciaDocencia.execute(parametrosActualizacionCursoExperienciaDocencia);
            Documento documento = cursoExperienciaDocencia.getCertificado();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarCertificadoCursoExperienciaDocencia = new MapSqlParameterSource();
                parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varIdCursoExperienciaDocencia", cursoExperienciaDocencia.getId());
                parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varNombre", documento.getNombre());
                parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarCertificadoCursoExperienciaDocencia.addValue("varContenido", documento.getContenido());
                actualizarCertificadoCursoExperienciaDocencia.execute(parametrosActualizarCertificadoCursoExperienciaDocencia);
            }
        }
    }

    @Override
    public void eliminarCursoExperienciaDocencia(int idCursoExperienciaDocencia) {
        MapSqlParameterSource parametrosEliminacionCursoExperienciaDocencia = new MapSqlParameterSource();
        parametrosEliminacionCursoExperienciaDocencia.addValue("varId", idCursoExperienciaDocencia);
        eliminarCursoExperienciaDocencia.execute(parametrosEliminacionCursoExperienciaDocencia);
    }

    @Override
    public void guardarArticulo(long idPersona, Articulo articulo) {
        if (articulo.getId() == 0) {
            MapSqlParameterSource parametrosIngresoArticulo = new MapSqlParameterSource();
            parametrosIngresoArticulo.addValue("varIdPersona", idPersona);
            parametrosIngresoArticulo.addValue("varAnyo", articulo.getAnyo());
            parametrosIngresoArticulo.addValue("varNombreRevista", articulo.getNombreRevista());
            parametrosIngresoArticulo.addValue("varNombre", articulo.getNombre());
            parametrosIngresoArticulo.addValue("varTipoAutor", articulo.getTipoAutor());
            parametrosIngresoArticulo.addValue("varUrl", articulo.getUrl());
            parametrosIngresoArticulo.addValue("varNucleoBasicoConocimiento", articulo.getNucleoBasicoConocimiento());
            ingresarArticulo.execute(parametrosIngresoArticulo);
        } else {
            MapSqlParameterSource parametrosActualizacionArticulo = new MapSqlParameterSource();
            parametrosActualizacionArticulo.addValue("varId", articulo.getId());
            parametrosActualizacionArticulo.addValue("varAnyo", articulo.getAnyo());
            parametrosActualizacionArticulo.addValue("varNombreRevista", articulo.getNombreRevista());
            parametrosActualizacionArticulo.addValue("varNombre", articulo.getNombre());
            parametrosActualizacionArticulo.addValue("varTipoAutor", articulo.getTipoAutor());
            parametrosActualizacionArticulo.addValue("varUrl", articulo.getUrl());
            parametrosActualizacionArticulo.addValue("varNucleoBasicoConocimiento", articulo.getNucleoBasicoConocimiento());
            actualizarArticulo.execute(parametrosActualizacionArticulo);
        }
    }

    @Override
    public List<Articulo> obtenerArticulos(long idPersona) {
        MapSqlParameterSource parametrosConsultaArticulo = new MapSqlParameterSource();
        parametrosConsultaArticulo.addValue("varIdPersona", idPersona);
        Map resultadoArticulos = obtenerArticulos.execute(parametrosConsultaArticulo);
        ArrayList<Articulo> articulosActuales = (ArrayList<Articulo>) resultadoArticulos.get("articulos");

        return articulosActuales;
    }

    @Override
    public void eliminarArticulo(int idArticulo) {
        MapSqlParameterSource parametrosEliminacionArticulo = new MapSqlParameterSource();
        parametrosEliminacionArticulo.addValue("varId", idArticulo);
        eliminarArticulo.execute(parametrosEliminacionArticulo);
    }

    @Override
    public void guardarPatente(long idPersona, Patente patente) {
        if (patente.getId() == 0) {
            MapSqlParameterSource parametrosIngresoPatente = new MapSqlParameterSource();
            parametrosIngresoPatente.addValue("varIdPersona", idPersona);
            parametrosIngresoPatente.addValue("varDescripcion", patente.getDescripcion());
            parametrosIngresoPatente.addValue("varClase", patente.getClase());
            parametrosIngresoPatente.addValue("varFecha", patente.getFecha());
            parametrosIngresoPatente.addValue("vartipopatente", patente.getTipo());
            parametrosIngresoPatente.addValue("varpropiedadcompartida", patente.isPropiedadCompartida());
            Map resultadoIngresoPatente = ingresarPatente.execute(parametrosIngresoPatente);
            int idPatente = (int) resultadoIngresoPatente.get("varId");
            Documento documento = patente.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoPatente = new MapSqlParameterSource();
                parametrosIngresoDocumentoPatente.addValue("varIdPatente", idPatente);
                parametrosIngresoDocumentoPatente.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoPatente.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoPatente.addValue("varContenido", documento.getContenido());
                ingresarDocumentoPatente.execute(parametrosIngresoDocumentoPatente);
            }
        } else {
            MapSqlParameterSource parametrosActualizacionPatente = new MapSqlParameterSource();
            parametrosActualizacionPatente.addValue("varId", patente.getId());
            parametrosActualizacionPatente.addValue("varDescripcion", patente.getDescripcion());
            parametrosActualizacionPatente.addValue("varClase", patente.getClase());
            parametrosActualizacionPatente.addValue("varFecha", patente.getFecha());
            parametrosActualizacionPatente.addValue("vartipopatente", patente.getTipo());
            parametrosActualizacionPatente.addValue("varpropiedadcompartida", patente.isPropiedadCompartida());
            actualizarPatente.execute(parametrosActualizacionPatente);
            Documento documento = patente.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarDocumentoPatente = new MapSqlParameterSource();
                parametrosActualizarDocumentoPatente.addValue("varIdPatente", patente.getId());
                parametrosActualizarDocumentoPatente.addValue("varNombre", documento.getNombre());
                parametrosActualizarDocumentoPatente.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarDocumentoPatente.addValue("varContenido", documento.getContenido());
                actualizarDocumentoPatente.execute(parametrosActualizarDocumentoPatente);
            }
        }
    }

    @Override
    public List<Patente> obtenerPatentes(long idPersona) {
        MapSqlParameterSource parametrosConsultaPatente = new MapSqlParameterSource();
        parametrosConsultaPatente.addValue("varIdPersona", idPersona);
        Map resultadoPatentes = obtenerPatentes.execute(parametrosConsultaPatente);
        ArrayList<Patente> patentesActuales = (ArrayList<Patente>) resultadoPatentes.get("patentes");

        for (Patente patente : patentesActuales) {
            patente.setFechaFormateada(Util.obtenerFechaFormateada(patente.getFecha()));
        }

        return patentesActuales;
    }

    @Override
    public void eliminarPatente(int idPatente) {
        MapSqlParameterSource parametrosEliminacionPatente = new MapSqlParameterSource();
        parametrosEliminacionPatente.addValue("varId", idPatente);
        eliminarPatente.execute(parametrosEliminacionPatente);
    }

    @Override
    public List<ProductoConocimiento> obtenerProductoConocimientos(long idPersona) {
        MapSqlParameterSource parametrosConsultaProductoConocimiento = new MapSqlParameterSource();
        parametrosConsultaProductoConocimiento.addValue("varIdPersona", idPersona);
        Map resultadoProductosConocimiento = obtenerProductosConocimiento.execute(parametrosConsultaProductoConocimiento);
        ArrayList<ProductoConocimiento> productosConocimientoActuales = (ArrayList<ProductoConocimiento>) resultadoProductosConocimiento.get("productosConocimiento");

        return productosConocimientoActuales;
    }

    @Override
    public void guardarProductoConocimiento(long idPersona, ProductoConocimiento productoConocimiento) {
        if (productoConocimiento.getId() == 0) {
            MapSqlParameterSource parametrosIngresoProductoConocimiento = new MapSqlParameterSource();
            parametrosIngresoProductoConocimiento.addValue("varIdPersona", idPersona);
            parametrosIngresoProductoConocimiento.addValue("varDescripcion", productoConocimiento.getDescripcion());
            parametrosIngresoProductoConocimiento.addValue("varNucleoBasicoConocimiento", productoConocimiento.getNucleoBasicoConocimiento());
            parametrosIngresoProductoConocimiento.addValue("varUrl", productoConocimiento.getUrl());
            parametrosIngresoProductoConocimiento.addValue("varTipo", productoConocimiento.getTipo());
            Map resultadoIngresoProductoConocimiento = ingresarProductoConocimiento.execute(parametrosIngresoProductoConocimiento);
            int idProductoConocimiento = (int) resultadoIngresoProductoConocimiento.get("varId");
            Documento documento = productoConocimiento.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosIngresoDocumentoProductoConocimiento = new MapSqlParameterSource();
                parametrosIngresoDocumentoProductoConocimiento.addValue("varIdProductoConocimiento", idProductoConocimiento);
                parametrosIngresoDocumentoProductoConocimiento.addValue("varNombre", documento.getNombre());
                parametrosIngresoDocumentoProductoConocimiento.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosIngresoDocumentoProductoConocimiento.addValue("varContenido", documento.getContenido());
                ingresarDocumentoProductoConocimiento.execute(parametrosIngresoDocumentoProductoConocimiento);
            }
        } else {

            MapSqlParameterSource parametrosActualizacionProductoConocimiento = new MapSqlParameterSource();
            parametrosActualizacionProductoConocimiento.addValue("varId", productoConocimiento.getId());
            parametrosActualizacionProductoConocimiento.addValue("varDescripcion", productoConocimiento.getDescripcion());
            parametrosActualizacionProductoConocimiento.addValue("varNucleoBasicoConocimiento", productoConocimiento.getNucleoBasicoConocimiento());
            parametrosActualizacionProductoConocimiento.addValue("varUrl", productoConocimiento.getUrl());
            parametrosActualizacionProductoConocimiento.addValue("varTipo", productoConocimiento.getTipo());
            actualizarProductoConocimiento.execute(parametrosActualizacionProductoConocimiento);
            Documento documento = productoConocimiento.getDocumento();
            if (documento != null) {
                MapSqlParameterSource parametrosActualizarDocumentoProductoConocimiento = new MapSqlParameterSource();
                parametrosActualizarDocumentoProductoConocimiento.addValue("varIdProductoConocimiento", productoConocimiento.getId());
                parametrosActualizarDocumentoProductoConocimiento.addValue("varNombre", documento.getNombre());
                parametrosActualizarDocumentoProductoConocimiento.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizarDocumentoProductoConocimiento.addValue("varContenido", documento.getContenido());
                actualizarDocumentoProductoConocimiento.execute(parametrosActualizarDocumentoProductoConocimiento);
            }
        }
    }

    @Override
    public void eliminarProductoConocimiento(int idProductoConocimiento) {
        MapSqlParameterSource parametrosEliminacionProductoConocimiento = new MapSqlParameterSource();
        parametrosEliminacionProductoConocimiento.addValue("varId", idProductoConocimiento);
        eliminarProductoConocimiento.execute(parametrosEliminacionProductoConocimiento);
    }
}
