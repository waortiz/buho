/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class Convocatoria {

    private int tipoConvocatoria;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaInicio;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaFin;
    private int area;
    private String nombre;
    private String descripcion;
    private MultipartFile documento;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaPublicacionResultados;
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
    public MultipartFile getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(MultipartFile documento) {
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
}
