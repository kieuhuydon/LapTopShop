<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                    <title>Login</title>
                </head>

                <body>
                    <div class="container mt-5">

                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h2 class="card-title text-center mb-4">Login </h2>
                                        <form action="/login" method="post" >
                                            <c:if test="${param.error !=null }">

                                                <div class="my-2" style="color:red"> Invalid email or password</div>

                                            </c:if>
                                            <div class="row g-3">
                                                <div class="col-12">
                                                    <div class="form-floating">
                                                        <input name="username" path="email" type="email" 
                                                            id="email" placeholder="Email Address" required="true" class="form-control"/>
                                                        <label for="email">Email Address</label>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-floating">

                                                        <input name="password"   path="password" type="password" class="form-control"
                                                            id="password" placeholder="Password" required="true" />
                                                        <label for="password">Password</label>

                                                    </div>
                                                </div>
                                                <div>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100 mt-4">Login</button>
                                            <p class="text-center mt-2">Need an account? <a href="#"
                                                    class="text-decoration-none">Sign up</a></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </body>

                </html>