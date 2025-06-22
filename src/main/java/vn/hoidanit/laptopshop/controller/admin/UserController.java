package vn.hoidanit.laptopshop.controller.admin;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.service.UpLoadService;
import vn.hoidanit.laptopshop.service.UserService;


@Controller
public class UserController {
    private final UserService userService;
    private final UpLoadService upLoadService;
    private final PasswordEncoder passwordEncoder;

    // inject dependency
    public UserController(UserService userSevice,
    UpLoadService upLoadService,
    PasswordEncoder passwordEncoder ) {
        this.userService = userSevice;
        this.upLoadService = upLoadService;
        this.passwordEncoder = passwordEncoder;

    }

    // table user
    @GetMapping("/admin/user")
    public String getUserTabel(Model model) {
        List users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    // create
    @GetMapping("/admin/user/create")
    public String getUserPAge(Model model) {
        User user = new User();
        user.setRole(new Role());
        model.addAttribute("newUser", user);
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")

    public String createUserPage(Model model,
    @ModelAttribute("newUser") @Valid User newUser,
    BindingResult bindingResult,
    //nhận file từ client
    @RequestParam("file") MultipartFile file) {

        //validate
        if(bindingResult.hasErrors()){
            return "admin/user/create";
        }

        // lưu trữ file trên server
        String avatar = this.upLoadService.handleUpLoadFile(file,"avatar");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());

        newUser.setAvatar(avatar);
        newUser.setPassword(hashPassword);// newUser có đối tượng role chỉ có attribute name thôi
        Role role = this.userService.getRoleByName(newUser.getRole().getName());
        newUser.setRole(role);

        this.userService.solveSave(newUser);
        return "redirect:/admin/user"; /* tương ứng get request, spring gọi controller */
    }

    // view
    @GetMapping("/admin/user/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        model.addAttribute("id", id); // lấy được id từ table-user, truyền qua view
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/view";
    }

    // update
    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdate(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("currentUser", currentUser); // fil thông tin đã có
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUser(Model model, @ModelAttribute("currentUser") User currentUse) {
        User updateUser = this.userService.getUserById(currentUse.getId());// lôi user chưa update từ database
        if (updateUser != null) {
            updateUser.setAddress(currentUse.getAddress());
            updateUser.setFullName(currentUse.getFullName());
            updateUser.setPhoneNumber(currentUse.getPhoneNumber());
        }
        this.userService.solveSave(updateUser);
        return "redirect:/admin/user";
    }

    // delete
    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable long id) {// lấy giá trị id động từ view sang controller
        this.userService.deleteUserById(id);
        return "redirect:/admin/user";
    }

}
