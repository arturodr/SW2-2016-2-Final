
package com.gameshop.model.bean;

import com.gameshop.model.validator.Fecha;
import java.io.Serializable;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;


public class FacturaBean implements Serializable {    
    
    private int idfactura;
    @Fecha
    private String fechaEnvio;
    @NotBlank(message = "El campo no puede estar vacío.") @Size(min=19, max=19, message = "El campo debe tener {min} caracteres")
    private String tarjeta;
    @Range(min=100, max=999, message = "El campo debe tener 3 caracteres numéricos")
    private String codigoVerificacion;
    @NotBlank(message = "El campo no puede estar vacío.") @Size(min=5, max=255)
    private String direccion;
    
    private double monto;
    private int idusuario;

    /**
     * @return the fechaEnvio
     */
    public String getFechaEnvio() {
        return fechaEnvio;
    }

    /**
     * @param fechaEnvio the fechaEnvio to set
     */
    public void setFechaEnvio(String fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    /**
     * @return the tarjeta
     */
    public String getTarjeta() {
        return tarjeta;
    }

    /**
     * @param tarjeta the tarjeta to set
     */
    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }

    /**
     * @return the codigoVerificacion
     */
    public String getCodigoVerificacion() {
        return codigoVerificacion;
    }

    /**
     * @param codigoVerificacion the codigoVerificacion to set
     */
    public void setCodigoVerificacion(String codigoVerificacion) {
        this.codigoVerificacion = codigoVerificacion;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the idfactura
     */
    public int getIdfactura() {
        return idfactura;
    }

    /**
     * @param idfactura the idfactura to set
     */
    public void setIdfactura(int idfactura) {
        this.idfactura = idfactura;
    }

    /**
     * @return the monto
     */
    public double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(double monto) {
        this.monto = monto;
    }

    /**
     * @return the idusuario
     */
    public int getIdusuario() {
        return idusuario;
    }

    /**
     * @param idusuario the idusuario to set
     */
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
}
