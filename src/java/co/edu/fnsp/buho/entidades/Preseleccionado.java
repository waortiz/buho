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
public class Preseleccionado {
    private long idPersona;
    private String numeroIdentificacion;
    private int tiempoExperienciaDocente;
    private int tiempoExperienciaLaboral;
    private String sexo;
    private String perfil;

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
     * @return the tiempoExperienciaDocente
     */
    public int getTiempoExperienciaDocente() {
        return tiempoExperienciaDocente;
    }

    /**
     * @param tiempoExperienciaDocente the tiempoExperienciaDocente to set
     */
    public void setTiempoExperienciaDocente(int tiempoExperienciaDocente) {
        this.tiempoExperienciaDocente = tiempoExperienciaDocente;
    }

    /**
     * @return the tiempoExperienciaLaboral
     */
    public int getTiempoExperienciaLaboral() {
        return tiempoExperienciaLaboral;
    }

    /**
     * @param tiempoExperienciaLaboral the tiempoExperienciaLaboral to set
     */
    public void setTiempoExperienciaLaboral(int tiempoExperienciaLaboral) {
        this.tiempoExperienciaLaboral = tiempoExperienciaLaboral;
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
     * @return the perfil
     */
    public String getPerfil() {
        return perfil;
    }

    /**
     * @param perfil the perfil to set
     */
    public void setPerfil(String perfil) {
        this.perfil = perfil;
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
