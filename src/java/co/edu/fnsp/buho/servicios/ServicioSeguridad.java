/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.servicios;

import co.edu.fnsp.buho.entidades.CorreoElectronico;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Privilegio;
import co.edu.fnsp.buho.entidades.PrivilegioEnum;
import co.edu.fnsp.buho.entidades.Usuario;
import co.edu.fnsp.buho.repositorios.IRepositorioHojaVida;
import co.edu.fnsp.buho.repositorios.IRepositorioSeguridad;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 *
 * @author William
 */
@Service("servicioSeguridad")
public class ServicioSeguridad implements IServicioSeguridad {

    @Autowired
    private IRepositorioSeguridad repositorioSeguridad;

    @Autowired
    private IRepositorioHojaVida repositorioHojaVida;
    
    @Autowired
    private PlatformTransactionManager transactionManager;

    @Override
    public Usuario obtenerUsuario(String nombreUsuario) {
        return repositorioSeguridad.obtenerUsuario(nombreUsuario);
    }

    @Override
    public Usuario obtenerUsuario(long idUsuario) {
        return repositorioSeguridad.obtenerUsuario(idUsuario);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            HojaVida hojaVida = new HojaVida();
            Calendar calendar = Calendar.getInstance();
            calendar.set(1900, 1, 1);
            hojaVida.setFechaNacimiento(calendar.getTime());
            hojaVida.setFechaExpedicion(calendar.getTime());
            hojaVida.setDiscapacidad("5");
            hojaVida.setGrupoEtnico("5");
            hojaVida.setTipoIdentificacion("CC");
            hojaVida.setNombres(usuario.getNombres());
            hojaVida.setApellidos(usuario.getApellidos());
            hojaVida.setNumeroIdentificacion(usuario.getNumeroIdentificacion());
            CorreoElectronico correoElectronico = new CorreoElectronico();
            correoElectronico.setCorreoElectronico(usuario.getCorreoElectronico());
            hojaVida.getCorreosElectronicos().add(correoElectronico);
            long idPersona = repositorioHojaVida.ingresarHojaVida(0, hojaVida);
            usuario.setIdPersona(idPersona);
            Privilegio privilegio = new Privilegio();
            privilegio.setIdPrivilegio(PrivilegioEnum.USUARIO.getIdPrivilegio());
            usuario.getPrivilegios().add(privilegio);
            repositorioSeguridad.crearUsuario(usuario);
            transactionManager.commit(txStatus);
        } catch (TransactionException exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        repositorioSeguridad.actualizarUsuario(usuario);
    }

    @Override
    public void actualizarClaveUsuario(long idUsuario, String claveAnterior, String nuevaClave) {
        String clave = repositorioSeguridad.obtenerClaveUsuario(idUsuario);
        if (clave.equals(claveAnterior)) {
            repositorioSeguridad.actualizarClaveUsuario(idUsuario, nuevaClave);
        } else {
            throw new BadCredentialsException("La clave anterior del usuario no es correcta.");
        }
    }

    @Override
    public List<Privilegio> obtenerPrivilegios() {
        return repositorioSeguridad.obtenerPrivilegios();
    }

    @Override
    public List<Usuario> obtenerUsuarios() {
        return repositorioSeguridad.obtenerUsuarios();
    }

    @Override
    public void actualizarPrivilegiosUsuario(long idUsuario, List<Privilegio> privilegios) {
        repositorioSeguridad.actualizarPrivilegiosUsuario(idUsuario, privilegios);
    }

    @Override
    public List<Privilegio> obtenerPrivilegiosUsuario(long idUsuario) {
        return repositorioSeguridad.obtenerPrivilegiosUsuario(idUsuario);
    }

    @Override
    public void crearPrivilegio(Privilegio privilegio) {
        repositorioSeguridad.crearPrivilegio(privilegio);
    }

    @Override
    public Privilegio obtenerPrivilegio(int idPrivilegio) {
        return repositorioSeguridad.obtenerPrivilegio(idPrivilegio);
    }

    @Override
    public void eliminarPrivilegio(int idPrivilegio) {
        repositorioSeguridad.eliminarPrivilegio(idPrivilegio);
    }

    @Override
    public boolean existePrivilegio(String codigo) {
        return repositorioSeguridad.existePrivilegio(codigo);
    }
}
