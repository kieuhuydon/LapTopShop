package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.ModelAttribute;



import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;


@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userSevice;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService,
    UserService userSevice, PasswordEncoder passwordEncoder){
        this.productService = productService;
        this.userSevice = userSevice;
        this.passwordEncoder = passwordEncoder;
    }
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/Auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
    BindingResult bindingResult)
    {   //validate
        
        if(bindingResult.hasErrors()){
            return "client/Auth/register";
        }

        User user = this.userSevice.registerDTOtoUser(registerUser);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        Role role = this.userSevice.getRoleByName("User");
        user.setRole(role);
        this.userSevice.solveSave(user);

        return "redirect:/login";
    }

    @GetMapping ("/login")
    public String getLoginPage(Model model){
    
        return "client/Auth/login";
    }

}
