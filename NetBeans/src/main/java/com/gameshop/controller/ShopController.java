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
public class ShopController {

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

    @RequestMapping(value = {"/shop/catalogo"}, method = RequestMethod.GET)
    public String catalogo(Model model, @RequestParam(value = "action", required = false) String action, HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
        ArrayList<JuegoBean> carritoList = (ArrayList<JuegoBean>) session.getAttribute("carrito");
        List<JuegoBean> juegoList = juegoDAO.listjuegos(new JuegoBean("", "", "", null, null, null, null));
        model.addAttribute("juego", new JuegoBean());
        model.addAttribute("ListaCarrito", carritoList);
        model.addAttribute("ListaJuegos", juegoList);
        model.addAttribute("ListaGeneros", generoDAO.listgeneros());
        model.addAttribute("ListaPlataformas", plataformaDAO.listplataformas());
        model.addAttribute("ListaEditoras", editoraDAO.listeditoras());
        model.addAttribute("ListaDistribuidoras", distribuidoraDAO.listdistribuidoras());
        return "/user/shop/catalogo";
    }

    @RequestMapping(value = {"/shop/search"}, method = RequestMethod.POST)
    public String search(Model model, @ModelAttribute("juego") JuegoBean juego, HttpSession session) {
        UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
        ArrayList<JuegoBean> carritoList = (ArrayList<JuegoBean>) session.getAttribute("carrito");
        List<JuegoBean> juegoList = juegoDAO.listjuegos(juego);
        model.addAttribute("ListaCarrito", carritoList);
        model.addAttribute("ListaJuegos", juegoList);
        model.addAttribute("ListaGeneros", generoDAO.listgeneros());
        model.addAttribute("ListaPlataformas", plataformaDAO.listplataformas());
        model.addAttribute("ListaEditoras", editoraDAO.listeditoras());
        model.addAttribute("ListaDistribuidoras", distribuidoraDAO.listdistribuidoras());
        return "/user/shop/catalogo";
    }

    @RequestMapping(value = {"/shop/agregar"}, method = RequestMethod.GET)
    public String agregarCarrito(Model model, @RequestParam(value = "id", required = true) int id, HttpSession session) {

        ArrayList<JuegoBean> juegoList = (ArrayList<JuegoBean>) session.getAttribute("carrito");
        if (juegoList == null) {
            session.setAttribute("carrito", new ArrayList<JuegoBean>());
            juegoList = (ArrayList<JuegoBean>) session.getAttribute("carrito");
            JuegoBean juego = juegoDAO.info(id);
            juego.setCantidad(1);
            juegoList.add(juego);
        } else {
            boolean exist = false;
            for (JuegoBean j : juegoList) {
                if (j.getIdjuego() == id) {
                    j.setCantidad(j.getCantidad() + 1);
                    exist = true;
                }
            }
            if (!exist) {
                JuegoBean juego = juegoDAO.info(id);
                juego.setCantidad(1);
                juegoList.add(juego);
            }
        }
        return "redirect:/shop/catalogo";
    }

    @RequestMapping(value = {"/shop/carrito"}, method = RequestMethod.GET)
    public String carrito(Model model, @RequestParam(value = "action", required = false) String action, HttpSession session) {
        ArrayList<JuegoBean> carritoList = (ArrayList<JuegoBean>) session.getAttribute("carrito");
        double total = juegoDAO.calcularTotal(carritoList);
        session.setAttribute("total", total);
        model.addAttribute("ListaCarrito", carritoList);
        model.addAttribute("total", total);
        return "/user/shop/carrito";
    }

    /*
     Completar Método que muestra el formulario de Factura
     */
    @RequestMapping(value = {"/shop/factura"}, method = RequestMethod.GET)
    public String view(Model model, @RequestParam(value = "id", required = false) Integer id, HttpSession session) {
        model.addAttribute("fechaEnvio", new FacturaBean().getFechaEnvio());
        model.addAttribute("tarjeta", new FacturaBean().getTarjeta());
        model.addAttribute("codigoVerificacion", new FacturaBean().getCodigoVerificacion());
        model.addAttribute("direccion", new FacturaBean().getDireccion());
        return "/user/shop/factura";
    }

    /*
     Completar Método que recibe DATOS del formulario de Factura
     Si hay errores, redirigir al formulario. Si no, guardar Factura.
     */

    @RequestMapping(value = {"/shop/save"}, method = RequestMethod.POST)
    public String save(@ModelAttribute("factura") FacturaBean factura,BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            model.addAttribute("fechaEnvio", new FacturaBean().getFechaEnvio());
            model.addAttribute("tarjeta", new FacturaBean().getTarjeta());
            model.addAttribute("codigoVerificacion", new FacturaBean().getCodigoVerificacion());
            model.addAttribute("direccion", new FacturaBean().getDireccion());
            return "redirect:/shop/factura";
        }else{
            return "redirect:/shop/factura";
        }

    }

}
