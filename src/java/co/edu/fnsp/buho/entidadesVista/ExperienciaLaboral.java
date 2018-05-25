/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class ExperienciaLaboral {
    private int id;
    private String tipoExperiencia;
    private String nombreTipoExperiencia;
    private boolean trabajoActual;
    private boolean fnsp;
    private String fechaIngreso;
    private String fechaRetiro;
    private String nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    private String tipoEmpresa;
    private String nombreTipoEmpresa;
    private String nombreEmpresa;
    private String actividadEconomica;
    private String nombreActividadEconomica;
    private String tipoContrato;
    private String nombreTipoContrato;
    private String cargo;
    private String naturalezaCargo;
    private String nombreNaturalezaCargo;
    private Object certificado;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the tipoExperiencia
     */
    public String getTipoExperiencia() {
        return tipoExperiencia;
    }

    /**
     * @param tipoExperiencia the tipoExperiencia to set
     */
    public void setTipoExperiencia(String tipoExperiencia) {
        this.tipoExperiencia = tipoExperiencia;
    }

    /**
     * @return the nombreTipoExperiencia
     */
    public String getNombreTipoExperiencia() {
        return nombreTipoExperiencia;
    }

    /**
     * @param nombreTipoExperiencia the nombreTipoExperiencia to set
     */
    public void setNombreTipoExperiencia(String nombreTipoExperiencia) {
        this.nombreTipoExperiencia = nombreTipoExperiencia;
    }

    /**
     * @return the trabajoActual
     */
    public boolean isTrabajoActual() {
        return trabajoActual;
    }

    /**
     * @param trabajoActual the trabajoActual to set
     */
    public void setTrabajoActual(boolean trabajoActual) {
        this.trabajoActual = trabajoActual;
    }

    /**
     * @return the fnsp
     */
    public boolean isFnsp() {
        return fnsp;
    }

    /**
     * @param fnsp the fnsp to set
     */
    public void setFnsp(boolean fnsp) {
        this.fnsp = fnsp;
    }

    /**
     * @return the fechaIngreso
     */
    public String getFechaIngreso() {
        return fechaIngreso;
    }

    /**
     * @param fechaIngreso the fechaIngreso to set
     */
    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    /**
     * @return the fechaRetiro
     */
    public String getFechaRetiro() {
        return fechaRetiro;
    }

    /**
     * @param fechaRetiro the fechaRetiro to set
     */
    public void setFechaRetiro(String fechaRetiro) {
        this.fechaRetiro = fechaRetiro;
    }

    /**
     * @return the nucleoBasicoConocimiento
     */
    public String getNucleoBasicoConocimiento() {
        return nucleoBasicoConocimiento;
    }

    /**
     * @param nucleoBasicoConocimiento the nucleoBasicoConocimiento to set
     */
    public void setNucleoBasicoConocimiento(String nucleoBasicoConocimiento) {
        this.nucleoBasicoConocimiento = nucleoBasicoConocimiento;
    }

    /**
     * @return the nombreNucleoBasicoConocimiento
     */
    public String getNombreNucleoBasicoConocimiento() {
        return nombreNucleoBasicoConocimiento;
    }

    /**
     * @param nombreNucleoBasicoConocimiento the nombreNucleoBasicoConocimiento to set
     */
    public void setNombreNucleoBasicoConocimiento(String nombreNucleoBasicoConocimiento) {
        this.nombreNucleoBasicoConocimiento = nombreNucleoBasicoConocimiento;
    }

    /**
     * @return the tipoEmpresa
     */
    public String getTipoEmpresa() {
        return tipoEmpresa;
    }

    /**
     * @param tipoEmpresa the tipoEmpresa to set
     */
    public void setTipoEmpresa(String tipoEmpresa) {
        this.tipoEmpresa = tipoEmpresa;
    }

    /**
     * @return the nombreTipoEmpresa
     */
    public String getNombreTipoEmpresa() {
        return nombreTipoEmpresa;
    }

    /**
     * @param nombreTipoEmpresa the nombreTipoEmpresa to set
     */
    public void setNombreTipoEmpresa(String nombreTipoEmpresa) {
        this.nombreTipoEmpresa = nombreTipoEmpresa;
    }

    /**
     * @return the nombreEmpresa
     */
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    /**
     * @param nombreEmpresa the nombreEmpresa to set
     */
    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    /**
     * @return the tipoContrato
     */
    public String getTipoContrato() {
        return tipoContrato;
    }

    /**
     * @param tipoContrato the tipoContrato to set
     */
    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    /**
     * @return the nombreTipoContrato
     */
    public String getNombreTipoContrato() {
        return nombreTipoContrato;
    }

    /**
     * @param nombreTipoContrato the nombreTipoContrato to set
     */
    public void setNombreTipoContrato(String nombreTipoContrato) {
        this.nombreTipoContrato = nombreTipoContrato;
    }

    /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    /**
     * @return the naturalezaCargo
     */
    public String getNaturalezaCargo() {
        return naturalezaCargo;
    }

    /**
     * @param naturalezaCargo the naturalezaCargo to set
     */
    public void setNaturalezaCargo(String naturalezaCargo) {
        this.naturalezaCargo = naturalezaCargo;
    }

    /**
     * @return the nombreNaturalezaCargo
     */
    public String getNombreNaturalezaCargo() {
        return nombreNaturalezaCargo;
    }

    /**
     * @param nombreNaturalezaCargo the nombreNaturalezaCargo to set
     */
    public void setNombreNaturalezaCargo(String nombreNaturalezaCargo) {
        this.nombreNaturalezaCargo = nombreNaturalezaCargo;
    }

    /**
     * @return the certificado
     */
    public Object getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(Object certificado) {
        this.certificado = certificado;
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
}
