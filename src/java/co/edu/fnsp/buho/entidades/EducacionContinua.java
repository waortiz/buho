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
    private int tipoCapacitacion;
    private String nombreTipoCapacitacion;
    private int institucion;
    private String nombreInstitucion;
    private int areaSaber;
    private String nombreNucleoBasicoConocimiento;    
    private String nombreCapacitacion;    
    private int numeroHoras;    
    private int anyo;
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
     * @return the areaSaber
     */
    public int getNucleoBasicoConocimiento() {
        return areaSaber;
    }

    /**
     * @param areaSaber the areaSaber to set
     */
    public void setNucleoBasicoConocimiento(int areaSaber) {
        this.areaSaber = areaSaber;
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

}
