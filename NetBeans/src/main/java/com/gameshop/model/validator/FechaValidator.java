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
        /*
        Completar Validador de Fecha
        */
        return false;
    }
}
