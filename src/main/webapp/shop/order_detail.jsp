<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 05/12/2023
  Time: 3:32 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="featured-block text-center">
  <div class="container">
    <c:if test="${order == null}">
      <div class="row">
        <div class="col-12 text-center">
          <h2 class="mt-5 mb-2">You are not authorized to view this order</h2>
        </div>
      </div>
    </c:if>
    <c:if test="${order != null}">
      <div class="row">
        <div class="col-md-6 text-center">
          <h2>Order Overview</h2>
          <div align="center">
            <table>
              <%--<tr>
                <td><b>Ordered By: </b></td>
                <td>${order.customer.nameCustomer}</td>
              </tr>--%>
              <tr>
                <td><b>Order Status: </b></td>
                <td>${order.status}</td>
              </tr>
              <tr>
                <td><b>Order Date: </b></td>
                <td>${order.dateOrder}</td>
              </tr>
              <tr>
                <td><b>Payment Method: </b></td>
                <td>${order.paymentMethod}</td>
              </tr>

              <tr>
                <td><b>Total Amount: </b></td>
                <td>$${order.totalPrice}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="col-md-6 text-center">
          <h2>Recipient Information</h2>
          <div align="center">
            <table>
              <tr>
                <td><b>Full Name: </b></td>
                <td>${order.fullName}</td>
              </tr>
              <tr>
                <td><b>Phone: </b></td>
                <td>${order.phone}</td>
              </tr>
              <tr>
                <td><b>Address: </b></td>
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
        <h2>Ordered Products</h2>
      </div>
      <div class="row">
        <table class="table table-condensed">
          <thead>
          <tr>
            <th style="width: 5%">Index</th>
            <th style="width: 50%">Product Title</th>
            <th style="width: 10%">Price</th>
            <th style="width: 10%">Quantity</th>
            <th style="width: 10%">Subtotal</th>
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
              <td>$${orderDetail.product.price}</td>
              <td>${orderDetail.quantity}</td>
              <td>$${orderDetail.toltalPrice}</td>
<%--              <th><a href="write_review?product_id=${orderDetail.product.id}">Write reviews</a></th>--%>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="6" align="right">
<%--              <p>Subtotal: $${order.subtotal}</p>--%>

              <p>Shipping fee: $${order.fee}</p>
              <p>TOTAL: $${order.totalPrice}</p>
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
