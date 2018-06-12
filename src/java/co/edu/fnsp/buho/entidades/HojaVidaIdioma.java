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
public class HojaVidaIdioma {

    private long idPersona;;
    private String numeroIdentificacion;
    private String nombres;
    private String apellidos;
    private String idioma;
    private String tipoCertificacion;
    private double puntaje;
    private String validado;

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
     * @return the idioma
     */
    public String getIdioma() {
        return idioma;
    }

    /**
     * @param idioma the idioma to set
     */
    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    /**
     * @return the tipoCertificacion
     */
    public String getTipoCertificacion() {
        return tipoCertificacion;
    }

    /**
     * @param tipoCertificacion the tipoCertificacion to set
     */
    public void setTipoCertificacion(String tipoCertificacion) {
        this.tipoCertificacion = tipoCertificacion;
    }

    /**
     * @return the puntaje
     */
    public double getPuntaje() {
        return puntaje;
    }

    /**
     * @param puntaje the puntaje to set
     */
    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }

    /**
     * @return the validado
     */
    public String getValidado() {
        return validado;
    }

    /**
     * @param validado the validado to set
     */
    public void setValidado(String validado) {
        this.validado = validado;
    }

}