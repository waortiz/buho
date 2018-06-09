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
public class HojaVidaEducacionSuperior {
    private long idPersona;;
    private String numeroIdentificacion;
    private String nombres;
    private String apellidos;
    private String institucion;
    private String nucleoBasicoConocimiento;
    private Integer anyoGraduacion;
    private String nivelEstudio;
    private String tituloExterior;
    private String validado;

    /**
     * @return the idPersona
     */
    public long getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
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
     * @return the anyoGraduacion
     */
    public Integer getAnyoGraduacion() {
        return anyoGraduacion;
    }

    /**
     * @param anyoGraduacion the anyoGraduacion to set
     */
    public void setAnyoGraduacion(Integer anyoGraduacion) {
        this.anyoGraduacion = anyoGraduacion;
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
     * @return the validado
     */
    public String getValidado() {
        return validado;
    }

    /**
     * @param validado the validado to set
     */
    public void setValidado(String validado) {
        this.validado = validado;
    }
    
    /**
     * @return the tituloExterior
     */
    public String getTituloExterior() {
        return tituloExterior;
    }

    /**
     * @param tituloExterior the tituloExterior to set
     */
    public void setTituloExterior(String tituloExterior) {
        this.tituloExterior = tituloExterior;
    }
}
