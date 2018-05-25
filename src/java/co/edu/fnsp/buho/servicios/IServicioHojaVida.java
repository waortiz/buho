/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.CursoExperienciaDocencia;
import co.edu.fnsp.buho.entidades.Distincion;
import co.edu.fnsp.buho.entidades.Documento;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaDocencia;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import co.edu.fnsp.buho.entidades.Telefono;
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

    void guardarDocumentoSoporte(long idPersona, DocumentoSoporte documentoSoporte);

    List<DocumentoSoporte> obtenerDocumentosSoporte(long idPersona);

    void eliminarDocumentoSoporte(int idDocumentoSoporte);

    void guardarEducacionBasica(long idPersona, EducacionBasica nuevaEducacionBasica);

    List<EducacionBasica> obtenerEducacionesBasicas(long idPersona);
    
    void eliminarEducacionBasica(int idEducacionBasica);
    
    void guardarEducacionSuperior(long idPersona, EducacionSuperior educacionSuperior);

    List<EducacionSuperior> obtenerEducacionesSuperiores(long idPersona);

    void eliminarEducacionSuperior(int idEducacionSuperior);

    void guardarCorreoElectronico(long idPersona, CorreoElectronico correoElectronico);

    List<CorreoElectronico> obtenerCorreosElectronicos(long idPersona);

    void eliminarCorreoElectronico(int idCorreoElectronico);

    void guardarCuentaBancaria(long idPersona, CuentaBancaria cuentaBancaria);

    List<CuentaBancaria> obtenerCuentasBancarias(long idPersona);

    void eliminarCuentaBancaria(int idCuentaBancaria);

    void guardarTelefono(long idPersona, Telefono telefono);

    List<Telefono> obtenerTelefonos(long idPersona);

    void eliminarTelefono(int idTelefono);

    void guardarEducacionContinua(long idPersona, EducacionContinua educacionContinua);

    List<EducacionContinua> obtenerEducacionesContinuas(long idPersona);

    void eliminarEducacionContinua(int idEducacionContinua);

    void eliminarIdioma(int idIdioma);

    List<Idioma> obtenerIdiomas(long idPersona);

    void guardarIdioma(long idPersona, Idioma idioma);

    void eliminarDistincion(int idDistincion);

    List<Distincion> obtenerDistinciones(long idPersona);

    void guardarDistincion(long idPersona, Distincion distincion);

    List<ExperienciaLaboral> obtenerExperienciasLaborales(long idPersona);

    void eliminarExperienciaLaboral(int idExperienciaLaboral);

    void guardarExperienciaLaboral(long idPersona, ExperienciaLaboral experienciaLaboral);

    int guardarExperienciaDocencia(long idPersona, ExperienciaDocencia experienciaDocencia);

    List<ExperienciaDocencia> obtenerExperienciasDocencia(long idPersona);

    void eliminarExperienciaDocencia(int idExperienciaDocencia);

    void guardarCursoExperienciaDocencia(long idPersona, CursoExperienciaDocencia cursoExperienciaDocencia);

    void eliminarCursoExperienciaDocencia(int idCursoExperienciaDocencia);

    void guardarArticulo(long idPersona, Articulo articulo);

    List<Articulo> obtenerArticulos(long idPersona);

    void eliminarArticulo(int idArticulo);

    void guardarPatente(long idPersona, Patente patente);

    List<Patente> obtenerPatentes(long idPersona);
    
    void eliminarPatente(int idPatente);

    List<ProductoConocimiento> obtenerProductoConocimientos(long idPersona);

    void guardarProductoConocimiento(long idPersona, ProductoConocimiento productoConocimiento);
    
    void eliminarProductoConocimiento(int idProductoConocimiento);
}
