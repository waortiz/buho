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
public class EducacionContinua {

    private int id;
    private int consecutivo;
    private int tipoCapacitacion;
    private String nombreTipoCapacitacion;
    private int institucion;
    private String nombreInstitucion;
    private int nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;    
    private String nombreCapacitacion;    
    private int numeroHoras;    
    private int anyo;
    private boolean estudioExterior;
    private boolean certificadoValidado;
    private Documento certificado;
    private String nombreCertificadoValidado;
    private String nombreCertificado;

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

    /**
     * @return the numeroHoras
     */
    public int getNumeroHoras() {
        return numeroHoras;
    }

    /**
     * @param numeroHoras the numeroHoras to set
     */
    public void setNumeroHoras(int numeroHoras) {
        this.numeroHoras = numeroHoras;
    }

    /**
     * @return the anyo
     */
    public int getAnyo() {
        return anyo;
    }

    /**
     * @param anyo the anyo to set
     */
    public void setAnyo(int anyo) {
        this.anyo = anyo;
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
     * @return the estudioExterior
     */
    public boolean isEstudioExterior() {
        return estudioExterior;
    }

    /**
     * @param estudioExterior the estudioExterior to set
     */
    public void setEstudioExterior(boolean estudioExterior) {
        this.estudioExterior = estudioExterior;
    }

    /**
     * @return the certificadoValidado
     */
    public boolean isCertificadoValidado() {
        return certificadoValidado;
    }

    /**
     * @param certificadoValidado the certificadoValidado to set
     */
    public void setCertificadoValidado(boolean certificadoValidado) {
        this.certificadoValidado = certificadoValidado;
    }

    /**
     * @return the nombreCertificadoValidado
     */
    public String getNombreCertificadoValidado() {
        return nombreCertificadoValidado;
    }

    /**
     * @param nombreCertificadoValidado the nombreCertificadoValidado to set
     */
    public void setNombreCertificadoValidado(String nombreCertificadoValidado) {
        this.nombreCertificadoValidado = nombreCertificadoValidado;
    }

    /**
     * @return the nombreCertificado
     */
    public String getNombreCertificado() {
        return nombreCertificado;
    }

    /**
     * @param nombreCertificado the nombreCertificado to set
     */
    public void setNombreCertificado(String nombreCertificado) {
        this.nombreCertificado = nombreCertificado;
    }

}
