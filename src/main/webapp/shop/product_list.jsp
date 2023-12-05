<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<style>
    .btn-group.float-right {
        margin-left: 10px;
    }

    .btn-group a {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 2px;
        color: #444342;
        text-decoration: none;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-group a:hover {
        background-color: #f2f2f2;
    }

    .btn-group a.active {
        background-color: #4CAF50;
        color: white;
    }

</style>
<!-- Content: Products by Category -->
<div id="content-product-list">
    <div class="container mt-0 margin-top-content">
        <!-- Filter -->

        <!-- List products -->
        <div class="row">
            <%--Button display filter to search product by category--%>
            <div class="col-md-3">
                <div class="btn-group">
                    <button type="button" class="btn btn-success dropdown-toggle margin-top-content" data-bs-toggle="dropdown" aria-expanded="false">
                        Phân loại
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="list_product?sort=${'newest'}">Mới nhất</a></li>
                        <li><a class="dropdown-item" href="list_product?sort=${'best_selling'}">Bán chạy</a></li>
                        <li><a class="dropdown-item" href="list_product?sort=${'price_inc'}">Giá từ thấp đến cao</a></li>
                        <li><a class="dropdown-item" href="list_product?sort=${'price_dec'}">Giá từ cao đến thấp</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Sidebar Categories Component -->
            <div class="col-md-3 mt-5">
                <h3>Danh mục sản phẩm:</h3>
                <div class="row mt-5">
                    <c:forEach items="${listCategories}" var="category">
                        <a style="width: 60%; margin: 0 auto;" class="btn btn-outline-success btn-sm mx-auto mb-2 fw-bold" href="view_category?id=${category.id}">${category.nameCategory}</a>
                    </c:forEach>
                </div>

            </div>
            <!-- Products -->
            <div class="col-md-9">
                <div id="assignment" class="container-fluid m-5 text-center">
                    <div class="row p-4">
                        <c:forEach items="${listProducts}" var="product" begin="${numBegin}" end="${numEnd}">
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
                    <div class="btn-group float-right ml-3 mt-3">
                        <c:forEach begin="1" end="${numberOfPages}" var="i">
                            <a id="${i}" style="color: #444342"
                               href="list_product?sort=${sort}&page=${i}">&nbsp${i}&nbsp</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/includes/footer.jsp" %>