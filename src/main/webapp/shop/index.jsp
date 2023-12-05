<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<div class="video-container">
    <div class="slide-video">
        <video height="95%" class="video-dk" autoplay="autoplay" loop="loop" muted="muted">
            <source src="shop/images/video/video_banner.mp4" type="video/mp4">
        </video>
    </div>
</div>


<div class="divider"></div>
<section class="products text-center mt-3">
    <div class="container">
        <h3 class="mb-4 text-danger fw-bold">Sản phẩm mới nhất</h3>
        <div class="col-md">
            <div id="assignment" class="container-fluid m-5 text-center border-bottom border-info">
                <div class="row p-4">
                    <c:forEach items="${listNewProducts}" var="product" begin="0" end="3">
                        <div class="col-md-4 mb-4">
                            <div class="rounded-5 " style="width: 16rem;">
                                <img src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" >
                                <div class="card-body text-light rounded-5 mt-2">
                                    <h5 class="card-title fw-bold text-black">${product.nameProduct}</h5>
                                    <p class="card-text text-black">${product.price}đ</p>
                                    <a href="view_product?id=${product.id}" class="btn btn-outline-info">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <%--Best Selling Products--%>
            <h3 class="mb-4 text-danger fw-bold">Sản phẩm bán chạy nhất</h3>
        <div class="col-md">
            <div class="container-fluid m-5 text-center">
                <div class="row p-4">
                    <c:forEach items="${listBestSellingProducts}" var="product" begin="0" end="4">
                        <div class="col-md-4 mb-4">
                            <div class="rounded-5 " style="width: 16rem;">
                                <img src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" >
                                <div class="card-body text-light rounded-5 mt-2">
                                    <h5 class="card-title fw-bold text-black">${product.nameProduct}</h5>
                                    <p class="card-text text-black">${product.price}đ</p>
                                    <a href="view_product?id=${product.id}" class="btn btn-outline-info">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>
