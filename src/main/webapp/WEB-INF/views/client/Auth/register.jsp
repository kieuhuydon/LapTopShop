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
                    <title>Register</title>
                </head>

                <body>
                    <div class="container mt-5">

                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h2 class="card-title text-center mb-4">Create Account</h2>
                                        <form:form action="/register" method="post" modelAttribute="registerUser">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="firstName" type="text" class="form-control"
                                                            id="firstName" placeholder="First Name" required="true" />
                                                        <label for="firstName">First Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="lastName" type="text" class="form-control"
                                                            id="lastName" placeholder="Last Name" required="true" />
                                                        <label for="lastName">Last Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-floating">
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" />

                                                        </c:set>
                                                        <form:input path="email" type="email" class="form-control"
                                                            id="email" placeholder="Email Address" required="true"
                                                            cssClass="${not empty errorEmail ? 'form-control is-invalid' : 'form-control'}"/>
                                                        <label for="email">Email Address</label>
                                                        <form:errors path="email"
                                                            cssClass="invalid-feedback" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">

                                                        <form:input path="passWord" type="password" class="form-control"
                                                            id="password" placeholder="Password" required="true" />
                                                        <label for="password">Password</label>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <c:set var="errorConfirmPassword">
                                                            <form:errors path="confirmPassword" />

                                                        </c:set>
                                                        <form:input path="confirmPassword" type="passWord"
                                                            cssClass="${not empty errorConfirmPassword ? 'form-control is-invalid' : 'form-control'}"
                                                            id="confirmPassword" placeholder="Confirm Password"
                                                            required="true" />
                                                        <label for="confirmPassword">Confirm Password</label>
                                                        <form:errors path="confirmPassword"
                                                            cssClass="invalid-feedback" />
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100 mt-4">Create
                                                Account</button>
                                            <p class="text-center mt-2">Have an account? <a href="#"
                                                    class="text-decoration-none">Go to Login</a></p>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </body>

                </html>