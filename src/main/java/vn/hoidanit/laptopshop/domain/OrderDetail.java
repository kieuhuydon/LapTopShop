package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long quantity;
    private double price;
    // order id
    // product id
    // nhiều orderdetail thuộc 1 order
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // 1 sản phẩm thuộc nhiều orderdetails
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

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

    public OrderDetail(long id, long quantity, long price) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
    }
    public OrderDetail(){

    }

}
