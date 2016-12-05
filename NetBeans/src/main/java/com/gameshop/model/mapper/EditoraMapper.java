package com.gameshop.model.mapper;

import com.gameshop.model.bean.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class EditoraMapper implements RowMapper<EditoraBean> {

    @Override
    public EditoraBean mapRow(ResultSet rs, int i) throws SQLException {
        EditoraBean editora = new EditoraBean();
        editora.setIdeditora(rs.getInt("ideditora"));
        editora.setNombre(rs.getString("nombre"));
        editora.setDescripcion(rs.getString("descripcion"));
        return editora;
    }        
    
}
