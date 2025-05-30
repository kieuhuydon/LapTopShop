<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</head>
<body>
    <div class ="container mt-5">
        <div class="row" >
            <div class="col-md-6 col-12 mx-auto">
                <h3>Create a user</h3>
                <hr/>
                <form:form action="/admin/user/create" method="post"
                modelAttribute="newUser">
                    <div class="mb-3">
                        <label class="form-lable"> Email:</label>
                        <form:input  path="email"  type="email" class="form-control"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-lable"> Password:</label>
                        <form:input path="password" type="password" class="form-control"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-lable"> Phone number:</label>
                        <form:input path="phoneNumber" type="text" class="form-control"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-lable"> Full Name:</label>
                        <form:input path="fullName" type="text" class="form-control"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-lable"> Address:</label>
                        <form:input path="address" type="text" class="form-control"/>
                    </div>
                    <button type="submit" class="btn btn-primary"> Create</button>
                </form:form>
            </div>
        </div>
    </div>

</body>
</html>