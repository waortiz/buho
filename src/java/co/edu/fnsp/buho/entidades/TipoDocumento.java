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
public enum TipoDocumento {
    FOTO(1), 
    COPIA_CEDULA(2), 
    RUT(3), 
    CERTIFICACION_BANCARIA(4), 
    CERTIFICADO_EPS(5), 
    CERTIFICADO_AFP(6), 
    CERTIFICADO_ARL(7),
    LIBRETA_MILITAR(8),
    PROPUESTA_INVESTIGACION(9);

    private int id;

    private TipoDocumento(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
