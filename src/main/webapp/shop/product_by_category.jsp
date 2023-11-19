<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link rel="stylesheet" href="/shop/css/main.css" type="text/css"/>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">--%>
<%--    <link rel="icon" type="image/x-icon" href="/shop/images/logo.png">--%>
<%--    <title>CoverYou</title>--%>
<%--</head>--%>
<%--<body>--%>
<%-- <div id="header">--%>
<%--    <div id="nav">--%>
<%--        <nav class="nav-full navbar navbar-expand-lg fixed-top">--%>
<%--            <div class="container-fluid navigation">--%>
<%--                <a class="navbar-brand" href="#">--%>
<%--                    <img class="ms-5" src="assets/images/logo.png" alt="Logo" width="60" height="60" >--%>
<%--                </a>--%>
<%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--                    <ul class="navbar-nav nav-element text-uppercase nav-text">--%>
<%--                        <li class="nav-item text-white">--%>
<%--                            <a class="nav-link" aria-current="page" href="#">Home</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Products</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Categories</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Contact</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #ffffff;"></i></a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #ffffff;"></i></a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#"><i class="fa-solid fa-user fa-xl" style="color: #ffffff;"></i></a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <form action="search" method="post">--%>
<%--                                <div class="flexbox">--%>
<%--                                    <div class="search">--%>
<%--                                        <div>--%>
<%--                                            <input type="text" name="keyword" placeholder="Search . . .">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </div>--%>
<%--</div>--%>
<%@ include file="/includes/header.jsp" %>

<!-- Content: Products by Category -->
<div id="content-product-by-category">
    <div class="container mt-5 margin-top-content">
        <!-- Filter -->
        <div class="btn-group">
            <button type="button" class="btn btn-success dropdown-toggle margin-top-content" data-bs-toggle="dropdown" aria-expanded="false">
                Filters
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Separated link</a></li>
            </ul>
        </div>
        <!-- List products -->

        <div class="row">
            <!-- Sidebar Categories Component -->
            <div class="col-md-3 mt-5">
                <h1>Category</h1>
                <h3><a href="view_category?id=1">Quan</a></h3>
                <h3><a href="view_category?id=2">Ao</a></h3>
                <h3>Phu Kien</h3>
                <h3>Giay...</h3>
            </div>
            <!-- Products -->
            <div class="col-md-9">
                <div id="assignment" class="container-fluid m-5 text-center">
                    <div class="row p-4">
                        <c:forEach items="${listProducts}" var="product">
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
<%--                        <div class="col-md-4 card-assignment">--%>
<%--                            <div class="card full-card rounded-5 " style="width: 16rem;">--%>
<%--                                <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" alt="...">--%>
<%--                                <div class="card-body text-light rounded-5 mt-2">--%>
<%--                                    <h5 class="card-title fw-bold text-black">Product Name</h5>--%>
<%--                                    <p class="card-text">Price</p>--%>
<%--                                    <a href="#" class="btn btn-outline-info">Buy now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 card-assignment">--%>
<%--                            <div class="card full-card rounded-5 " style="width: 16rem;">--%>
<%--                                <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" alt="...">--%>
<%--                                <div class="card-body text-light rounded-5 mt-2">--%>
<%--                                    <h5 class="card-title fw-bold text-black">Product Name</h5>--%>
<%--                                    <p class="card-text">Price</p>--%>
<%--                                    <a href="#" class="btn btn-outline-info">Buy now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 card-assignment">--%>
<%--                            <div class="card full-card rounded-5 " style="width: 16rem;">--%>
<%--                                <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" alt="...">--%>
<%--                                <div class="card-body text-light rounded-5 mt-2">--%>
<%--                                    <h5 class="card-title fw-bold text-black">Product Name</h5>--%>
<%--                                    <p class="card-text">Price</p>--%>
<%--                                    <a href="#" class="btn btn-outline-info">Buy now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 card-assignment">--%>
<%--                            <div class="card full-card rounded-5 " style="width: 16rem;">--%>
<%--                                <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="50%" height="50%" class="card-img-top shadow pt-2 rounded-5" alt="...">--%>
<%--                                <div class="card-body text-light rounded-5 mt-2">--%>
<%--                                    <h5 class="card-title fw-bold text-black">Product Name</h5>--%>
<%--                                    <p class="card-text">Price</p>--%>
<%--                                    <a href="#" class="btn btn-outline-info">Buy now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row">--%>
<%--&lt;%&ndash;                <p>Category's Name: ${category.name_category}</p>&ndash;%&gt;--%>
<%--                <c:forEach items="${listProducts}" var="product">--%>
<%--&lt;%&ndash;                           begin="${numBegin}" end="${numEnd}">&ndash;%&gt;--%>
<%--                    <div class="col-md-6 col-lg-4 col-product list">--%>
<%--                        <figure>--%>
<%--                            <img class="rounded-corners img-fluid"--%>
<%--                                 src="data:image/jpg;base64,${product.imageProduct}" alt="">--%>
<%--                            <figcaption>--%>
<%--                                <div class="thumb-overlay">--%>
<%--                                    <a href="view_product?id=${product.id}"--%>
<%--                                       title="More Info"> <i class="fas fa-search-plus"></i>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                            </figcaption>--%>
<%--                        </figure>--%>
<%--                        <h4 class="mb-1">--%>
<%--                            <a href="view_product?id=${product.id}">${product.nameProduct}</a>--%>
<%--                        </h4>--%>
<%--&lt;%&ndash;                        <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <%@ include file="product_rating.jsp" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                        <p>--%>
<%--                            <span class="emphasis">$${product.price}</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <div class="row">--%>
<%--                    <c:forEach items="${listProducts}" var="product">--%>
<%--                        <p>ID Product: ${product.id}</p>--%>
<%--                        <p>Name Product: ${product.nameProduct}</p>--%>
<%--                        <p>Price: ${product.price}</p>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <div class="row">--%>
<%--                    <c:if test="${not empty listProducts}">--%>
<%--                        &lt;%&ndash; Lấy phần tử đầu tiên từ listProducts &ndash;%&gt;--%>
<%--                        <c:set var="firstProduct" value="${listProducts[0]}" />--%>


<%--                        <p>Name Product: ${firstProduct.nameProduct}</p>--%>
<%--                        <p>Price: ${firstProduct.price}</p>--%>

<%--                    </c:if>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
