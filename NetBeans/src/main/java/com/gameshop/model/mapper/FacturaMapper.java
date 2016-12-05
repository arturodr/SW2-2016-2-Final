
package com.gameshop.model.mapper;

import com.gameshop.model.bean.FacturaBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;


public class FacturaMapper implements RowMapper<FacturaBean> {

    @Override
    public FacturaBean mapRow(ResultSet rs, int i) throws SQLException {
        FacturaBean factura = new FacturaBean();
        factura.setIdfactura(rs.getInt("idfactura"));
        factura.setFechaEnvio(rs.getString("fechaEnvio"));
        factura.setTarjeta(rs.getString("tarjeta"));
        factura.setCodigoVerificacion(rs.getString("codigoVerificacion"));
        factura.setDireccion(rs.getString("direccion"));
        factura.setMonto(rs.getDouble("monto"));
        factura.setIdusuario(rs.getInt("idusuario"));
        return factura;
    }

}
