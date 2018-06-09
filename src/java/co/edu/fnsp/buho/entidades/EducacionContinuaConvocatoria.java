/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;


/**
 *
 * @author William
 */
public class EducacionContinuaConvocatoria {

    private int id;
    private int idConvocatoria;
    private int consecutivo;
    private int tipoCapacitacion;
    private String nombreTipoCapacitacion;
    private int nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;    
    private String nombreCapacitacion;

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
     * @return the idConvocatoria
     */
    public int getIdConvocatoria() {
        return idConvocatoria;
    }

    /**
     * @param idConvocatoria the idConvocatoria to set
     */
    public void setIdConvocatoria(int idConvocatoria) {
        this.idConvocatoria = idConvocatoria;
    }

    /**
     * @return the consecutivo
     */
    public int getConsecutivo() {
        return consecutivo;
    }

    /**
     * @param consecutivo the consecutivo to set
     */
    public void setConsecutivo(int consecutivo) {
        this.consecutivo = consecutivo;
    }

    /**
     * @return the tipoCapacitacion
     */
    public int getTipoCapacitacion() {
        return tipoCapacitacion;
    }

    /**
     * @param tipoCapacitacion the tipoCapacitacion to set
     */
    public void setTipoCapacitacion(int tipoCapacitacion) {
        this.tipoCapacitacion = tipoCapacitacion;
    }

    /**
     * @return the nombreTipoCapacitacion
     */
    public String getNombreTipoCapacitacion() {
        return nombreTipoCapacitacion;
    }

    /**
     * @param nombreTipoCapacitacion the nombreTipoCapacitacion to set
     */
    public void setNombreTipoCapacitacion(String nombreTipoCapacitacion) {
        this.nombreTipoCapacitacion = nombreTipoCapacitacion;
    }

    /**
     * @return the nucleoBasicoConocimiento
     */
    public int getNucleoBasicoConocimiento() {
        return nucleoBasicoConocimiento;
    }

    /**
     * @param nucleoBasicoConocimiento the nucleoBasicoConocimiento to set
     */
    public void setNucleoBasicoConocimiento(int nucleoBasicoConocimiento) {
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
     * @return the nombreCapacitacion
     */
    public String getNombreCapacitacion() {
        return nombreCapacitacion;
    }

    /**
     * @param nombreCapacitacion the nombreCapacitacion to set
     */
    public void setNombreCapacitacion(String nombreCapacitacion) {
        this.nombreCapacitacion = nombreCapacitacion;
    }
    
}
