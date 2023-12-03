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
<%@ include file="/includes/header.jsp" %>
<div class="row">
    <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
        <a href="${pageContext.request.contextPath}/"><i class="fas fa-arrow-left mr-2"></i> Continue
            Shopping</a>
    </div>
</div>
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
                        </div>
                    </div>
                </td>

                <td data-th="Quantity">
                    <input type="hidden" name="productId" value="${item.product.getId()}"/>
                    <%--<input type="number" name="quantity&lt;%&ndash;${status.index + 1}&ndash;%&gt;" value="${item.quantity}"
                           class="form-control text-center" value="1" min="1" required="required"/>--%>
<%--                    <input type="number" name="quantity${status.index + 1}" value="${item.quantity}" class="form-control text-center" min="1" required="required"/>--%>
                    <input  type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" min="1" required="required"/>


                </td>

                <td data-th="Price">$${item.totalPrice}</td>

<%--                <td>$${item.quantity * item.key.price}</td>--%>

                <td class="actions" data-th="">
                    <div class="text_center">
                        <button type="submit" class="btn btn-white btn-md mb-2">
                            <i class="fas fa-sync"></i>
                        </button>
                        <a type="button" class="btn btn-white btn-md mb-2"
                           href="remove_from_cart?product_id=${item.product.id}"><i
                                class="fas fa-trash"></i></a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<div class="row">
    <div class="col-md-8">

    </div>
    <div class="col-md-4">
        <div class="float-right text-right">
            <h4>Total:</h4>
            <h1>$${totalPriceCart}</h1>
        </div>

        <div class="text-md-right">
            <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Checkout</a>
        </div>
    </div>
</div>

</body>
<footer>
    <%@ include file="/includes/footer.jsp" %>
</footer>
</html>
