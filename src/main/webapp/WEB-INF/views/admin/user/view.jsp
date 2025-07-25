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
                <title>Manage User</title>
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
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>
                                
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <h3>User detail with id = ${id}</h3>
                                            <hr />
                                        </div>
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-header">User information</div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">ID: ${user.id} </li>
                                                <li class="list-group-item">Email: ${user.email}</li>
                                                <li class="list-group-item">Full name: ${user.fullName} </li>
                                                <li class="list-group-item">Address: ${user.address}</li>
                                                <li class="list-group-item">Role: ${user.role.getName()}</li>

                                            </ul>
                                        </div>
                                        <div><a href="/admin/user" class="btn btn-success mt-3">Back</a></div>
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