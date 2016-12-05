package com.gameshop.model.bean;

import java.io.Serializable;
import org.hibernate.validator.constraints.Range;

public class EditoraBean implements Serializable {
    
    @Range(min = 1, max = 4, message = "Debe seleccionar una opción")
    private int ideditora;
    private String nombre;
    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdeditora() {
        return ideditora;
    }

    public void setIdeditora(int ideditora) {
        this.ideditora = ideditora;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


}
