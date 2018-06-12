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
public class HojaVidaInvestigacion {

    private long idPersona;;
    private String numeroIdentificacion;
    private String nombres;
    private String apellidos;
    private String tipoInvestigador;
    private String urlCVLAC;

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

    
}