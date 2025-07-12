package vn.hoidanit.laptopshop.controller.admin;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.service.UserService;




@Controller
public class DashBoardController {
    private final UserService userService;
    public DashBoardController (UserService userService){
        this.userService =userService;
    }
    

    @GetMapping("/admin")
    public String getDashBoard(Model model){
        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countProduct", this.userService.countProduct());
        model.addAttribute("countOrder", this.userService.countOrder());

        return "admin/dashboard/show";
    }
}
