package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
public class OrderController {
    @GetMapping("/admin/order")
    public String getUserTabel(Model model) {
        return "admin/order/show";
    }
}
