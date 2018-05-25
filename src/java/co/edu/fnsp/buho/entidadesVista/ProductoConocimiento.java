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
public class ProductoConocimiento {
    private int id;
    private String nombreTipo;
    private int tipo;
    private int nucleoBasicoConocimiento;
    private String url;
    private String descripcion;
    private Object documento;

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
     * @return the nombreTipo
     */
    public String getNombreTipo() {
        return nombreTipo;
    }

    /**
     * @param nombreTipo the nombreTipo to set
     */
    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
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
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
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
     * @return the documento
     */
    public Object getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(Object documento) {
        this.documento = documento;
    }
    
}
