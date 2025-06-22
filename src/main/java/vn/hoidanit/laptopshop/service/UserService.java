package vn.hoidanit.laptopshop.service;
import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;


    public UserService(UserRepository userRepository, RoleRepository roleRepository){
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void solveSave(User user){
        this.userRepository.save(user);
    }
    public List <User> getAllUsers(){
        return this.userRepository.findAll();
    }
    public User getUserById(long id){
        return this.userRepository.findById(id);

    }

    public void deleteUserById(long id){
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findRoleByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO){
        User user = new User();
        user.setFullName(registerDTO.getFirstName()+" "+registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassWord());
        return user;

    }

    public boolean existsByEmail(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.getUserByEmail(email);
    }
}
