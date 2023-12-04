<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }
        footer {
            background-color: #f8f9fa; /* Adjust the background color as needed */
            margin-top: 50%;
            text-align: center;
        }
    </style>
</head>
<body>
<%--<%@ include file="/includes/header.jsp" %>--%>
<section class="cart text-center">
    <div class="container">
        <c:if test="${message != null}">
            <div align="center">
                <h4>${message}</h4>
            </div>
        </c:if>



        <c:if test="${numberOfCartDetails == 0}">
            <h2>There's no items in your cart</h2>
        </c:if>

        <div class="row">
            <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
                <a href=""><i class="fas fa-arrow-left mr-2"></i>Continue Shopping</a>
            </div>
            <div class="col-sm-6 text-md-right">
                <a href="view_cart" class="btn btn-primary btn-lg pl-5 pr-5">Edit cart</a>
            </div>
        </div>
        <c:if test="${numberOfCartDetails > 0}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2">Review Your Order Detail </h2>
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 5%">No</th>
                            <th style="width: 50%">Product</th>
                            <th style="width: 15%">Price</th>
                            <th style="width: 15%">Quantity</th>

                        </tr>

                        <c:forEach items="${cartDetails}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td data-th="Product">
                                    <div class="row">
                                        <div class="col-md-3 text-left">
                                            <img src="https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2023/T-Shirt_Cotton_Compact.2_66.jpg"
                                                 class="img-fluid" alt="">
                                        </div>
                                        <div class="col-md-9 text-left mt-sm-2">
                                            <input type="hidden" name="productId1" value="${item.product.getId()}"/>
                                            <h4>${item.product.getNameProduct()}</h4>
                                            <input type="hidden" name="productIds" value="${item.product.getId()}">
                                        </div>
                                    </div>
                                </td>

                                <td data-th="Quantity">
                                    <input type="hidden" name="productId" value="${item.product.getId()}"/>

                                    <input type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>
<%--                                    <input type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>--%>
                                      <%--  ${item.quantity}--%>
                                    <!-- Gửi số lượng dưới dạng trường ẩn -->
                                    <%--<input type="hidden" name="quantities" value="${item.quantity}">--%>

                                </td>

                                <td data-th="Price">$${item.totalPrice}</td>

                            </tr>
                        </c:forEach>
                    </table>
                    <div class="float-right text-right">
                     <%--<h4>${cart.totalQuantity} product(s)</h4>--%>
                        <h4>Subtotal: $${totalPriceCart}</h4>

                        <h4>Shipping Fee: $${shippingFee}</h4>
                        <h3>TOTAL: $${total}</h3>
                    </div>
                </div>
            </div>


            <form action="place_order" method="post">
                <div class="row">
                    <div class="col-12 text-center">
                        <h2 class="mt-5 mb-2">Your Shipping Information</h2>
                        <div class="text-left">

                            <table align="center">
                                <tr>
                                    <td>Full Name:</td>
                                    <td><input type="text" name="recipientFullName" value="${loggedCustomer.nameCustomer}"
                                               required="required" maxlength="32"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phone:</td>
                                    <td><input type="text" name="recipientPhone" value="${loggedCustomer.phone}"
                                               required="required" maxlength="16"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td><input type="text" name="recipientAddress"
                                               value="${loggedCustomer.address}"
                                               required="required" maxlength="128"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Payment method:
                                    </td>
                                    <td>
                                        <select name="paymentMethod" class="btn btn-lg btn-white dropdown-toggle">
                                            <option value="Cash On Delivery">Cash On Delivery</option>
                                            <option value="PayPal">PayPal or Credit card</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <c:forEach items="${cartDetails}" var="item" varStatus="status">
                        <!-- Các thông tin về sản phẩm -->
                        <!-- Trường ẩn cho ID sản phẩm -->
                        <input type="hidden" name="productIds" value="${item.product.getId()}">
                        <!-- Trường cho số lượng sản phẩm -->
                        <input type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>
                    </c:forEach>
                    <div class="products text-center container">
                        <button class="btn btn-lg btn-outline-primary" type="submit">Place Order</button> &nbsp;&nbsp;
                        <a class="btn btn-lg btn-outline-primary" href="${pageContext.request.contextPath}/">Continue
                            Shopping</a>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
</section>
</body>
</html>
