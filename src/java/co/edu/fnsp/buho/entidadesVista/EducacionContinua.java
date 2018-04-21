/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class EducacionContinua {

    private int id;
    private String tipoCapacitacion;
    private String nombreTipoCapacitacion;
    private String institucion;
    private String nombreInstitucion;
    private String nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;    
    private String nombreCapacitacion;    
    private String numeroHoras;    
    private String anyo;
    private MultipartFile certificado;

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
    public String getTipoCapacitacion() {
        return tipoCapacitacion;
    }

    /**
     * @param tipoCapacitacion the tipoCapacitacion to set
     */
    public void setTipoCapacitacion(String tipoCapacitacion) {
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
     * @return the nucleoBasicoConocimiento
     */
    public String getNucleoBasicoConocimiento() {
        return nucleoBasicoConocimiento;
    }

    /**
     * @param nucleoBasicoConocimiento the nucleoBasicoConocimiento to set
     */
    public void setNucleoBasicoConocimiento(String nucleoBasicoConocimiento) {
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
    public String getNumeroHoras() {
        return numeroHoras;
    }

    /**
     * @param numeroHoras the numeroHoras to set
     */
    public void setNumeroHoras(String numeroHoras) {
        this.numeroHoras = numeroHoras;
    }

    /**
     * @return the anyo
     */
    public String getAnyo() {
        return anyo;
    }

    /**
     * @param anyo the anyo to set
     */
    public void setAnyo(String anyo) {
        this.anyo = anyo;
    }

    /**
     * @return the certificado
     */
    public MultipartFile getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(MultipartFile certificado) {
        this.certificado = certificado;
    }

}
