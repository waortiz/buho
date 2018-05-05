/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Terminos;
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

    Documento obtenerCertificadoEducacionSuperior(int idEducacionSuperior);

    Documento obtenerCertificadoHomologadoEducacionSuperior(int idEducacionSuperior);

    Documento obtenerCertificadoEducacionContinua(int idEducacionContinua);
    
    Documento obtenerCertificadoDistincion(int idDistincion);
    
    Documento obtenerCertificadoExperienciaLaboral(int idExperienciaLaboral);

    Documento obtenerCertificadoCursoExperienciaDocencia(int idCursoExperienciaDocencia);

    Documento obtenerDocumentoPatente(int idPatente);

    Documento obtenerDocumentoProductoConocimiento(int idProductoConocimiento);

    void ingresarTerminos(long idPersona, Terminos terminos);
    
    boolean existenTerminos(long idPersona);
}
