package vn.hoidanit.laptopshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator (UserService userService){
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;
        if(!user.getPassWord().equals(user.getConfirmPassword())){
            context.buildConstraintViolationWithTemplate("Mật khẩu nhập lại không chính xác!")
            .addPropertyNode("confirmPassword")
            .addConstraintViolation()
            .disableDefaultConstraintViolation();
            valid = false;
        }

        // check email
        if(this.userService.existsByEmail(user.getEmail())){
            context.buildConstraintViolationWithTemplate("Email đã tồn tại!")
            .addPropertyNode("email")
            .addConstraintViolation()
            .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
