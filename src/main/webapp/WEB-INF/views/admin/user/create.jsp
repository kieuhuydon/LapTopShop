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
                                    <h1 class="mt-4">Manage Users</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard</li>
                                        <li class="breadcrumb-item active">Users</li>
                                    </ol>

                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a user</h3>
                                            <hr />
                                            <form:form action="/admin/user/create" method="post"
                                                modelAttribute="newUser" class="row"
                                                enctype ="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6" >
                                                    <!--1 cột trong mobile, 2 cột cho..-->
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email"/>

                                                    </c:set>
                                                    <label class="form-lable"> Email:</label>
                                                    <form:input path="email" type="email" cssClass="${not empty errorEmail ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password"/>

                                                    </c:set>
                                                    <label class="form-lable"> Password:</label>
                                                    <form:input path="password" type="password" cssClass="${not empty errorPassword ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-lable"> Phone number:</label>
                                                    <form:input path="phoneNumber" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="fullName"/>

                                                    </c:set>
                                                    <label class="form-lable"> Full Name:</label>
                                                    <form:input path="fullName" type="text" class="form-control" cssClass="${not empty errorName ? 'form-control is-invalid' : 'form-control'}" />
                                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="mb-3"> Address:</label>
                                                    <form:input path="address" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Role: </label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="Admin">ADMIN</form:option>
                                                        <form:option value="User">USER</form:option>
                                                    </form:select>

                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar: </label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="file">

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