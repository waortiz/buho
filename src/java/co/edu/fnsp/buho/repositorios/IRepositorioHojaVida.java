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
    
    List<HojaVida> obtenerHojasVida();

    void eliminarHojaVida(long idPersona);

    boolean existePersona(String numeroIdentificacion);

    String obtenerNumeroIdentificacionPersona(long idPersona);

    HojaVida obtenerHojaVida(long idPersona);

    Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento);
    
    Documento obtenerDocumentoSoporte(long idDocumentoSoporte);
    
    Documento obtenerCertificadoEducacionBasica(int idEducacionBasica);

    Documento obtenerCertificadoIdioma(int idIdioma);
    
    Documento obtenerCertificadoEducacionSuperior(int idEducacionSuperior);
    
    Documento obtenerCertificadoHomologadoEducacionSuperior(int idEducacionSuperior);
    
    Documento obtenerCertificadoEducacionContinua(int idEducacionContinua);

    Documento obtenerCertificadoDistincion(int idDistincion);
    
    Documento obtenerCertificadoExperienciaLaboral(int idExperienciaLaboral);
    
    Documento obtenerCertificadoCursoExperienciaDocencia(int idCursoExperienciaDocencia);

    Documento obtenerDocumentoProductoConocimento(int idProductoConocimento);

    Documento obtenerDocumentoPatente(int idPatente);
}
