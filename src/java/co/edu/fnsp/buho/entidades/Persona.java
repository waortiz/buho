/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.Date;

/**
 *
 * @author William
 */
public class Persona {
    private String numeroId;
    private String tipoId;
    private String lugarExpedicion;
    private Date fechaExpedicion;
    private String libretaMilitar;
    private String distritoClase;
    private String nombres;
    private String apellidos;
    private Date fechaNacimiento;
    private String lugarNacimiento;
    private int nacionalidad;
    private int sexo;
    private String ciudadResidencia;
    private String direccion;
    private boolean egresadoUdea;
    private int grupoEtnico;
    private int discapacidad;
    private boolean disponeRut;
    private int actividadEconomica;
    private boolean disponibilidadViajar;
    private int tipoVinculacion;
    
    /**
     * @return the numeroId
     */
    public String getNumeroId() {
        return numeroId;
    }

    /**
     * @param numeroId the numeroId to set
     */
    public void setNumeroId(String numeroId) {
        this.numeroId = numeroId;
    }

    /**
     * @return the tipoId
     */
    public String getTipoId() {
        return tipoId;
    }

    /**
     * @param tipoId the tipoId to set
     */
    public void setTipoId(String tipoId) {
        this.tipoId = tipoId;
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
     * @return the nacionalidad
     */
    public int getNacionalidad() {
        return nacionalidad;
    }

    /**
     * @param nacionalidad the nacionalidad to set
     */
    public void setNacionalidad(int nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    /**
     * @return the sexo
     */
    public int getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(int sexo) {
        this.sexo = sexo;
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
     * @return the egresadoUdea
     */
    public boolean isEgresadoUdea() {
        return egresadoUdea;
    }

    /**
     * @param egresadoUdea the egresadoUdea to set
     */
    public void setEgresadoUdea(boolean egresadoUdea) {
        this.egresadoUdea = egresadoUdea;
    }

    /**
     * @return the grupoEtnico
     */
    public int getGrupoEtnico() {
        return grupoEtnico;
    }

    /**
     * @param grupoEtnico the grupoEtnico to set
     */
    public void setGrupoEtnico(int grupoEtnico) {
        this.grupoEtnico = grupoEtnico;
    }

    /**
     * @return the discapacidad
     */
    public int getDiscapacidad() {
        return discapacidad;
    }

    /**
     * @param discapacidad the discapacidad to set
     */
    public void setDiscapacidad(int discapacidad) {
        this.discapacidad = discapacidad;
    }

    /**
     * @return the disponeRut
     */
    public boolean isDisponeRut() {
        return disponeRut;
    }

    /**
     * @param disponeRut the disponeRut to set
     */
    public void setDisponeRut(boolean disponeRut) {
        this.disponeRut = disponeRut;
    }

    /**
     * @return the actividadEconomica
     */
    public int getActividadEconomica() {
        return actividadEconomica;
    }

    /**
     * @param actividadEconomica the actividadEconomica to set
     */
    public void setActividadEconomica(int actividadEconomica) {
        this.actividadEconomica = actividadEconomica;
    }

    /**
     * @return the disponibilidadViajar
     */
    public boolean isDisponibilidadViajar() {
        return disponibilidadViajar;
    }

    /**
     * @param disponibilidadViajar the disponibilidadViajar to set
     */
    public void setDisponibilidadViajar(boolean disponibilidadViajar) {
        this.disponibilidadViajar = disponibilidadViajar;
    }

    /**
     * @return the tipoVinculacion
     */
    public int getTipoVinculacion() {
        return tipoVinculacion;
    }

    /**
     * @param tipoVinculacion the tipoVinculacion to set
     */
    public void setTipoVinculacion(int tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }
}
