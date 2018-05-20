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
public enum CampoHojaVidaEnum {
    	PE_TIPO_ID(1),	
        PE_LUGAR_EXPEDICION(2),
	PE_FECHA_EXPEDICION(3),
	PE_LIBRETA_MILITAR(4),
	PE_NOMBRES(5),
	PE_APELLIDOS(6),
	PE_FECHA_NACIMIENTO(7),
	PE_LUGAR_NACIMIENTO(8),
	PE_NACIONALIDAD(9),
	PE_SEXO(10),
	PE_CIUDAD_RESIDENCIA(11),
	PE_DIRECCION(12),
	PE_EGRESADO_UDEA(13),
	PE_GRUPO_ETNICO(14),
	PE_DISCAPACIDAD(15),
	PE_DISPONE_RUT(16),
	PE_ACTIVIDAD_ECONOMICA(17),
	PE_DISPONIBILIDAD_VIAJAR(18),
	PE_TIPO_VINCULACION(19),
	PE_EMPLEADO_UDEA(20),
        PE_NUMERO_ID(21);
   
    private final int campoHojaVida;
    CampoHojaVidaEnum (int campoHojaVida) {
        this.campoHojaVida = campoHojaVida;
    }
    
    public int campoHojaVida() {
        return campoHojaVida;
    }
}
