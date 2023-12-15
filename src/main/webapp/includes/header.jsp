<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    #cart-icon {
        position: relative;
        cursor: pointer;
        margin-bottom: 20px;
    }

    #cart-count {
        position: absolute;
        top: 5px;
        right: 5px;
        background-color: red;
        color: white;
        border-radius: 50%;
        padding: 5px 8px;
        font-size: 12px;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-dark navigation  ">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img class="ms-5" src="shop/images/logo.png" alt="Logo" width="55" height="55" >
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ms-5" id="main_nav">
            <ul class="navbar-nav ms-5">
                <li class="nav-item active"> <a class="nav-link" href="${pageContext.request.contextPath}/">TRANG CHỦ </a> </li>
                <li class="nav-item"><a class="nav-link" href="list_product"> SẢN PHẨM </a></li>

                <li class="nav-item dropdown has-megamenu">
                    <a class="nav-link dropdown-toggle" href="view_category?id=1" data-bs-toggle="dropdown"> DANH MỤC </a>
                    <div style="width: 50%; margin-left: 20%" class="dropdown-menu megamenu" role="menu" data-bs-popper="none">
                        <div class="row g-3" >
                            <div class="col-lg-4 col-6">
                                <div class="col-megamenu">
                                    <h6 class="title fw-bold fs-4">Áo</h6>
                                    <ul class="list-unstyled" >
                                        <c:forEach items="${listCategories}" var="category" begin="0" end="3">
                                            <li><a style="text-decoration: none " href="view_category?id=${category.id}">${category.nameCategory}</a></li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-6">
                                <div class="col-megamenu">
                                    <h6 class="title fw-bold fs-4">Quần</h6>
                                    <ul class="list-unstyled" >
                                        <c:forEach items="${listCategories}" var="category" begin="4" end="6">
                                            <li><a style="text-decoration: none " href="view_category?id=${category.id}">${category.nameCategory}</a></li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-6">
                                <div class="col-megamenu">
                                    <h6 class="title fw-bold fs-4">Phụ kiện</h6>
                                    <ul class="list-unstyled">
                                        <c:forEach items="${listCategories}" var="category" begin="7" end="8">
                                            <li><a style="text-decoration: none " href="view_category?id=${category.id}">${category.nameCategory}</a></li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="#"> LIÊN HỆ </a></li>
                <li class="nav-item ms-5">
                    <form action="search" method="post">
                        <div class="flexbox">
                            <div class="search">
                                <div>
                                    <input class="rounded-2 border-primary-subtle pt-1" type="text" name="keyword" placeholder="Tìm kiếm">
                                </div>
                            </div>
                        </div>
                    </form>
                </li>

            </ul>
            <ul class="navbar-nav ms-auto">
                <c:if test="${loggedCustomer == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="view_cart"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #ffffff;"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login"><i class="fa-solid fa-user fa-xl" style="color: #ffffff;"></i></a>
                    </li>
                    <li class=nav-item">
                        <a class="nav-link" style="text-decoration: none; color: white" href="login" >Đăng nhập</a>
                    </li>
                </c:if>

                <c:if test="${loggedCustomer != null}">

                    <li class="nav-item">

                        <div id="cart-icon">
                            <a class="nav-link" href="view_cart"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #ffffff;"></i></a>
                            <span id="cart-count">${listCartDetailsByIdCustomer.size()}</span>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="fa-solid fa-user fa-xl" style="color: #ffffff;"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="view_profile"> Hồ sơ cá nhân</a></li>
                            <li><a class="dropdown-item" href="view_order"> Quản lý đơn hàng</a></li>
                            <li><a class="dropdown-item" href="logout"> Đăng xuất</a></li>
                        </ul>
                    </li>
                    <li class=nav-item">
                        <a class="nav-link" style="text-decoration: none; color: white" href="#" >Chào mừng, ${loggedCustomer.nameCustomer}</a>
                    </li>
                </c:if>
                <%--                <li class="nav-item"><a class="nav-link" href="#"> Menu item </a></li>--%>
                <%--                <li class="nav-item dropdown">--%>
                <%--                    <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"> Dropdown right </a>--%>
                <%--                    <ul class="dropdown-menu dropdown-menu-end">--%>
                <%--                        <li><a class="dropdown-item" href="#"> Submenu item 1</a></li>--%>
                <%--                        <li><a class="dropdown-item" href="#"> Submenu item 2 </a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
            </ul>
        </div> <!-- navbar-collapse.// -->
    </div> <!-- container-fluid.// -->
</nav>
<script>
    document.getElementById("cart-count").innerText = "${listCartDetailsByIdCustomer.size()}";
</script>






<%--<section class="container">--%>
<%--    <h1>Pure CSS Mega Menu Navigation</h1>--%>
<%--    <h2>Not a single line of jQuery in sight!</h2>--%>
<%--</section><!-- .container -->--%>

<%--<nav>--%>
<%--    <ul class="container ul-reset">--%>
<%--        <li><a href='#'>Home</a></li>--%>
<%--        <li class='droppable'>--%>
<%--            <a href='#'>Category One</a>--%>
<%--            <div class='mega-menu'>--%>
<%--                <div class="container cf">--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 1</h3>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 2</h3>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 3</h3>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                        <li><a href='#'>Category One Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 4</h3>--%>
<%--                        <li><img src="http://placehold.it/205x172"></li>--%>
<%--                    </ul>--%>
<%--                </div><!-- .container -->--%>
<%--            </div><!-- .mega-menu -->--%>
<%--        </li><!-- .droppable -->--%>
<%--        <li class='droppable'>--%>
<%--            <a href='#'>Category Two</a>--%>
<%--            <div class='mega-menu'>--%>
<%--                <div class="container cf">--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 1</h3>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 2</h3>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 3</h3>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                    <ul class="ul-reset">--%>
<%--                        <h3>Heading 4</h3>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                        <li><a href='#'>Category Two Sublink</a></li>--%>
<%--                    </ul><!-- .ul-reset -->--%>
<%--                </div><!-- .container -->--%>
<%--            </div><!-- .mega-menu-->--%>
<%--        </li><!-- .droppable -->--%>
<%--        <li><a href='#'>Category Three</a></li>--%>
<%--        <li><a href='#'>Category Four</a></li>--%>
<%--        <li><a href='#'>Category Five</a></li>--%>
<%--        <li><a href='#'>Category Six</a></li>--%>
<%--    </ul><!-- .container .ul-reset -->--%>
<%--</nav>--%>
