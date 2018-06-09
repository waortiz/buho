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
public class Adenda {
    private int id;
    private int consecutivo;
    private int tipoAdenda;
    private String nombreTipoAdenda;
    private String descripcion;
    private Date fecha;
    private String fechaFormateada;
    private boolean tieneDocumento;
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
     * @return the tipoAdenda
     */
    public int getTipoAdenda() {
        return tipoAdenda;
    }

    /**
     * @param tipoAdenda the tipoAdenda to set
     */
    public void setTipoAdenda(int tipoAdenda) {
        this.tipoAdenda = tipoAdenda;
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
     * @return the tieneDocumento
     */
    public boolean isTieneDocumento() {
        return tieneDocumento;
    }

    /**
     * @param tieneDocumento the tieneDocumento to set
     */
    public void setTieneDocumento(boolean tieneDocumento) {
        this.tieneDocumento = tieneDocumento;
    }

    /**
     * @return the nombreTipoAdenda
     */
    public String getNombreTipoAdenda() {
        return nombreTipoAdenda;
    }

    /**
     * @param nombreTipoAdenda the nombreTipoAdenda to set
     */
    public void setNombreTipoAdenda(String nombreTipoAdenda) {
        this.nombreTipoAdenda = nombreTipoAdenda;
    }
}
