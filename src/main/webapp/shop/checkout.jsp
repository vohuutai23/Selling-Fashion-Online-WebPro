<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="/includes/link.jsp" %>
</head>
<body>

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

        <div class="row mt-5">
            <div class="col-sm-9 mb-3 mb-m-1 text-md-left">

            </div>
            <div class="col-sm-3 text-md-right">
                <a href="view_cart" class="btn btn-primary pl-5 pr-5">Chỉnh sửa giỏ hàng</a>
            </div>
        </div>
        <c:if test="${numberOfCartDetails > 0}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2 fw-bolder mb-3">Kiểm tra đơn hàng </h2>
                    <table class="table table-condensed">
                        <tr>
                            <th style="width: 5%">STT</th>
                            <th style="width: 50%">Sản phẩm</th>
                            <th style="width: 15%">Số lượng</th>
                            <th style="width: 15%">Giá</th>

                        </tr>

                        <c:forEach items="${cartDetails}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td data-th="Product">
                                    <div class="row">
                                        <div class="col-md-3 text-left">
                                            <img src="data:image/jpeg;base64,${item.product.base64Image}" width="90px" height="120px" alt="Product Image"
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


                                </td>

                                <td data-th="Price">$${item.totalPrice}</td>

                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
            <div class="row">
                <div class="col-md-9"></div>
                <div class="col-md-3 float-right text-right">
                        <%--<h4>${cart.totalQuantity} product(s)</h4>--%>
                    <h5>Tạm tính: ${totalPriceCart}đ</h5>

                    <h5>Phí vận chuyển: ${shippingFee}đ</h5>
                    <h4 class="fw-bold">Tổng cộng: ${total}đ</h4>
                </div>
            </div>



            <form action="place_order" method="post">
                <div class="row mb-5 border-top border-info-subtle mt-5">
                    <div class="col-12">
                        <h2 class="mt-5 mb-2 fw-bolder mb-5">Thông tin vận chuyển</h2>
                        <div style="width: 50%; margin: 0 auto;">
                            <div class="form-group row m-3">
                                <label for="recipientFullName" class="col-sm-4 col-form-label">Họ tên:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recipientFullName" name="recipientFullName" value="${loggedCustomer.nameCustomer}" required maxlength="32"/>
                                </div>
                            </div>
                            <div class="form-group row m-3">
                                <label for="recipientPhone" class="col-sm-4 col-form-label">Số điện thoại:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recipientPhone" name="recipientPhone" value="${loggedCustomer.phone}" required maxlength="16"/>
                                </div>
                            </div>
                            <div class="form-group row m-3">
                                <label for="email" class="col-sm-4 col-form-label">Email:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="email" name="email" value="${loggedCustomer.email}" required maxlength="128"/>
                                </div>
                            </div>
                            <div class="form-group row m-3">
                                <label for="recipientAddress" class="col-sm-4 col-form-label">Địa chỉ:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recipientAddress" name="recipientAddress" value="${loggedCustomer.address}" required maxlength="128"/>
                                </div>
                            </div>
                            <div class="form-group row m-3">
                                <label for="paymentMethod" class="col-sm-4 col-form-label">Phương thức thanh toán:</label>
                                <div class="col-sm-8">
                                    <select name="paymentMethod" class="form-control btn btn-lg btn-white" id="paymentMethod">
                                        <option value="Cash On Delivery">Ship COD</option>
                                        <option value="PayPal">Thanh toán qua ngân hàng</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group m-3">
                                <c:forEach items="${cartDetails}" var="item" varStatus="status">
                                    <input type="hidden" name="productIds" value="${item.product.getId()}">
                                    <input type="hidden" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control" required/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="products text-center container mt-5">
                        <button class="btn btn-lg btn-outline-primary" type="submit">Xác nhận</button> &nbsp;&nbsp;
                        <a class="btn btn-lg btn-outline-primary" href="${pageContext.request.contextPath}/">Tiếp tục mua sắm</a>
                    </div>
                </div>

            </form>
        </c:if>
    </div>
</section>
</body>
</html>