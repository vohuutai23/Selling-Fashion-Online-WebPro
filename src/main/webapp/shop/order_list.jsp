<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
  <%@ include file="/includes/link.jsp" %>

</head>
<body>
<%@ include file="/includes/header.jsp" %>
<title>${loggedCustomer.nameCustomer} - Lịch sử đặt hàng</title>
<section class="cart text-center mt-5">
  <div class="container">
    <c:if test="${fn:length(listOrder) == 0}">
      <div class="row">
        <div class="col-12 text-center">
          <h2 class="mt-5 mb-2">Bạn chưa có bất kì đơn hàng nào</h2>
        </div>
      </div>
    </c:if>
    <c:if test="${fn:length(listOrder) > 0}">
      <h2 class="mt-5 mb-2">${loggedCustomer.nameCustomer} - Lịch sử đặt hàng</h2>
      <table class="table table-condensed">
        <thead>
        <tr>
          <th style="width: 5%">STT</th>
          <th style="width: 10%">ID Đơn hàng</th>
<%--          <th style="width: 10%">Quantity</th>--%>
          <th style="width: 15%">Số lượng</th>
          <th style="width: 30%">Ngày đặt hàng</th>
          <th style="width: 15%">Trạng thái</th>
          <th style="width: 15%">Tuỳ chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${listOrder}" varStatus="status">
          <tr>
            <td>${status.index + 1}</td>
            <td>${order.id}</td>
<%--            <td>${order.productCopies}</td>--%>
            <td data-th="Price">${order.totalPrice}đ</td>
            <td>${order.dateOrder}</td>
            <td>${order.status}</td>
            <td><a href="show_order_detail?id=${order.id}">Xem chi tiết</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>
</section>
</body>
</html>
