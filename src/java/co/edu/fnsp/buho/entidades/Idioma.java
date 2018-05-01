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
public class Idioma {
    private int id;
    private int idioma;
    private String nombreIdioma;
    private String nivelConversacion;
    private String nombreNivelConversacion;
    private String nivelEscritura;
    private String nombreNivelEscritura;
    private String nivelLectura;
    private String nombreNivelLectura;
    private String nivelEscucha;
    private String nombreNivelEscucha;
    private int tipoCertificacion;
    private String nombreTipoCertificacion;
    private String otraCertificacion;
    private double puntajeCertificacion;
    private Documento certificado;
    
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
     * @return the tipoCertificacion
     */
    public int getTipoCertificacion() {
        return tipoCertificacion;
    }

    /**
     * @param tipoCertificacion the tipoCertificacion to set
     */
    public void setTipoCertificacion(int tipoCertificacion) {
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
     * @return the puntajeCertificacion
     */
    public double getPuntajeCertificacion() {
        return puntajeCertificacion;
    }

    /**
     * @param puntajeCertificacion the puntajeCertificacion to set
     */
    public void setPuntajeCertificacion(double puntajeCertificacion) {
        this.puntajeCertificacion = puntajeCertificacion;
    }

    /**
     * @return the nivelConversacion
     */
    public String getNivelConversacion() {
        return nivelConversacion;
    }

    /**
     * @param nivelConversacion the nivelConversacion to set
     */
    public void setNivelConversacion(String nivelConversacion) {
        this.nivelConversacion = nivelConversacion;
    }

    /**
     * @return the nombreNivelConversacion
     */
    public String getNombreNivelConversacion() {
        return nombreNivelConversacion;
    }

    /**
     * @param nombreNivelConversacion the nombreNivelConversacion to set
     */
    public void setNombreNivelConversacion(String nombreNivelConversacion) {
        this.nombreNivelConversacion = nombreNivelConversacion;
    }

    /**
     * @return the nivelEscritura
     */
    public String getNivelEscritura() {
        return nivelEscritura;
    }

    /**
     * @param nivelEscritura the nivelEscritura to set
     */
    public void setNivelEscritura(String nivelEscritura) {
        this.nivelEscritura = nivelEscritura;
    }

    /**
     * @return the nombreNivelEscritura
     */
    public String getNombreNivelEscritura() {
        return nombreNivelEscritura;
    }

    /**
     * @param nombreNivelEscritura the nombreNivelEscritura to set
     */
    public void setNombreNivelEscritura(String nombreNivelEscritura) {
        this.nombreNivelEscritura = nombreNivelEscritura;
    }

    /**
     * @return the nivelLectura
     */
    public String getNivelLectura() {
        return nivelLectura;
    }

    /**
     * @param nivelLectura the nivelLectura to set
     */
    public void setNivelLectura(String nivelLectura) {
        this.nivelLectura = nivelLectura;
    }

    /**
     * @return the nombreNivelLectura
     */
    public String getNombreNivelLectura() {
        return nombreNivelLectura;
    }

    /**
     * @param nombreNivelLectura the nombreNivelLectura to set
     */
    public void setNombreNivelLectura(String nombreNivelLectura) {
        this.nombreNivelLectura = nombreNivelLectura;
    }

    /**
     * @return the nivelEscucha
     */
    public String getNivelEscucha() {
        return nivelEscucha;
    }

    /**
     * @param nivelEscucha the nivelEscucha to set
     */
    public void setNivelEscucha(String nivelEscucha) {
        this.nivelEscucha = nivelEscucha;
    }

    /**
     * @return the nombreNivelEscucha
     */
    public String getNombreNivelEscucha() {
        return nombreNivelEscucha;
    }

    /**
     * @param nombreNivelEscucha the nombreNivelEscucha to set
     */
    public void setNombreNivelEscucha(String nombreNivelEscucha) {
        this.nombreNivelEscucha = nombreNivelEscucha;
    }

    /**
     * @return the certificado
     */
    public Documento getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(Documento certificado) {
        this.certificado = certificado;
    }
}
