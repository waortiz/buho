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
public class ProgramaConvocatoria {
    private int id;
    private int programa;
    private String nombrePrograma;
    private int nivelFormacion;
    private String nombreNivelFormacion;
    private int nucleoBasicoConocimiento;

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
     * @return the nivelFormacion
     */
    public int getNivelFormacion() {
        return nivelFormacion;
    }

    /**
     * @param nivelFormacion the nivelFormacion to set
     */
    public void setNivelFormacion(int nivelFormacion) {
        this.nivelFormacion = nivelFormacion;
    }

    /**
     * @return the nombreNivelFormacion
     */
    public String getNombreNivelFormacion() {
        return nombreNivelFormacion;
    }

    /**
     * @param nombreNivelFormacion the nombreNivelFormacion to set
     */
    public void setNombreNivelFormacion(String nombreNivelFormacion) {
        this.nombreNivelFormacion = nombreNivelFormacion;
    }

    /**
     * @return the programa
     */
    public int getPrograma() {
        return programa;
    }

    /**
     * @param programa the programa to set
     */
    public void setPrograma(int programa) {
        this.programa = programa;
    }

    /**
     * @return the nombrePrograma
     */
    public String getNombrePrograma() {
        return nombrePrograma;
    }

    /**
     * @param nombrePrograma the nombrePrograma to set
     */
    public void setNombrePrograma(String nombrePrograma) {
        this.nombrePrograma = nombrePrograma;
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
}
