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
public class Evaluacion {
    private long idPersona;
    private String numeroIdentificacion;
    private int formacionAcademica;
    private int capacitacionDocenciaPedagogia;
    private int experienciaDocenciaInstitucionesEducacionSuperior;
    private int experienciaInvestigacion;
    private int experienciaExtension;
    private int experienciaProfesionalSectorSalud;
    private int total;

    /**
     * @return the idPersona
     */
    public long getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    /**
     * @return the formacionAcademica
     */
    public int getFormacionAcademica() {
        return formacionAcademica;
    }

    /**
     * @param formacionAcademica the formacionAcademica to set
     */
    public void setFormacionAcademica(int formacionAcademica) {
        this.formacionAcademica = formacionAcademica;
    }

    /**
     * @return the capacitacionDocenciaPedagogia
     */
    public int getCapacitacionDocenciaPedagogia() {
        return capacitacionDocenciaPedagogia;
    }

    /**
     * @param capacitacionDocenciaPedagogia the capacitacionDocenciaPedagogia to set
     */
    public void setCapacitacionDocenciaPedagogia(int capacitacionDocenciaPedagogia) {
        this.capacitacionDocenciaPedagogia = capacitacionDocenciaPedagogia;
    }

    /**
     * @return the experienciaDocenciaInstitucionesEducacionSuperior
     */
    public int getExperienciaDocenciaInstitucionesEducacionSuperior() {
        return experienciaDocenciaInstitucionesEducacionSuperior;
    }

    /**
     * @param experienciaDocenciaInstitucionesEducacionSuperior the experienciaDocenciaInstitucionesEducacionSuperior to set
     */
    public void setExperienciaDocenciaInstitucionesEducacionSuperior(int experienciaDocenciaInstitucionesEducacionSuperior) {
        this.experienciaDocenciaInstitucionesEducacionSuperior = experienciaDocenciaInstitucionesEducacionSuperior;
    }

    /**
     * @return the experienciaInvestigacion
     */
    public int getExperienciaInvestigacion() {
        return experienciaInvestigacion;
    }

    /**
     * @param experienciaInvestigacion the experienciaInvestigacion to set
     */
    public void setExperienciaInvestigacion(int experienciaInvestigacion) {
        this.experienciaInvestigacion = experienciaInvestigacion;
    }

    /**
     * @return the experienciaExtension
     */
    public int getExperienciaExtension() {
        return experienciaExtension;
    }

    /**
     * @param experienciaExtension the experienciaExtension to set
     */
    public void setExperienciaExtension(int experienciaExtension) {
        this.experienciaExtension = experienciaExtension;
    }

    /**
     * @return the experienciaProfesionalSectorSalud
     */
    public int getExperienciaProfesionalSectorSalud() {
        return experienciaProfesionalSectorSalud;
    }

    /**
     * @param experienciaProfesionalSectorSalud the experienciaProfesionalSectorSalud to set
     */
    public void setExperienciaProfesionalSectorSalud(int experienciaProfesionalSectorSalud) {
        this.experienciaProfesionalSectorSalud = experienciaProfesionalSectorSalud;
    }

    /**
     * @return the total
     */
    public int getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(int total) {
        this.total = total;
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
}
