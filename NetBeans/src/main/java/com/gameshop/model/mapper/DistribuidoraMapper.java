package com.gameshop.model.mapper;

import com.gameshop.model.bean.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class DistribuidoraMapper implements RowMapper<DistribuidoraBean> {

    @Override
    public DistribuidoraBean mapRow(ResultSet rs, int i) throws SQLException {
        DistribuidoraBean distribuidora = new DistribuidoraBean();
        distribuidora.setIddistribuidora(rs.getInt("iddistribuidora"));
        distribuidora.setNombre(rs.getString("nombre"));
        distribuidora.setDescripcion(rs.getString("descripcion"));
        return distribuidora;
    }        
    
}
