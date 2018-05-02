/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.entidades;

import java.util.ArrayList;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 *
 * @author William
 */
public class DetalleUsuario extends User {

    private long idUsuario;
    private long idPersona;
    private ArrayList<OpcionMenu> opcionesMenu = new ArrayList<>();
    
    public DetalleUsuario(long idUsuario, long idPersona, String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super( username,  password,  enabled, accountNonExpired, credentialsNonExpired,  accountNonLocked,  authorities);
        this.idUsuario = idUsuario;
        this.idPersona = idPersona;
    }

    /**
     * @return the idUsuario
     */
    public long getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }    

    /**
     * @return the opcionesMenu
     */
    public ArrayList<OpcionMenu> getOpcionesMenu() {
        return opcionesMenu;
    }

    /**
     * @param opcionesMenu the opcionesMenu to set
     */
    public void setOpcionesMenu(ArrayList<OpcionMenu> opcionesMenu) {
        this.opcionesMenu = opcionesMenu;
    }

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
}
