/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.Privilegio;
import co.edu.fnsp.buho.entidades.Usuario;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioSeguridad {

    Usuario obtenerUsuario(String nombreUsuario);

    Usuario obtenerUsuario(long idUsuario);

    void crearUsuario(Usuario usuario);

    void actualizarUsuario(Usuario usuario);

    void actualizarClaveUsuario(long idUsuario, String claveAnterior, String nuevaClave);

    List<Privilegio> obtenerPrivilegios();

    List<Privilegio> obtenerPrivilegiosUsuario(long idUsuario);

    List<Usuario> obtenerUsuarios();

    void actualizarPrivilegiosUsuario(long idUsuario, List<Privilegio> privilegios);

    void crearPrivilegio(Privilegio privilegio);

    void eliminarPrivilegio(int idPrivilegio);

    Privilegio obtenerPrivilegio(int idPrivilegio);

    boolean existePrivilegio(String codigo);
}
