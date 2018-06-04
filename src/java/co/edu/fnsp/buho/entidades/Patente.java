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
public class Patente {
    private int id;
    private int consecutivo;
    private String nombreTipo;
    private int tipo;
    private Date fecha;
    private String fechaFormateada;
    private boolean propiedadCompartida;
    private String nombrePropiedadCompartida;
    private int clase;
    private String descripcion;
    private boolean documentoValidado;
    private String nombreDocumentoValidado;
    private Documento documento;

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
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
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
    public Documento getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(Documento documento) {
        this.documento = documento;
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
     * @return the fechaFormateada
     */
    public String getFechaFormateada() {
        return fechaFormateada;
    }

    /**
     * @param fechaFormateada the fechaFormateada to set
     */
    public void setFechaFormateada(String fechaFormateada) {
        this.fechaFormateada = fechaFormateada;
    }

    /**
     * @return the documentoValidado
     */
    public boolean isDocumentoValidado() {
        return documentoValidado;
    }

    /**
     * @param documentoValidado the documentoValidado to set
     */
    public void setDocumentoValidado(boolean documentoValidado) {
        this.documentoValidado = documentoValidado;
    }

    /**
     * @return the nombreDocumentoValidado
     */
    public String getNombreDocumentoValidado() {
        return nombreDocumentoValidado;
    }

    /**
     * @param nombreDocumentoValidado the nombreDocumentoValidado to set
     */
    public void setNombreDocumentoValidado(String nombreDocumentoValidado) {
        this.nombreDocumentoValidado = nombreDocumentoValidado;
    }

    /**
     * @return the nombrePropiedadCompartida
     */
    public String getNombrePropiedadCompartida() {
        return nombrePropiedadCompartida;
    }

    /**
     * @param nombrePropiedadCompartida the nombrePropiedadCompartida to set
     */
    public void setNombrePropiedadCompartida(String nombrePropiedadCompartida) {
        this.nombrePropiedadCompartida = nombrePropiedadCompartida;
    }
    
}
