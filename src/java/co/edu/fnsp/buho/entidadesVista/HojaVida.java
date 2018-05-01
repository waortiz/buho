/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.CuentaBancaria;
import co.edu.fnsp.buho.entidades.Telefono;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class HojaVida {

    private int idPersona;
    private String tipoIdentificacion;
    private String nombreTipoIdentificacion;
    private String numeroIdentificacion;
    private MultipartFile copiaDocumentoIdentificacion;
    private boolean copiaDocumentoIdentificacionValidado;
    private boolean tieneCopiaDocumentoIdentificacion;
    private String nombres;
    private String apellidos;
    private String sexo;
    private String fechaExpedicion;
    private String fechaNacimiento;    
    private String lugarNacimiento;
    private String nombreLugarNacimiento;
    private String nacionalidad;
    private String nombreNacionalidad;
    private String libretaMilitar;
    private String distritoClase;
    private MultipartFile copiaLibretaMilitar;
    private boolean tieneCopiaLibretaMilitar;
    private boolean copiaLibretaMilitarValidado;
    private String ciudadResidencia;
    private String nombreCiudadResidencia;
    private String direccion;
    private String grupoEtnico;
    private String nombreGrupoEtnico;
    private String nombreDiscapacidad;
    private String discapacidad;
    private MultipartFile documentoRUT;
    private boolean documentoRUTValidado;
    private boolean tieneDocumentoRUT;
    private boolean disponeRUT;
    private String nombreActividadEconomica;
    private String actividadEconomica;
    private boolean disponibilidadViajar;
    private boolean egresadoUDEA;
    private boolean empleadoUDEA;
    private String lugarExpedicion;
    private String nombreLugarExpedicion;
    private String tipoVinculacion;
    private String perfil;
    private boolean investigadorReconocidoColciencias;
    private String urlCVLAC;
    private String tipoInvestigador;
    private String nombreTipoInvestigador;
    private String codigoORCID;
    private String identificadorScopus;
    private String researcherId;    
    private List<Telefono> telefonos = new ArrayList<>();
    private List<CuentaBancaria> cuentasBancarias = new ArrayList<>();
    private List<CorreoElectronico> correosElectronicos = new ArrayList<>();
    private List<DocumentoSoporte> documentosSoporte = new ArrayList<>();
    private List<Idioma> idiomas = new ArrayList<>();
    private List<EducacionBasica> educacionesBasicas = new ArrayList<>();
    private List<EducacionSuperior> educacionesSuperiores = new ArrayList<>();
    private List<EducacionContinua> educacionesContinuas = new ArrayList<>();
    private List<Distincion> distinciones = new ArrayList<>();
    private List<ExperienciaLaboral> experienciasLaborales = new ArrayList<>();
    private List<ExperienciaDocencia> experienciasDocencia = new ArrayList<>();
    private List<Articulo> articulos = new ArrayList<>();
    private List<Patente> patentes = new ArrayList<>();
    private List<ProductoConocimiento> productosConocimiento = new ArrayList<>();
    
    /**
     * @return the tipoIdentificacion
     */
    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    /**
     * @param tipoIdentificacion the tipoIdentificacion to set
     */
    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    /**
     * @return the nombreTipoIdentificacion
     */
    public String getNombreTipoIdentificacion() {
        return nombreTipoIdentificacion;
    }

    /**
     * @param nombreTipoIdentificacion the nombreTipoIdentificacion to set
     */
    public void setNombreTipoIdentificacion(String nombreTipoIdentificacion) {
        this.nombreTipoIdentificacion = nombreTipoIdentificacion;
    }

    /**
     * @return the numeroIdentificacion
     */
    public String getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    /**
     * @param numeroIdentificacion the numeroIdentificacion to set
     */
    public void setNumeroIdentificacion(String numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    /**
     * @return the copiaDocumentoIdentificacion
     */
    public MultipartFile getCopiaDocumentoIdentificacion() {
        return copiaDocumentoIdentificacion;
    }

    /**
     * @param copiaDocumentoIdentificacion the copiaDocumentoIdentificacion to set
     */
    public void setCopiaDocumentoIdentificacion(MultipartFile copiaDocumentoIdentificacion) {
        this.copiaDocumentoIdentificacion = copiaDocumentoIdentificacion;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the fechaExpedicion
     */
    public String getFechaExpedicion() {
        return fechaExpedicion;
    }

    /**
     * @param fechaExpedicion the fechaExpedicion to set
     */
    public void setFechaExpedicion(String fechaExpedicion) {
        this.fechaExpedicion = fechaExpedicion;
    }

    /**
     * @return the fechaNacimiento
     */
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * @return the lugarNacimiento
     */
    public String getLugarNacimiento() {
        return lugarNacimiento;
    }

    /**
     * @param lugarNacimiento the lugarNacimiento to set
     */
    public void setLugarNacimiento(String lugarNacimiento) {
        this.lugarNacimiento = lugarNacimiento;
    }

    /**
     * @return the nombreLugarNacimiento
     */
    public String getNombreLugarNacimiento() {
        return nombreLugarNacimiento;
    }

    /**
     * @param nombreLugarNacimiento the nombreLugarNacimiento to set
     */
    public void setNombreLugarNacimiento(String nombreLugarNacimiento) {
        this.nombreLugarNacimiento = nombreLugarNacimiento;
    }

    /**
     * @return the nacionalidad
     */
    public String getNacionalidad() {
        return nacionalidad;
    }

    /**
     * @param nacionalidad the nacionalidad to set
     */
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    /**
     * @return the nombreNacionalidad
     */
    public String getNombreNacionalidad() {
        return nombreNacionalidad;
    }

    /**
     * @param nombreNacionalidad the nombreNacionalidad to set
     */
    public void setNombreNacionalidad(String nombreNacionalidad) {
        this.nombreNacionalidad = nombreNacionalidad;
    }

    /**
     * @return the libretaMilitar
     */
    public String getLibretaMilitar() {
        return libretaMilitar;
    }

    /**
     * @param libretaMilitar the libretaMilitar to set
     */
    public void setLibretaMilitar(String libretaMilitar) {
        this.libretaMilitar = libretaMilitar;
    }

    /**
     * @return the distritoClase
     */
    public String getDistritoClase() {
        return distritoClase;
    }

    /**
     * @param distritoClase the distritoClase to set
     */
    public void setDistritoClase(String distritoClase) {
        this.distritoClase = distritoClase;
    }

    /**
     * @return the ciudadResidencia
     */
    public String getCiudadResidencia() {
        return ciudadResidencia;
    }

    /**
     * @param ciudadResidencia the ciudadResidencia to set
     */
    public void setCiudadResidencia(String ciudadResidencia) {
        this.ciudadResidencia = ciudadResidencia;
    }

    /**
     * @return the nombreCiudadResidencia
     */
    public String getNombreCiudadResidencia() {
        return nombreCiudadResidencia;
    }

    /**
     * @param nombreCiudadResidencia the nombreCiudadResidencia to set
     */
    public void setNombreCiudadResidencia(String nombreCiudadResidencia) {
        this.nombreCiudadResidencia = nombreCiudadResidencia;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the grupoEtnico
     */
    public String getGrupoEtnico() {
        return grupoEtnico;
    }

    /**
     * @param grupoEtnico the grupoEtnico to set
     */
    public void setGrupoEtnico(String grupoEtnico) {
        this.grupoEtnico = grupoEtnico;
    }

    /**
     * @return the nombreGrupoEtnico
     */
    public String getNombreGrupoEtnico() {
        return nombreGrupoEtnico;
    }

    /**
     * @param nombreGrupoEtnico the nombreGrupoEtnico to set
     */
    public void setNombreGrupoEtnico(String nombreGrupoEtnico) {
        this.nombreGrupoEtnico = nombreGrupoEtnico;
    }

    /**
     * @return the nombreDiscapacidad
     */
    public String getNombreDiscapacidad() {
        return nombreDiscapacidad;
    }

    /**
     * @param nombreDiscapacidad the nombreDiscapacidad to set
     */
    public void setNombreDiscapacidad(String nombreDiscapacidad) {
        this.nombreDiscapacidad = nombreDiscapacidad;
    }

    /**
     * @return the discapacidad
     */
    public String getDiscapacidad() {
        return discapacidad;
    }

    /**
     * @param discapacidad the discapacidad to set
     */
    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

    /**
     * @return the documentoRUT
     */
    public MultipartFile getDocumentoRUT() {
        return documentoRUT;
    }

    /**
     * @param documentoRUT the documentoRUT to set
     */
    public void setDocumentoRUT(MultipartFile documentoRUT) {
        this.documentoRUT = documentoRUT;
    }

    /**
     * @return the disponeRUT
     */
    public boolean isDisponeRUT() {
        return disponeRUT;
    }

    /**
     * @param disponeRUT the disponeRUT to set
     */
    public void setDisponeRUT(boolean disponeRUT) {
        this.disponeRUT = disponeRUT;
    }

    /**
     * @return the nombreActividadEconomica
     */
    public String getNombreActividadEconomica() {
        return nombreActividadEconomica;
    }

    /**
     * @param nombreActividadEconomica the nombreActividadEconomica to set
     */
    public void setNombreActividadEconomica(String nombreActividadEconomica) {
        this.nombreActividadEconomica = nombreActividadEconomica;
    }

    /**
     * @return the actividadEconomica
     */
    public String getActividadEconomica() {
        return actividadEconomica;
    }

    /**
     * @param actividadEconomica the actividadEconomica to set
     */
    public void setActividadEconomica(String actividadEconomica) {
        this.actividadEconomica = actividadEconomica;
    }

    /**
     * @return the disponibilidadViajar
     */
    public boolean isDisponibilidadViajar() {
        return disponibilidadViajar;
    }

    /**
     * @param disponibilidadViajar the disponibilidadViajar to set
     */
    public void setDisponibilidadViajar(boolean disponibilidadViajar) {
        this.disponibilidadViajar = disponibilidadViajar;
    }

    /**
     * @return the egresadoUDEA
     */
    public boolean isEgresadoUDEA() {
        return egresadoUDEA;
    }

    /**
     * @param egresadoUDEA the egresadoUDEA to set
     */
    public void setEgresadoUDEA(boolean egresadoUDEA) {
        this.egresadoUDEA = egresadoUDEA;
    }

    /**
     * @return the empleadoUDEA
     */
    public boolean isEmpleadoUDEA() {
        return empleadoUDEA;
    }

    /**
     * @param empleadoUDEA the empleadoUDEA to set
     */
    public void setEmpleadoUDEA(boolean empleadoUDEA) {
        this.empleadoUDEA = empleadoUDEA;
    }

    /**
     * @return the lugarExpedicion
     */
    public String getLugarExpedicion() {
        return lugarExpedicion;
    }

    /**
     * @param lugarExpedicion the lugarExpedicion to set
     */
    public void setLugarExpedicion(String lugarExpedicion) {
        this.lugarExpedicion = lugarExpedicion;
    }

    /**
     * @return the tipoVinculacion
     */
    public String getTipoVinculacion() {
        return tipoVinculacion;
    }

    /**
     * @param tipoVinculacion the tipoVinculacion to set
     */
    public void setTipoVinculacion(String tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }

    /**
     * @return the telefonos
     */
    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    /**
     * @param telefonos the telefonos to set
     */
    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }

    /**
     * @return the cuentasBancarias
     */
    public List<CuentaBancaria> getCuentasBancarias() {
        return cuentasBancarias;
    }

    /**
     * @param cuentasBancarias the cuentasBancarias to set
     */
    public void setCuentasBancarias(List<CuentaBancaria> cuentasBancarias) {
        this.cuentasBancarias = cuentasBancarias;
    }

    /**
     * @return the correosElectronicos
     */
    public List<CorreoElectronico> getCorreosElectronicos() {
        return correosElectronicos;
    }

    /**
     * @param correosElectronicos the correosElectronicos to set
     */
    public void setCorreosElectronicos(List<CorreoElectronico> correosElectronicos) {
        this.correosElectronicos = correosElectronicos;
    }

    /**
     * @return the idPersona
     */
    public int getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    /**
     * @return the nombreLugarExpedicion
     */
    public String getNombreLugarExpedicion() {
        return nombreLugarExpedicion;
    }

    /**
     * @param nombreLugarExpedicion the nombreLugarExpedicion to set
     */
    public void setNombreLugarExpedicion(String nombreLugarExpedicion) {
        this.nombreLugarExpedicion = nombreLugarExpedicion;
    }

    /**
     * @return the copiaDocumentoIdentificacionValidado
     */
    public boolean isCopiaDocumentoIdentificacionValidado() {
        return copiaDocumentoIdentificacionValidado;
    }

    /**
     * @param copiaDocumentoIdentificacionValidado the copiaDocumentoIdentificacionValidado to set
     */
    public void setCopiaDocumentoIdentificacionValidado(boolean copiaDocumentoIdentificacionValidado) {
        this.copiaDocumentoIdentificacionValidado = copiaDocumentoIdentificacionValidado;
    }

    /**
     * @return the documentoRUTValidado
     */
    public boolean isDocumentoRUTValidado() {
        return documentoRUTValidado;
    }

    /**
     * @param documentoRUTValidado the documentoRUTValidado to set
     */
    public void setDocumentoRUTValidado(boolean documentoRUTValidado) {
        this.documentoRUTValidado = documentoRUTValidado;
    }

    /**
     * @return the tieneDocumentoRUT
     */
    public boolean isTieneDocumentoRUT() {
        return tieneDocumentoRUT;
    }

    /**
     * @param tieneDocumentoRUT the tieneDocumentoRUT to set
     */
    public void setTieneDocumentoRUT(boolean tieneDocumentoRUT) {
        this.tieneDocumentoRUT = tieneDocumentoRUT;
    }

    /**
     * @return the tieneCopiaDocumentoIdentificacion
     */
    public boolean isTieneCopiaDocumentoIdentificacion() {
        return tieneCopiaDocumentoIdentificacion;
    }

    /**
     * @param tieneCopiaDocumentoIdentificacion the tieneCopiaDocumentoIdentificacion to set
     */
    public void setTieneCopiaDocumentoIdentificacion(boolean tieneCopiaDocumentoIdentificacion) {
        this.tieneCopiaDocumentoIdentificacion = tieneCopiaDocumentoIdentificacion;
    }

    /**
     * @return the copiaLibretaMilitar
     */
    public MultipartFile getCopiaLibretaMilitar() {
        return copiaLibretaMilitar;
    }

    /**
     * @param copiaLibretaMilitar the copiaLibretaMilitar to set
     */
    public void setCopiaLibretaMilitar(MultipartFile copiaLibretaMilitar) {
        this.copiaLibretaMilitar = copiaLibretaMilitar;
    }

    /**
     * @return the tieneCopiaLibretaMilitar
     */
    public boolean isTieneCopiaLibretaMilitar() {
        return tieneCopiaLibretaMilitar;
    }

    /**
     * @param tieneCopiaLibretaMilitar the tieneCopiaLibretaMilitar to set
     */
    public void setTieneCopiaLibretaMilitar(boolean tieneCopiaLibretaMilitar) {
        this.tieneCopiaLibretaMilitar = tieneCopiaLibretaMilitar;
    }

    /**
     * @return the copiaLibretaMilitarValidado
     */
    public boolean isCopiaLibretaMilitarValidado() {
        return copiaLibretaMilitarValidado;
    }

    /**
     * @return the perfil
     */
    public String getPerfil() {
        return perfil;
    }

    /**
     * @param perfil the perfil to set
     */
    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    /**
     * @return the idiomas
     */
    public List<Idioma> getIdiomas() {
        return idiomas;
    }

    /**
     * @param idiomas the idiomas to set
     */
    public void setIdiomas(List<Idioma> idiomas) {
        this.idiomas = idiomas;
    }

    /**
     * @return the documentosSoporte
     */
    public List<DocumentoSoporte> getDocumentosSoporte() {
        return documentosSoporte;
    }

    /**
     * @param documentosSoporte the documentosSoporte to set
     */
    public void setDocumentosSoporte(List<DocumentoSoporte> documentosSoporte) {
        this.documentosSoporte = documentosSoporte;
    }    

    /**
     * @return the educacionesBasicas
     */
    public List<EducacionBasica> getEducacionesBasicas() {
        return educacionesBasicas;
    }

    /**
     * @param educacionesBasicas the educacionesBasicas to set
     */
    public void setEducacionesBasicas(List<EducacionBasica> educacionesBasicas) {
        this.educacionesBasicas = educacionesBasicas;
    }

    /**
     * @return the educacionesSuperiores
     */
    public List<EducacionSuperior> getEducacionesSuperiores() {
        return educacionesSuperiores;
    }

    /**
     * @param educacionesSuperiores the educacionesSuperiores to set
     */
    public void setEducacionesSuperiores(List<EducacionSuperior> educacionesSuperiores) {
        this.educacionesSuperiores = educacionesSuperiores;
    }

    /**
     * @return the educacionesContinuas
     */
    public List<EducacionContinua> getEducacionesContinuas() {
        return educacionesContinuas;
    }

    /**
     * @param educacionesContinuas the educacionesContinuas to set
     */
    public void setEducacionesContinuas(List<EducacionContinua> educacionesContinuas) {
        this.educacionesContinuas = educacionesContinuas;
    }

    /**
     * @return the distinciones
     */
    public List<Distincion> getDistinciones() {
        return distinciones;
    }

    /**
     * @param distinciones the distinciones to set
     */
    public void setDistinciones(List<Distincion> distinciones) {
        this.distinciones = distinciones;
    }

    /**
     * @return the experienciasLaborales
     */
    public List<ExperienciaLaboral> getExperienciasLaborales() {
        return experienciasLaborales;
    }

    /**
     * @param experienciasLaborales the experienciasLaborales to set
     */
    public void setExperienciasLaborales(List<ExperienciaLaboral> experienciasLaborales) {
        this.experienciasLaborales = experienciasLaborales;
    }

    /**
     * @return the experienciasDocencia
     */
    public List<ExperienciaDocencia> getExperienciasDocencia() {
        return experienciasDocencia;
    }

    /**
     * @param experienciasDocencia the experienciasDocencia to set
     */
    public void setExperienciasDocencia(List<ExperienciaDocencia> experienciasDocencia) {
        this.experienciasDocencia = experienciasDocencia;
    }

    /**
     * @param copiaLibretaMilitarValidado the copiaLibretaMilitarValidado to set
     */
    public void setCopiaLibretaMilitarValidado(boolean copiaLibretaMilitarValidado) {
        this.copiaLibretaMilitarValidado = copiaLibretaMilitarValidado;
    }

    /**
     * @return the investigadorReconocidoColciencias
     */
    public boolean isInvestigadorReconocidoColciencias() {
        return investigadorReconocidoColciencias;
    }

    /**
     * @param investigadorReconocidoColciencias the investigadorReconocidoColciencias to set
     */
    public void setInvestigadorReconocidoColciencias(boolean investigadorReconocidoColciencias) {
        this.investigadorReconocidoColciencias = investigadorReconocidoColciencias;
    }

    /**
     * @return the urlCVLAC
     */
    public String getUrlCVLAC() {
        return urlCVLAC;
    }

    /**
     * @param urlCVLAC the urlCVLAC to set
     */
    public void setUrlCVLAC(String urlCVLAC) {
        this.urlCVLAC = urlCVLAC;
    }

    /**
     * @return the tipoInvestigador
     */
    public String getTipoInvestigador() {
        return tipoInvestigador;
    }

    /**
     * @param tipoInvestigador the tipoInvestigador to set
     */
    public void setTipoInvestigador(String tipoInvestigador) {
        this.tipoInvestigador = tipoInvestigador;
    }

    /**
     * @return the nombreTipoInvestigador
     */
    public String getNombreTipoInvestigador() {
        return nombreTipoInvestigador;
    }

    /**
     * @param nombreTipoInvestigador the nombreTipoInvestigador to set
     */
    public void setNombreTipoInvestigador(String nombreTipoInvestigador) {
        this.nombreTipoInvestigador = nombreTipoInvestigador;
    }

    /**
     * @return the codigoORCID
     */
    public String getCodigoORCID() {
        return codigoORCID;
    }

    /**
     * @param codigoORCID the codigoORCID to set
     */
    public void setCodigoORCID(String codigoORCID) {
        this.codigoORCID = codigoORCID;
    }

    /**
     * @return the identificadorScopus
     */
    public String getIdentificadorScopus() {
        return identificadorScopus;
    }

    /**
     * @param identificadorScopus the identificadorScopus to set
     */
    public void setIdentificadorScopus(String identificadorScopus) {
        this.identificadorScopus = identificadorScopus;
    }

    /**
     * @return the researcherId
     */
    public String getResearcherId() {
        return researcherId;
    }

    /**
     * @param researcherId the researcherId to set
     */
    public void setResearcherId(String researcherId) {
        this.researcherId = researcherId;
    }

    /**
     * @return the articulos
     */
    public List<Articulo> getArticulos() {
        return articulos;
    }

    /**
     * @param articulos the articulos to set
     */
    public void setArticulos(List<Articulo> articulos) {
        this.articulos = articulos;
    }

    /**
     * @return the patentes
     */
    public List<Patente> getPatentes() {
        return patentes;
    }

    /**
     * @param patentes the patentes to set
     */
    public void setPatentes(List<Patente> patentes) {
        this.patentes = patentes;
    }

    /**
     * @return the productosConocimiento
     */
    public List<ProductoConocimiento> getProductosConocimiento() {
        return productosConocimiento;
    }

    /**
     * @param productosConocimiento the productosConocimiento to set
     */
    public void setProductosConocimiento(List<ProductoConocimiento> productosConocimiento) {
        this.productosConocimiento = productosConocimiento;
    }
}
