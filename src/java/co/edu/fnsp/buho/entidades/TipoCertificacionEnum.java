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
public enum TipoCertificacionEnum {
    TIPO_CERTIFICACION_OTRO(8);
    
    private final int tipoCertificacion;
    TipoCertificacionEnum (int tipoCertificacion) {
        this.tipoCertificacion = tipoCertificacion;
    }
    
    public int tipoCertificacion() {
        return tipoCertificacion;
    }
}
