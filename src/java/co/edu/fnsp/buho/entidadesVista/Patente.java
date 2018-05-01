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
public class Patente {
    private int id;
    private String nombreTipo;
    private int tipo;
    private String fecha;
    private boolean propiedadCompartida;
    private int clase;
    private String descripcion;
    private MultipartFile documento;

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
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the propiedadCompartida
     */
    public boolean isPropiedadCompartida() {
        return propiedadCompartida;
    }

    /**
     * @param propiedadCompartida the propiedadCompartida to set
     */
    public void setPropiedadCompartida(boolean propiedadCompartida) {
        this.propiedadCompartida = propiedadCompartida;
    }

    /**
     * @return the clase
     */
    public int getClase() {
        return clase;
    }

    /**
     * @param clase the clase to set
     */
    public void setClase(int clase) {
        this.clase = clase;
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
    public MultipartFile getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(MultipartFile documento) {
        this.documento = documento;
    }
    
}
