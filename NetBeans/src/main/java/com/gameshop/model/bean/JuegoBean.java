package com.gameshop.model.bean;

import com.gameshop.model.validator.Precio;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;


public class JuegoBean implements Serializable {
    private int idjuego = 0;
    
    @NotBlank(message = "El campo no puede estar vacío.") @Size(min=2, max=30)
    private String nombre;
    private String descripcion;
    
    @Precio
    private String precio;  
    @Valid
    private GeneroBean genero;
    @Valid
    private DistribuidoraBean distribuidora;
    @Valid
    private EditoraBean editora;
    @Valid
    private PlataformaBean plataforma;
    
    private int cantidad;

    public JuegoBean() {}   
    
    public JuegoBean(String nombre, String descripcion, String precio, GeneroBean genero, DistribuidoraBean distribuidora, EditoraBean editora, PlataformaBean plataforma) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.genero = genero;
        this.distribuidora = distribuidora;
        this.editora = editora;
        this.plataforma = plataforma;
    }  
    
    
    /**
     * @return the idjuego
     */
    public int getIdjuego() {
        return idjuego;
    }

    /**
     * @param idjuego the idjuego to set
     */
    public void setIdjuego(int idjuego) {
        this.idjuego = idjuego;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the precio
     */
    public String getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(String precio) {
        this.precio = precio;
    }

    /**
     * @return the genero
     */
    public GeneroBean getGenero() {
        return genero;
    }

    /**
     * @param genero the genero to set
     */
    public void setGenero(GeneroBean genero) {
        this.genero = genero;
    }

    /**
     * @return the distribuidora
     */
    public DistribuidoraBean getDistribuidora() {
        return distribuidora;
    }

    /**
     * @param distribuidora the distribuidora to set
     */
    public void setDistribuidora(DistribuidoraBean distribuidora) {
        this.distribuidora = distribuidora;
    }

    /**
     * @return the editora
     */
    public EditoraBean getEditora() {
        return editora;
    }

    /**
     * @param editora the editora to set
     */
    public void setEditora(EditoraBean editora) {
        this.editora = editora;
    }

    /**
     * @return the plataforma
     */
    public PlataformaBean getPlataforma() {
        return plataforma;
    }

    /**
     * @param plataforma the plataforma to set
     */
    public void setPlataforma(PlataformaBean plataforma) {
        this.plataforma = plataforma;
    }

    /**
     * @return the Cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad
     * 
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }


   
}
