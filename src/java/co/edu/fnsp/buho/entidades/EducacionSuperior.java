/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.Date;

/**
 *
 * @author William
 */
public class EducacionSuperior {

    private int id;
    private int nivel;
    private String nombreNivel;
    private Integer paisTituloExterior;
    private String nombrePaisTituloExterior;
    private int institucion;
    private String nombreInstitucion;
    private boolean tituloExterior;
    private String programa;
    private int nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    private int anyoInicio;
    private Integer anyoFinalizacion;
    private String titulo;
    private boolean graduado;
    private Date fechaTitulo;
    private Documento certificado;
    private Documento certificadoHomologado;
    
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
     * @return the institucion
     */
    public int getInstitucion() {
        return institucion;
    }

    /**
     * @param institucion the institucion to set
     */
    public void setInstitucion(int institucion) {
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
    public int getNucleoBasicoConocimiento() {
        return nucleoBasicoConocimiento;
    }

    /**
     * @param nucleoBasicoConocimiento the nucleoBasicoConocimiento to set
     */
    public void setNucleoBasicoConocimiento(int nucleoBasicoConocimiento) {
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
    public Date getFechaTitulo() {
        return fechaTitulo;
    }

    /**
     * @param fechaTitulo the fechaTitulo to set
     */
    public void setFechaTitulo(Date fechaTitulo) {
        this.fechaTitulo = fechaTitulo;
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
     * @return the certificadoHomologado
     */
    public Documento getCertificadoHomologado() {
        return certificadoHomologado;
    }

    /**
     * @param certificadoHomologado the certificadoHomologado to set
     */
    public void setCertificadoHomologado(Documento certificadoHomologado) {
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
    public Integer getPaisTituloExterior() {
        return paisTituloExterior;
    }

    /**
     * @param paisTituloExterior the paisTituloExterior to set
     */
    public void setPaisTituloExterior(Integer paisTituloExterior) {
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
