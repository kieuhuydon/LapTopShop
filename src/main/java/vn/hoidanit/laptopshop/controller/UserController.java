package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserSevice;



@Controller
public class UserController {
    private final UserSevice userSevice;

    public UserController(UserSevice userSevice){
        this.userSevice = userSevice;
    }

    @GetMapping("/admin/user")
        public String getUserPAge (Model model){
            model.addAttribute("newUser", new User());
            return "admin/user/create";
        }

    @PostMapping("/admin/user/create1")
        public String createUserPAge (Model model, @ModelAttribute("newUser") User don){
            System.out.println("run here"+ don);
            this.userSevice.solveSave(don);
            return "admin/user/hello";
        }

}
