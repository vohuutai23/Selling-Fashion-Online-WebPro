<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="shop/css/main.css" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="shop/images/logo.png">
    <title>CoverYou</title>
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
                        <img class="rounded-corners img-fluid" src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg"
                             width="240" height="240" alt="">
                        <figcaption>
                            <div class="thumb-overlay"><a href="view_product?id=${product.id}" title="More Info">
                                <i class="fas fa-search-plus"></i>
                            </a></div>
                        </figcaption>
                    </figure>
                    <h4><a style="text-decoration: none" href="view_product?id=${product.id}">${product.nameProduct}</a></h4>
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
