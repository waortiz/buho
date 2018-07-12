/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidadesVista;

import co.edu.fnsp.buho.entidades.AnyosExperiencia;
import co.edu.fnsp.buho.entidades.CriterioHabilitanteConvocatoria;
import co.edu.fnsp.buho.entidades.EducacionContinuaConvocatoria;
import co.edu.fnsp.buho.entidades.IdiomaConvocatoria;
import co.edu.fnsp.buho.entidades.ProgramaConvocatoria;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class Convocatoria {

    private int id;
    private String tipoConvocatoria;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaInicio;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaFin;
    private String nombre;
    private String descripcion;
    private MultipartFile documento;
    private MultipartFile resultado;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaPublicacionResultados;
    private String sedeCurso;
    private String idSedeCurso;
    private String idProgramaCurso;
    private String programaCurso;
    private String nombreCurso;
    private String totalHorasSemestreCurso;
    private String anyosMinimosExperiencia;
    private boolean interna;
    private List<Adenda> adendas = new ArrayList<>();
    private List<AnyosExperiencia> anyosExperiencias = new ArrayList<>();
    private List<IdiomaConvocatoria> idiomas = new ArrayList<>();
    private List<ProgramaConvocatoria> programas = new ArrayList<>();
    private List<EducacionContinuaConvocatoria> educacionesContinuas = new ArrayList<>();
    private List<CriterioHabilitanteConvocatoria> criteriosHabilitantes = new ArrayList<>();
    
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
     * @return the tipoConvocatoria
     */
    public String getTipoConvocatoria() {
        return tipoConvocatoria;
    }

    /**
     * @param tipoConvocatoria the tipoConvocatoria to set
     */
    public void setTipoConvocatoria(String tipoConvocatoria) {
        this.tipoConvocatoria = tipoConvocatoria;
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
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
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the documento
     */
    public MultipartFile getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(MultipartFile documento) {
        this.documento = documento;
    }

    /**
     * @return the fechaPublicacionResultados
     */
    public Date getFechaPublicacionResultados() {
        return fechaPublicacionResultados;
    }

    /**
     * @param fechaPublicacionResultados the fechaPublicacionResultados to set
     */
    public void setFechaPublicacionResultados(Date fechaPublicacionResultados) {
        this.fechaPublicacionResultados = fechaPublicacionResultados;
    }

    /**
     * @return the adendas
     */
    public List<Adenda> getAdendas() {
        return adendas;
    }

    /**
     * @param adendas the adendas to set
     */
    public void setAdendas(List<Adenda> adendas) {
        this.adendas = adendas;
    }

    /**
     * @return the sedeCurso
     */
    public String getSedeCurso() {
        return sedeCurso;
    }

    /**
     * @param sedeCurso the sedeCurso to set
     */
    public void setSedeCurso(String sedeCurso) {
        this.sedeCurso = sedeCurso;
    }

    /**
     * @return the idSedeCurso
     */
    public String getIdSedeCurso() {
        return idSedeCurso;
    }

    /**
     * @param idSedeCurso the idSedeCurso to set
     */
    public void setIdSedeCurso(String idSedeCurso) {
        this.idSedeCurso = idSedeCurso;
    }

    /**
     * @return the idProgramaCurso
     */
    public String getIdProgramaCurso() {
        return idProgramaCurso;
    }

    /**
     * @param idProgramaCurso the idProgramaCurso to set
     */
    public void setIdProgramaCurso(String idProgramaCurso) {
        this.idProgramaCurso = idProgramaCurso;
    }

    /**
     * @return the programaCurso
     */
    public String getProgramaCurso() {
        return programaCurso;
    }

    /**
     * @param programaCurso the programaCurso to set
     */
    public void setProgramaCurso(String programaCurso) {
        this.programaCurso = programaCurso;
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
     * @return the totalHorasSemestreCurso
     */
    public String getTotalHorasSemestreCurso() {
        return totalHorasSemestreCurso;
    }

    /**
     * @param totalHorasSemestreCurso the totalHorasSemestreCurso to set
     */
    public void setTotalHorasSemestreCurso(String totalHorasSemestreCurso) {
        this.totalHorasSemestreCurso = totalHorasSemestreCurso;
    }

    /**
     * @return the anyosExperiencias
     */
    public List<AnyosExperiencia> getAnyosExperiencias() {
        return anyosExperiencias;
    }

    /**
     * @param anyosExperiencias the anyosExperiencias to set
     */
    public void setAnyosExperiencias(List<AnyosExperiencia> anyosExperiencias) {
        this.anyosExperiencias = anyosExperiencias;
    }

    /**
     * @return the idiomas
     */
    public List<IdiomaConvocatoria> getIdiomas() {
        return idiomas;
    }

    /**
     * @param idiomas the idiomas to set
     */
    public void setIdiomas(List<IdiomaConvocatoria> idiomas) {
        this.idiomas = idiomas;
    }

    /**
     * @return the anyosMinimosExperiencia
     */
    public String getAnyosMinimosExperiencia() {
        return anyosMinimosExperiencia;
    }

    /**
     * @param anyosMinimosExperiencia the anyosMinimosExperiencia to set
     */
    public void setAnyosMinimosExperiencia(String anyosMinimosExperiencia) {
        this.anyosMinimosExperiencia = anyosMinimosExperiencia;
    }

    /**
     * @return the programas
     */
    public List<ProgramaConvocatoria> getProgramas() {
        return programas;
    }

    /**
     * @param programas the programas to set
     */
    public void setProgramas(List<ProgramaConvocatoria> programas) {
        this.programas = programas;
    }

    /**
     * @return the educacionesContinuas
     */
    public List<EducacionContinuaConvocatoria> getEducacionesContinuas() {
        return educacionesContinuas;
    }

    /**
     * @param educacionesContinuas the educacionesContinuas to set
     */
    public void setEducacionesContinuas(List<EducacionContinuaConvocatoria> educacionesContinuas) {
        this.educacionesContinuas = educacionesContinuas;
    }

    /**
     * @return the criteriosHabilitantes
     */
    public List<CriterioHabilitanteConvocatoria> getCriteriosHabilitantes() {
        return criteriosHabilitantes;
    }

    /**
     * @param criteriosHabilitantes the criteriosHabilitantes to set
     */
    public void setCriterios(List<CriterioHabilitanteConvocatoria> criteriosHabilitantes) {
        this.criteriosHabilitantes = criteriosHabilitantes;
    }

    /**
     * @return the resultado
     */
    public MultipartFile getResultado() {
        return resultado;
    }

    /**
     * @param resultado the resultado to set
     */
    public void setResultado(MultipartFile resultado) {
        this.resultado = resultado;
    }

    /**
     * @return the interna
     */
    public boolean isInterna() {
        return interna;
    }

    /**
     * @param interna the interna to set
     */
    public void setInterna(boolean interna) {
        this.interna = interna;
    }
}
