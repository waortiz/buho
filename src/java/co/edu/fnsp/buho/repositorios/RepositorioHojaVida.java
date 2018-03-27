/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.entidades.Idioma;
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
    }

    @Override
    public void ingresarHojaVida(long idUsuario, HojaVida hojaVida) {
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
        if (hojaVida.getActividadEconomica().length() > 0) {
            parametros.addValue("varActividadEconomica", hojaVida.getActividadEconomica());
        } else {
            parametros.addValue("varActividadEconomica", null);
        }
        parametros.addValue("varDisponibilidadViajar", hojaVida.isDisponibilidadViajar());
        if (hojaVida.getTipoVinculacion().length() > 0) {
            parametros.addValue("varTipoVinculacion", hojaVida.getTipoVinculacion());
        } else {
            parametros.addValue("varTipoVinculacion", null);
        }
        Map resultado = ingresarPersona.execute(parametros);
        long idPersona = (long) resultado.get("varIdPersona");

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

        MapSqlParameterSource parametrosIngresoEducacionSuperior = new MapSqlParameterSource();
        parametrosIngresoEducacionSuperior.addValue("varIdPersona", idPersona);
        for (EducacionSuperior educacionSuperior : hojaVida.getEducacionesSuperiores()) {
            if (educacionSuperior.getId() == 0) {
                parametrosIngresoEducacionSuperior.addValue("varNivel", educacionSuperior.getNivel());
                parametrosIngresoEducacionSuperior.addValue("varTituloExterior", educacionSuperior.isTituloExterior());
                parametrosIngresoEducacionSuperior.addValue("varPrograma", educacionSuperior.getPrograma());
                if (educacionSuperior.getPaisTituloExterior() != null) {
                    parametrosIngresoEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperior.getPaisTituloExterior());
                }
                parametrosIngresoEducacionSuperior.addValue("varFechaTitulo", educacionSuperior.getFechaTitulo());
                parametrosIngresoEducacionSuperior.addValue("varAreaSaber", educacionSuperior.getAreaSaber());
                parametrosIngresoEducacionSuperior.addValue("varInstitucion", educacionSuperior.getInstitucion());
                parametrosIngresoEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
                parametrosIngresoEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
                parametrosIngresoEducacionSuperior.addValue("varTitulo", educacionSuperior.getTitulo());
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

    @Override
    public void actualizarHojaVida(long idUsuario, HojaVida hojaVida) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", hojaVida.getIdPersona());
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

        actualizarTelefonos(hojaVida.getIdPersona(), hojaVida.getTelefonos());
        actualizarCuentasBancarias(hojaVida.getIdPersona(), hojaVida.getCuentasBancarias());
        actualizarCorreosElectronicos(hojaVida.getIdPersona(), hojaVida.getCorreosElectronicos());
        actualizarDocumentosSoporte(hojaVida.getIdPersona(), hojaVida.getDocumentosSoporte());
        actualizarIdioma(hojaVida.getIdPersona(), hojaVida.getIdiomas());
        actualizarEducacionBasica(hojaVida.getIdPersona(), hojaVida.getEducacionesBasicas());
        actualizarEducacionSuperior(hojaVida.getIdPersona(), hojaVida.getEducacionesSuperiores());

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
        hojaVida.setFechaExpedicion((Date) resultado.get("varFechaExpedicion"));
        hojaVida.setLibretaMilitar((String) resultado.get("varLibretaMilitar"));
        hojaVida.setDistritoClase((String) resultado.get("varDistritoClase"));
        hojaVida.setNombres((String) resultado.get("varNombres"));
        hojaVida.setApellidos((String) resultado.get("varApellidos"));
        hojaVida.setFechaNacimiento((Date) resultado.get("varFechaNacimiento"));
        hojaVida.setLugarNacimiento((String) resultado.get("varLugarNacimiento"));
        hojaVida.setNombreLugarNacimiento((String) resultado.get("varNombreLugarNacimiento"));
        hojaVida.setNacionalidad(((Integer) resultado.get("varNacionalidad")).toString());
        hojaVida.setNombreNacionalidad((String) resultado.get("varNombreNacionalidad"));
        hojaVida.setSexo(((Integer) resultado.get("varSexo")).toString());
        hojaVida.setNombreSexo(((String) resultado.get("varNombreSexo")));
        hojaVida.setCiudadResidencia((String) resultado.get("varCiudadResidencia"));
        hojaVida.setNombreCiudadResidencia((String) resultado.get("varNombreCiudadResidencia"));
        hojaVida.setDireccion((String) resultado.get("varDireccion"));
        hojaVida.setPerfil((String) resultado.get("varPerfil"));
        if (resultado.get("varEgresadoUdea") != null) {
            hojaVida.setEgresadoUDEA((Boolean) resultado.get("varEgresadoUdea"));
        }
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

        hojaVida.setTelefonos(telefonos);
        hojaVida.setCorreosElectronicos(correosElectronicos);
        hojaVida.setCuentasBancarias(cuentasBancarias);
        hojaVida.setDocumentosSoporte(documentosSoporte);
        hojaVida.setIdiomas(idiomas);
        hojaVida.setEducacionesBasicas(educacionesBasicas);
        hojaVida.setEducacionesSuperiores(educacionesSuperiores);

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

    private void actualizarIdioma(long idPersona, List<Idioma> idiomas) {
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

    private void actualizarEducacionBasica(long idPersona, List<EducacionBasica> educacionesBasicas) {
        MapSqlParameterSource parametrosConsultaEducacionBasica = new MapSqlParameterSource();
        parametrosConsultaEducacionBasica.addValue("varIdPersona", idPersona);
        Map resultadoEducacionBasicas = obtenerEducacionesBasicas.execute(parametrosConsultaEducacionBasica);
        ArrayList<EducacionBasica> educacionesBasicasActuales = (ArrayList<EducacionBasica>) resultadoEducacionBasicas.get("educacionesBasicas");

        MapSqlParameterSource parametrosEliminacionEducacionBasica = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionBasica = new MapSqlParameterSource();
        for (EducacionBasica educacionBasicaActual : educacionesBasicasActuales) {
            EducacionBasica educacionBasicaModificado = null;
            for (EducacionBasica educacionBasica : educacionesBasicas) {
                if (educacionBasica.getId() == educacionBasicaActual.getId()) {
                    educacionBasicaModificado = educacionBasica;
                    break;
                }
            }
            if (educacionBasicaModificado == null) {
                parametrosEliminacionEducacionBasica.addValue("varId", educacionBasicaActual.getId());
                eliminarEducacionBasica.execute(parametrosEliminacionEducacionBasica);
            } else {
                parametrosActualizacionEducacionBasica.addValue("varId", educacionBasicaModificado.getId());
                parametrosActualizacionEducacionBasica.addValue("varNivel", educacionBasicaModificado.getNivel());
                parametrosActualizacionEducacionBasica.addValue("varInstitucion", educacionBasicaModificado.getInstitucion());
                parametrosActualizacionEducacionBasica.addValue("varAnyoFinalizacion", educacionBasicaModificado.getAnyoFinalizacion());
                parametrosActualizacionEducacionBasica.addValue("varAnyoInicio", educacionBasicaModificado.getAnyoInicio());
                parametrosActualizacionEducacionBasica.addValue("varTitulo", educacionBasicaModificado.getTitulo());
                parametrosActualizacionEducacionBasica.addValue("varGraduado", educacionBasicaModificado.isGraduado());
                actualizarEducacionBasica.execute(parametrosActualizacionEducacionBasica);
                Documento documento = educacionBasicaModificado.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoEducacionBasica = new MapSqlParameterSource();
                    parametrosActualizarCertificadoEducacionBasica.addValue("varIdEducacionBasica", educacionBasicaModificado.getId());
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

    private void actualizarEducacionSuperior(long idPersona, List<EducacionSuperior> educacionesSuperiores) {
        MapSqlParameterSource parametrosConsultaEducacionSuperior = new MapSqlParameterSource();
        parametrosConsultaEducacionSuperior.addValue("varIdPersona", idPersona);
        Map resultadoEducacionSuperiores = obtenerEducacionesSuperiores.execute(parametrosConsultaEducacionSuperior);
        ArrayList<EducacionSuperior> educacionesSuperioresActuales = (ArrayList<EducacionSuperior>) resultadoEducacionSuperiores.get("educacionesSuperiores");

        MapSqlParameterSource parametrosEliminacionEducacionSuperior = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEducacionSuperior = new MapSqlParameterSource();
        for (EducacionSuperior educacionSuperiorActual : educacionesSuperioresActuales) {
            EducacionSuperior educacionSuperiorModificado = null;
            for (EducacionSuperior educacionSuperior : educacionesSuperiores) {
                if (educacionSuperior.getId() == educacionSuperiorActual.getId()) {
                    educacionSuperiorModificado = educacionSuperior;
                    break;
                }
            }
            if (educacionSuperiorModificado == null) {
                parametrosEliminacionEducacionSuperior.addValue("varId", educacionSuperiorActual.getId());
                eliminarEducacionSuperior.execute(parametrosEliminacionEducacionSuperior);
            } else {
                parametrosActualizacionEducacionSuperior.addValue("varId", educacionSuperiorModificado.getId());
                parametrosActualizacionEducacionSuperior.addValue("varNivel", educacionSuperiorModificado.getNivel());
                parametrosActualizacionEducacionSuperior.addValue("varTituloExterior", educacionSuperiorModificado.isTituloExterior());
                parametrosActualizacionEducacionSuperior.addValue("varPaisTituloExterior", educacionSuperiorModificado.getPaisTituloExterior());
                parametrosActualizacionEducacionSuperior.addValue("varPrograma", educacionSuperiorModificado.getPrograma());
                parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperiorModificado.getFechaTitulo());
                parametrosActualizacionEducacionSuperior.addValue("varAreaSaber", educacionSuperiorModificado.getAreaSaber());
                parametrosActualizacionEducacionSuperior.addValue("varInstitucion", educacionSuperiorModificado.getInstitucion());
                parametrosActualizacionEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperiorModificado.getAnyoFinalizacion());
                parametrosActualizacionEducacionSuperior.addValue("varAnyoInicio", educacionSuperiorModificado.getAnyoInicio());
                parametrosActualizacionEducacionSuperior.addValue("varTitulo", educacionSuperiorModificado.getTitulo());
                parametrosActualizacionEducacionSuperior.addValue("varFechaTitulo", educacionSuperiorModificado.getFechaTitulo());
                parametrosActualizacionEducacionSuperior.addValue("varGraduado", educacionSuperiorModificado.isGraduado());
                actualizarEducacionSuperior.execute(parametrosActualizacionEducacionSuperior);
                Documento documento = educacionSuperiorModificado.getCertificado();
                if (documento != null) {
                    MapSqlParameterSource parametrosActualizarCertificadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificado.getId());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varNombre", documento.getNombre());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varTipoContenido", documento.getTipoContenido());
                    parametrosActualizarCertificadoEducacionSuperior.addValue("varContenido", documento.getContenido());
                    actualizarCertificadoEducacionSuperior.execute(parametrosActualizarCertificadoEducacionSuperior);
                }
                if (educacionSuperiorModificado.isTituloExterior()) {
                    Documento documentoHomologado = educacionSuperiorModificado.getCertificadoHomologado();
                    if (documentoHomologado != null) {
                        MapSqlParameterSource parametrosActualizarCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificado.getId());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varNombre", documentoHomologado.getNombre());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varTipoContenido", documentoHomologado.getTipoContenido());
                        parametrosActualizarCertificadoHomologadoEducacionSuperior.addValue("varContenido", documentoHomologado.getContenido());
                        actualizarCertificadoHomologadoEducacionSuperior.execute(parametrosActualizarCertificadoHomologadoEducacionSuperior);
                    }
                } else {
                    MapSqlParameterSource parametrosEliminacionCertificadoHomologadoEducacionSuperior = new MapSqlParameterSource();
                    parametrosEliminacionCertificadoHomologadoEducacionSuperior.addValue("varIdEducacionSuperior", educacionSuperiorModificado.getId());
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
                parametrosIngresoEducacionSuperior.addValue("varAreaSaber", educacionSuperior.getAreaSaber());
                parametrosIngresoEducacionSuperior.addValue("varInstitucion", educacionSuperior.getInstitucion());
                parametrosIngresoEducacionSuperior.addValue("varAnyoFinalizacion", educacionSuperior.getAnyoFinalizacion());
                parametrosIngresoEducacionSuperior.addValue("varAnyoInicio", educacionSuperior.getAnyoInicio());
                parametrosIngresoEducacionSuperior.addValue("varTitulo", educacionSuperior.getTitulo());
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
}
