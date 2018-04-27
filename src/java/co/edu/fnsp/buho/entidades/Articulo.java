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
public class Articulo {
    
    private int id;
    private String nombre;
    private String nombreRevista;
    private int tipoAutor;
    private String nombreTipoAutor;
    private String url;
    private int anyo;
    private int nucleoBasicoConocimiento;
    private String nombreNucleoBasicoConocimiento;
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

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
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }


    /**
     * @return the nombreRevista
     */
    public String getNombreRevista() {
        return nombreRevista;
    }

    /**
     * @param nombreRevista the nombreRevista to set
     */
    public void setNombreRevista(String nombreRevista) {
        this.nombreRevista = nombreRevista;
    }

    /**
     * @return the tipoAutor
     */
    public int getTipoAutor() {
        return tipoAutor;
    }

    /**
     * @param tipoAutor the tipoAutor to set
     */
    public void setTipoAutor(int tipoAutor) {
        this.tipoAutor = tipoAutor;
    }

    /**
     * @return the nombreTipoAutor
     */
    public String getNombreTipoAutor() {
        return nombreTipoAutor;
    }

    /**
     * @param nombreTipoAutor the nombreTipoAutor to set
     */
    public void setNombreTipoAutor(String nombreTipoAutor) {
        this.nombreTipoAutor = nombreTipoAutor;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
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
}
