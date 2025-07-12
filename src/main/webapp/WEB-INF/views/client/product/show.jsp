<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Laptops</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- header start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- end header  -->


                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">

                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <!--option-->
                                        <div class="col-lg-4">
                                            <div class="row g-4">
                                                <div class="col-12">
                                                    <div class="mb-2"> <b>Hãng sản xuất</b></div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-1"
                                                            value="APPLE">
                                                        <label for="form-check-label" for="factory-1">Apple</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-2"
                                                            value="ASUS">
                                                        <label for="form-check-label" for="factory-2">Asus</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-3"
                                                            value="LENOVO">
                                                        <label for="form-check-label" for="factory-3">Lenovo</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-4"
                                                            value="DELL">
                                                        <label for="form-check-label" for="factory-4">Dell</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-5"
                                                            value="LG">
                                                        <label for="form-check-label" for="factory-5">LG</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="factory-6"
                                                            value="Acer">
                                                        <label for="form-check-label" for="factory-6">Acer</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="mb-2"> <b>Mục đích sử dụng</b></div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="target-1"
                                                            value="GAMING">
                                                        <label for="form-check-label" for="target-1">Gaming</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="target-2"
                                                            value="VANPHONG">
                                                        <label for="form-check-label" for="target-2">Văn phòng</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="target-3"
                                                            value="THIET-KE-DO-HOA">
                                                        <label for="form-check-label" for="target-3">Thiết kế đồ
                                                            họa</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="target-4"
                                                            value="MONG-NHE">
                                                        <label for="form-check-label" for="target-4">Mỏng nhẹ</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="target-5"
                                                            value="DOANH-NHAN">
                                                        <label for="form-check-label" for="target-5">Doanh nhân</label>
                                                    </div>

                                                </div>
                                                <div class="col-12">
                                                    <div class="mb-2"> <b>Mức giá</b></div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="price-1"
                                                            value="duoi-10-trieu">
                                                        <label for="form-check-label" for="price-1">Dưới 10
                                                            triệu</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="price-2"
                                                            value="1--15-trieu">
                                                        <label for="form-check-label" for="price-2">Từ 10 - 15
                                                            triệu</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="price-3"
                                                            value="15-20-trieu">
                                                        <label for="form-check-label" for="price-3">Từ 15 - 20
                                                            triệu</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="price-4"
                                                            value="tren-20-trieu">
                                                        <label for="form-check-label" for="price-4">Trên 20
                                                            triệu</label>
                                                    </div>

                                                </div>
                                                <div class="col-12">
                                                    <div class="mb-2"> <b>Sắp xếp</b></div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="sorting-1"
                                                            value="tang-dang">
                                                        <label for="form-check-label" for="sorting-1">Giá tăng
                                                            dần</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="sorting-2"
                                                            value="giam-dan">
                                                        <label for="form-check-label" for="sorting-2">Giá giảm
                                                            dần</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input type="checkbox" class="form-check-input" id="sorting-3"
                                                            value="khong-sap-xep">
                                                        <label for="form-check-label" for="sorting-3">Không sắp
                                                            xếp</label>
                                                    </div>
                                                    <div class="d-flex justify-content-center my-4">
                                                        <a href="#"
                                                            class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Tìm sản phẩm</a>
                                                    </div>

                                                </div>


                                            </div>
                                        </div>
                                        <!--product-->
                                        <div class="col-lg-8">

                                            <div class="row g-4 justify-content-center">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Laptop</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>${product.name}</h4>
                                                                <p>${product.shortDesc}</p>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> Đ
                                                                    </p>
                                                                    <a href="/add-product-to-cart/${product.id}"
                                                                        class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                        <i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <!--phân trang-->
                                            <div class="col-12">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <a href="/products?page=${currentPage -1}"
                                                        class="${currentPage eq 1 ? 'disabled rounded' : 'rounded'}">&laquo;</a>

                                                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                                        <a href="/products?page=${loop.index+1}"
                                                            class="${(loop.index +1) eq currentPage ? 'active rounded' : 'rounded' }">${loop.index+1}</a>

                                                    </c:forEach>

                                                    <a href="/products?page=${currentPage +1}"
                                                        class="${currentPage eq totalPages ? 'disabled rounded' : 'rounded'}">&raquo;
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- Fruits Shop End-->


                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->
                    <!-- Footer Start -->






                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>