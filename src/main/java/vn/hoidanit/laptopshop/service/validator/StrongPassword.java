package vn.hoidanit.laptopshop.service.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = StrongPasswordValidator.class) // class thực hiện kiểm tra
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface StrongPassword {

    String message() default "Password must be at least 8 characters long, include uppercase, lowercase, number, and special character";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}