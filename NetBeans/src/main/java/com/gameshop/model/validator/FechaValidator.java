
package com.gameshop.model.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class FechaValidator implements ConstraintValidator<Fecha, String> {

    @Override
    public void initialize(Fecha paramA) {
    }

    @Override
    public boolean isValid(String fechaValue, ConstraintValidatorContext ctx) {
        if (fechaValue == null || fechaValue.trim().length() == 0) {
            return false;
        } //validación de que sea un numero Double
        else if (fechaValue.matches("^\\d{4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])$")) {
            // Si cumple la validación retorna TRUE
            return true;
        } else {
            // Si no cumple la cumple retorna FALSE
            return false;
        }
    }
}
