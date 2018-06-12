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
public class ResultadoConvocatoria {
    private int idConvocatoria;
    private Documento resultado;

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
     * @return the resultado
     */
    public Documento getResultado() {
        return resultado;
    }

    /**
     * @param resultado the resultado to set
     */
    public void setResultado(Documento resultado) {
        this.resultado = resultado;
    }
    
}
