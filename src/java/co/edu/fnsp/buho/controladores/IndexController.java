/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

/**
 *
 * @author William
 */
@Controller
public class IndexController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

       return "redirect:convocatorias/index";
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexConSlash(Model model) {

        return "redirect:convocatorias/index";
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String indexConVacio(Model model) {

        return "redirect:convocatorias/index";
    }

}
