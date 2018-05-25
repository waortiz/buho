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
public class CursoExperienciaDocencia {
    private int id;
    private int idExperienciaDocencia;
    private String nombreCurso;
    private String nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    private String modalidad;
    private String nombreModalidad;
    private String nivelEstudio;
    private String nombreNivelEstudio;
    private String numeroHoras;
    private String anyo;
    private Object certificado;

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
     * @return the modalidad
     */
    public String getModalidad() {
        return modalidad;
    }

    /**
     * @param modalidad the modalidad to set
     */
    public void setModalidad(String modalidad) {
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
    public String getNivelEstudio() {
        return nivelEstudio;
    }

    /**
     * @param nivelEstudio the nivelEstudio to set
     */
    public void setNivelEstudio(String nivelEstudio) {
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
    public String getNumeroHoras() {
        return numeroHoras;
    }

    /**
     * @param numeroHoras the numeroHoras to set
     */
    public void setNumeroHoras(String numeroHoras) {
        this.numeroHoras = numeroHoras;
    }

    /**
     * @return the anyo
     */
    public String getAnyo() {
        return anyo;
    }

    /**
     * @param anyo the anyo to set
     */
    public void setAnyo(String anyo) {
        this.anyo = anyo;
    }

    /**
     * @return the certificado
     */
    public Object getCertificado() {
        return certificado;
    }

    /**
     * @param certificado the certificado to set
     */
    public void setCertificado(Object certificado) {
        this.certificado = certificado;
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
    
}
