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

    Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento);
    
    Documento obtenerDocumentoSoporte(long idDocumentoSoporte);

    List<HojaVida> obtenerHojasVida();

    void eliminarHojaVida(long idPersona);
    
    boolean existePersona(String numeroIdentificacion);

    String obtenerNumeroIdentificacionPersona(long idPersona);

    HojaVida obtenerHojaVida(long idPersona);

    Documento obtenerCertificadoIdioma(int idIdioma);

    Documento obtenerCertificadoEducacionBasica(int idEducacionBasica);

    public Documento obtenerCertificadoEducacionSuperior(int idEducacionSuperior);

    public Documento obtenerCertificadoHomologadoEducacionSuperior(int idEducacionSuperior);
}
