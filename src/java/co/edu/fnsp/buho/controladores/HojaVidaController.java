/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/hojasVida")
public class HojaVidaController {
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        return "hojasVida/index";
    }
    
    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String crear(Model model) {

        return "hojasVida/crear";
    }
}
