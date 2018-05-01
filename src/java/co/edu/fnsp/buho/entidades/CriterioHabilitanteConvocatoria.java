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
    private int campoHojaVida;
    private String nombreCampoHojaVida;
    private String valor;

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
    
}
