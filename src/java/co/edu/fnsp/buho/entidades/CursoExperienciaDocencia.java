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
public class CursoExperienciaDocencia {
    private int id;
    private String nombreInstitucion;
    private int idExperienciaDocencia;
    private int consecutivo;
    private String nombreCurso;
    private int nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    private int modalidad;
    private String nombreModalidad;
    private int nivelEstudio;
    private String nombreNivelEstudio;
    private int numeroHoras;
    private int anyo;
    private boolean certificadoValidado;
     private String nombreCertificadoValidado;
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
     * @return the nombreCurso
     */
    public String getNombreCurso() {
        return nombreCurso;
    }

    /**
     * @param nombreCurso the nombreCurso to set
     */
    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
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
     * @return the modalidad
     */
    public int getModalidad() {
        return modalidad;
    }

    /**
     * @param modalidad the modalidad to set
     */
    public void setModalidad(int modalidad) {
        this.modalidad = modalidad;
    }

    /**
     * @return the nombreModalidad
     */
    public String getNombreModalidad() {
        return nombreModalidad;
    }

    /**
     * @param nombreModalidad the nombreModalidad to set
     */
    public void setNombreModalidad(String nombreModalidad) {
        this.nombreModalidad = nombreModalidad;
    }

    /**
     * @return the nivelEstudio
     */
    public int getNivelEstudio() {
        return nivelEstudio;
    }

    /**
     * @param nivelEstudio the nivelEstudio to set
     */
    public void setNivelEstudio(int nivelEstudio) {
        this.nivelEstudio = nivelEstudio;
    }

    /**
     * @return the nombreNivelEstudio
     */
    public String getNombreNivelEstudio() {
        return nombreNivelEstudio;
    }

    /**
     * @param nombreNivelEstudio the nombreNivelEstudio to set
     */
    public void setNombreNivelEstudio(String nombreNivelEstudio) {
        this.nombreNivelEstudio = nombreNivelEstudio;
    }

    /**
     * @return the numeroHoras
     */
    public int getNumeroHoras() {
        return numeroHoras;
    }

    /**
     * @param numeroHoras the numeroHoras to set
     */
    public void setNumeroHoras(int numeroHoras) {
        this.numeroHoras = numeroHoras;
    }

    /**
     * @return the anyo
     */
    public int getAnyo() {
        return anyo;
    }

    /**
     * @param anyo the anyo to set
     */
    public void setAnyo(int anyo) {
        this.anyo = anyo;
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
     * @return the idExperienciaDocencia
     */
    public int getIdExperienciaDocencia() {
        return idExperienciaDocencia;
    }

    /**
     * @param idExperienciaDocencia the idExperienciaDocencia to set
     */
    public void setIdExperienciaDocencia(int idExperienciaDocencia) {
        this.idExperienciaDocencia = idExperienciaDocencia;
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
    
}
