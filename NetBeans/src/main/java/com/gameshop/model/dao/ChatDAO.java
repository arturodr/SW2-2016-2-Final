/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gameshop.model.dao;

import com.gameshop.model.bean.MsjChat;
import com.gameshop.model.bean.UsuarioBean;
import com.gameshop.model.mapper.ChatMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Renato
 */
@Repository("chatDAO")
public class ChatDAO {
    
    @Autowired  
public DataSource dataSource;    
    
    public List<MsjChat> list() {

        String query = "select c.id, c.texto "
                + "from msjchat c order by c.id ASC limit 50;";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<MsjChat> usuariosList = jdbcTemplate.query(query, new ChatMapper());
        return usuariosList;

    }
    
    
    public int insertt(final MsjChat msj) {
        StringBuilder sql = new StringBuilder();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO msjchat "
                + "(texto) "
                + "VALUES (?)";

        try {
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            jdbcTemplate.update(
                    new PreparedStatementCreator() {

                @Override
                public PreparedStatement createPreparedStatement(Connection cnctn) throws SQLException {
                    PreparedStatement ps = cnctn.prepareStatement(query,
                            new String[]{"id"});

                    ps.setString(1, msj.getTexto());
                    

                    return ps;
                }
            }, keyHolder);

        } catch (Exception ex) {
            System.out.println("Insert -1" + ex.toString());
        }
        
        return keyHolder.getKey().intValue();
    }
    
}
