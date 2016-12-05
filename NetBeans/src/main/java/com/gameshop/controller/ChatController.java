/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gameshop.controller;

import com.gameshop.model.bean.DistribuidoraBean;
import com.gameshop.model.bean.EditoraBean;
import com.gameshop.model.bean.FacturaBean;
import com.gameshop.model.bean.GeneroBean;
import com.gameshop.model.bean.JuegoBean;
import com.gameshop.model.bean.PlataformaBean;
import com.gameshop.model.bean.UsuarioBean;
import com.gameshop.model.dao.DistribuidoraDAO;
import com.gameshop.model.dao.EditoraDAO;
import com.gameshop.model.dao.FacturaDAO;
import com.gameshop.model.dao.GeneroDAO;
import com.gameshop.model.dao.JuegoDAO;
import com.gameshop.model.dao.PlataformaDAO;
import com.gameshop.model.dao.UsuarioDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author joseluis
 */
@Controller
public class ChatController {

    @Autowired
    private JuegoDAO juegoDAO;

    @Autowired
    private FacturaDAO facturaDAO;

    @Autowired
    private GeneroDAO generoDAO;

    @Autowired
    private PlataformaDAO plataformaDAO;

    @Autowired
    private EditoraDAO editoraDAO;

    @Autowired
    private DistribuidoraDAO distribuidoraDAO;

    @RequestMapping(value = {"http://localhost:3000/chat"}, method = RequestMethod.GET)
    public String catalogo(Model model, @RequestParam(value = "action", required = false) String action, HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");

        model.addAttribute("usuarioBean", usuarioBean);
        return "/chat";
    }



}
