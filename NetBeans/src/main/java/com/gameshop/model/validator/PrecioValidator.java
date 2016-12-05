
package com.gameshop.model.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class PrecioValidator implements ConstraintValidator<Precio, String> {

    @Override
    public void initialize(Precio paramA) {
    }

    @Override
    public boolean isValid(String precioValue, ConstraintValidatorContext ctx) {

        if (precioValue == null || precioValue.trim().length() == 0) {
            return false;
        } //validamos que sea un numero (Double)
        else if (precioValue.matches("[-+]?[0-9]*\\.?[0-9]*")) {
            // Cumple la validación retorna TRUE
            return true;
        } else {
            // Si no cumple la validación retorna FALSE
            return false;
        }
    }

}
