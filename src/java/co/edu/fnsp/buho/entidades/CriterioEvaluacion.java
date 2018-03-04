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
public class CriterioEvaluacion {

    private String nombre;
    private int id;
    private String nombreSubcriterio;
    private int idSubcriterio;
    private String peso;
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

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
    * @return the peso
    */
    public String getPeso() {
        return peso;
    }

    /**
     * @param peso the peso to set
     */
    public void setPeso(String peso) {
        this.peso = peso;
    }

    /**
     * @return the nombreSubcriterio
     */
    public String getNombreSubcriterio() {
        return nombreSubcriterio;
    }

    /**
     * @param nombreSubcriterio the nombreSubcriterio to set
     */
    public void setNombreSubcriterio(String nombreSubcriterio) {
        this.nombreSubcriterio = nombreSubcriterio;
    }

    /**
     * @return the idSubcriterio
     */
    public int getIdSubcriterio() {
        return idSubcriterio;
    }

    /**
     * @param idSubcriterio the idSubcriterio to set
     */
    public void setIdSubcriterio(int idSubcriterio) {
        this.idSubcriterio = idSubcriterio;
    }
}
