<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi Tiết Hóa Đơn</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">

  <!-- DataTables JS -->
  <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

  <!-- Custom CSS và JS c?a b?n -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/assets/css/list_customer_style.css">

</head>
<body>

<%@ include file="slidebar.jsp" %>




<div class="main">
  <div class="topbar">
    <div class="toggle">
      <ion-icon name="menu-outline"></ion-icon>
    </div>

    <!-- <div class="search">
        <label>
            <input type="text" placeholder="Search here">
            <ion-icon name="search-outline"></ion-icon>
        </label>
    </div> -->

    <div class="user">
      <img src="assets/imgs/customer01.jpg" alt="">
    </div>
  </div>



  <div class="list_table">
    <div class="table-responsive">
      <div class="cardHeader">
        <h2>Chi Tiết Hóa Đơn</h2>
<%--        <a href="new_customer" class="btn">Create Customer</a>--%>
      </div>

      <div class="col-lg-8 col-xlg-9 col-md-7">
        <div class="card">
          <!-- Tab panes -->
          <div class="card-body">
            <h2 class="text-themecolor" style="text-align: center;">Order Overview</h2>
            <div class="form-group">
              <label class="col-md-12">Ordered By (Customer ID):</label>
              <a style="text-align: center;"
                 class="form-control form-control-line">${order.customer.getId()}</a>
            </div>
            <div class="form-group">
              <label class="col-md-12">Order Status:</label>
              <a class="form-control form-control-line">${order.status}</a>
            </div>
            <div class="form-group">
              <label class="col-md-12">Order Date:</label>
              <a class="form-control form-control-line">${order.dateOrder}</a>
            </div>
            <div class="form-group">
              <label class="col-md-12">Payment Method:</label>
              <a class="form-control form-control-line">${order.paymentMethod}</a>
            </div>
            <%--<div class="form-group">
              <label class="col-md-12">Product Copies:</label>
              <a class="form-control form-control-line">${order.productCopies}</a>
            </div>--%>
            <div class="form-group">
              <label class="col-md-12">Total Amount:</label>
              <a class="form-control form-control-line">$${order.totalPrice}</a>
            </div>
            <h2 class="text-themecolor" style="text-align: center;">Recipient Information</h2>
            <div class="form-group">
              <label class="col-md-12">Full Name:</label>
              <a class="form-control form-control-line">${order.fullName}</a>
            </div>

              <label class="col-md-12">Phone:</label>
              <a class="form-control form-control-line">${order.phone}</a>
            </div>
            <div class="form-group">
              <label class="col-md-12">Address:</label>
              <a class="form-control form-control-line">${order.shippingAddress}</a>
            </div>
            <h2 class="text-themecolor" style="text-align: center;">Ordered Products</h2>
            <div class="form-group">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                    <tr>
                      <th>Index</th>
                      <th>Product Title</th>
                      <th>Price</th>
                      <th>Quantity</th>
                      <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody class="list">
                    <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                      <tr>
                        <td>${status.index + 1}</td>
                        <td>
                          <img style="vertical-align: middle;"
                               src="data:image/jpg;base64,${orderDetail.product.base64Image}"
                               width="48" height="64"/>
                            ${orderDetail.product.nameProduct}
                        </td>
                        <td>$${orderDetail.product.price}</td>
                        <td>${orderDetail.quantity}</td>
                        <td>$${orderDetail.totalPrice}</td>
                      </tr>
                    </c:forEach>
                    <tr>
                      <td colspan="5" align="right">
<%--                        <p>Subtotal: $${order.subtotal}</p>--%>
                        <p>Shipping fee: $${order.fee}</p>
                        <p>TOTAL: $${order.totalPrice}</p>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12">
                <a class="btn btn-success" href="edit_order?id=${order.id}">Edit this Order</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                        type="button" onclick="delete_order(${order.id})">Delete
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- ================= New Customers ================ -->


</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function () {
    $('#orderTable').DataTable({
      "pagingType": "full_numbers",
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
      "order": [
        [1, 'asc']
      ], // S?p x?p theo c?t ID m?c ??nh
      "lengthMenu": [
        [2, 25, 50, -1],
        [2, 25, 50, "All"]
      ]
    });
  });
</script>
<script>
  function delete_customer(id) {
    let customerId = id;
    if (confirm('Are you sure you want to delete the customer with ID ' + customerId + '?')) {
      window.location = 'delete_customer?id=' + customerId;
    }
  }
</script>

<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
