
package com.gameshop.model.dao;

import com.gameshop.model.bean.FacturaBean;
import com.gameshop.model.bean.JuegoBean;
import com.gameshop.model.bean.UsuarioBean;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("facturaDAO")
public class FacturaDAO {

    @Autowired
    private DataSource dataSource;

    public void insert(FacturaBean factura) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO factura (fechaEnvio, "
                + " tarjeta ,"
                + " codigoVerificacion ,"
                + " direccion ,"
                + " monto ,"
                + " idusuario ) VALUES"
                + " (?, ?, ?, ?, ?, ?)");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<Object> parametros = new ArrayList<Object>();
        parametros.add(factura.getFechaEnvio());
        parametros.add(factura.getTarjeta());
        parametros.add(factura.getCodigoVerificacion());
        parametros.add(factura.getDireccion());
        parametros.add(factura.getMonto());
        parametros.add(factura.getIdusuario());

        jdbcTemplate.update(sql.toString(), parametros.toArray());
    }

    public void insertJuegosxUsuario(ArrayList<JuegoBean> ListaCarrito, UsuarioBean usuarioBean, List<JuegoBean> ListaJuegos) {

       
        for (JuegoBean j : ListaCarrito) {
            boolean exist = false;
            for (JuegoBean m : ListaJuegos) {
                if (j.getIdjuego() == m.getIdjuego()) {
                    exist = true;
                }
            }

            if (exist) {
                StringBuilder sql = new StringBuilder();
                sql.append("UPDATE juegosxusuario SET cantidad = ? "
                        + " WHERE idjuego = ? "
                        + " AND idusuario = ? ");
                JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
                List<Object> parametros = new ArrayList<Object>();
                parametros.add(j.getCantidad()+1);
                parametros.add(j.getIdjuego());
                parametros.add(usuarioBean.getIdusuario());                
                jdbcTemplate.update(sql.toString(), parametros.toArray());
            } else {
                StringBuilder sql = new StringBuilder();
                sql.append("INSERT INTO juegosxusuario (idjuego, "
                        + " idusuario ,"
                        + " cantidad) VALUES"
                        + " (?, ?, ?)");
                JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
                List<Object> parametros = new ArrayList<Object>();
                parametros.add(j.getIdjuego());
                parametros.add(usuarioBean.getIdusuario());
                parametros.add(j.getCantidad());
                jdbcTemplate.update(sql.toString(), parametros.toArray());
            }
        }
    }

}
