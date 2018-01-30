/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class Adenda {
    private int tipoAdenda;
    private String descripcion;
    private Date fecha;
    private MultipartFile documento;
    
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
