package com.gameshop.model.mapper;

import com.gameshop.model.bean.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class GeneroMapper implements RowMapper<GeneroBean> {

    @Override
    public GeneroBean mapRow(ResultSet rs, int i) throws SQLException {
        GeneroBean genero = new GeneroBean();
        genero.setIdgenero(rs.getInt("idgenero"));
        genero.setNombre(rs.getString("nombre"));
        genero.setDescripcion(rs.getString("descripcion"));
        return genero;
    }        
    
}
