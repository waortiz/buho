/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.ConsultaHojaVida;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaDistincion;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaEducacionBasica;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaEducacionContinua;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaEducacionSuperior;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaExperiencia;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaExperienciaDocencia;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaIdioma;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaInvestigacion;
import co.edu.fnsp.buho.entidades.ConsultaHojaVidaTipoExperiencia;
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
import co.edu.fnsp.buho.entidades.HojaVidaConsulta;
import co.edu.fnsp.buho.entidades.HojaVidaDistincion;
import co.edu.fnsp.buho.entidades.HojaVidaEducacionBasica;
import co.edu.fnsp.buho.entidades.HojaVidaEducacionContinua;
import co.edu.fnsp.buho.entidades.HojaVidaEducacionSuperior;
import co.edu.fnsp.buho.entidades.HojaVidaExperiencia;
import co.edu.fnsp.buho.entidades.HojaVidaExperienciaDocencia;
import co.edu.fnsp.buho.entidades.HojaVidaIdioma;
import co.edu.fnsp.buho.entidades.HojaVidaInvestigacion;
import co.edu.fnsp.buho.entidades.HojaVidaSoporte;
import co.edu.fnsp.buho.entidades.HojaVidaTipoExperiencia;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.Investigacion;
import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import co.edu.fnsp.buho.entidades.Telefono;
import co.edu.fnsp.buho.entidades.Terminos;
import co.edu.fnsp.buho.entidades.ValidacionDocumento;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioHojaVida {
    
    void actualizarHojaVida(HojaVida hojaVida);

    long ingresarHojaVida(HojaVida hojaVida);
    
    void eliminarHojaVida(long idPersona);

    boolean existePersona(String numeroIdentificacion);

    String obtenerNumeroIdentificacionPersona(long idPersona);

    HojaVida obtenerHojaVida(long idPersona);
    
    HojaVida obtenerPersona(long idPersona);

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

    Documento obtenerDocumentoProductoConocimiento(int idProductoConocimiento);

    Documento obtenerDocumentoPatente(int idPatente);

    void ingresarTerminos(long idPersona, Terminos terminos);

    boolean existenTerminos(long idPersona);

    List<DocumentoSoporte> obtenerDocumentosSoporte(long idPersona);

    void guardarDocumentoSoporte(long idPersona, DocumentoSoporte documentoSoporte);

    void eliminarDocumentoSoporte(int idDocumentoSoporte);

    void guardarEducacionBasica(long idPersona, EducacionBasica nuevaEducacionBasica);

    List<EducacionBasica> obtenerEducacionesBasicas(long idPersona);

    void eliminarEducacionBasica(int idEducacionBasica);
    
    void guardarEducacionSuperior(long idPersona, EducacionSuperior nuevaEducacionSuperior);

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

    void validarDocumento(long idPersona, ValidacionDocumento validacionDocumento);

    Investigacion obtenerInvestigacion(long idPersona);
    
    List<CursoExperienciaDocencia> obtenerCursosExperienciaDocencia(long idPersona);

    List<HojaVidaConsulta> obtenerHojasVida(ConsultaHojaVida consultaHojaVida);

    List<HojaVidaEducacionBasica> obtenerHojasVidaEducacionBasica(ConsultaHojaVidaEducacionBasica consultaHojaVidaEducacionBasica);

    List<HojaVidaEducacionSuperior> obtenerHojasVidaEducacionSuperior(ConsultaHojaVidaEducacionSuperior consultaHojaVidaEducacionSuperior);

    List<HojaVidaEducacionContinua> obtenerHojasVidaEducacionContinua(ConsultaHojaVidaEducacionContinua consultaHojaVidaEducacionContinua);
    
    List<HojaVidaIdioma> obtenerHojasVidaIdioma(ConsultaHojaVidaIdioma consultaHojaVidaIdioma);

    List<HojaVidaExperiencia> obtenerHojasVidaExperiencia(ConsultaHojaVidaExperiencia consultaHojaVidaExperiencia);
    
    List<HojaVidaTipoExperiencia> obtenerHojasVidaTipoExperiencia(ConsultaHojaVidaTipoExperiencia consultaHojaVidaTipoExperiencia);
    
    List<HojaVidaExperienciaDocencia> obtenerHojasVidaExperienciaDocencia(ConsultaHojaVidaExperienciaDocencia consultaHojaVidaExperienciaDocencia);
    
    List<HojaVidaInvestigacion> obtenerHojasVidaInvestigacion(ConsultaHojaVidaInvestigacion consultaHojaVidaInvestigacion);

    List<HojaVidaDistincion> obtenerHojasVidaDistincion(ConsultaHojaVidaDistincion consultaHojaVidaDistincion);
    
    List<Maestro> obtenerNumerosDocumento();
    
    List<Maestro> obtenerNombres();
    
    List<Maestro> obtenerApellidos();

    List<HojaVidaSoporte> obtenerHojasVidaSoporte(ConsultaHojaVida consultaHojaVida);

    public List<CorreoElectronico> obtenerCorreosElectronicosValidadores();
}
