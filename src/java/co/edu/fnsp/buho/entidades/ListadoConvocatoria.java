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
public class ListadoConvocatoria {
    private int id;
    private String tipoConvocatoria;
    private String nombreTipoConvocatoria;
    private Date fechaFin;
    private String fechaFinFormateada;
    private Date fechaPostulacion;
    private String fechaPostulacionFormateada;
    private String nombre;
    private String descripcion;
    private boolean tieneDocumento;
    private boolean tieneResultado;
    private boolean postulado;

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
     * @return the tipoConvocatoria
     */
    public String getTipoConvocatoria() {
        return tipoConvocatoria;
    }

    /**
     * @param tipoConvocatoria the tipoConvocatoria to set
     */
    public void setTipoConvocatoria(String tipoConvocatoria) {
        this.tipoConvocatoria = tipoConvocatoria;
    }

    /**
     * @return the nombreTipoConvocatoria
     */
    public String getNombreTipoConvocatoria() {
        return nombreTipoConvocatoria;
    }

    /**
     * @param nombreTipoConvocatoria the nombreTipoConvocatoria to set
     */
    public void setNombreTipoConvocatoria(String nombreTipoConvocatoria) {
        this.nombreTipoConvocatoria = nombreTipoConvocatoria;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    /**
     * @return the fechaFinFormateada
     */
    public String getFechaFinFormateada() {
        return fechaFinFormateada;
    }

    /**
     * @param fechaFinFormateada the fechaFinFormateada to set
     */
    public void setFechaFinFormateada(String fechaFinFormateada) {
        this.fechaFinFormateada = fechaFinFormateada;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
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
     * @return the postulado
     */
    public boolean isPostulado() {
        return postulado;
    }

    /**
     * @param postulado the postulado to set
     */
    public void setPostulado(boolean postulado) {
        this.postulado = postulado;
    }

    /**
     * @return the fechaPostulacion
     */
    public Date getFechaPostulacion() {
        return fechaPostulacion;
    }

    /**
     * @param fechaPostulacion the fechaPostulacion to set
     */
    public void setFechaPostulacion(Date fechaPostulacion) {
        this.fechaPostulacion = fechaPostulacion;
    }

    /**
     * @return the fechaPostulacionFormateada
     */
    public String getFechaPostulacionFormateada() {
        return fechaPostulacionFormateada;
    }

    /**
     * @param fechaPostulacionFormateada the fechaPostulacionFormateada to set
     */
    public void setFechaPostulacionFormateada(String fechaPostulacionFormateada) {
        this.fechaPostulacionFormateada = fechaPostulacionFormateada;
    }

    /**
     * @return the tieneResultado
     */
    public boolean isTieneResultado() {
        return tieneResultado;
    }

    /**
     * @param tieneResultado the tieneResultado to set
     */
    public void setTieneResultado(boolean tieneResultado) {
        this.tieneResultado = tieneResultado;
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
    
}
