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
                    <title>Manage Product</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");

                            avatarFile.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);

                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            });
                        });
                    </script>
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
                                    <h1 class="mt-4">Manage Products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard</li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>

                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a Product</h3>
                                            <hr />
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="newProduct" class="row"
                                                enctype ="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6" >
                                                    <c:set var="errorName">
                                                        <form:errors path="name"/>

                                                    </c:set>
                                                    <label class="form-lable"> Name:</label>
                                                    <form:input path="name" type="text" cssClass="${not empty errorName ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="name" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price"/>

                                                    </c:set>
                                                    <label class="form-lable"> Price:</label>
                                                    <form:input path="price" type="text" cssClass="${not empty errorPrice ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="price" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <c:set var="errorDetail">
                                                        <form:errors path="detailDesc"/>

                                                    </c:set>
                                                    <label class="form-lable"> Detail description :</label>
                                                    <form:input path="detailDesc" type="text" cssClass="${not empty errorDetail ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorShortDetail">
                                                        <form:errors path="shortDesc"/>

                                                    </c:set>
                                                    <label class="form-lable"> Short description:</label>
                                                    <form:input path="shortDesc" type="text" cssClass="${not empty errorShortDetail ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-lable"> Quantity:</label>
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity"/>

                                                    </c:set>
                                                    <form:input path="quantity" type="text" cssClass="${not empty errorQuantity ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="quantity" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory: </label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="Asus">ASUS</form:option>
                                                        <form:option value="User">Lenovo</form:option>
                                                        <form:option value="User">Dell</form:option>
                                                        <form:option value="User">Acer</form:option>
                                                    </form:select>

                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target: </label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="Admin">Gaming</form:option>
                                                        <form:option value="User">Văn Phòng</form:option>
                                                        <form:option value="User">Đồ họa</form:option>
                                                        <form:option value="User">Mỏng-nhẹ</form:option>
                                                    </form:select>

                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Img </label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg, .jfif" name="file">

                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img alt="avatar preview"
                                                        style="max-height: 250px; display: none; "
                                                        id="avatarPreview" />

                                                </div>

                                                <div>
                                                    <button type="submit" class="btn btn-primary"> Create</button>
                                                </div>

                                            </form:form>
                                        </div>
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