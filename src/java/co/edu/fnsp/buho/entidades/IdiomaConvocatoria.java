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
public class IdiomaConvocatoria {
    private int id;
    private int idioma;
    private String nombreIdioma;
    private String tipoCertificacion;
    private String nombreTipoCertificacion;
    private String otraCertificacion;
    private double puntajeMinimoCertificacion;

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
     * @return the idioma
     */
    public int getIdioma() {
        return idioma;
    }

    /**
     * @param idioma the idioma to set
     */
    public void setIdioma(int idioma) {
        this.idioma = idioma;
    }

    /**
     * @return the nombreIdioma
     */
    public String getNombreIdioma() {
        return nombreIdioma;
    }

    /**
     * @param nombreIdioma the nombreIdioma to set
     */
    public void setNombreIdioma(String nombreIdioma) {
        this.nombreIdioma = nombreIdioma;
    }

    /**
     * @return the otraCertificacion
     */
    public String getOtraCertificacion() {
        return otraCertificacion;
    }

    /**
     * @param otraCertificacion the otraCertificacion to set
     */
    public void setOtraCertificacion(String otraCertificacion) {
        this.otraCertificacion = otraCertificacion;
    }

    /**
     * @return the puntajeMinimoCertificacion
     */
    public double getPuntajeMinimoCertificacion() {
        return puntajeMinimoCertificacion;
    }

    /**
     * @param puntajeMinimoCertificacion the puntajeMinimoCertificacion to set
     */
    public void setPuntajeMinimoCertificacion(double puntajeMinimoCertificacion) {
        this.puntajeMinimoCertificacion = puntajeMinimoCertificacion;
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
     * @return the nombreTipoCertificacion
     */
    public String getNombreTipoCertificacion() {
        return nombreTipoCertificacion;
    }

    /**
     * @param nombreTipoCertificacion the nombreTipoCertificacion to set
     */
    public void setNombreTipoCertificacion(String nombreTipoCertificacion) {
        this.nombreTipoCertificacion = nombreTipoCertificacion;
    }
}
