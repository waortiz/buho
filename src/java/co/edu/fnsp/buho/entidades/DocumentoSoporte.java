/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

/**
 *
 * @author William
 */
public class DocumentoSoporte {

    private int id;
    private int tipoDocumento;
    private int consecutivo;
    private boolean validado;
    private String nombreValidado;
    private String nombreTipoDocumento;
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
     * @return the tipoDocumento
     */
    public int getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * @param tipoDocumento the tipoDocumento to set
     */
    public void setTipoDocumento(int tipoDocumento) {
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
    * @return the validado
    */
    public boolean isValidado() {
        return validado;
    }

    /**
     * @param validado the validado to set
     */
    public void setValidado(boolean validado) {
        this.validado = validado;
    }

    /**
     * @return the nombreValidado
     */
    public String getNombreValidado() {
        return nombreValidado;
    }

    /**
     * @param nombreValidado the nombreValidado to set
     */
    public void setNombreValidado(String nombreValidado) {
        this.nombreValidado = nombreValidado;
    }

}
