/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Persona;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import co.edu.fnsp.buho.repositorios.IRepositorioPersona;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */

@Service("servicioHojaVida")
public class ServicioHojaVida implements IServicioHojaVida {
    
    @Autowired
    private IRepositorioHojaVida repositorioHojaVida;

    @Override
    public void ingresarHojaVida(long idUsuario, HojaVida hojaVida) {
        repositorioHojaVida.ingresarHojaVida(idUsuario, hojaVida);
    }

    @Override
    public void actualizarHojaVida(long idUsuario, HojaVida hojaVida) {
        repositorioHojaVida.actualizarHojaVida(idUsuario, hojaVida);
    }
}
