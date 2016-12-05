package com.gameshop.controller;

import com.gameshop.model.bean.JuegoBean;
import com.gameshop.model.bean.UsuarioBean;
import com.gameshop.model.dao.UsuarioDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("usuarioBean")
public class LoginController {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @RequestMapping(value = {"/login.do", "/"}, method = RequestMethod.GET)
    public String showLogin(HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
        if (usuarioBean != null) {
            if (usuarioBean.getAutorizacion().equalsIgnoreCase("ADMIN")) {
                return "/admin/index";
            } else {
                
                return "/user/index";
            }
        } else {
            return "login";
        }
    }

    @RequestMapping(value = {"/home.do"}, method = RequestMethod.GET)
    public String home(Model model) {
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String email = auth.getName();
            UsuarioBean usuario = usuarioDAO.get(email);
             model.addAttribute("usuarioBean", usuario);        
//TODO: Rutas
        if (usuario.getAutorizacion().equalsIgnoreCase("ADMIN")) {
            return "/admin/index";
        } else {
            return "/user/index";
        }
    }
    
    @RequestMapping(value = {"/accessdenied.do"}, method = RequestMethod.GET)
    public String denied() {
        return "/denied";
    }
}




