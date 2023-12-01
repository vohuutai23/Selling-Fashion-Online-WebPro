<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/24/2023
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <style>
        h4 {
            font-family: 'Inter', sans-serif;
        }
    </style>
    <title>HomePage</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<div class="video-container">
    <div class="slide-video">
        <video height="100%" class="video-dk" autoplay="autoplay" loop="loop" muted="muted">
            <source src="shop/images/video/video_banner.mp4" type="video/mp4">
        </video>
    </div>
</div>
<div class="divider"></div>
<section class="products text-center">
    <div class="container">
        <h3 class="mb-4">New Products</h3>
        <div class="row">
            <c:forEach items="${listNewProducts}" var="product" begin="0" end="3">
                <div class="col-sm-6 col-md-3 col-product">
                    <figure>
                        <%--<img class="rounded-corners img-fluid" src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg"
                             width="240" height="240" alt="">--%>
                            <img class="rounded-corners img-fluid", src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" width="240" height="240">
                        <figcaption>
                            <div class="thumb-overlay"><a href="view_product?id=${product.id}" title="More Info">
                                <i class="fas fa-search-plus"></i>
                            </a></div>
                        </figcaption>
                    </figure>
                    <h4><a href="view_product?id=${product.id}">${product.nameProduct}</a></h4>
<%--                    <h4><a href="view_product?id=${product.id}" style="font-family: 'Inter', sans-serif;">${product.nameProduct}</a></h4>--%>
                    <h4>Tài ngu</h4>
                <%--                    <p><span class="emphasis"><%@include file="product_rating.jsp" %></span></p>--%>
                    <p><span class="emphasis">$${product.price}</span></p>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>
