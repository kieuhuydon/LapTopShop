package vn.hoidanit.laptopshop.service;


import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.User;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderRepository orderDetailRepository;
    public OrderService (OrderRepository orderRepository, OrderRepository orderDetailRepository){
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrder(){
        return this.orderRepository.findAll();
    }

    public Order getOrderById(Long id){
        Optional <Order> orderOpt = this.orderRepository.findById(id);
        if(orderOpt.isPresent()){
          Order order =  orderOpt.get();
            return order;
        }
        return null;
    }

    public void saveOrder(Order order){
        this.orderRepository.save(order);
    }

    

    public void deleteOrderDetailById(long id){
        this.orderDetailRepository.deleteById(id);
    }

    public void deleteOrderById(Long id){
        Optional<Order> oderOptional = this.orderRepository.findById(id);
        if(oderOptional.isPresent()){
            Order order = oderOptional.get();
            List<OrderDetail> orderDetails  = order.getOrderDetails();
            for(OrderDetail orderDetail : orderDetails){
                this.orderDetailRepository.deleteById(orderDetail.getId());

            }
            this.orderRepository.deleteById(id);
        }
        
    }
    public List<Order> getOrderByUser(User user){
        return this.orderRepository.findOrderByUser(user);
    }
    
}
