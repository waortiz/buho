/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class EducacionSuperior {

    private int id;
    private String nivel;
    private String nombreNivel;
    private String paisTituloExterior;
    private String nombrePaisTituloExterior;
    private String institucion;
    private String nombreInstitucion;
    private boolean tituloExterior;
    private String programa;
    private String nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    private String anyoInicio;
    private String anyoFinalizacion;
    private String titulo;
    private boolean graduado;
    private String fechaTitulo;
    private MultipartFile certificado;
    private MultipartFile certificadoHomologado;

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
    public String getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(String nivel) {
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
     * @return the nombreInstitucion
     */
    public String getNombreInstitucion() {
        return nombreInstitucion;
    }

    /**
     * @param nombreInstitucion the nombreInstitucion to set
     */
    public void setNombreInstitucion(String nombreInstitucion) {
        this.nombreInstitucion = nombreInstitucion;
    }

    /**
     * @return the anyoInicio
     */
    public String getAnyoInicio() {
        return anyoInicio;
    }

    /**
     * @param anyoInicio the anyoInicio to set
     */
    public void setAnyoInicio(String anyoInicio) {
        this.anyoInicio = anyoInicio;
    }

    /**
     * @return the anyoFinalizacion
     */
    public String getAnyoFinalizacion() {
        return anyoFinalizacion;
    }

    /**
     * @param anyoFinalizacion the anyoFinalizacion to set
     */
    public void setAnyoFinalizacion(String anyoFinalizacion) {
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
     * @return the programa
     */
    public String getPrograma() {
        return programa;
    }

    /**
     * @param programa the programa to set
     */
    public void setPrograma(String programa) {
        this.programa = programa;
    }

    /**
     * @return the nucleoBasicoConocimiento
     */
    public String getNucleoBasicoConocimiento() {
        return nucleoBasicoConocimiento;
    }

    /**
     * @param nucleoBasicoConocimiento the nucleoBasicoConocimiento to set
     */
    public void setNucleoBasicoConocimiento(String nucleoBasicoConocimiento) {
        this.nucleoBasicoConocimiento = nucleoBasicoConocimiento;
    }

    /**
     * @return the nombreNucleoBasicoConocimiento
     */
    public String getNombreNucleoBasicoConocimiento() {
        return nombreNucleoBasicoConocimiento;
    }

    /**
     * @param nombreNucleoBasicoConocimiento the nombreNucleoBasicoConocimiento to set
     */
    public void setNombreNucleoBasicoConocimiento(String nombreNucleoBasicoConocimiento) {
        this.nombreNucleoBasicoConocimiento = nombreNucleoBasicoConocimiento;
    }

    /**
     * @return the fechaTitulo
     */
    public String getFechaTitulo() {
        return fechaTitulo;
    }

    /**
     * @param fechaTitulo the fechaTitulo to set
     */
    public void setFechaTitulo(String fechaTitulo) {
        this.fechaTitulo = fechaTitulo;
    }

    /**
     * @return the certificado
     */
    public MultipartFile getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(MultipartFile certificado) {
        this.certificado = certificado;
    }

    /**
     * @return the certificadoHomologado
     */
    public MultipartFile getCertificadoHomologado() {
        return certificadoHomologado;
    }

    /**
     * @param certificadoHomologado the certificadoHomologado to set
     */
    public void setCertificadoHomologado(MultipartFile certificadoHomologado) {
        this.certificadoHomologado = certificadoHomologado;
    }

    /**
     * @return the tituloExterior
     */
    public boolean isTituloExterior() {
        return tituloExterior;
    }

    /**
     * @param tituloExterior the tituloExterior to set
     */
    public void setTituloExterior(boolean tituloExterior) {
        this.tituloExterior = tituloExterior;
    }

    /**
     * @return the paisTituloExterior
     */
    public String getPaisTituloExterior() {
        return paisTituloExterior;
    }

    /**
     * @param paisTituloExterior the paisTituloExterior to set
     */
    public void setPaisTituloExterior(String paisTituloExterior) {
        this.paisTituloExterior = paisTituloExterior;
    }

    /**
     * @return the nombrePaisTituloExterior
     */
    public String getNombrePaisTituloExterior() {
        return nombrePaisTituloExterior;
    }

    /**
     * @param nombrePaisTituloExterior the nombrePaisTituloExterior to set
     */
    public void setNombrePaisTituloExterior(String nombrePaisTituloExterior) {
        this.nombrePaisTituloExterior = nombrePaisTituloExterior;
    }
}
