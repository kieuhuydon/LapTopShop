<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Cart</title>
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
                <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <!-- Cart Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Products</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>



                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="/images/product/${cartDetail.product.image}"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4"> <a href="/product/${cartDetail.product.id}"
                                                        target="_blank">${cartDetail.product.name}</a></p>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.product.price}" />Đ
                                                </p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4" style="width: 100px;">

                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="${cartDetail.quantity}" disabled>


                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.product.price*cartDetail.quantity}" /> Đ
                                                </p>
                                            </td>

                                        </tr>

                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                        <form:form action="/place-order" method="post" modelAttribute="cart">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="row g-4 justify-content-between">
                            <!-- Cột Thông tin Người nhận -->
                            <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5">
                                <div class="bg-light rounded shadow-sm">
                                    <div class="p-4">
                                        <h3 class="mb-4 text-uppercase text-success fw-bold">Thông Tin Người Nhận</h3>

                                        
                                            <div class="mb-3">
                                                <label for="receiverName" class="form-label fw-semibold">Họ và
                                                    tên</label>
                                                <input type="text" class="form-control" id="receiverName"
                                                    name="receiverName" placeholder="Nhập tên người nhận" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="receiverAddress" class="form-label fw-semibold">Địa
                                                    chỉ</label>
                                                <input type="text" class="form-control" id="receiverAddress"
                                                    name="receiverAddress" placeholder="Nhập địa chỉ người nhận" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="receiverPhone" class="form-label fw-semibold">Số điện
                                                    thoại</label>
                                                <input type="tel" class="form-control" id="receiverPhone"
                                                    name="receiverPhone" placeholder="Nhập số điện thoại" required>
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <!-- Cột Thông tin Đơn hàng -->

                            <div class="col-sm-10 col-md-8 col-lg-7 col-xl-6">
                                <div class="bg-light rounded shadow-sm">
                                    <div class="p-4">
                                        <h3 class="mb-4 text-uppercase text-primary fw-bold">Thông Tin Đơn Hàng</h3>

                                        <ul class="list-group list-group-flush mb-3">
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center">
                                                <span>Phí vận chuyển</span>
                                                <span class="fw-semibold">0 Đ</span>
                                            </li>
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center">
                                                <span>Hình thức thanh toán</span>
                                                <span class="fw-semibold">Thanh toán khi nhận hàng</span>
                                            </li>
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center border-top pt-3 mt-2">
                                                <strong class="text-dark">Tổng số tiền</strong>
                                                <strong class="text-danger fs-5">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> Đ
                                                </strong>
                                            </li>
                                        </ul>

                                        <div class="text-end">
                                            <button class="btn btn-primary rounded-pill px-4 py-2 text-uppercase" type="submit">
                                                Xác nhận đơn hàng
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        </form:form>

                        
                    </div>
                </div>
                <!-- Cart Page End -->

                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->





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