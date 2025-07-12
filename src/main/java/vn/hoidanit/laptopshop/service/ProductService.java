package vn.hoidanit.laptopshop.service;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public void solveSave(Product product) {
        this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }
 
    // lấy product theo page
    public Page<Product> fetchProducts(Pageable pageAble) {
        return this.productRepository.findAll(pageAble);
    }

    public Product getProductById(long id) {
        Optional<Product> productOpt = this.productRepository.findById(id);
        if (!productOpt.isPresent()) {
            throw new RuntimeException("Không tìm thấy sản phẩm với ID: " + id);
        }
        return productOpt.get();
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check uesr đã có Cart chưa ? nếu chưa ->tạo mới
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // tạo mới
                Cart otherCart = new Cart();
                otherCart.setUser(user); // tạo ra cột user_id
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);

            }

            // lưu cart_detail vào cart
            Optional<Product> productOpt = this.productRepository.findById(productId);
            if (!productOpt.isPresent()) {
                return; // hoặc throw new Exception("Product not found");
            }
            Product product = productOpt.get();

            // check sản phẩm đã từng đượ thêm vào giỏ hàng chưa
            CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);

            // nếu product chưa có trong giỏ hàng
            if (oldDetail == null) {
                CartDetail cd = new CartDetail();
                cd.setCart(cart);
                cd.setProduct(product); // lưu trong dbs là product_id, nhưng code java là object
                cd.setPrice(product.getPrice());
                cd.setQuantity(1);

                this.cartDetailRepository.save(cd);

                // update cart (sum) khi thêm sp mới
                int s = cart.getSum() + 1;
                cart.setSum(s);
                this.cartRepository.save(cart);
                // update session, lưu số lượng sp hiện tại trong giỏ
                // không có HttpSession thì k thể setAttribute
                session.setAttribute("sum", s);

            } else {
                oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                this.cartDetailRepository.save(oldDetail);
            }
        }

    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        // tìm cartDetail
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            // tìm cart
            Cart currentCart = cartDetail.getCart();
            // 1. Xóa cartDetail ra khỏi cart
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // không delete cart nữa
                currentCart.setSum(0);
                this.cartRepository.save(currentCart);

                /* this.cartRepository.deleteById(currentCart.getId()); */
                session.setAttribute("sum", 0);
            }
        }

    }

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    // order
    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {

        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("Pending");

                double totalPrice = 0;
                for (CartDetail cd : cartDetails) {
                    totalPrice += cd.getPrice() ;

                }
                order.setTotalPrice(totalPrice);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // XÓA cartDetails đúng cách:
                Iterator<CartDetail> iterator = cartDetails.iterator();
                while (iterator.hasNext()) {
                    CartDetail cd = iterator.next();
                    iterator.remove(); // xóa khỏi list của Cart
                    this.cartDetailRepository.deleteById(cd.getId()); // xóa khỏi DB
                }

                // cập nhật lại tổng tiền
                cart.setSum(0);
                session.setAttribute("sum", 0);
                cartRepository.save(cart); // cập nhật Cart sau khi sửa list

            }
        }

    }

}
