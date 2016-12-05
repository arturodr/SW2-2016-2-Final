package com.gameshop.model.bean;

import java.io.Serializable;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Range;

public class PlataformaBean implements Serializable {
    
    @Range(min = 1, max = 3, message = "Debe seleccionar una opción")
    private int idplataforma;
    private String nombre;
    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdplataforma() {
        return idplataforma;
    }

    public void setIdplataforma(int idplataforma) {
        this.idplataforma = idplataforma;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
