package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UpLoadService;


@Controller
public class ProductController {
    private final ProductService productService;
    private final UpLoadService upLoadService;
    public ProductController (ProductService productService, UpLoadService upLoadService){

        this.productService = productService;
        this.upLoadService = upLoadService;
    }

// phân trang 
@GetMapping("/admin/product")
    public String getProductTabel(Model model,
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
        Pageable pageAble = PageRequest.of(page - 1, 2);
        // lấy sản phẩm trang hiện tại
        Page<Product> products = this.productService.fetchProducts(pageAble);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts); //truyền products qua JSP
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/product/show";
    }

    //create product
@GetMapping("/admin/product/create")
    public String getCreatePage(Model model) {
        Product product = new Product();
        model.addAttribute("newProduct", product);
        return "admin/product/create";
    }

@PostMapping("/admin/product/create")
    public String createProduct(Model model,
    @ModelAttribute("newProduct") @Valid Product newProduct,
    BindingResult bindingResult,
    //nhận file từ client
    @RequestParam("file") MultipartFile file) {
        //validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for(FieldError error:errors){
            System.out.println(error.getField()+"-" + error.getDefaultMessage());
        }

        if(bindingResult.hasErrors()){
            return "admin/product/create";
        }

        // lưu trữ file trên server
        String img = this.upLoadService.handleUpLoadFile(file,"product");
        newProduct.setImage(img);
        this.productService.solveSave(newProduct);
        return "redirect:/admin/product";
    }

        // view
    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        model.addAttribute("id", id); // lấy được id từ table-product, truyền qua view
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/view";
    }

    // update
    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdate(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("currentProduct", currentProduct); // fill thông tin đã có
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update/{id}")
    public String updateProduct(Model model,
    @ModelAttribute("currentProduct") Product currentProduct) {// chỉ chứa dữ liệu từ form update thôi
        Product updateProduct = this.productService.getProductById(currentProduct.getId());// lôi user chưa update từ database
        if (updateProduct != null) {
            updateProduct.setName(currentProduct.getName());
            updateProduct.setPrice(currentProduct.getPrice());
            updateProduct.setDetailDesc(currentProduct.getDetailDesc());
            updateProduct.setShortDesc(currentProduct.getShortDesc());
            updateProduct.setQuantity(currentProduct.getQuantity());
            updateProduct.setFactory(currentProduct.getFactory());
            updateProduct.setTarget(currentProduct.getTarget());
        this.productService.solveSave(updateProduct);

     }
     return "redirect:/admin/product";
    }


    // delete
    @GetMapping("/admin/product/delete/{id}")
    public String deleteProduct(Model model, @PathVariable long id) {// lấy giá trị id động từ view sang controller
        this.productService.deleteProductById(id);
        return "redirect:/admin/product";
    }

    

    


}
