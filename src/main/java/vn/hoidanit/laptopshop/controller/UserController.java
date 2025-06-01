package vn.hoidanit.laptopshop.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserSevice;




@Controller
public class UserController {
    private final UserSevice userSevice;

    //inject dependency
    public UserController(UserSevice userSevice){
        this.userSevice = userSevice;
    }

    //table user
    @GetMapping("/admin/user")
    public String getUserTabel(Model model) {
        List users = this.userSevice.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    // create
    @GetMapping("/admin/user/create")
        public String getUserPAge (Model model){
            model.addAttribute("newUser", new User());
            return "admin/user/create";
        }

    @PostMapping("/admin/user/create")
        public String createUserPAge (Model model, @ModelAttribute("newUser") User don){
            System.out.println("run here"+ don);
            this.userSevice.solveSave(don);
            return "redirect:/admin/user"; /*tương ứng get request, spring gọi controller */
        }

    // view
     @GetMapping("/admin/user/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        model.addAttribute("id", id); // lấy được id từ table-user, truyền qua view
        User user = this.userSevice.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/view";
    }

    //update
    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdate(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User currentUser = this.userSevice.getUserById(id);
        model.addAttribute("currentUser", currentUser); // fil thông tin đã có
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUser(Model model, @ModelAttribute("currentUser") User currentUse) {
        User updateUser = this.userSevice.getUserById(currentUse.getId());// lôi user chưa update từ database
        if(updateUser!=null){
            updateUser.setAddress(currentUse.getAddress());
            updateUser.setFullName(currentUse.getFullName());
            updateUser.setPhoneNumber(currentUse.getPhoneNumber());
        }
        this.userSevice.solveSave(updateUser);
        return "redirect:/admin/user";
    }

    // delete
    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable long id) {// lấy giá trị id động từ view sang controller
        this.userSevice.deleteUserById(id);
        return "redirect:/admin/user";
    }


}
