<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link rel="stylesheet" href="assets/css/main.css" type="text/css"/>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">--%>
<%--    <link rel="icon" type="image/x-icon" href="assets/images/logo.png">--%>
<%--    <title>CoverYou</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="header">--%>
<%--    <div id="nav">--%>
<%--        <nav class="nav-full navbar navbar-expand-lg fixed-top">--%>
<%--            <div class="container-fluid navigation">--%>
<%--                <a class="navbar-brand" href="#">--%>
<%--                    <img class="ms-5" src="/shop/images/logo.png" alt="Logo" width="60" height="60" >--%>
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
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </div>--%>
<%--</div>--%>
<%@ include file="/includes/header.jsp" %>
<!-- Content: Product details -->
<div id="content-product-details">
    <div class="container mt-5">
        <div class="product-single">
            <div class="row">
                <div class="col-md-6">
                    <div class="background-product">
                        <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg" width="80%" height="80%" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="info-product mt-5">
                        <div class="row m-4 fs-1 fw-medium">${product.nameProduct}</div>
                        <div class="row m-4 fs-3 fw-medium">$ ${product.price}</div>
                        <div class="row m-5 fs-5">
                            ${product.description}

                        </div>
                        <div class="row select-to-order m-4">
<%--                            <div class="col-4">--%>
<%--                                Quantity--%>
<%--                            </div>--%>
                            <div class="col-4">
<%--                                <form action="view_cart" method="post">--%>
<%--                                    <input type="hidden" name="id" value="${product.id}">--%>
<%--                                    <input type="submit" value="Add To Cart" class="btn btn-outline-info">--%>
<%--                                </form>--%>
                                    <a href="add_to_cart?product_id=${product.id}" type="button" id="buttonAddToCart" class="btn btn-full-width btn-lg btn-outline-primary">Add to cart</a></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
