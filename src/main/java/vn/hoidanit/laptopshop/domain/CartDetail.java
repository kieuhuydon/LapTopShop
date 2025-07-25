package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class CartDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;

    private double price;

    //cart_id:
    //nhiều cartdetails - một cart
    // xem cart_details thuộc về cart nào
    @ManyToOne
    @JoinColumn(name="cart_id")
    private Cart cart;

    //product_id 
    // 1 product - thuộc nhiều cart_details
    @ManyToOne
    @JoinColumn(name ="product_id")
    private Product product;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public CartDetail(long id, long quantity, double price, Cart cart, Product product) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.cart = cart;
        this.product = product;
    }

    public CartDetail() {
    }

    
}
