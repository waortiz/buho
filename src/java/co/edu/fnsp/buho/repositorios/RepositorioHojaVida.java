/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Convocatoria;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.utilidades.Util;
import java.util.ArrayList;
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
    private SimpleJdbcCall ingresarDocumentoSoporte;
    private SimpleJdbcCall obtenerDocumentoSoporte;
    private SimpleJdbcCall actualizarDocumentoSoporte;

    private SimpleJdbcCall obtenerHojasVida;
    private SimpleJdbcCall eliminarHojaVida;
    
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

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarPersona");
        this.actualizarPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarPersona");
        this.ingresarDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoSoporte");
        this.obtenerDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoSoporte");
        this.actualizarDocumentoSoporte = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoSoporte");

        this.obtenerHojasVida = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerHojasVida").returningResultSet("hojasVida", BeanPropertyRowMapper.newInstance(HojaVida.class));
        this.eliminarHojaVida = new SimpleJdbcCall(jdbcTemplate).withProcedureName("eliminarHojaVida");

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

    }

    @Override
    public void actualizarHojaVida(long idUsuario, HojaVida hojaVida) {
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
        parametros.addValue("varEgresadoUdea", hojaVida.isEgresadoUDEA());
        parametros.addValue("varGrupoEtnico", hojaVida.getGrupoEtnico());
        parametros.addValue("varDiscapacidad", hojaVida.getDiscapacidad());
        parametros.addValue("varDisponeRut", hojaVida.isDisponeRUT());
        parametros.addValue("varActividadEconomica", hojaVida.getActividadEconomica());
        parametros.addValue("varDisponibilidadViajar", hojaVida.isDisponibilidadViajar());
        parametros.addValue("varTipoVinculacion", hojaVida.getTipoVinculacion());

        actualizarPersona.execute(parametros);

        actualizarTelefonos(hojaVida.getIdPersona(), hojaVida.getTelefonos());
        actualizarCuentasBancarias(hojaVida.getIdPersona(), hojaVida.getCuentasBancarias());
        actualizarCorreosElectronicos(hojaVida.getIdPersona(), hojaVida.getCorreosElectronicos());

        Documento copiaDocumentoIdentificacion = hojaVida.getCopiaDocumentoIdentificacion();
        if (copiaDocumentoIdentificacion != null) {
            MapSqlParameterSource parametrosActualizacionCopiaDocumentoIdentificacion = new MapSqlParameterSource();
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varIdPersona", hojaVida.getIdPersona());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varTipoDocumento", TipoDocumento.COPIA_CEDULA.getId());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varNombre", copiaDocumentoIdentificacion.getNombre());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varTipoContenido", copiaDocumentoIdentificacion.getTipoContenido());
            parametrosActualizacionCopiaDocumentoIdentificacion.addValue("varContenido", copiaDocumentoIdentificacion.getContenido());
            actualizarDocumentoSoporte.execute(parametrosActualizacionCopiaDocumentoIdentificacion);
        }

        Documento documentoRUT = hojaVida.getDocumentoRUT();
        if (documentoRUT != null) {
            MapSqlParameterSource parametrosActualizacionDocumentoRUT = new MapSqlParameterSource();
            parametrosActualizacionDocumentoRUT.addValue("varIdPersona", hojaVida.getIdPersona());
            parametrosActualizacionDocumentoRUT.addValue("varTipoDocumento", TipoDocumento.RUT.getId());
            parametrosActualizacionDocumentoRUT.addValue("varNombre", documentoRUT.getNombre());
            parametrosActualizacionDocumentoRUT.addValue("varTipoContenido", documentoRUT.getTipoContenido());
            parametrosActualizacionDocumentoRUT.addValue("varContenido", documentoRUT.getContenido());
            actualizarDocumentoSoporte.execute(parametrosActualizacionDocumentoRUT);
        }
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
        parametros.addValue("varEgresadoUdea", hojaVida.isEgresadoUDEA());
        parametros.addValue("varGrupoEtnico", hojaVida.getGrupoEtnico());
        parametros.addValue("varDiscapacidad", hojaVida.getDiscapacidad());
        parametros.addValue("varDisponeRut", hojaVida.isDisponeRUT());
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
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varTipoDocumento", TipoDocumento.COPIA_CEDULA.getId());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varNombre", copiaDocumentoIdentificacion.getNombre());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varTipoContenido", copiaDocumentoIdentificacion.getTipoContenido());
            parametrosIngresoCopiaDocumentoIdentificacion.addValue("varContenido", copiaDocumentoIdentificacion.getContenido());
            ingresarDocumentoSoporte.execute(parametrosIngresoCopiaDocumentoIdentificacion);
        }

        Documento documentoRUT = hojaVida.getDocumentoRUT();
        if (documentoRUT != null) {
            MapSqlParameterSource parametrosIngresoDocumentoRUT = new MapSqlParameterSource();
            parametrosIngresoDocumentoRUT.addValue("varIdPersona", idPersona);
            parametrosIngresoDocumentoRUT.addValue("varTipoDocumento", TipoDocumento.RUT.getId());
            parametrosIngresoDocumentoRUT.addValue("varNombre", documentoRUT.getNombre());
            parametrosIngresoDocumentoRUT.addValue("varTipoContenido", documentoRUT.getTipoContenido());
            parametrosIngresoDocumentoRUT.addValue("varContenido", documentoRUT.getContenido());
            ingresarDocumentoSoporte.execute(parametrosIngresoDocumentoRUT);
        }
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento) {
        Documento documento = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersona", idPersona);
        parametros.addValue("varIdTipoDocumento", idTipoDocumento);

        Map resultado = obtenerDocumentoSoporte.execute(parametros);

        if (resultado.get("varNombre") != null) {
            documento = new Documento();
            documento.setNombre((String) resultado.get("varNombre"));
            documento.setTipoContenido((String) resultado.get("varTipoContenido"));
            documento.setContenido((byte[]) resultado.get("varContenido"));
        }

        return documento;
    }

    private void actualizarTelefonos(int idPersona, List<Telefono> telefonos) {
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

    private void actualizarCuentasBancarias(int idPersona, List<CuentaBancaria> cuentasBancarias) {
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
                actualizarCuentaBancaria.execute(parametrosActualizacionCuentaBancaria);
            }
        }

        MapSqlParameterSource parametrosIngresoCuentaBancaria = new MapSqlParameterSource();
        parametrosIngresoCuentaBancaria.addValue("varIdPersona", idPersona);
        for (CuentaBancaria cuentaBancaria : cuentasBancarias) {
            if (cuentaBancaria.getId() == 0) {
                parametrosIngresoCuentaBancaria.addValue("varNumero", cuentaBancaria.getNumero());
                parametrosIngresoCuentaBancaria.addValue("varTipo", cuentaBancaria.getTipo());
                ingresarCuentaBancaria.execute(parametrosIngresoCuentaBancaria);
            }
        }
    }

    private void actualizarCorreosElectronicos(int idPersona, List<CorreoElectronico> correosElectronicos) {
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

    @Override
    public List<HojaVida> obtenerHojaVida() {
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

}
