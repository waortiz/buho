/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author William
 */
public class ExperienciaDocencia {
    private int id;
    private int consecutivo;
    private boolean trabajoActual;
    private boolean fnsp;
    private int institucion;
    private String nombreInstitucion;
    private List<CursoExperienciaDocencia> cursosExperienciaDocencia = new ArrayList<>();

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
     * @return the institucion
     */
    public int getInstitucion() {
        return institucion;
    }

    /**
     * @param institucion the institucion to set
     */
    public void setInstitucion(int institucion) {
        this.institucion = institucion;
    }

    /**
     * @return the nombreInstitucion
     */
    public String getNombreInstitucion() {
        return nombreInstitucion;
    }

    /**
     * @param nombreInstitucion the nombreInstitucion to set
     */
    public void setNombreInstitucion(String nombreInstitucion) {
        this.nombreInstitucion = nombreInstitucion;
    }

    /**
     * @return the cursosExperienciaDocencia
     */
    public List<CursoExperienciaDocencia> getCursosExperienciaDocencia() {
        return cursosExperienciaDocencia;
    }

    /**
     * @param cursosExperienciaDocencia the cursosExperienciaDocencia to set
     */
    public void setCursosExperienciaDocencia(List<CursoExperienciaDocencia> cursosExperienciaDocencia) {
        this.cursosExperienciaDocencia = cursosExperienciaDocencia;
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
    
}
