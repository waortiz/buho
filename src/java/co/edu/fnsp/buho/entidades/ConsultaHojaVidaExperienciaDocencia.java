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
public class ConsultaHojaVidaExperienciaDocencia {

    private String curso;
    private String institucion;
    private String numeroHorasInicial;
    private String numeroHorasFinal;

    /**
     * @return the curso
     */
    public String getCurso() {
        return curso;
    }

    /**
     * @param curso the curso to set
     */
    public void setCurso(String curso) {
        this.curso = curso;
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
     * @return the numeroHorasInicial
     */
    public String getNumeroHorasInicial() {
        return numeroHorasInicial;
    }

    /**
     * @param numeroHorasInicial the numeroHorasInicial to set
     */
    public void setNumeroHorasInicial(String numeroHorasInicial) {
        this.numeroHorasInicial = numeroHorasInicial;
    }

    /**
     * @return the numeroHorasFinal
     */
    public String getNumeroHorasFinal() {
        return numeroHorasFinal;
    }

    /**
     * @param numeroHorasFinal the numeroHorasFinal to set
     */
    public void setNumeroHorasFinal(String numeroHorasFinal) {
        this.numeroHorasFinal = numeroHorasFinal;
    }
}
