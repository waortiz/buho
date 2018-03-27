/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.repositorios;

import co.edu.fnsp.buho.entidades.Persona;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioPersona {

    void ingresarPersona(long idUsuario, Persona persona);

    void actualizarPersona(long idUsuario, Persona persona);

    Persona obtenerPersona(int idPersona);

    void eliminarPersona(int idPersona);

    List<Persona> obtenerPersonas();
}
