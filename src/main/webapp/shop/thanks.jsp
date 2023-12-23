<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%--<a class="btn btn-lg btn-outline-primary ms-4" href="${pageContext.request.contextPath}/">Tiếp tục mua sắm</a>--%>
<%--   <div class="container text-center mt-4">--%>
<%--       <h1 class="text-danger">Cảm ơn vì đã tin tưởng chúng tôi!🥰</h1>--%>
<%--       <h4>Xác nhận đơn hàng sẽ được gửi qua email.</h4>--%>
<%--       <h4>Bạn có thể tiếp tục mua sắm bằng cách click vào nút trên để về trang chủ.</h4>--%>
<%--   </div>--%>

<div class="mt-5 d-flex justify-content-center align-items-center">
    <div class="col-md-6">
        <div class="border border-3 border-success"></div>
        <div class="card  bg-white shadow p-5">
            <div class="mb-4 text-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75"
                     fill="currentColor" class="bi bi-check-circle text-success" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                    <path
                            d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                </svg>
            </div>
            <div class="text-center">
                <h1>Cảm ơn !</h1>
                <p>Đơn hàng sẽ được xác nhận thông qua email của bạn! </p>
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/">Trang chủ</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
