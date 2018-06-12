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
public class HojaVidaExperiencia {

    private long idPersona;;
    private String numeroIdentificacion;
    private String nombres;
    private String apellidos;
    private String tiempoExperienciaDocencia;
    private String tiempoExperienciaLaboral;
    private String tiempoExperienciaProfesional;

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
     * @return the tiempoExperienciaDocencia
     */
    public String getTiempoExperienciaDocencia() {
        return tiempoExperienciaDocencia;
    }

    /**
     * @param tiempoExperienciaDocencia the tiempoExperienciaDocencia to set
     */
    public void setTiempoExperienciaDocencia(String tiempoExperienciaDocencia) {
        this.tiempoExperienciaDocencia = tiempoExperienciaDocencia;
    }

    /**
     * @return the tiempoExperienciaLaboral
     */
    public String getTiempoExperienciaLaboral() {
        return tiempoExperienciaLaboral;
    }

    /**
     * @param tiempoExperienciaLaboral the tiempoExperienciaLaboral to set
     */
    public void setTiempoExperienciaLaboral(String tiempoExperienciaLaboral) {
        this.tiempoExperienciaLaboral = tiempoExperienciaLaboral;
    }

    /**
     * @return the tiempoExperienciaProfesional
     */
    public String getTiempoExperienciaProfesional() {
        return tiempoExperienciaProfesional;
    }

    /**
     * @param tiempoExperienciaProfesional the tiempoExperienciaProfesional to set
     */
    public void setTiempoExperienciaProfesional(String tiempoExperienciaProfesional) {
        this.tiempoExperienciaProfesional = tiempoExperienciaProfesional;
    }
    
}