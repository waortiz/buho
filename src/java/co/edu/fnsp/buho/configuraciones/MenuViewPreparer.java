/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.configuraciones;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.OpcionMenu;
import co.edu.fnsp.buho.servicios.IServicioMenu;
import java.util.List;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 *
 * @author William
 */
@Component("menuViewPreparer")
public class MenuViewPreparer implements ViewPreparer {

    @Autowired
    private IServicioMenu servicioMenu;

    @Override
    public void execute(Request request, AttributeContext attributeContext) {
        String htmlMenu = "";
        String htmlUsuario = "<ul>\n" +
                      "<!-- Menu perfil-->\n" +
                      "<li class='active'><a href='#'></a></li></ul>\n";

        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            DetalleUsuario detalleUsuario = (DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            List<OpcionMenu> items = servicioMenu.obtenerOpcionesMenuUsuario(detalleUsuario.getIdUsuario());
            htmlMenu = co.edu.fnsp.buho.utilidades.Menu.obtenerMenu(items);
            htmlUsuario = "<ul>\n" +
                      "<!-- Menu perfil-->\n" +
                      "<li class='active'><a href='#'>" + detalleUsuario.getUsername() + "</a></li>\n" +
                      "<li class='active'>\n" +
                      " <a href='#'><i class=\"fa fa-user fa-1x\"></i>   <i class=\"fa fa-chevron-down\" aria-hidden=\"true\"></i>\n" +
                      " </a>\n" +
                      "<ul>\n" +
                      " <li><a href=\"javascript:abrirOpcion('/login/cambiarClave')\">Cambiar contraseña</a></li>\n" +
                      " <li class=\"divider\"></li>\n" +
                      " <li><a href=\"javascript:abrirOpcion('/logout')\"><i class=\"fa fa-sign-out fa-fw\"></i>Salir</a>\n" +
                      " </li>\n" +
                      "</ul>\n" +
                      "</li> \n" +
                      "</ul>\n";
        } 
        if(htmlMenu == null || htmlMenu.length() == 0) {
            htmlMenu =   "<li class='active'>\n"
                    + "  <a href=\"javascript:abrirOpcion('/hojasVida/editar')\"><i class=\"fa fa-user fa-1x\"></i>\n"
                    + "     Hoja de vida\n"
                    + "  </a>\n"
                    + "</li>\n";
        }
        
        attributeContext.putAttribute("menu", new Attribute(htmlMenu));
        attributeContext.putAttribute("usuario", new Attribute(htmlUsuario));
    }

}
