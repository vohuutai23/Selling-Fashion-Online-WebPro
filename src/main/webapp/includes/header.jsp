<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<body>
<div id="header">
    <div id="nav">
        <nav class="navbar navbar-expand-lg p-0">
            <div class="container-fluid navigation">
                <a class="navbar-brand" href="#">
                    <img class="ms-5" src="shop/images/logo.png" alt="Logo" width="60" height="60" >
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav nav-element text-uppercase nav-text">
                        <li class="nav-item text-white">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="list_product">Products</a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#">Categories</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item dropdown">--%>
<%--                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                                Categories--%>
<%--                            </a>--%>
<%--                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                                <div class="container">--%>
<%--                                    <div class="divider"></div>--%>
<%--                                    <div class="row">--%>
<%--                                        <c:forEach var="category" items="${listCategories}">--%>
<%--                                            <div class="col-md-2">--%>
<%--                                                <a href="view_category?id=${category.id}" style="color: black">--%>
<%--                                                    <h6 class="text-uppercase">${category.detailCategory}</h6></a>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="view_category?id=1">Quần</a></li>
                                <li><a class="dropdown-item" href="view_category?id=2">Áo</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="#"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #ffffff;"></i></a>--%>
<%--                        </li>--%>
                        <li class="nav-item">
                            <form action="search" method="post">
                                <div class="flexbox">
                                    <div class="search">
                                        <div>
                                            <input class="rounded-4 border-primary-subtle pt-1" type="text" name="keyword" placeholder="Search">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #ffffff;"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><i class="fa-solid fa-user fa-xl" style="color: #ffffff;"></i></a>
                            <c:if test="${loggedCustomer == null}">
                                <a style="text-decoration: none;" href="login" class="text-light login-navigation">Login</a>
                            </c:if>

                            <c:if test="${loggedCustomer != null}">
                                <a href="view_profile" class="dropdown-item">Welcome,
                                        ${loggedCustomer.nameCustomer}</a>

                            </c:if>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
