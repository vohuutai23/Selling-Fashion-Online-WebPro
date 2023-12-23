<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 05/12/2023
  Time: 3:32 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<section class="featured-block text-center">
  <div class="container">
    <c:if test="${order == null}">
      <div class="row">
        <div class="col-12 text-center">
          <h2 class="mt-5 mb-2">Bạn không có đơn hàng nào</h2>
        </div>
      </div>
    </c:if>
    <c:if test="${order != null}">
      <div class="row mt-5">
        <div class="col-md-6">
          <h2>Tổng quan đơn hàng</h2>
          <div>
            <div class="form-group row">
              <label for="orderStatus" class="col-sm-6 col-form-label"><b>Trạng thái đơn hàng:</b></label>
              <div class="col-sm-3">
                <label id="orderStatus">${order.status}</label>
              </div>
            </div>
            <div class="form-group row">
              <label for="orderDate" class="col-sm-6 col-form-label"><b>Ngày đặt hàng:</b></label>
              <div class="col-sm-3">
                <label id="orderDate">${order.dateOrder}</label>
              </div>
            </div>
            <div class="form-group row">
              <label for="paymentMethod" class="col-sm-6 col-form-label"><b>Phương thức thanh toán:</b></label>
              <div class="col-sm-3">
                <label id="paymentMethod">${order.paymentMethod}</label>
              </div>
            </div>
            <div class="form-group row">
              <label for="totalPrice" class="col-sm-6 col-form-label"><b>Tổng tiền:</b></label>
              <div class="col-sm-3">
                <label id="totalPrice">$${order.totalPrice}</label>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <h2>Thông tin hoá đơn</h2>
          <div>
            <div class="form-group row">
              <label for="fullName" class="col-sm-6 col-form-label"><b>Tên:</b></label>
              <div class="col-sm-3">
                <label id="fullName">${order.fullName}</label>
              </div>
            </div>
            <div class="form-group row">
              <label for="phone" class="col-sm-6 col-form-label"><b>Số điện thoại:</b></label>
              <div class="col-sm-3">
                <label id="phone">${order.phone}</label>
              </div>
            </div>
            <div class="form-group row">
              <label for="shippingAddress" class="col-sm-6 col-form-label"><b>Địa chỉ:</b></label>
              <div class="col-sm-3">
                <label id="shippingAddress">${order.shippingAddress}</label>
              </div>
            </div>
          </div>
        </div>
      </div>

    </c:if>
  </div>
</section>
<div class="divider"></div>
<section class="cart text-center mt-5">
  <c:if test="${order != null}">
    <div class="container">
      <div class="text-center">
        <h2>Sản phẩm đã đặt</h2>
      </div>
      <div class="row">
        <table class="table table-condensed">
          <thead>
          <tr>
            <th style="width: 5%">STT</th>
            <th style="width: 50%">Tên sản phẩm</th>
            <th style="width: 10%">Giá</th>
            <th style="width: 10%">Số lượng</th>
            <th style="width: 10%">Thành tiền</th>
<%--            <th style="width: 15%">Help us reviews</th>--%>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
            <tr>
              <td>${status.index + 1}</td>
              <td data-th="Product">
                <div class="row">
                  <div class="col-md-3 text-left">
                    <img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.product.base64Image}" width="48" height="64" alt=""/>
                  </div>
                  <div class="col-md-9 text-left mt-sm-2">
                    <a href="view_product?id=${orderDetail.product.id}"><h4>${orderDetail.product.nameProduct}</h4></a>
                  </div>
                </div>
              </td>
              <td>${orderDetail.product.price}đ</td>
              <td>${orderDetail.quantity}</td>
              <td>${orderDetail.totalPrice}đ</td>
<%--              <th><a href="write_review?product_id=${orderDetail.product.id}">Write reviews</a></th>--%>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="6" align="right">
<%--              <p>Subtotal: $${order.subtotal}</p>--%>

              <p>Phí vận chuyển: ${order.fee}đ</p>
              <p>TỔNG TIỀN: ${order.totalPrice}đ</p>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </c:if>
</section>
</body>
</html>
