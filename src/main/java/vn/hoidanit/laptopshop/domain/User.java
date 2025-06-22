package vn.hoidanit.laptopshop.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

import org.hibernate.validator.constraints.EAN;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull (message = "Email không được để trống")
    @Email (message = "Email không hợp lệ")
    private String email;

    @NotNull (message="Mật khẩu không được để trống")
    @Size(min = 3, message = "Mật khẩu phải tối thiểu 3 ký tự")
    private String password;
    private String phoneNumber;

    @NotNull (message = "Tên người dùng  không được để trống")
    @Size(min = 3, message = "Tên phải tối thiểu 3 ký tự")
    private String fullName;

    private String address;
    private String avatar;
    // RoleId
    // Many user thuộc về -> to one -> role
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    // one user có -> many orders
    @OneToMany(mappedBy = "user")
    private List<Order> orders;
    

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public User(long id, String email, String password,String phoneNumber,  String fullName, String address, String avatar, Role role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.fullName = fullName;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
    }
    public User(){

    };

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName
                + ", address=" + address + ", avatar="  + "]";
    }
}
