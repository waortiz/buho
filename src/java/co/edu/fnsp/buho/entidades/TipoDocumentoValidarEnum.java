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
public enum TipoDocumentoValidarEnum {
    SOPORTE(1),
    EXPERIENCIA_LABORAL(2),
    CURSO_EXPERIENCIA_DOCENCIA(3),
    EDUCACION_BASICA(4),
    EDUCACION_CONTINUA(5),
    EDUCACION_SUPERIOR(6),
    EDUCACION_HOMOLOGADO_SUPERIOR(7),
    IDIOMA(8),
    DISTINCION(9),
    CVLAC(10),
    ARTICULO(11),
    PATENTE(12),
    PRODUCTO_CONOCIMIENTO(13),
    PROPUESTA_INVESTIGACION(14);

    private int id;

    private TipoDocumentoValidarEnum(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
