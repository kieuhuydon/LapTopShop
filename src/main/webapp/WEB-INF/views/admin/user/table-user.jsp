<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</head>
<body>
    <div class ="container mt-5">
        <div class="row" >
            <div class="col-12 mx-auto">
                <div class="d-flex justify-content-between">
                    <h3>Table Users</h3>
                    <a href="/admin/user/create" class="btn btn-primary"> Create a User</a>
                </div>
                <hr/>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Full name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                            <td>${user.id}</th>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td> <!-- đặt nhiều bottom trong một table data nó để inline-->
                                <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                <a href="" class="btn btn-warning">Update</a>
                                <a href="" class="btn btn-danger">Delete</a>
                                
                            </td>
                            </tr>
                        </c:forEach>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>