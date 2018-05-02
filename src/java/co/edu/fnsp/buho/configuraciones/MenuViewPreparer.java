/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.configuraciones;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.OpcionMenu;
import co.edu.fnsp.buho.entidades.Usuario;
import co.edu.fnsp.buho.servicios.IServicioMenu;
import java.util.List;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
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
        boolean administrador = false;
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            DetalleUsuario detalleUsuario = (DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            for (GrantedAuthority authority : detalleUsuario.getAuthorities()) {
                if (authority.getAuthority().equalsIgnoreCase("ADMINISTRADOR")
                        || authority.getAuthority().equalsIgnoreCase("SUPER_ADMINISTRADOR")) {
                    administrador = true;
                    break;
                }
            }
        }
        String menu = null;
        if (administrador) {
            menu = "<li class='active'>\n"
                    + "<a href='#'><i class=\"fa fa-users fa-1x\" aria-hidden=\"true\"></i>\n"
                    + "   Convocatorias\n"
                    + "</a>\n"
                    + "<ul>\n"
                    + "  <li><a href=\"javascript:abrirOpcion('/convocatorias/crear')\">Crear</a></li>\n"
                    + "  <li><a href=\"javascript:abrirOpcion('/convocatorias/index')\">Consultar</a></li>\n"
                    + "</ul>\n"
                    + "</li>\n"
                    + "<li class='active'>\n"
                    + "  <a href='#'><i class=\"fa fa-user fa-1x\"></i>\n"
                    + "     Hoja de vida\n"
                    + "  </a>\n"
                    + "<ul>\n"
                    + "<li><a href=\"javascript:abrirOpcion('/hojasVida/crear')\">Crear</a></li>\n"
                    + "<li><a href=\"javascript:abrirOpcion(/hojasVida/index')\">Consultar</a></li>\n"
                    + "</ul>\n"
                    + "</li>\n";
        } else {
            menu = "<li class='active'>\n"
                    + "<a href='#'><i class=\"fa fa-users fa-1x\" aria-hidden=\"true\"></i>\n"
                    + "   Convocatorias\n"
                    + "</a>\n"
                    + "<ul>\n"
                    + "  <li><a href=\"javascript:abrirOpcion('/convocatorias/postular')\">Postular</a></li>\n"
                    + "</ul>\n"
                    + "</li>\n"
                    + "<li class='active'>\n"
                    + "  <a href='#'><i class=\"fa fa-user fa-1x\"></i>\n"
                    + "     Hoja de vida\n"
                    + "  </a>\n"
                    + "<ul>\n"
                    + "<li><a href=\"javascript:abrirOpcion('/hojasVida/modificar')\">Modificar</a></li>\n"
                    + "</ul>\n"
                    + "</li>\n";
        }

        attributeContext.putAttribute("menu", new Attribute(menu));
    }

}
