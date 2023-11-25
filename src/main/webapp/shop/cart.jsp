<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/24/2023
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<h1 class="text-info fs-2 fw-bold text-center">Your cart</h1>
<form action="update_cart" method="post" id="cartForm">
    <table class="table table-condensed">
        <thead>
        <tr>
            <th style="width: 5%">No</th>
            <th style="width: 50%">Product</th>
            <th style="width: 10%">Quantity</th>
            <th style="width: 10%">Price</th>
            <th style="width: 10%">Subtotal</th>
            <th style="width: 15%">
                <a href="clear_cart" type="button" id="clearCart">Clear All</a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cart.items}" var="item" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-md-3 text-left">
                            <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg"
                                 class="img-fluid" alt="">
                        </div>
                        <div class="col-md-9 text-left mt-sm-2">
                            <h4>${item.key.nameProduct}</h4>
                        </div>
                    </div>
                </td>

                <td data-th="Quantity">
                    <input type="hidden" name="productId" value="${item.key.id}"/>
                    <input type="number" name="quantity${status.index + 1}" value="${item.value}"
                           class="form-control text-center" value="1" min="1" required="required"/>
                </td>

                <td data-th="Price">$${item.key.price}</td>

                <td>$${item.value * item.key.price}</td>

                <td class="actions" data-th="">
                    <div class="text_center">
                        <button type="submit" class="btn btn-white btn-md mb-2">
                            <i class="fas fa-sync"></i>
                        </button>
                        <a type="button" class="btn btn-white btn-md mb-2"
                           href="remove_from_cart?product_id=${item.key.id}"><i
                                class="fas fa-trash"></i></a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<%--<section class="cart text-center">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">--%>
<%--                <a href=""><i class="fas fa-arrow-left mr-2"></i>Continue Shopping</a>--%>
<%--            </div>--%>
<%--            <div class="col-sm-6 text-md-right">--%>
<%--                <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Checkout</a>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--&lt;%&ndash;        <c:set var="cart" value="${sessionScope['cart']}"/>&ndash;%&gt;--%>

<%--        <div class="row">--%>
<%--            <div class="col-12 text-center">--%>
<%--                <h2 class="mt-5 mb-2">Your Shopping Cart</h2>--%>

<%--&lt;%&ndash;                <c:if test="${cart.totalItems == 0}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p class="mb-5">There's no items in your cart</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${cart.totalItems > 0}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p class="mb-5"><span class="primary-color">${cart.totalItems}</span> Items in your cart</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;                <c:if test="${message != null}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div align="center">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p class="mb-5">${message}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;                <c:if test="${cart.totalItems > 0}">&ndash;%&gt;--%>
<%--                    <form action="update_cart" method="post" id="cartForm">--%>
<%--                        <table class="table table-condensed">--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th style="width: 5%">No</th>--%>
<%--                                <th style="width: 50%">Product</th>--%>
<%--                                <th style="width: 10%">Quantity</th>--%>
<%--                                <th style="width: 10%">Price</th>--%>
<%--                                <th style="width: 10%">Subtotal</th>--%>
<%--                                <th style="width: 15%">--%>
<%--                                    <a href="clear_cart" type="button" id="clearCart">Clear All</a>--%>
<%--                                </th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <c:forEach items="${cart.items}" var="item" varStatus="status">--%>
<%--                                <tr>--%>
<%--&lt;%&ndash;                                    <td>${status.index + 1}</td>&ndash;%&gt;--%>
<%--                                    <td data-th="Product">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-md-3 text-left">--%>
<%--                                                <img src="data:image/jpg;base64,${item.key.base64Image}"--%>
<%--                                                     class="img-fluid" alt="">--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-9 text-left mt-sm-2">--%>
<%--                                                <h4>${item.key.title}</h4>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>

<%--                                    <td data-th="Quantity">--%>
<%--                                        <input type="hidden" name="productId" value="${item.key.productId}"/>--%>
<%--                                        <input type="number" name="quantity${status.index + 1}" value="${item.value}"--%>
<%--                                               class="form-control text-center" value="1" min="1" required="required"/>--%>
<%--                                    </td>--%>

<%--                                    <td data-th="Price">$${item.key.price}</td>--%>

<%--                                    <td>$${item.value * item.key.price}</td>--%>

<%--                                    <td class="actions" data-th="">--%>
<%--                                        <div class="text_center">--%>
<%--                                            <button type="submit" class="btn btn-white btn-md mb-2">--%>
<%--                                                <i class="fas fa-sync"></i>--%>
<%--                                            </button>--%>
<%--                                            <a type="button" class="btn btn-white btn-md mb-2"--%>
<%--                                               href="remove_from_cart?product_id=${item.key.productId}"><i--%>
<%--                                                    class="fas fa-trash"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </form>--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--                <div class="float-right text-right">--%>
<%--                    <h4>Total:</h4>--%>
<%--                    <h1>$${cart.totalAmount}</h1>--%>
<%--                    <p>(Excluding Delivery)</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">--%>
<%--                <a href="#"><i class="fas fa-arrow-left mr-2"></i> Continue--%>
<%--                    Shopping</a>--%>
<%--            </div>--%>
<%--            <div class="col-sm-6 text-md-right">--%>
<%--                <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Checkout</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</section>--%>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
