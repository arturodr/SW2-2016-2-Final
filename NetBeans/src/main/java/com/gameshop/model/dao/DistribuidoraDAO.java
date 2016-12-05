package com.gameshop.model.dao;

import com.gameshop.model.bean.DistribuidoraBean;
import com.gameshop.model.mapper.DistribuidoraMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("distribuidoraDAO")
public class DistribuidoraDAO {

    @Autowired
    private DataSource dataSource;
   
    public List<DistribuidoraBean> listdistribuidoras() {
        
        String query = "SELECT iddistribuidora, nombre, descripcion FROM distribuidoras";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<DistribuidoraBean> distribuidora_list = jdbcTemplate.query(query, new DistribuidoraMapper());
        return distribuidora_list;
        
    }

}
