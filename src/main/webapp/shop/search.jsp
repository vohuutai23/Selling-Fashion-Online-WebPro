<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/19/2023
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>
<html>
<head>
    <title>Search Products</title>
</head>
<body>
<p>${message}</p>
<div class="row">
    <!-- Sidebar Categories Component -->
    <div class="col-md-3 mt-5">
       <p class="margin-top-content">Kết quả tìm kiếm</p>
    </div>
    <!-- Products -->
    <div class="col-md-9">
        <div id="assignment" class="container-fluid m-5 text-center">
            <div class="row p-4">
                <c:forEach items="${result}" var="product">
                    <div class="col-md-4">
                        <div class="rounded-5 " style="width: 16rem;">
                            <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" alt="...">
                            <div class="card-body text-light rounded-5 mt-2">
                                <h5 class="card-title fw-bold text-black">${product.nameProduct}</h5>
                                <p class="card-text text-black">$${product.price}</p>
                                <a href="view_product?id=${product.id}" class="btn btn-outline-info">Buy now</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
