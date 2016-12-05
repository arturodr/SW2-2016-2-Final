package com.gameshop.model.dao;

import com.gameshop.model.bean.UsuarioBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("usuarioDAO")
public class UsuarioDAO {

@Autowired  
private DataSource dataSource;    
    
 public UsuarioBean get(String username) {
        StringBuilder query = new StringBuilder();
        query.append("SELECT idusuario, apellidos, nombres, correo, autorizacion");
        query.append(" FROM usuarios ");
        query.append(" where correo = ? ");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        UsuarioBean resultado = jdbcTemplate.queryForObject(query.toString(), new Object[]{username}, new RowMapper<UsuarioBean>() {
            @Override
            public UsuarioBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                UsuarioBean usuario = new UsuarioBean();
                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setAutorizacion(rs.getString("autorizacion"));
                return usuario;
            }
        });
        return resultado;
    }    
}
