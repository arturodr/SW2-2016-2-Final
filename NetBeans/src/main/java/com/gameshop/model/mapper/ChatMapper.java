package com.gameshop.model.mapper;


import com.gameshop.model.bean.MsjChat;
import com.gameshop.model.bean.UsuarioBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class ChatMapper implements RowMapper<MsjChat> {
    @Override
    public MsjChat mapRow(ResultSet rs, int i) throws SQLException {
        MsjChat msj = new MsjChat();
        msj.setId(rs.getInt("c.id"));
        msj.setTexto(rs.getString("c.texto"));         
        return msj;
    }   
}
