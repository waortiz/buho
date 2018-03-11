/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.HojaVida;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioHojaVida {
    
    void actualizarHojaVida(long idUsuario, HojaVida hojaVida);

    void ingresarHojaVida(long idUsuario, HojaVida hojaVida);
    
    Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento);

    List<HojaVida> obtenerHojaVida();

    void eliminarHojaVida(long idPersona);

    boolean existePersona(String numeroIdentificacion);

    String obtenerNumeroIdentificacionPersona(long idPersona);

    HojaVida obtenerHojaVida(long idPersona);
}
