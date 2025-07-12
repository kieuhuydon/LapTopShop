package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class ItemController {
    private final ProductService productService;
    public ItemController (ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        Product  product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    // nhận id từ url qua pathvariable
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {

        HttpSession session = request.getSession(false);// chưa có sesion (login), thì k tạo session mới
        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpSession session){
        User currentUser = new User();
        Long id = (Long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.getCartByUser(currentUser);
        

        List<CartDetail>  cartDetails = cart== null ? new ArrayList<>() : cart.getCartDetails();

        double totalPrice = 0;
        for(CartDetail cd: cartDetails){
            totalPrice += cd.getPrice()*cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request ) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
            return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpSession session){
         User currentUser = new User();
        Long id = (Long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.getCartByUser(currentUser);

        List<CartDetail>  cartDetails = cart==null? new ArrayList<>() : cart.getCartDetails();
        double totalPrice = 0;
        for(CartDetail cd: cartDetails){
            totalPrice += cd.getPrice()*cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String updateCartToCheckOut(@ModelAttribute("cart")  Cart cart) {
        List<CartDetail> cartDetails = cart==null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckOut(cartDetails);
        return"redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrdeString(HttpServletRequest request,
    @RequestParam("receiverName") String receiverName,
        @RequestParam("receiverAddress" ) String receiverAddress,
        @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, 
        receiverName, receiverAddress, receiverPhone);

        return "redirect:/";
    }

    //phân trang sản phẩm
    @GetMapping("/products")
    public String getProductsPage(Model model,
    @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try{
            if(pageOptional.isPresent()){
                page = Integer.parseInt(pageOptional.get());
            }else{
                page = 1;
            }
        }catch(Exception e){

        }

        // đối tượng để lấy một trang page bắt đầu từ 0
        Pageable pageAble = PageRequest.of(page - 1, 6);
        // lấy sản phẩm trang hiện tại
        Page<Product> products = this.productService.fetchProducts(pageAble);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts); //truyền products qua JSP
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "client/product/show";
    }
    
    

    


}
