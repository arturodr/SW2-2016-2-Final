package com.gameshop.model.bean;

import java.io.Serializable;
import org.hibernate.validator.constraints.Range;

public class DistribuidoraBean implements Serializable {
    
    @Range(min = 1, max = 4, message = "Debe seleccionar una opción")
    private int iddistribuidora;
    private String nombre;
    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIddistribuidora() {
        return iddistribuidora;
    }

    public void setIddistribuidora(int iddistribuidora) {
        this.iddistribuidora = iddistribuidora;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
