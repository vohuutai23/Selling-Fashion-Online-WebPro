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
      <div class="row">
        <div class="col-md-6 text-center">
          <h2>Tổng quan đơn hàng</h2>
          <div align="center">
            <table>
              <%--<tr>
                <td><b>Ordered By: </b></td>
                <td>${order.customer.nameCustomer}</td>
              </tr>--%>
              <tr>
                <td><b>Trạng thái đơn hàng: </b></td>
                <td>${order.status}</td>
              </tr>
              <tr>
                <td><b>Ngày đặt hàng: </b></td>
                <td>${order.dateOrder}</td>
              </tr>
              <tr>
                <td><b>Phương thức thanh toán: </b></td>
                <td>${order.paymentMethod}</td>
              </tr>

              <tr>
                <td><b>Tổng tiền: </b></td>
                <td>$${order.totalPrice}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="col-md-6 text-center">
          <h2>Thông tin hoá đơn</h2>
          <div align="center">
            <table>
              <tr>
                <td><b>Tên: </b></td>
                <td>${order.fullName}</td>
              </tr>
              <tr>
                <td><b>Số điện thoại: </b></td>
                <td>${order.phone}</td>
              </tr>
              <tr>
                <td><b>Địa chỉ: </b></td>
                <td>${order.shippingAddress}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </c:if>
  </div>
</section>
<div class="divider"></div>
<section class="cart text-center">
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
              <td>${orderDetail.toltalPrice}đ</td>
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
