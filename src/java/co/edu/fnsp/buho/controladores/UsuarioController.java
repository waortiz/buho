/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import co.edu.fnsp.buho.entidades.Privilegio;
import co.edu.fnsp.buho.entidades.PrivilegiosUsuario;
import co.edu.fnsp.buho.entidades.Usuario;
import co.edu.fnsp.buho.servicios.IServicioSeguridad;
import java.util.ArrayList;
import java.util.List;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/usuarios")
public class UsuarioController {

    private static final Logger logger = LogManager.getLogger(UsuarioController.class.getName());

    @Autowired
    private IServicioSeguridad servicioSeguridad;
    
    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String obtenerUsuarios(Model model) {

        List<Usuario> usuarios = servicioSeguridad.obtenerUsuarios();
        model.addAttribute("usuarios", usuarios);

        return "usuarios/index";
    }

    /**
     *
     * @param idUsuario
     * @param model
     * @return
     */
    @RequestMapping(value = "/privilegios/{idUsuario}", method = RequestMethod.GET)
    public String mostrarPrivilegiosUsuario(@PathVariable long idUsuario, Model model) {
        List<Privilegio> privilegios = servicioSeguridad.obtenerPrivilegios();
        List<Privilegio> privilegiosPorAsignar = new ArrayList<>();
        Usuario usuario = servicioSeguridad.obtenerUsuario(idUsuario);
        for (Privilegio privilegio : privilegios) {
            boolean existe = false;
            for (Privilegio privilegioAsignado : usuario.getPrivilegios()) {
                if (privilegio.getIdPrivilegio() == privilegioAsignado.getIdPrivilegio()) {
                    existe = true;
                    break;
                }
            }
            if (!existe) {
                privilegiosPorAsignar.add(privilegio);
            }
        }
        model.addAttribute("privilegiosPorAsignar", privilegiosPorAsignar);
        model.addAttribute("privilegiosAsignados", usuario.getPrivilegios());
        model.addAttribute("privilegiosUsuario", usuario);

        return "usuarios/privilegios";
    }

    @RequestMapping(value = "/privilegios", method = RequestMethod.POST)
    public @ResponseBody
    String actualizarPrivilegiosUsuario(@ModelAttribute(value = "privilegiosUsuario") PrivilegiosUsuario privilegioUsuario, Model model) {
        String mensaje = "";
        try {
            servicioSeguridad.actualizarPrivilegiosUsuario(privilegioUsuario.getIdUsuario(), privilegioUsuario.getPrivilegios());
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return mensaje;
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(ArrayList.class, "privilegios", new CustomCollectionEditor(ArrayList.class) {

            @Override
            protected Object convertElement(Object element) {
                Privilegio privilegio = new Privilegio();
                if (element instanceof String && !((String) element).equals("")) {
                    try {
                        privilegio.setIdPrivilegio(Integer.parseInt((String) element));
                    } catch (NumberFormatException e) {

                    }
                } else if (element instanceof Integer) {
                    try {
                        privilegio.setIdPrivilegio((int) element);
                    } catch (Exception e) {

                    }
                }

                return privilegio;
            }
        });
    }
}
