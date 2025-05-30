<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</head>
<body>
    <div class ="container mt-5">
        <div class="row" >
            <div class="col-12 mx-auto">
                    <h3>User detail with id = ${id}</h3>
                <hr/>
            </div>
            <div class="card" style="width: 18rem;">
                <div class="card-header">User information</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">ID: ${user.id} </li>
                    <li class="list-group-item">Email: ${user.email}</li>
                    <li class="list-group-item">Full name: ${user.fullName} </li>
                    <li class="list-group-item">Address: ${user.address}</li>

                </ul>
            </div>
            <a href="/admin/user" class="btn btn-success mt-3">Back</a>
        </div>
    </div>

</body>
</html>