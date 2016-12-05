package com.gameshop.controller;

import com.gameshop.model.bean.*;
import com.gameshop.model.dao.*;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JuegoController {

    @Autowired
    private JuegoDAO juegoDAO;

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    private GeneroDAO generoDAO;

    @Autowired
    private PlataformaDAO plataformaDAO;

    @Autowired
    private EditoraDAO editoraDAO;

    @Autowired
    private DistribuidoraDAO distribuidoraDAO;

    @RequestMapping(value = "/admin/juego", method = RequestMethod.GET)
    public String home(Model model, @RequestParam(value = "action", required = false) String action) {
        List<JuegoBean> juegoList = juegoDAO.listjuegos(new JuegoBean("", "", "", null, null, null, null));
        model.addAttribute("ListaJuegos", juegoList);
        return "/admin/juego/list";
    }

    @RequestMapping(value = {"/juego"}, method = RequestMethod.GET)
    public String mygames(Model model, @RequestParam(value = "action", required = false) String action, HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
        List<JuegoBean> juegoList = juegoDAO.listjuegosxusuario(usuarioBean, new JuegoBean("", "", "", null, null, null, null));
        model.addAttribute("juego", new JuegoBean());
        model.addAttribute("ListaJuegos", juegoList);
        model.addAttribute("ListaGeneros", generoDAO.listgeneros());
        model.addAttribute("ListaPlataformas", plataformaDAO.listplataformas());
        model.addAttribute("ListaEditoras", editoraDAO.listeditoras());
        model.addAttribute("ListaDistribuidoras", distribuidoraDAO.listdistribuidoras());
        return "/user/juego/mygames";
    }

    @RequestMapping(value = {"/juego/search"}, method = RequestMethod.POST)
    public String search(Model model, @ModelAttribute("juego") JuegoBean juego, HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
        List<JuegoBean> juegoList = juegoDAO.listjuegosxusuario(usuarioBean, juego);
        model.addAttribute("ListaJuegos", juegoList);
        model.addAttribute("ListaGeneros", generoDAO.listgeneros());
        model.addAttribute("ListaPlataformas", plataformaDAO.listplataformas());
        model.addAttribute("ListaEditoras", editoraDAO.listeditoras());
        model.addAttribute("ListaDistribuidoras", distribuidoraDAO.listdistribuidoras());
        return "/user/juego/mygames";
    }

    /*
        Este es el Método que muestra el formulario de creación de Juegos
    */    
    @RequestMapping(value = {"/juego/view"}, method = RequestMethod.GET)
    public String view(Model model, @RequestParam(value = "id", required = false) Integer id, HttpSession session) {

        JuegoBean juego = new JuegoBean();
        if (id != null) {
            juego = juegoDAO.info(id);
        }

        List<GeneroBean> generoList = generoDAO.listgeneros();
        List<PlataformaBean> plataformaList = plataformaDAO.listplataformas();
        List<EditoraBean> editoraList = editoraDAO.listeditoras();
        List<DistribuidoraBean> distribuidoraList = distribuidoraDAO.listdistribuidoras();
        model.addAttribute("juego", juego);
        model.addAttribute("ListaGeneros", generoList);
        model.addAttribute("ListaPlataformas", plataformaList);
        model.addAttribute("ListaEditoras", editoraList);
        model.addAttribute("ListaDistribuidoras", distribuidoraList);
        return "/admin/juego/form";
    }

    /*
        Este es el Método que recibe los DATOS del formulario de creación de Juegos
        result.hasErrors()  --->  Nos indica si hubo errores (Muestra el formularios con los errores).
                                  Si no hubo errores, guarda el Juego.
    */  
    @RequestMapping(value = {"/juego/save"}, method = RequestMethod.POST)
    public String save(@ModelAttribute("juego") @Valid JuegoBean juego, BindingResult result, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("juego", juego);
            model.addAttribute("ListaGeneros", generoDAO.listgeneros());
            model.addAttribute("ListaPlataformas", plataformaDAO.listplataformas());
            model.addAttribute("ListaEditoras", editoraDAO.listeditoras());
            model.addAttribute("ListaDistribuidoras", distribuidoraDAO.listdistribuidoras());
            return "/admin/juego/form";
        } else {
            if (juego.getIdjuego() == 0) {
                juegoDAO.insert(juego);
            } else {
                juegoDAO.update(juego);
            }
            return "redirect:/admin/juego";
        }
    }

    @RequestMapping(value = {"/juego/delete"}, method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Integer id) {

        if (id != null) {
            juegoDAO.delete(id);
        }

        return "redirect:/admin/juego";
    }

}
