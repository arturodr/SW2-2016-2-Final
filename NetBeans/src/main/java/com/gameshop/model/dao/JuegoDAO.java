package com.gameshop.model.dao;

import com.gameshop.model.bean.JuegoBean;
import com.gameshop.model.bean.UsuarioBean;
import com.gameshop.model.mapper.JuegoMapper;
import com.gameshop.model.mapper.JuegoxUsuarioMapper;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("juegoDAO")
public class JuegoDAO {

    @Autowired
    private DataSource dataSource;

    public List<JuegoBean> listjuegosxusuario(UsuarioBean usuario, JuegoBean juego) {

        String query = "SELECT j.idjuego,j.nombre,j.descripcion,j.precio,"
                + "g.nombre, p.nombre,"
                + "e.nombre, d.nombre, "
                + "g.nombre, g.idgenero, "
                + "p.nombre, p.idplataforma,"
                + "e.nombre, e.ideditora, "
                + "d.nombre, d.iddistribuidora, "
                + "ju.cantidad "
                + "FROM juegos j "
                + "INNER JOIN generos g ON j.idgenero = g.idgenero "
                + "INNER JOIN plataformas p ON j.idplataforma = p.idplataforma "
                + "INNER JOIN editoras e ON j.ideditora = e.ideditora "
                + "INNER JOIN distribuidoras d ON j.iddistribuidora = d.iddistribuidora "
                + "INNER JOIN juegosxusuario ju ON j.idjuego=ju.idjuego "
                + "WHERE idusuario = ? ";

        List<Object> parametros = new ArrayList<Object>();
        parametros.add(usuario.getIdusuario());

        if (juego.getNombre().trim().length() > 0) {
            query = query + " AND upper(j.nombre) Like upper(concat('%', ?, '%')) ";
            parametros.add(juego.getNombre());
        }

        if (juego.getGenero() != null) {
            if (juego.getGenero().getIdgenero() > 0) {
                query = query + " AND g.idgenero = ? ";
                parametros.add(juego.getGenero().getIdgenero());
            }
        }

        if (juego.getPlataforma() != null) {
            if (juego.getPlataforma().getIdplataforma() > 0) {
                query = query + " AND p.idplataforma = ? ";
                parametros.add(juego.getPlataforma().getIdplataforma());
            }
        }

        if (juego.getEditora() != null) {
            if (juego.getEditora().getIdeditora() > 0) {
                query = query + " AND e.ideditora = ? ";
                parametros.add(juego.getEditora().getIdeditora());
            }
        }

        if (juego.getDistribuidora() != null) {
            if (juego.getDistribuidora().getIddistribuidora() > 0) {
                query = query + " AND d.iddistribuidora = ? ";
                parametros.add(juego.getDistribuidora().getIddistribuidora());
            }
        }

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<JuegoBean> juego_list = jdbcTemplate.query(query, parametros.toArray(), new JuegoxUsuarioMapper());
        return juego_list;

    }

    public List<JuegoBean> listjuegos(JuegoBean juego) {

        String query = "SELECT j.idjuego,j.nombre,j.descripcion,j.precio,"
                + "g.nombre, p.nombre,"
                + "e.nombre, d.nombre, "
                + "g.nombre, g.idgenero, "
                + "p.nombre, p.idplataforma,"
                + "e.nombre, e.ideditora, "
                + "d.nombre, d.iddistribuidora "
                + "FROM juegos j "
                + "INNER JOIN generos g ON j.idgenero = g.idgenero "
                + "INNER JOIN plataformas p ON j.idplataforma = p.idplataforma "
                + "INNER JOIN editoras e ON j.ideditora = e.ideditora "
                + "INNER JOIN distribuidoras d ON j.iddistribuidora = d.iddistribuidora ";

        List<Object> parametros = new ArrayList<Object>();

        if (juego.getNombre().trim().length() > 0) {
            query = query + " AND upper(j.nombre) Like upper(concat('%', ?, '%')) ";
            parametros.add(juego.getNombre());
        }

        if (juego.getGenero() != null) {
            if (juego.getGenero().getIdgenero() > 0) {
                query = query + " AND g.idgenero = ? ";
                parametros.add(juego.getGenero().getIdgenero());
            }
        }

        if (juego.getPlataforma() != null) {
            if (juego.getPlataforma().getIdplataforma() > 0) {
                query = query + " AND p.idplataforma = ? ";
                parametros.add(juego.getPlataforma().getIdplataforma());
            }
        }

        if (juego.getEditora() != null) {
            if (juego.getEditora().getIdeditora() > 0) {
                query = query + " AND e.ideditora = ? ";
                parametros.add(juego.getEditora().getIdeditora());
            }
        }

        if (juego.getDistribuidora() != null) {
            if (juego.getDistribuidora().getIddistribuidora() > 0) {
                query = query + " AND d.iddistribuidora = ? ";
                parametros.add(juego.getDistribuidora().getIddistribuidora());
            }
        }

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<JuegoBean> juego_list = jdbcTemplate.query(query, parametros.toArray(), new JuegoMapper());
        return juego_list;

    }

    public JuegoBean info(int id) {

        String query = "SELECT j.idjuego,j.nombre,j.descripcion,j.precio,"
                + "g.nombre, g.idgenero, "
                + "p.nombre, p.idplataforma,"
                + "e.nombre, e.ideditora, "
                + "d.nombre, d.iddistribuidora "
                + "FROM juegos j "
                + "INNER JOIN generos g ON j.idgenero = g.idgenero "
                + "INNER JOIN plataformas p ON j.idplataforma = p.idplataforma "
                + "INNER JOIN editoras e ON j.ideditora = e.ideditora "
                + "INNER JOIN distribuidoras d ON j.iddistribuidora = d.iddistribuidora "
                + "WHERE j.idjuego = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        JuegoBean juego = jdbcTemplate.queryForObject(query, new Object[]{id}, new JuegoMapper());
        return juego;
    }

    public void update(JuegoBean juego) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE juegos SET nombre = ?,"
                + " descripcion = ? ,"
                + " precio = ? ,"
                + " ideditora = ? ,"
                + " idgenero = ? ,"
                + " idplataforma = ? ,"
                + " iddistribuidora = ? "
                + " WHERE idjuego = ?");

        try {
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            List<Object> parametros = new ArrayList<Object>();
            parametros.add(juego.getNombre());
            parametros.add(juego.getDescripcion());
            parametros.add(juego.getPrecio());
            parametros.add(juego.getEditora().getIdeditora());
            parametros.add(juego.getGenero().getIdgenero());
            parametros.add(juego.getPlataforma().getIdplataforma());
            parametros.add(juego.getDistribuidora().getIddistribuidora());
            parametros.add(juego.getIdjuego());
            jdbcTemplate.update(sql.toString(), parametros.toArray());
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

    public void insert(JuegoBean juego) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO juegos (nombre, "
                + " descripcion ,"
                + " precio ,"
                + " ideditora ,"
                + " idgenero ,"
                + " idplataforma ,"
                + " iddistribuidora) VALUES"
                + " (?, ?, ?, ?, ?, ?, ?)");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<Object> parametros = new ArrayList<Object>();
        parametros.add(juego.getNombre());
        parametros.add(juego.getDescripcion());
        parametros.add(juego.getPrecio());
        parametros.add(juego.getEditora().getIdeditora());
        parametros.add(juego.getGenero().getIdgenero());
        parametros.add(juego.getPlataforma().getIdplataforma());
        parametros.add(juego.getDistribuidora().getIddistribuidora());
        jdbcTemplate.update(sql.toString(), parametros.toArray());
    }

    public void delete(Integer id) {
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM juegos WHERE idjuego = ?");
        try {
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            jdbcTemplate.update(sql.toString(), new Object[]{id});
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

    public double calcularTotal(ArrayList<JuegoBean> carritoList) {

        double total = 0;
        if (carritoList != null) {
            for (JuegoBean j : carritoList) {
                total += j.getCantidad() * Double.parseDouble(j.getPrecio());
            }
        }
        
        return total;

    }

}
