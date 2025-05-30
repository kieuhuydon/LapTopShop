package vn.hoidanit.laptopshop.service;

import java.lang.classfile.ClassFile.Option;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.domain.User;

@Service
public class UserSevice {
    private final UserRepository userRepository;

    public UserSevice(UserRepository userRepository){
        this.userRepository = userRepository;
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
}
