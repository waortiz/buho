/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.Date;

/**
 *
 * @author William
 */
public class Distincion {
    private int id;
    private String institucionOtorga;
    private String descripcion;
    private Date fechaDistincion;
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
     * @return the institucionOtorga
     */
    public String getInstitucionOtorga() {
        return institucionOtorga;
    }

    /**
     * @param institucionOtorga the institucionOtorga to set
     */
    public void setInstitucionOtorga(String institucionOtorga) {
        this.institucionOtorga = institucionOtorga;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the fechaDistincion
     */
    public Date getFechaDistincion() {
        return fechaDistincion;
    }

    /**
     * @param fechaDistincion the fechaDistincion to set
     */
    public void setFechaDistincion(Date fechaDistincion) {
        this.fechaDistincion = fechaDistincion;
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
