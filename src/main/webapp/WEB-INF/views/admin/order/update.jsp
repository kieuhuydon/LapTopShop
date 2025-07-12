<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

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
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Order</h3>
                                            <hr />
                                            <form:form action="/admin/order/update/${id}" method="post"
                                                modelAttribute="currentOrder">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />

                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Order ID:</label>
                                                        <form:input path="id" type="text" class="form-control"
                                                            readonly="true" />
                                                    </div>

                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Total Price:</label>
                                                        <p class="form-control-plaintext ">
                                                            <fmt:formatNumber type="number"
                                                                value="${currentOrder.totalPrice}" /> Đ
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Status:</label>
                                                        <form:select class="form-select" path="status">
                                                            <form:option value="Pending">Pending</form:option>
                                                            <form:option value="Shipping">Shipping</form:option>
                                                            <form:option value="Complete">Complete</form:option>
                                                            <form:option value="Cancel">Cancel</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </form:form>

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