package com.gameshop.model.dao;

import com.gameshop.model.bean.PlataformaBean;
import com.gameshop.model.mapper.PlataformaMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("plataformaDAO")
public class PlataformaDAO {

    @Autowired
    private DataSource dataSource;

    public List<PlataformaBean> listplataformas() {

        String query = "SELECT idplataforma, nombre, descripcion "
                + "FROM plataformas";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<PlataformaBean> plataforma_list = jdbcTemplate.query(query, new PlataformaMapper());
        return plataforma_list;

    }

}
