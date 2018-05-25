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
public class Distincion {
    private int id;
    private String institucionOtorga;
    private String descripcion;
    private String fechaDistincion;
    private Object certificado;
    
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
    public String getFechaDistincion() {
        return fechaDistincion;
    }

    /**
     * @param fechaDistincion the fechaDistincion to set
     */
    public void setFechaDistincion(String fechaDistincion) {
        this.fechaDistincion = fechaDistincion;
    }

    /**
     * @return the certificado
     */
    public Object getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(Object certificado) {
        this.certificado = certificado;
    }
    
}
