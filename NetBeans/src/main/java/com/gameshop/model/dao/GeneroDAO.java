package com.gameshop.model.dao;

import com.gameshop.model.bean.GeneroBean;
import com.gameshop.model.mapper.GeneroMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("generoDAO")
public class GeneroDAO {

    @Autowired
    private DataSource dataSource;
   
    public List<GeneroBean> listgeneros() {
        
        String query = "SELECT idgenero, nombre, descripcion FROM generos";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<GeneroBean> genero_list = jdbcTemplate.query(query, new GeneroMapper());
        return genero_list;
        
    }

}
