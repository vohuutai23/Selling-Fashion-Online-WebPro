<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    .rating {
        display: inline-block;
        position: relative;
        height: 50px;
        line-height: 50px;
        font-size: 50px;
    }

    .rating label {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        cursor: pointer;
    }

    .rating label:last-child {
        position: static;
    }

    .rating label:nth-child(1) {
        z-index: 5;
    }

    .rating label:nth-child(2) {
        z-index: 4;
    }

    .rating label:nth-child(3) {
        z-index: 3;
    }

    .rating label:nth-child(4) {
        z-index: 2;
    }

    .rating label:nth-child(5) {
        z-index: 1;
    }

    .rating label input {
        position: absolute;
        top: 0;
        left: 0;
        opacity: 0;
    }

    .rating label .icon {
        float: left;
        color: transparent;
    }

    .rating label:last-child .icon {
        color: #000;
    }

    .rating:not(:hover) label input:checked ~ .icon,
    .rating:hover label:hover input ~ .icon {
        color: #09f;
    }

    .rating label input:focus:not(:checked) ~ .icon:last-child {
        color: #000;
        text-shadow: 0 0 5px #09f;
    }
</style>
<!-- Content: Product details -->
<div id="content-product-details mb-5">
    <div class="container mt-5">
        <div class="product-single">
            <div class="row">
                <div class="col-md-6">
                    <div class="background-product">
                        <img src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" height="80%" width="80%">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="info-product mt-5">
                        <div class="row m-4 fs-1 fw-medium">${product.nameProduct}</div>
                        <div class="row m-4 fs-3 fw-medium">${product.price}đ</div>
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
                                <%--                                    <a href="add_to_cart?product_id=${product.id}" type="button" id="buttonAddToCart" class="btn btn-full-width btn-lg btn-outline-primary">Add to cart</a></div>--%>
                                <form action="add_to_cart" method="post">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="submit" value="Thêm vào giỏ hàng" class="btn btn-full-width btn-lg btn-outline-primary">
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%--    <h2 class="products text-center">${loggedCustomer.fullName} Reviews</h2>--%>
<%--    <h3 class="mb-3 mt-0">${product.nameProduct}</h3>--%>
<%--    <div class="rating-star">--%>
<%--&lt;%&ndash;        <form class="rating" action="submit_review" method="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="radio" name="rating" value="1" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="radio" name="rating" value="2" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="radio" name="rating" value="3" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="radio" name="rating" value="4" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="radio" name="rating" value="5" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="icon">★</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>
<%--    <form class="rating" action="submit_review" method="post">--%>
<%--        <label>--%>
<%--            <input type="radio" name="rating" value="1" />--%>
<%--            <span class="icon">★</span>--%>
<%--        </label>--%>
<%--        <label>--%>
<%--            <input type="radio" name="rating" value="2" />--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--        </label>--%>
<%--        <label>--%>
<%--            <input type="radio" name="rating" value="3" />--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--        </label>--%>
<%--        <label>--%>
<%--            <input type="radio" name="rating" value="4" />--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--        </label>--%>
<%--        <label>--%>
<%--            <input type="radio" name="rating" value="5" />--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--            <span class="icon">★</span>--%>
<%--        </label>--%>
<%--        <input type="hidden" name="selectedRating" id="selectedRating" value="1" />--%>
<%--&lt;%&ndash;        <button class="btn btn-lg btn-outline-primary" type="submit">Submit</button>&ndash;%&gt;--%>
<%--    </form>--%>
<%--    </div>--%>
<%--    <form action="submit_review" method="post">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-md-6 mt-5 mt-md-2 text-center text-md-left">--%>

<%--                    <input type="hidden" name="productId" value="${product.id}"/>--%>
<%--                    <br>--%>
<%--&lt;%&ndash;                    <input type="text" name="headline" size="60"&ndash;%&gt;--%>
<%--&lt;%&ndash;                           placeholder="Headline or summary for your review (required)" required="required"/>&ndash;%&gt;--%>
<%--                    <textarea name="comment" cols="70" rows="10" placeholder="Write your review details..."--%>
<%--                              required="required"></textarea>--%>
<%--                    <button class="btn btn-lg btn-outline-primary" type="submit">Submit</button>--%>
<%--                    &nbsp;&nbsp;--%>
<%--                    <button class="btn btn-lg btn-outline-primary" onclick="history.go(-1);">Cancel</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>


<%--<script>--%>
<%--    $(':radio').change(function() {--%>
<%--        console.log('New star rating: ' + this.value);--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    // Sử dụng jQuery để cập nhật giá trị của hidden input khi người dùng chọn số sao--%>
<%--    $('.rating input').on('change', function() {--%>
<%--        $('#selectedRating').val($(this).val());--%>
<%--    });--%>
<%--</script>--%>
</body>

