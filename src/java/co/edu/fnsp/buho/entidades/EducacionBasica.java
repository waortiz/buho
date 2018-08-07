/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

/**
 *
 * @author William
 */
public class EducacionBasica {

    private int id;
    private int nivel;
    private String nombreNivel;
    private String institucion;
    private int anyoInicio;
    private Integer anyoFinalizacion;
    private String titulo;
    private boolean graduado;
    private boolean certificadoValidado;
    private int consecutivo;
    private String nombreCertificadoValidado;
    private String nombreCertificado;
    private Documento certificado;
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nivel
     */
    public int getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    /**
     * @return the nombreNivel
     */
    public String getNombreNivel() {
        return nombreNivel;
    }

    /**
     * @param nombreNivel the nombreNivel to set
     */
    public void setNombreNivel(String nombreNivel) {
        this.nombreNivel = nombreNivel;
    }

    /**
     * @return the anyoInicio
     */
    public Integer getAnyoInicio() {
        return anyoInicio;
    }

    /**
     * @param anyoInicio the anyoInicio to set
     */
    public void setAnyoInicio(int anyoInicio) {
        this.anyoInicio = anyoInicio;
    }

    /**
     * @return the anyoFinalizacion
     */
    public Integer getAnyoFinalizacion() {
        return anyoFinalizacion;
    }

    /**
     * @param anyoFinalizacion the anyoFinalizacion to set
     */
    public void setAnyoFinalizacion(Integer anyoFinalizacion) {
        this.anyoFinalizacion = anyoFinalizacion;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the graduado
     */
    public boolean isGraduado() {
        return graduado;
    }

    /**
     * @param graduado the graduado to set
     */
    public void setGraduado(boolean graduado) {
        this.graduado = graduado;
    }

    /**
     * @return the certificado
     */
    public Documento getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(Documento certificado) {
        this.certificado = certificado;
    }

    /**
     * @return the institucion
     */
    public String getInstitucion() {
        return institucion;
    }

    /**
     * @param institucion the institucion to set
     */
    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    /**
     * @return the consecutivo
     */
    public int getConsecutivo() {
        return consecutivo;
    }

    /**
     * @param consecutivo the consecutivo to set
     */
    public void setConsecutivo(int consecutivo) {
        this.consecutivo = consecutivo;
    }

    /**
     * @return the certificadoValidado
     */
    public boolean isCertificadoValidado() {
        return certificadoValidado;
    }

    /**
     * @param certificadoValidado the certificadoValidado to set
     */
    public void setCertificadoValidado(boolean certificadoValidado) {
        this.certificadoValidado = certificadoValidado;
    }

    /**
     * @return the nombreCertificadoValidado
     */
    public String getNombreCertificadoValidado() {
        return nombreCertificadoValidado;
    }

    /**
     * @param nombreCertificadoValidado the nombreCertificadoValidado to set
     */
    public void setNombreCertificadoValidado(String nombreCertificadoValidado) {
        this.nombreCertificadoValidado = nombreCertificadoValidado;
    }

    /**
     * @return the nombreCertificado
     */
    public String getNombreCertificado() {
        return nombreCertificado;
    }

    /**
     * @param nombreCertificado the nombreCertificado to set
     */
    public void setNombreCertificado(String nombreCertificado) {
        this.nombreCertificado = nombreCertificado;
    }
}
