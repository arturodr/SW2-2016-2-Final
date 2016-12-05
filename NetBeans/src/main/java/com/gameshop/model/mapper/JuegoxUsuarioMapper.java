package com.gameshop.model.mapper;

import com.gameshop.model.bean.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class JuegoxUsuarioMapper implements RowMapper<JuegoBean> {

    @Override
    public JuegoBean mapRow(ResultSet rs, int i) throws SQLException {
        JuegoBean juego = new JuegoBean();
        juego.setIdjuego(rs.getInt("j.idjuego"));
        juego.setNombre(rs.getString("j.nombre"));
        juego.setDescripcion(rs.getString("j.descripcion"));
        juego.setPrecio(rs.getString("j.precio"));
        
        GeneroBean genero = new GeneroBean();
        genero.setIdgenero(rs.getInt("g.idgenero"));
        genero.setNombre(rs.getString("g.nombre"));
        juego.setGenero(genero);

        EditoraBean editora =  new EditoraBean();
        editora.setIdeditora(rs.getInt("e.ideditora"));
        editora.setNombre(rs.getString("e.nombre"));
        juego.setEditora(editora);
        
        PlataformaBean plataforma = new PlataformaBean();
        plataforma.setIdplataforma(rs.getInt("p.idplataforma"));
        plataforma.setNombre(rs.getString("p.nombre"));
        juego.setPlataforma(plataforma);
        
        DistribuidoraBean distribuidora = new DistribuidoraBean();
        distribuidora.setIddistribuidora(rs.getInt("d.iddistribuidora"));
        distribuidora.setNombre(rs.getString("d.nombre"));
        juego.setDistribuidora(distribuidora);
        
        juego.setCantidad(rs.getInt("ju.cantidad"));
        
        return juego;
    }        
    
}
