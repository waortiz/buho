/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author William
 */
public class ExperienciaDocencia {
    private int id;
    private boolean trabajoActual;
    private boolean fnsp;
    private String institucion;
    private String nombreInstitucion;
    private boolean exterior;
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
    public String getInstitucion() {
        return institucion;
    }

    /**
     * @param institucion the institucion to set
     */
    public void setInstitucion(String institucion) {
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
     * @return the exterior
     */
    public boolean isExterior() {
        return exterior;
    }

    /**
     * @param exterior the exterior to set
     */
    public void setExterior(boolean exterior) {
        this.exterior = exterior;
    }
    
}
