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
                    <h2 class="mt-5 mb-2">Kiểm tra đơn hàng </h2>
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
<%--                                    <input type="number" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>--%>
                                      <%--  ${item.quantity}--%>
                                    <!-- Gửi số lượng dưới dạng trường ẩn -->
                                    <%--<input type="hidden" name="quantities" value="${item.quantity}">--%>

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
                    <h4>Tổng cộng: ${total}đ</h4>
                </div>
            </div>


<%--            <form action="place_order" method="post">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-12 text-center">--%>
<%--                        <h2 class="mt-5 mb-2">Thông tin vận chuyển</h2>--%>
<%--                        <div class="text-left">--%>

<%--                            <table align="center ">--%>
<%--                                <tr>--%>
<%--                                    <td>Họ tên:</td>--%>
<%--                                    <td><input type="text" name="recipientFullName" value="${loggedCustomer.nameCustomer}"--%>
<%--                                               required="required" maxlength="32"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>Số điện thoại:</td>--%>
<%--                                    <td><input type="text" name="recipientPhone" value="${loggedCustomer.phone}"--%>
<%--                                               required="required" maxlength="16"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>Email:</td>--%>
<%--                                    <td><input type="text" name="email"--%>
<%--                                               value="${loggedCustomer.email}"--%>
<%--                                               required="required" maxlength="128"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>Địa chỉ:</td>--%>
<%--                                    <td><input type="text" name="recipientAddress"--%>
<%--                                               value="${loggedCustomer.address}"--%>
<%--                                               required="required" maxlength="128"/>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>

<%--                                <tr>--%>
<%--                                    <td>Phương thức thanh toán:--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <select name="paymentMethod" class="btn btn-lg btn-white dropdown-toggle">--%>
<%--                                            <option value="Cash On Delivery">Ship COD</option>--%>
<%--                                            <option value="PayPal">Thanh toán qua ngân hàng</option>--%>
<%--                                        </select>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>--%>
<%--                                        <c:forEach items="${cartDetails}" var="item" varStatus="status">--%>
<%--                                            <!-- Các thông tin về sản phẩm -->--%>
<%--                                            <!-- Trường ẩn cho ID sản phẩm -->--%>
<%--                                            <input type="hidden" name="productIds" value="${item.product.getId()}">--%>
<%--                                            <!-- Trường cho số lượng sản phẩm -->--%>
<%--                                            <input type="hidden" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>--%>
<%--                                        </c:forEach>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="products text-center container">--%>
<%--                        <button class="btn btn-lg btn-outline-primary" type="submit">Xác nhận</button> &nbsp;&nbsp;--%>
<%--                        <a class="btn btn-lg btn-outline-primary" href="${pageContext.request.contextPath}/">Tiếp tục mua sắm</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
            <form action="place_order" method="post">
                <div class="row">
                    <div class="col-12 text-center">
                        <h2 class="mt-5 mb-2">Thông tin vận chuyển</h2>
                        <div class="text-left">
                            <table align="center" style="width: 50%; margin: 0 auto;">
                                <!-- Các hàng khác giữ nguyên, chỉ thêm text-align: center; -->
                                <tr class="m-2">
                                    <td style="text-align: center;">Họ tên:</td>
                                    <td><input type="text" name="recipientFullName" value="${loggedCustomer.nameCustomer}" required="required" maxlength="32"/></td>
                                </tr>
                                <tr class="m-2">
                                    <td style="text-align: center;">Số điện thoại:</td>
                                    <td><input type="text" name="recipientPhone" value="${loggedCustomer.phone}" required="required" maxlength="16"/></td>
                                </tr>
                                <tr class="m-2">
                                    <td style="text-align: center;">Email:</td>
                                    <td><input type="text" name="email" value="${loggedCustomer.email}" required="required" maxlength="128"/></td>
                                </tr>
                                <tr class="m-2">
                                    <td style="text-align: center;">Địa chỉ:</td>
                                    <td><input type="text" name="recipientAddress" value="${loggedCustomer.address}" required="required" maxlength="128"/></td>
                                </tr>
                                <tr class="m-2">
                                    <td style="text-align: center;">Phương thức thanh toán:</td>
                                    <td>
                                        <select name="paymentMethod" class="btn btn-lg btn-white dropdown-toggle">
                                            <option value="Cash On Delivery">Ship COD</option>
                                            <option value="PayPal">Thanh toán qua ngân hàng</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <c:forEach items="${cartDetails}" var="item" varStatus="status">
                                            <!-- Các thông tin về sản phẩm -->
                                            <!-- Trường ẩn cho ID sản phẩm -->
                                            <input type="hidden" name="productIds" value="${item.product.getId()}">
                                            <!-- Trường cho số lượng sản phẩm -->
                                            <input type="hidden" name="quantity_${item.product.getId()}" value="${item.quantity}" class="form-control text-center" required="required"/>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </table>
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
