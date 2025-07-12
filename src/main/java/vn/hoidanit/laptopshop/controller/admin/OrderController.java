package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.OrderService;

import java.util.List;

import org.springframework.stereotype.Controller;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderTable(Model model) {
        List<Order> orders = this.orderService.getAllOrder();
        model.addAttribute("orders", orders);

        return "admin/order/show";
    }

    // view
    @GetMapping("/admin/order/view/{id}")
    public String getOrderDetail(Model model, @PathVariable long id) {
        model.addAttribute("id", id); // lấy được id từ url
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/view";
    }

    // update
    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Order currentOrder = this.orderService.getOrderById(id);
        model.addAttribute("currentOrder", currentOrder);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update/{id}")
    public String handleUpdateOrderPage(Model model, @PathVariable long id,
            @ModelAttribute("currentOrder") Order currentOrder) {
        Order updateOrder = this.orderService.getOrderById(currentOrder.getId());// lôi order cũ đầy đủ thông tin ở
                                                                                 // database
        if (updateOrder != null) {
            updateOrder.setStatus(currentOrder.getStatus());
        }
        this.orderService.saveOrder(updateOrder);

        return "redirect:/admin/order";
    }

    // delete
    @GetMapping("/admin/order/delete/{id}")
    public String deleteProduct(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete/{id}")
    public String deleteOrder(Model model, @PathVariable long id) {

        this.orderService.deleteOrderById(id);
        return "redirect:/admin/order";
    }
}
