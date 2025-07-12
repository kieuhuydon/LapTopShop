<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Manage Order</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <!--header-->
                <jsp:include page="../layout/header.jsp" /> <!--lùi lại từ dashboard về admin/layout/header-->
                <div id="layoutSidenav">
                    <!--side bar-->
                    <jsp:include page="../layout/side-bar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Order</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                    <li class="breadcrumb-item active">Orders</li>
                                </ol>

                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <h3>Order detail with id = ${id}</h3>
                                        <hr />
                                    </div>


                                    <div class="card" style="width: 100%;">
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
                                                    <c:forEach var="orderDetail" items="${order.orderDetails}"
                                                        >
                                                        <tr>
                                                            <td scope="row">
                                                                <div class="d-flex align-items-center">
                                                                    <img src="/images/product/${orderDetail.product.image}"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 80px; height: 80px;" alt="">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4"> <a
                                                                        href="/product/${orderDetail.product.id}"
                                                                        target="_blank">${orderDetail.product.name}</a>
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.product.price}" />Đ
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <div class="input-group quantity mt-4"
                                                                    style="width: 100px;">
                                                                    
                                                                    <input type="text"
                                                                        class="form-control form-control-sm text-center border-0"
                                                                        value="${orderDetail.quantity}"
                                                                       >

                                                                   
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4"
                                                                    >
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.product.price*orderDetail.quantity}" />
                                                                    Đ
                                                                </p>
                                                            </td>
                                                            

                                                        </tr>

                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div><a href="/admin/order" class="btn btn-success mt-3">Back</a></div>
                                </div>
                            </div>
                        </main>
                        <!--footer-->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>