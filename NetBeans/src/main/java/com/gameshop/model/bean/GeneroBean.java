package com.gameshop.model.bean;

import java.io.Serializable;
import org.hibernate.validator.constraints.Range;

public class GeneroBean implements Serializable {
    
    @Range(min = 1, max = 3, message = "Debe seleccionar una opción")
    private int idgenero;
    private String nombre;
    private String descripcion;
       
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdgenero() {
        return idgenero;
    }

    public void setIdgenero(int idgenero) {
        this.idgenero = idgenero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
