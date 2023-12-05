<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
  <title>${loggedCustomer.nameCustomer} - Order History</title>
</head>
<body>
<section class="cart text-center">
  <div class="container">
    <c:if test="${fn:length(listOrder) == 0}">
      <div class="row">
        <div class="col-12 text-center">
          <h2 class="mt-5 mb-2">You have not placed any order</h2>
        </div>
      </div>
    </c:if>
    <c:if test="${fn:length(listOrder) > 0}">
      <h2 class="mt-5 mb-2">${loggedCustomer.nameCustomer} - Order History</h2>
      <table class="table table-condensed">
        <thead>
        <tr>
          <th style="width: 5%">Index</th>
          <th style="width: 10%">Order ID</th>
<%--          <th style="width: 10%">Quantity</th>--%>
          <th style="width: 15%">Total Amount</th>
          <th style="width: 30%">Order Date</th>
          <th style="width: 15%">Status</th>
          <th style="width: 15%">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${listOrder}" varStatus="status">
          <tr>
            <td>${status.index + 1}</td>
            <td>${order.id}</td>
<%--            <td>${order.productCopies}</td>--%>
            <td data-th="Price">$${order.totalPrice}</td>
            <td>${order.dateOrder}</td>
            <td>${order.status}</td>
            <td><a href="show_order_detail?id=${order.id}">View Detail</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>
</section>
</body>
</html>
