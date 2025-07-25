package vn.hoidanit.laptopshop.repository;

import vn.hoidanit.laptopshop.domain.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface UserRepository extends JpaRepository<User, Long> {
User findById(long id);

boolean existsByEmail (String email);

User getUserByEmail(String email);
}
