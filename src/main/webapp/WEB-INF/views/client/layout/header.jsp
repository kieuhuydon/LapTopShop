<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <div class="container-fluid">

                <div class="container px-0" >
                    <nav class="navbar navbar-light  navbar-expand-xl" >
                        <a href="/" class="navbar-brand">
                            <h1 class="text-primary display-6">LapTopShop</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse  justify-content-between mx-5" id="navbarCollapse">
                            <div class="navbar-nav ">
                                <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                                <a href="/products" class="nav-item nav-link">Sản Phẩm</a>
                            </div>
                            <div class="d-flex m-3 me-0">
                                <c:if test="${not empty pageContext.request.userPrincipal}">

                                <a href="/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.sum}</span>
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li>
                                            <div class="d-flex align-items-center flex-column"
                                                style="min-width: 300px;">
                                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                    src="/images/avatar/${sessionScope.avatar}" />
                                                <div class="text-center my-3">
                                                <!--<c:out value="${pageContext.request.userPrincipal.name}"/> principal người dùng đã login--> 
                                                <c:out value="${sessionScope.fullName}"/>
                                                </div>
                                            </div>
                                        </li>
                                        <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                        <hr class="dropdown-divider" />
                                        <li>
                                            <form action="/logout" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                <button class="dropdown-item" type="submit"> Đăng xuất</button>

                                            </form>
                                            
                                        </li>
                                    </ul>
                                </div>

                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login" class="position-relative me-4 my-auto">
                                        Đăng Nhập
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>