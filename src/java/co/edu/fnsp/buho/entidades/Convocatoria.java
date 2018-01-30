/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author William
 */
public class Convocatoria {

    private int id;
    private int tipoConvocatoria;
    private String nombreTipoConvocatoria;
    private Date fechaInicio;
    private String fechaInicioFormateada;
    private Date fechaFin;
    private String fechaFinFormateada;
    private int area;
    private String nombreArea;
    private String nombre;
    private String descripcion;
    private Documento documento;
    private Date fechaPublicacionResultados;
    private String fechaPublicacionResultadosFormateada;
    private boolean tieneDocumento;
    private boolean postulado;
    private List<Adenda> adendas = new ArrayList<>();
    
    /**
     * @return the tipoConvocatoria
     */
    public int getTipoConvocatoria() {
        return tipoConvocatoria;
    }

    /**
     * @param tipoConvocatoria the tipoConvocatoria to set
     */
    public void setTipoConvocatoria(int tipoConvocatoria) {
        this.tipoConvocatoria = tipoConvocatoria;
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
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
     * @return the area
     */
    public int getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    public void setArea(int area) {
        this.area = area;
    }

    /**
     * @return the nombreArea
     */
    public String getNombreArea() {
        return nombreArea;
    }

    /**
     * @param nombreArea the nombreArea to set
     */
    public void setNombreArea(String nombreArea) {
        this.nombreArea = nombreArea;
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
     * @return the fechaPublicacionResultados
     */
    public Date getFechaPublicacionResultados() {
        return fechaPublicacionResultados;
    }

    /**
     * @param fechaPublicacionResultados the fechaPublicacionResultados to set
     */
    public void setFechaPublicacionResultados(Date fechaPublicacionResultados) {
        this.fechaPublicacionResultados = fechaPublicacionResultados;
    }

    /**
     * @return the adendas
     */
    public List<Adenda> getAdendas() {
        return adendas;
    }

    /**
     * @param adendas the adendas to set
     */
    public void setAdendas(List<Adenda> adendas) {
        this.adendas = adendas;
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
     * @return the fechaInicioFormateada
     */
    public String getFechaInicioFormateada() {
        return fechaInicioFormateada;
    }

    /**
     * @param fechaInicioFormateada the fechaInicioFormateada to set
     */
    public void setFechaInicioFormateada(String fechaInicioFormateada) {
        this.fechaInicioFormateada = fechaInicioFormateada;
    }

    /**
     * @return the fechaPublicacionResultadosFormateada
     */
    public String getFechaPublicacionResultadosFormateada() {
        return fechaPublicacionResultadosFormateada;
    }

    /**
     * @param fechaPublicacionResultadosFormateada the fechaPublicacionResultadosFormateada to set
     */
    public void setFechaPublicacionResultadosFormateada(String fechaPublicacionResultadosFormateada) {
        this.fechaPublicacionResultadosFormateada = fechaPublicacionResultadosFormateada;
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
}
