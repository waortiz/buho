/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.Telefono;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class HojaVida {
    private int idPersona;
    private String tipoIdentificacion;
    private String nombreTipoIdentificacion;
    private String numeroIdentificacion;
    private MultipartFile copiaDocumentoIdentificacion;
    private String nombres;
    private String apellidos;
    private String sexo;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaExpedicion;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaNacimiento;    
    private String lugarNacimiento;
    private String nombreLugarNacimiento;
    private String nacionalidad;
    private String nombreNacionalidad;
    private String libretaMilitar;
    private String distritoClase;
    private String ciudadResidencia;
    private String nombreCiudadResidencia;
    private String direccion;
    private String grupoEtnico;
    private String nombreGrupoEtnico;
    private String nombreDiscapacidad;
    private String discapacidad;
    private MultipartFile documentoRUT;
    private String disponeRUT;
    private String nombreActividadEconomica;
    private String actividadEconomica;
    private String disponibilidadViajar;
    private String egresadoUDEA;
    private String empleadoUDEA;
    private String lugarExpedicion;
    private String tipoVinculacion;
    private List<Telefono> telefonos = new ArrayList<>();
    private List<CuentaBancaria> cuentasBancarias = new ArrayList<>();
    private List<CorreoElectronico> correosElectronicos = new ArrayList<>();
    
    /**
     * @return the tipoIdentificacion
     */
    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    /**
     * @param tipoIdentificacion the tipoIdentificacion to set
     */
    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    /**
     * @return the nombreTipoIdentificacion
     */
    public String getNombreTipoIdentificacion() {
        return nombreTipoIdentificacion;
    }

    /**
     * @param nombreTipoIdentificacion the nombreTipoIdentificacion to set
     */
    public void setNombreTipoIdentificacion(String nombreTipoIdentificacion) {
        this.nombreTipoIdentificacion = nombreTipoIdentificacion;
    }

    /**
     * @return the numeroIdentificacion
     */
    public String getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    /**
     * @param numeroIdentificacion the numeroIdentificacion to set
     */
    public void setNumeroIdentificacion(String numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    /**
     * @return the copiaDocumentoIdentificacion
     */
    public MultipartFile getCopiaDocumentoIdentificacion() {
        return copiaDocumentoIdentificacion;
    }

    /**
     * @param copiaDocumentoIdentificacion the copiaDocumentoIdentificacion to set
     */
    public void setCopiaDocumentoIdentificacion(MultipartFile copiaDocumentoIdentificacion) {
        this.copiaDocumentoIdentificacion = copiaDocumentoIdentificacion;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the fechaExpedicion
     */
    public Date getFechaExpedicion() {
        return fechaExpedicion;
    }

    /**
     * @param fechaExpedicion the fechaExpedicion to set
     */
    public void setFechaExpedicion(Date fechaExpedicion) {
        this.fechaExpedicion = fechaExpedicion;
    }

    /**
     * @return the fechaNacimiento
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * @return the lugarNacimiento
     */
    public String getLugarNacimiento() {
        return lugarNacimiento;
    }

    /**
     * @param lugarNacimiento the lugarNacimiento to set
     */
    public void setLugarNacimiento(String lugarNacimiento) {
        this.lugarNacimiento = lugarNacimiento;
    }

    /**
     * @return the nombreLugarNacimiento
     */
    public String getNombreLugarNacimiento() {
        return nombreLugarNacimiento;
    }

    /**
     * @param nombreLugarNacimiento the nombreLugarNacimiento to set
     */
    public void setNombreLugarNacimiento(String nombreLugarNacimiento) {
        this.nombreLugarNacimiento = nombreLugarNacimiento;
    }

    /**
     * @return the nacionalidad
     */
    public String getNacionalidad() {
        return nacionalidad;
    }

    /**
     * @param nacionalidad the nacionalidad to set
     */
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    /**
     * @return the nombreNacionalidad
     */
    public String getNombreNacionalidad() {
        return nombreNacionalidad;
    }

    /**
     * @param nombreNacionalidad the nombreNacionalidad to set
     */
    public void setNombreNacionalidad(String nombreNacionalidad) {
        this.nombreNacionalidad = nombreNacionalidad;
    }

    /**
     * @return the libretaMilitar
     */
    public String getLibretaMilitar() {
        return libretaMilitar;
    }

    /**
     * @param libretaMilitar the libretaMilitar to set
     */
    public void setLibretaMilitar(String libretaMilitar) {
        this.libretaMilitar = libretaMilitar;
    }

    /**
     * @return the distritoClase
     */
    public String getDistritoClase() {
        return distritoClase;
    }

    /**
     * @param distritoClase the distritoClase to set
     */
    public void setDistritoClase(String distritoClase) {
        this.distritoClase = distritoClase;
    }

    /**
     * @return the ciudadResidencia
     */
    public String getCiudadResidencia() {
        return ciudadResidencia;
    }

    /**
     * @param ciudadResidencia the ciudadResidencia to set
     */
    public void setCiudadResidencia(String ciudadResidencia) {
        this.ciudadResidencia = ciudadResidencia;
    }

    /**
     * @return the nombreCiudadResidencia
     */
    public String getNombreCiudadResidencia() {
        return nombreCiudadResidencia;
    }

    /**
     * @param nombreCiudadResidencia the nombreCiudadResidencia to set
     */
    public void setNombreCiudadResidencia(String nombreCiudadResidencia) {
        this.nombreCiudadResidencia = nombreCiudadResidencia;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the grupoEtnico
     */
    public String getGrupoEtnico() {
        return grupoEtnico;
    }

    /**
     * @param grupoEtnico the grupoEtnico to set
     */
    public void setGrupoEtnico(String grupoEtnico) {
        this.grupoEtnico = grupoEtnico;
    }

    /**
     * @return the nombreGrupoEtnico
     */
    public String getNombreGrupoEtnico() {
        return nombreGrupoEtnico;
    }

    /**
     * @param nombreGrupoEtnico the nombreGrupoEtnico to set
     */
    public void setNombreGrupoEtnico(String nombreGrupoEtnico) {
        this.nombreGrupoEtnico = nombreGrupoEtnico;
    }

    /**
     * @return the nombreDiscapacidad
     */
    public String getNombreDiscapacidad() {
        return nombreDiscapacidad;
    }

    /**
     * @param nombreDiscapacidad the nombreDiscapacidad to set
     */
    public void setNombreDiscapacidad(String nombreDiscapacidad) {
        this.nombreDiscapacidad = nombreDiscapacidad;
    }

    /**
     * @return the discapacidad
     */
    public String getDiscapacidad() {
        return discapacidad;
    }

    /**
     * @param discapacidad the discapacidad to set
     */
    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

    /**
     * @return the documentoRUT
     */
    public MultipartFile getDocumentoRUT() {
        return documentoRUT;
    }

    /**
     * @param documentoRUT the documentoRUT to set
     */
    public void setDocumentoRUT(MultipartFile documentoRUT) {
        this.documentoRUT = documentoRUT;
    }

    /**
     * @return the disponeRUT
     */
    public String getDisponeRUT() {
        return disponeRUT;
    }

    /**
     * @param disponeRUT the disponeRUT to set
     */
    public void setDisponeRUT(String disponeRUT) {
        this.disponeRUT = disponeRUT;
    }

    /**
     * @return the nombreActividadEconomica
     */
    public String getNombreActividadEconomica() {
        return nombreActividadEconomica;
    }

    /**
     * @param nombreActividadEconomica the nombreActividadEconomica to set
     */
    public void setNombreActividadEconomica(String nombreActividadEconomica) {
        this.nombreActividadEconomica = nombreActividadEconomica;
    }

    /**
     * @return the actividadEconomica
     */
    public String getActividadEconomica() {
        return actividadEconomica;
    }

    /**
     * @param actividadEconomica the actividadEconomica to set
     */
    public void setActividadEconomica(String actividadEconomica) {
        this.actividadEconomica = actividadEconomica;
    }

    /**
     * @return the disponibilidadViajar
     */
    public String getDisponibilidadViajar() {
        return disponibilidadViajar;
    }

    /**
     * @param disponibilidadViajar the disponibilidadViajar to set
     */
    public void setDisponibilidadViajar(String disponibilidadViajar) {
        this.disponibilidadViajar = disponibilidadViajar;
    }

    /**
     * @return the egresadoUDEA
     */
    public String getEgresadoUDEA() {
        return egresadoUDEA;
    }

    /**
     * @param egresadoUDEA the egresadoUDEA to set
     */
    public void setEgresadoUDEA(String egresadoUDEA) {
        this.egresadoUDEA = egresadoUDEA;
    }

    /**
     * @return the empleadoUDEA
     */
    public String getEmpleadoUDEA() {
        return empleadoUDEA;
    }

    /**
     * @param empleadoUDEA the empleadoUDEA to set
     */
    public void setEmpleadoUDEA(String empleadoUDEA) {
        this.empleadoUDEA = empleadoUDEA;
    }

    /**
     * @return the lugarExpedicion
     */
    public String getLugarExpedicion() {
        return lugarExpedicion;
    }

    /**
     * @param lugarExpedicion the lugarExpedicion to set
     */
    public void setLugarExpedicion(String lugarExpedicion) {
        this.lugarExpedicion = lugarExpedicion;
    }

    /**
     * @return the tipoVinculacion
     */
    public String getTipoVinculacion() {
        return tipoVinculacion;
    }

    /**
     * @param tipoVinculacion the tipoVinculacion to set
     */
    public void setTipoVinculacion(String tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }

    /**
     * @return the telefonos
     */
    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    /**
     * @param telefonos the telefonos to set
     */
    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }

    /**
     * @return the cuentasBancarias
     */
    public List<CuentaBancaria> getCuentasBancarias() {
        return cuentasBancarias;
    }

    /**
     * @param cuentasBancarias the cuentasBancarias to set
     */
    public void setCuentasBancarias(List<CuentaBancaria> cuentasBancarias) {
        this.cuentasBancarias = cuentasBancarias;
    }

    /**
     * @return the correosElectronicos
     */
    public List<CorreoElectronico> getCorreosElectronicos() {
        return correosElectronicos;
    }

    /**
     * @param correosElectronicos the correosElectronicos to set
     */
    public void setCorreosElectronicos(List<CorreoElectronico> correosElectronicos) {
        this.correosElectronicos = correosElectronicos;
    }

    /**
     * @return the idPersona
     */
    public int getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }
    
}
