<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<!-- Content: Product details -->
<div id="content-product-details">
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
</body>

