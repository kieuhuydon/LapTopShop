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
                                    <h1 class="mt-4">Manage Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard</li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Product</h3>
                                            <hr />
                                            <form:form action="/admin/product/update/${id}" method="post"
                                                modelAttribute="currentProduct">
                                                <!-- Hidden ID field -->
                                                <div class="mb-3" style="display:none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input path="id" type="text" class="form-control" />
                                                </div>

                                                <!-- Two-column row for Name and Price -->
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Name:</label>
                                                        <form:input path="name" type="text" class="form-control" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Price:</label>
                                                        <form:input path="price" type="text" class="form-control" />
                                                    </div>
                                                </div>

                                                <!-- Full-width Detail Description -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Detail description:</label>
                                                    <form:input path="detailDesc" type="text" class="form-control" />
                                                </div>

                                                <!-- Two-column row for Short Description and Quantity -->
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Short description:</label>
                                                        <form:input path="shortDesc" type="text" class="form-control" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input path="quantity" type="text" class="form-control" />
                                                    </div>
                                                </div>

                                                <!-- Two-column row for Factory and Target -->
                                                <div class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="Asus">ASUS</form:option>
                                                            <form:option value="Lenovo">Lenovo</form:option>
                                                            <form:option value="Dell">Dell</form:option>
                                                            <form:option value="Acer">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="Gaming">Gaming</form:option>
                                                            <form:option value="Văn Phòng">Văn Phòng</form:option>
                                                            <form:option value="Đồ họa">Đồ họa</form:option>
                                                            <form:option value="Mỏng-nhẹ">Mỏng-nhẹ</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <!-- Submit button -->
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