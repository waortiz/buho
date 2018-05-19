/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.filtros;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import co.edu.fnsp.buho.entidades.OpcionMenu;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CustomInterceptor extends HandlerInterceptorAdapter {

    /**
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {

        if (!request.getRequestURI().toLowerCase().contains("/convocatorias/index")) {
            if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {

                boolean existe = false;
                String requestURI = request.getRequestURI().toLowerCase();
                if(requestURI.contains("/usuarios/privilegios")) {
                    requestURI = "/usuarios/index";
                }
                else if(requestURI.contains("/privilegios/editar") ||
                   requestURI.contains("/privilegios/eliminar")) {
                    requestURI = "/privilegios/index";
                }
                else if(requestURI.contains("/convocatorias/editar") ||
                   requestURI.contains("/convocatorias/eliminar")) {
                   requestURI = "/convocatorias/index";
                }
                DetalleUsuario usuario = (DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                for (OpcionMenu opcionMenu : usuario.getOpcionesMenu()) {
                    existe = false;
                    if (opcionMenu.getUrl() != null && requestURI.contains(opcionMenu.getUrl().toLowerCase())) {
                        existe = true;
                        break;
                    }
                }
                if (!existe) {
                    response.sendRedirect(request.getContextPath() + "/convocatorias/index");
                }
            }
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            Exception ex) throws Exception {
    }
}
