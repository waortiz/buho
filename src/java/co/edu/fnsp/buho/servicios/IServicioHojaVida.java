/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.HojaVida;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioHojaVida {
        
    void ingresarHojaVida(long idUsuario, HojaVida hojaVidaIngresar);

    void actualizarHojaVida(long idUsuario, HojaVida hojaVidaIngresar);

    Documento obtenerDocumentoSoporte(int idPersona, int idTipoDocumento);

    List<HojaVida> obtenerHojasVida();

    void eliminarHojaVida(long idPersona);
}
