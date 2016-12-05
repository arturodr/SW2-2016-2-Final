/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gameshop.model.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 *
 * @author joseluis
 */
public class FechaValidator implements ConstraintValidator<Fecha, String> {

    @Override
    public void initialize(Fecha paramA) {
    }

    @Override
    public boolean isValid(String fechaValue, ConstraintValidatorContext ctx) {
        if (fechaValue == null || fechaValue.trim().length()==0) {
            return false;
        }        
        //validamos que sea un numero (Double)
        else if (fechaValue.matches("^\\d{4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])$")) {
            // Cumple la validación retorna TRUE
            return true;
        } 
        else {
            // Si no cumple la validación retorna FALSE
            return false;
        }
    }
}
