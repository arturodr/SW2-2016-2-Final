package com.gameshop.model.dao;

import com.gameshop.model.bean.EditoraBean;
import com.gameshop.model.mapper.EditoraMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("editoraDAO")
public class EditoraDAO {

    @Autowired
    private DataSource dataSource;
   
    public List<EditoraBean> listeditoras() {
        
        String query = "SELECT ideditora, nombre, descripcion FROM editoras";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        List<EditoraBean> editora_list = jdbcTemplate.query(query, new EditoraMapper());
        return editora_list;
        
    }

}
