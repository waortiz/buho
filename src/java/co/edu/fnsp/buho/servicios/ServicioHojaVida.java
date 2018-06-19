/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

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
import co.edu.fnsp.buho.entidades.TipoDocumento;
import co.edu.fnsp.buho.entidades.ValidacionDocumento;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import java.util.ArrayList;
import java.util.List;
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
    public void ingresarHojaVida(HojaVida hojaVida) {
        repositorioHojaVida.ingresarHojaVida(hojaVida);
    }

    @Override
    public void actualizarHojaVida(HojaVida hojaVida) {
        repositorioHojaVida.actualizarHojaVida(hojaVida);
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idPersona, int idTipoDocumento) {
        return repositorioHojaVida.obtenerDocumentoSoporte(idPersona, idTipoDocumento);
    }

    @Override
    public Documento obtenerDocumentoSoporte(long idDocumentoSoporte) {
        return repositorioHojaVida.obtenerDocumentoSoporte(idDocumentoSoporte);
    }

    @Override
    public List<DocumentoSoporte> obtenerDocumentosSoporteComplementarios(long idPersona) {
        List<DocumentoSoporte> documentosSoporteActuales = repositorioHojaVida.obtenerDocumentosSoporte(idPersona);
        List<DocumentoSoporte> documentosSoporte = new ArrayList<>();
        for (DocumentoSoporte documento : documentosSoporteActuales) {
            if (documento.getTipoDocumento() != TipoDocumento.COPIA_CEDULA.getId()
                    && documento.getTipoDocumento() != TipoDocumento.RUT.getId()
                    && documento.getTipoDocumento() != TipoDocumento.LIBRETA_MILITAR.getId()) {
                documentosSoporte.add(documento);
            }
        }

        return documentosSoporte;
    }
        
    @Override
    public List<DocumentoSoporte> obtenerDocumentosSoporteValidar(long idPersona) {
        List<DocumentoSoporte> documentosSoporteActuales = repositorioHojaVida.obtenerDocumentosSoporte(idPersona);
        List<DocumentoSoporte> documentosSoporte = new ArrayList<>();
        for (DocumentoSoporte documento : documentosSoporteActuales) {
            if (documento.getTipoDocumento() != TipoDocumento.PROPUESTA_INVESTIGACION.getId()) { 
                documentosSoporte.add(documento);
            }
        }
        
        return documentosSoporte;
    }
    
    @Override
    public List<DocumentoSoporte> obtenerPropuestasInvestigacion(long idPersona) {
        List<DocumentoSoporte> documentosSoporteActuales = repositorioHojaVida.obtenerDocumentosSoporte(idPersona);
        List<DocumentoSoporte> documentosSoporte = new ArrayList<>();
        for (DocumentoSoporte documento : documentosSoporteActuales) {
            if (documento.getTipoDocumento() == TipoDocumento.PROPUESTA_INVESTIGACION.getId()) {
                documentosSoporte.add(documento);
            }
        }

        return documentosSoporte;
    }

    @Override
    public List<HojaVidaConsulta> obtenerHojasVida(ConsultaHojaVida consultaHojaVida) {
        return repositorioHojaVida.obtenerHojasVida(consultaHojaVida);
    }

    @Override
    public void eliminarHojaVida(long idPersona) {
        repositorioHojaVida.eliminarHojaVida(idPersona);
    }

    @Override
    public boolean existePersona(String numeroIdentificacion) {
        return repositorioHojaVida.existePersona(numeroIdentificacion);
    }

    @Override
    public String obtenerNumeroIdentificacionPersona(long idPersona) {
        return repositorioHojaVida.obtenerNumeroIdentificacionPersona(idPersona);
    }

    @Override
    public HojaVida obtenerHojaVida(long idPersona) {
        return repositorioHojaVida.obtenerHojaVida(idPersona);
    }

    @Override
    public Documento obtenerCertificadoIdioma(int idIdioma) {
        return repositorioHojaVida.obtenerCertificadoIdioma(idIdioma);
    }

    @Override
    public Documento obtenerCertificadoEducacionBasica(int idEducacionBasica) {
        return repositorioHojaVida.obtenerCertificadoEducacionBasica(idEducacionBasica);
    }

    @Override
    public Documento obtenerCertificadoEducacionSuperior(int idEducacionSuperior) {
        return repositorioHojaVida.obtenerCertificadoEducacionSuperior(idEducacionSuperior);
    }

    @Override
    public Documento obtenerCertificadoHomologadoEducacionSuperior(int idEducacionSuperior) {
        return repositorioHojaVida.obtenerCertificadoHomologadoEducacionSuperior(idEducacionSuperior);
    }

    @Override
    public Documento obtenerCertificadoEducacionContinua(int idEducacionContinua) {
        return repositorioHojaVida.obtenerCertificadoEducacionContinua(idEducacionContinua);
    }

    @Override
    public Documento obtenerCertificadoDistincion(int idDistincion) {
        return repositorioHojaVida.obtenerCertificadoDistincion(idDistincion);
    }

    @Override
    public Documento obtenerCertificadoExperienciaLaboral(int idExperienciaLaboral) {
        return repositorioHojaVida.obtenerCertificadoExperienciaLaboral(idExperienciaLaboral);
    }

    @Override
    public Documento obtenerCertificadoCursoExperienciaDocencia(int idCursoExperienciaDocencia) {
        return repositorioHojaVida.obtenerCertificadoCursoExperienciaDocencia(idCursoExperienciaDocencia);
    }

    @Override
    public Documento obtenerDocumentoPatente(int idPatente) {
        return repositorioHojaVida.obtenerDocumentoPatente(idPatente);
    }

    @Override
    public Documento obtenerDocumentoProductoConocimiento(int idProductoConocimiento) {
        return repositorioHojaVida.obtenerDocumentoProductoConocimiento(idProductoConocimiento);
    }

    @Override
    public void ingresarTerminos(long idPersona, Terminos terminos) {
        repositorioHojaVida.ingresarTerminos(idPersona, terminos);
    }

    @Override
    public boolean existenTerminos(long idPersona) {
        return repositorioHojaVida.existenTerminos(idPersona);
    }

    @Override
    public void guardarDocumentoSoporte(long idPersona, DocumentoSoporte documentoSoporte) {
        repositorioHojaVida.guardarDocumentoSoporte(idPersona, documentoSoporte);
    }

    @Override
    public List<DocumentoSoporte> obtenerDocumentosSoporte(long idPersona) {
        return repositorioHojaVida.obtenerDocumentosSoporte(idPersona);
    }

    @Override
    public void eliminarDocumentoSoporte(int idDocumentoSoporte) {
        repositorioHojaVida.eliminarDocumentoSoporte(idDocumentoSoporte);
    }

    @Override
    public void guardarEducacionBasica(long idPersona, EducacionBasica nuevaEducacionBasica) {
        repositorioHojaVida.guardarEducacionBasica(idPersona, nuevaEducacionBasica);
    }

    @Override
    public List<EducacionBasica> obtenerEducacionesBasicas(long idPersona) {
        return repositorioHojaVida.obtenerEducacionesBasicas(idPersona);
    }

    @Override
    public void eliminarEducacionBasica(int idEducacionBasica) {
        repositorioHojaVida.eliminarEducacionBasica(idEducacionBasica);
    }

    @Override
    public void guardarEducacionSuperior(long idPersona, EducacionSuperior nuevaEducacionSuperior) {
        repositorioHojaVida.guardarEducacionSuperior(idPersona, nuevaEducacionSuperior);
    }

    @Override
    public List<EducacionSuperior> obtenerEducacionesSuperiores(long idPersona) {
        return repositorioHojaVida.obtenerEducacionesSuperiores(idPersona);
    }

    @Override
    public void eliminarEducacionSuperior(int idEducacionSuperior) {
        repositorioHojaVida.eliminarEducacionSuperior(idEducacionSuperior);
    }

    @Override
    public void guardarCorreoElectronico(long idPersona, CorreoElectronico correoElectronico) {
        repositorioHojaVida.guardarCorreoElectronico(idPersona, correoElectronico);
    }

    @Override
    public List<CorreoElectronico> obtenerCorreosElectronicos(long idPersona) {
        return repositorioHojaVida.obtenerCorreosElectronicos(idPersona);
    }

    @Override
    public void eliminarCorreoElectronico(int idCorreoElectronico) {
        repositorioHojaVida.eliminarCorreoElectronico(idCorreoElectronico);
    }

    @Override
    public void guardarCuentaBancaria(long idPersona, CuentaBancaria cuentaBancaria) {
        repositorioHojaVida.guardarCuentaBancaria(idPersona, cuentaBancaria);
    }

    @Override
    public List<CuentaBancaria> obtenerCuentasBancarias(long idPersona) {
        return repositorioHojaVida.obtenerCuentasBancarias(idPersona);
    }

    @Override
    public void eliminarCuentaBancaria(int idCuentaBancaria) {
        repositorioHojaVida.eliminarCuentaBancaria(idCuentaBancaria);
    }

    @Override
    public void guardarTelefono(long idPersona, Telefono telefono) {
        repositorioHojaVida.guardarTelefono(idPersona, telefono);
    }

    @Override
    public List<Telefono> obtenerTelefonos(long idPersona) {
        return repositorioHojaVida.obtenerTelefonos(idPersona);
    }

    @Override
    public void eliminarTelefono(int idTelefono) {
        repositorioHojaVida.eliminarTelefono(idTelefono);
    }

    @Override
    public void guardarEducacionContinua(long idPersona, EducacionContinua educacionContinua) {
        repositorioHojaVida.guardarEducacionContinua(idPersona, educacionContinua);
    }

    @Override
    public List<EducacionContinua> obtenerEducacionesContinuas(long idPersona) {
        return repositorioHojaVida.obtenerEducacionesContinuas(idPersona);
    }

    @Override
    public void eliminarEducacionContinua(int idEducacionContinua) {
        repositorioHojaVida.eliminarEducacionContinua(idEducacionContinua);
    }

    @Override
    public void eliminarIdioma(int idIdioma) {
        repositorioHojaVida.eliminarIdioma(idIdioma);
    }

    @Override
    public List<Idioma> obtenerIdiomas(long idPersona) {
        return repositorioHojaVida.obtenerIdiomas(idPersona);
    }

    @Override
    public void guardarIdioma(long idPersona, Idioma idioma) {
        repositorioHojaVida.guardarIdioma(idPersona, idioma);
    }

    @Override
    public void eliminarDistincion(int idDistincion) {
        repositorioHojaVida.eliminarDistincion(idDistincion);
    }

    @Override
    public List<Distincion> obtenerDistinciones(long idPersona) {
        return repositorioHojaVida.obtenerDistinciones(idPersona);
    }

    @Override
    public void guardarDistincion(long idPersona, Distincion distincion) {
        repositorioHojaVida.guardarDistincion(idPersona, distincion);
    }

    @Override
    public List<ExperienciaLaboral> obtenerExperienciasLaborales(long idPersona) {
        return repositorioHojaVida.obtenerExperienciasLaborales(idPersona);
    }

    @Override
    public void eliminarExperienciaLaboral(int idExperienciaLaboral) {
        repositorioHojaVida.eliminarExperienciaLaboral(idExperienciaLaboral);
    }

    @Override
    public void guardarExperienciaLaboral(long idPersona, ExperienciaLaboral experienciaLaboral) {
        repositorioHojaVida.guardarExperienciaLaboral(idPersona, experienciaLaboral);
    }

    @Override
    public int guardarExperienciaDocencia(long idPersona, ExperienciaDocencia experienciaDocencia) {
        return repositorioHojaVida.guardarExperienciaDocencia(idPersona, experienciaDocencia);
    }

    @Override
    public List<ExperienciaDocencia> obtenerExperienciasDocencia(long idPersona) {
        return repositorioHojaVida.obtenerExperienciasDocencia(idPersona);
    }

    @Override
    public void eliminarExperienciaDocencia(int idExperienciaDocencia) {
        repositorioHojaVida.eliminarExperienciaDocencia(idExperienciaDocencia);
    }

    @Override
    public void guardarCursoExperienciaDocencia(long idPersona, CursoExperienciaDocencia cursoExperienciaDocencia) {
        repositorioHojaVida.guardarCursoExperienciaDocencia(idPersona, cursoExperienciaDocencia);
    }

    @Override
    public void eliminarCursoExperienciaDocencia(int idCursoExperienciaDocencia) {
        repositorioHojaVida.eliminarCursoExperienciaDocencia(idCursoExperienciaDocencia);
    }

    @Override
    public void guardarArticulo(long idPersona, Articulo articulo) {
        repositorioHojaVida.guardarArticulo(idPersona, articulo);
    }

    @Override
    public List<Articulo> obtenerArticulos(long idPersona) {
        return repositorioHojaVida.obtenerArticulos(idPersona);
    }

    @Override
    public void eliminarArticulo(int idArticulo) {
        repositorioHojaVida.eliminarArticulo(idArticulo);
    }

    @Override
    public void guardarPatente(long idPersona, Patente patente) {
        repositorioHojaVida.guardarPatente(idPersona, patente);
    }

    @Override
    public List<Patente> obtenerPatentes(long idPersona) {
        return repositorioHojaVida.obtenerPatentes(idPersona);
    }

    @Override
    public void eliminarPatente(int idPatente) {
        repositorioHojaVida.eliminarPatente(idPatente);
    }

    @Override
    public List<ProductoConocimiento> obtenerProductoConocimientos(long idPersona) {
        return repositorioHojaVida.obtenerProductoConocimientos(idPersona);
    }

    @Override
    public void guardarProductoConocimiento(long idPersona, ProductoConocimiento productoConocimiento) {
        repositorioHojaVida.guardarProductoConocimiento(idPersona, productoConocimiento);
    }

    @Override
    public void eliminarProductoConocimiento(int idProductoConocimiento) {
        repositorioHojaVida.eliminarProductoConocimiento(idProductoConocimiento);
    }

    @Override
    public void validarDocumento(long idPersona, ValidacionDocumento validacionDocumento) {
        repositorioHojaVida.validarDocumento(idPersona, validacionDocumento);
    }

    @Override
    public Investigacion obtenerInvestigacion(long idPersona) {
        return repositorioHojaVida.obtenerInvestigacion(idPersona);
    }

    @Override
    public List<CursoExperienciaDocencia> obtenerCursosExperienciaDocencia(long idPersona) {
        return repositorioHojaVida.obtenerCursosExperienciaDocencia(idPersona);
    }

    @Override
    public List<HojaVidaEducacionBasica> obtenerHojasVidaEducacionBasica(ConsultaHojaVidaEducacionBasica consultaHojaVidaEducacionBasica) {
        return repositorioHojaVida.obtenerHojasVidaEducacionBasica(consultaHojaVidaEducacionBasica);
    }

    @Override
    public List<HojaVidaEducacionSuperior> obtenerHojasVidaEducacionSuperior(ConsultaHojaVidaEducacionSuperior consultaHojaVidaEducacionSuperior) {
        return repositorioHojaVida.obtenerHojasVidaEducacionSuperior(consultaHojaVidaEducacionSuperior);
    }

    @Override
    public List<HojaVidaEducacionContinua> obtenerHojasVidaEducacionContinua(ConsultaHojaVidaEducacionContinua consultaHojaVidaEducacionContinua) {
        return repositorioHojaVida.obtenerHojasVidaEducacionContinua(consultaHojaVidaEducacionContinua);
    }

    @Override
    public List<HojaVidaIdioma> obtenerHojasVidaIdioma(ConsultaHojaVidaIdioma consultaHojaVidaIdioma) {
        return repositorioHojaVida.obtenerHojasVidaIdioma(consultaHojaVidaIdioma);
    }

    @Override
    public List<HojaVidaExperiencia> obtenerHojasVidaExperiencia(ConsultaHojaVidaExperiencia consultaHojaVidaExperiencia) {
        return repositorioHojaVida.obtenerHojasVidaExperiencia(consultaHojaVidaExperiencia);
    }
    
    @Override
    public List<HojaVidaTipoExperiencia> obtenerHojasVidaTipoExperiencia(ConsultaHojaVidaTipoExperiencia consultaHojaVidaTipoExperiencia){
        return repositorioHojaVida.obtenerHojasVidaTipoExperiencia(consultaHojaVidaTipoExperiencia);
    }

    @Override
    public List<HojaVidaExperienciaDocencia> obtenerHojasVidaExperienciaDocencia(ConsultaHojaVidaExperienciaDocencia consultaHojaVidaExperienciaDocencia){
        return repositorioHojaVida.obtenerHojasVidaExperienciaDocencia(consultaHojaVidaExperienciaDocencia);
    }

    @Override
    public List<HojaVidaInvestigacion> obtenerHojasVidaInvestigacion(ConsultaHojaVidaInvestigacion consultaHojaVidaInvestigacion) {
        return repositorioHojaVida.obtenerHojasVidaInvestigacion(consultaHojaVidaInvestigacion);
    }
    
    @Override
    public List<HojaVidaDistincion> obtenerHojasVidaDistincion(ConsultaHojaVidaDistincion consultaHojaVidaDistincion) {
        return repositorioHojaVida.obtenerHojasVidaDistincion(consultaHojaVidaDistincion);
    }

    @Override
    public List<Maestro> obtenerNumerosDocumento() {
        return repositorioHojaVida.obtenerNumerosDocumento();
    }

    @Override
    public List<Maestro> obtenerNombres() {
        return repositorioHojaVida.obtenerNombres();
    }

    @Override
    public List<Maestro> obtenerApellidos() {
        return repositorioHojaVida.obtenerApellidos();
    }

    @Override
    public List<HojaVidaSoporte> obtenerHojasVidaSoporte(ConsultaHojaVida consultaHojaVida) {
        return repositorioHojaVida.obtenerHojasVidaSoporte(consultaHojaVida);
    }
    
}
