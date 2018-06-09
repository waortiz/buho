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
public class CriterioHabilitanteConvocatoria {
    private int id;
    private int idConvocatoria;
    private int consecutivo;
    private int campoHojaVida;
    private String nombreCampoHojaVida;
    private String valor;
    private String texto;

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
     * @return the idConvocatoria
     */
    public int getIdConvocatoria() {
        return idConvocatoria;
    }

    /**
     * @param idConvocatoria the idConvocatoria to set
     */
    public void setIdConvocatoria(int idConvocatoria) {
        this.idConvocatoria = idConvocatoria;
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
     * @return the campoHojaVida
     */
    public int getCampoHojaVida() {
        return campoHojaVida;
    }

    /**
     * @param campoHojaVida the campoHojaVida to set
     */
    public void setCampoHojaVida(int campoHojaVida) {
        this.campoHojaVida = campoHojaVida;
    }

    /**
     * @return the nombreCampoHojaVida
     */
    public String getNombreCampoHojaVida() {
        return nombreCampoHojaVida;
    }

    /**
     * @param nombreCampoHojaVida the nombreCampoHojaVida to set
     */
    public void setNombreCampoHojaVida(String nombreCampoHojaVida) {
        this.nombreCampoHojaVida = nombreCampoHojaVida;
    }

    /**
     * @return the valor
     */
    public String getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(String valor) {
        this.valor = valor;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }
    
}
