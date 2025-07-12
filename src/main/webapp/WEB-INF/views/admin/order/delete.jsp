<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Xác nhận xóa đơn hàng</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        </head>

        <body>
            <!--header-->
            <jsp:include page="../layout/header.jsp" /> <!--lùi lại từ dashboard về admin/layout/header-->
            <div class="container d-flex justify-content-center align-items-center min-vh-100">
                <div class="card shadow-lg border-0" style="max-width: 500px; width: 100%;">
                    <div class="card-header bg-danger text-white text-center">
                        <h5 class="mb-0">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            Xác nhận xóa đơn hàng
                        </h5>
                    </div>
                    <div class="card-body text-center">

                        <form action="/admin/order/delete/${order.id}" method="post"
                            class="d-flex justify-content-center gap-3 mt-3">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="btn btn-danger px-4">
                                <i class="fas fa-trash-alt me-1"></i> Xóa
                            </button>
                            <a href="/admin/order" class="btn btn-secondary px-4">
                                <i class="fas fa-times me-1"></i> Hủy
                            </a>
                        </form>
                    </div>
                </div>
            </div>

        </body>

        </html>