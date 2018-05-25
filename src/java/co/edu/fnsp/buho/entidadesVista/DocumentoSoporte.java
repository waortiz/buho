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
public class DocumentoSoporte {
    private int id;
    private String tipoDocumento;
    private String nombreTipoDocumento;
    private boolean tieneDocumento;
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
     * @return the tipoDocumento
     */
    public String getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * @param tipoDocumento the tipoDocumento to set
     */
    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    /**
     * @return the nombreTipoDocumento
     */
    public String getNombreTipoDocumento() {
        return nombreTipoDocumento;
    }

    /**
     * @param nombreTipoDocumento the nombreTipoDocumento to set
     */
    public void setNombreTipoDocumento(String nombreTipoDocumento) {
        this.nombreTipoDocumento = nombreTipoDocumento;
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
