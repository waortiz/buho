/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.filtros;

import co.edu.fnsp.buho.entidades.DetalleUsuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.GrantedAuthority;
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

        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof DetalleUsuario) {
            boolean administrador = false;
            DetalleUsuario detalleUsuario = (DetalleUsuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            for (GrantedAuthority authority : detalleUsuario.getAuthorities()) {
                if (authority.getAuthority().equalsIgnoreCase("ADMINISTRADOR")
                        || authority.getAuthority().equalsIgnoreCase("SUPER_ADMINISTRADOR")) {
                    administrador = true;
                    break;
                }
            }
            if (!administrador) {
                if(request.getRequestURI().toLowerCase().contains("convocatorias/crear") ||
                   request.getRequestURI().toLowerCase().contains("convocatorias/index")) {
                    response.sendRedirect(request.getContextPath() + "/convocatorias/postular");
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
