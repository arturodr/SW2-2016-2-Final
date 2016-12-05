
package com.gameshop.model.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;
 
import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = PrecioValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface Precio {
    String message() default "No es un precio válido";
      
    Class<?>[] groups() default {};
      
    Class<? extends Payload>[] payload() default {};
}
