<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/24/2023
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/includes/link.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Giỏ hàng</title>
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
<div class="row mt-4">
    <div class="col-sm-6 mb-3 mb-m-1 text-md-left">
        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/"><i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm</a>
    </div>
</div>
<h1 class="text-info fs-2 fw-bold text-center mb-4">Giỏ hàng của bạn</h1>
<form action="update_cart" method="post" id="cartForm">
    <table class="table table-condensed">
        <thead>
        <tr>
            <th style="width: 5%">STT</th>
            <th style="width: 50%">Sản phẩm</th>
            <th style="width: 10%">Số lượng</th>
            <th style="width: 10%">Giá</th>
            <th style="width: 10%">Tạm tính</th>
            <th style="width: 10%">
                <a style="text-decoration: none; color: red" href="clear_cart" type="button" id="clearCart">Xoá tất cả</a>
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
                            <img src="data:image/jpeg;base64,${item.product.base64Image}" alt="Product Image"
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

                    <input  type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" min="1" required="required"/>


                </td>

                <td data-th="Price">${item.totalPrice}đ</td>

                <td>${item.quantity * item.totalPrice}đ</td>

                <td class="actions" data-th="">
                    <div class="text_center">
                        <button type="submit" class="btn btn-white btn-md mb-2">
                            <i class="fa-solid fa-rotate-right"></i>
                        </button>
                        <a type="button" class="btn btn-white btn-md mb-2"
                           href="remove_from_cart?product_id=${item.product.id}"><i
                                class="fa-solid fa-trash"></i></a>
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
            <h4>Tổng tiền:</h4>
            <h1>${totalPriceCart}đ</h1>
        </div>

        <div class="text-md-right">
            <a href="checkout" class="btn btn-primary btn-lg pl-5 pr-5">Thanh toán</a>
        </div>
    </div>
</div>
<%@ include file="/includes/footer.jsp" %>
</body>

</html>
