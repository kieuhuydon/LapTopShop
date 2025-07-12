package vn.hoidanit.laptopshop.repository;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;


import vn.hoidanit.laptopshop.domain.OrderDetail;

@Repository
public interface OrderDetailRepository  extends JpaRepository<OrderDetail, Long>{
    
}
