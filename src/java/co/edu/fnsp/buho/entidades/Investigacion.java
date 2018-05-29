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
public class Investigacion {
    private long id;
    private boolean investigadorReconocidoColciencias;
    private String urlCVLAC;
    private boolean urlCVLACValidada;
    private String nombreUrlCVLACValidada;
    private Integer tipoInvestigador;
    private String nombreTipoInvestigador;
    private String codigoORCID;
    private String identificadorScopus;
    private String researcherId;

    /**
     * @return the investigadorReconocidoColciencias
     */
    public boolean isInvestigadorReconocidoColciencias() {
        return investigadorReconocidoColciencias;
    }

    /**
     * @param investigadorReconocidoColciencias the investigadorReconocidoColciencias to set
     */
    public void setInvestigadorReconocidoColciencias(boolean investigadorReconocidoColciencias) {
        this.investigadorReconocidoColciencias = investigadorReconocidoColciencias;
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

    /**
     * @return the urlCVLACValidada
     */
    public boolean isUrlCVLACValidada() {
        return urlCVLACValidada;
    }

    /**
     * @param urlCVLACValidada the urlCVLACValidada to set
     */
    public void setUrlCVLACValidada(boolean urlCVLACValidada) {
        this.urlCVLACValidada = urlCVLACValidada;
    }

    /**
     * @return the tipoInvestigador
     */
    public Integer getTipoInvestigador() {
        return tipoInvestigador;
    }

    /**
     * @param tipoInvestigador the tipoInvestigador to set
     */
    public void setTipoInvestigador(Integer tipoInvestigador) {
        this.tipoInvestigador = tipoInvestigador;
    }

    /**
     * @return the nombreTipoInvestigador
     */
    public String getNombreTipoInvestigador() {
        return nombreTipoInvestigador;
    }

    /**
     * @param nombreTipoInvestigador the nombreTipoInvestigador to set
     */
    public void setNombreTipoInvestigador(String nombreTipoInvestigador) {
        this.nombreTipoInvestigador = nombreTipoInvestigador;
    }

    /**
     * @return the codigoORCID
     */
    public String getCodigoORCID() {
        return codigoORCID;
    }

    /**
     * @param codigoORCID the codigoORCID to set
     */
    public void setCodigoORCID(String codigoORCID) {
        this.codigoORCID = codigoORCID;
    }

    /**
     * @return the identificadorScopus
     */
    public String getIdentificadorScopus() {
        return identificadorScopus;
    }

    /**
     * @param identificadorScopus the identificadorScopus to set
     */
    public void setIdentificadorScopus(String identificadorScopus) {
        this.identificadorScopus = identificadorScopus;
    }

    /**
     * @return the researcherId
     */
    public String getResearcherId() {
        return researcherId;
    }

    /**
     * @param researcherId the researcherId to set
     */
    public void setResearcherId(String researcherId) {
        this.researcherId = researcherId;
    }

    /**
     * @return the nombreUrlCVLACValidada
     */
    public String getNombreUrlCVLACValidada() {
        return nombreUrlCVLACValidada;
    }

    /**
     * @param nombreUrlCVLACValidada the nombreUrlCVLACValidada to set
     */
    public void setNombreUrlCVLACValidada(String nombreUrlCVLACValidada) {
        this.nombreUrlCVLACValidada = nombreUrlCVLACValidada;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }
    
}
