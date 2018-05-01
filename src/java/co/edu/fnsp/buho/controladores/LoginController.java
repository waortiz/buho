package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.Maestro;
import co.edu.fnsp.buho.entidades.Usuario;
import co.edu.fnsp.buho.entidadesVista.CambioClave;
import co.edu.fnsp.buho.entidadesVista.RecuperacionClave;
import co.edu.fnsp.buho.servicios.IServicioMaestro;
import co.edu.fnsp.buho.servicios.IServicioSeguridad;
import co.edu.fnsp.buho.utilidades.CookieUtil;
import co.edu.fnsp.buho.utilidades.JwtUtil;
import co.edu.fnsp.buho.utilidades.Mail;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class LoginController {
    private static final Logger logger = LogManager.getLogger(LoginController.class.getName());
    
    @Autowired
    private IServicioSeguridad servicioSeguridad;
    
    @Autowired
    private IServicioMaestro servicioMaestro;
    
    @Autowired
    private Mail mail;
        
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(Model model) {

        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response, Model model) {
        CookieUtil.clear(response, JwtUtil.jwtTokenCookieName); 
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        
        List<Maestro> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        
        return "redirect:/login";
    }
    
    @RequestMapping(value = "/login/recuperarClave", method = RequestMethod.POST)
    public @ResponseBody
    String recuperarClave(@ModelAttribute(value = "recuperacionClave") RecuperacionClave recuperacionClave, Model model) {
        String mensaje = "";
        Usuario usuarioActual = servicioSeguridad.obtenerUsuario(recuperacionClave.getNombreUsuario());
        if (usuarioActual != null) {
            try {
                mail.sendMail(usuarioActual.getCorreoElectronico(), "Clave Ingreso Sistema", "Para ingresar al sistema utilice como clave <b>" + usuarioActual.getClave() + "</b>");
                mensaje = "La clave ha sido enviada a su correo electrónico";
            } catch (Exception exc) {
                logger.error(exc);
                throw exc;
            }
        } else {
            mensaje = "El usuario no existe. por favor verifique";
        }

        return mensaje;
    }
    
    @RequestMapping(value = "/login/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearUsuario(@ModelAttribute(value = "usuario") Usuario usuario, Model model) {
        String mensaje = "";
        try {
            Usuario usuarioActual = servicioSeguridad.obtenerUsuario(usuario.getNombreUsuario());
            if (usuarioActual == null) {
                servicioSeguridad.crearUsuario(usuario);
            } else {
                mensaje = "El usuario ya existe";
            }
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }
        
        return mensaje;
    }
    
    
    @RequestMapping(value = "/login/cambiarClave", method = RequestMethod.GET)
    public String mostrarCambioClave(Model model) {
        
        return "login/cambioClave";
    }
    
    @RequestMapping(value = "/login/cambiarClave", method = RequestMethod.POST)
    public @ResponseBody
    String cambiarClave(@ModelAttribute(value = "cambioClave") CambioClave cambioClave, Model model) {
        String mensaje = "";
        Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        try {
            servicioSeguridad.actualizarClaveUsuario(usuario.getIdUsuario(), cambioClave.getClaveAnterior(), cambioClave.getClaveNueva());
            usuario.setClave(cambioClave.getClaveNueva());
        } catch (BadCredentialsException exc) {
            logger.error(exc);
            mensaje = exc.getMessage();
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return mensaje;
    }
}
