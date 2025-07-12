package vn.hoidanit.laptopshop.config;

import java.io.IOException;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userService;
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        //get session
        HttpSession session = request.getSession(false);
        // get user details (username=email sau khi login lưu vào auth..)
        String userName = authentication.getName();
        User user = this.userService.getUserByEmail(userName);

        // set in session
        if(user!=null){
          session.setAttribute("fullName", user.getFullName());
          session.setAttribute("avatar", user.getAvatar());
          session.setAttribute("id", user.getId());
          session.setAttribute("email", user.getEmail());
          
          int sum = user.getCart() ==null ? 0 : user.getCart().getSum();
          session.setAttribute("sum", sum);

        }
       


        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        boolean isAdmin = authorities.stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"));

        if (isAdmin) {
            response.sendRedirect("/admin");
        } else {
            response.sendRedirect("/");
        }
    }
    
}
