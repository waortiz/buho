/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.HojaVida;

/**
 *
 * @author William
 */
public interface IServicioHojaVida {
        
    public void ingresarHojaVida(long idUsuario, HojaVida hojaVidaIngresar);

    public void actualizarHojaVida(long idUsuario, HojaVida hojaVidaIngresar);
}
