package com.gameshop.model.mapper;

import com.gameshop.model.bean.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class PlataformaMapper implements RowMapper<PlataformaBean> {

    @Override
    public PlataformaBean mapRow(ResultSet rs, int i) throws SQLException {
        PlataformaBean plataforma = new PlataformaBean();
        plataforma.setIdplataforma(rs.getInt("idplataforma"));
        plataforma.setNombre(rs.getString("nombre"));
        plataforma.setDescripcion(rs.getString("descripcion"));
        return plataforma;
    }        
    
}
