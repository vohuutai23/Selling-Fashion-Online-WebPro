<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh Sách Sản Phẩm</title>
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
      <img src="../shop/images/logo.png" alt="">
    </div>
  </div>



  <div class="list_table">
    <div class="table-responsive">
      <div class="cardHeader">
        <h2>List Product</h2>
        <a href="new_product" class="btn">Create Product</a>
      </div>

      <table id="productTable" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
          <th>Index</th>
          <th>ID</th>
          <th>Product Name</th>
          <td>Category</td>
          <th>Image</th>
          <th>Description</th>
          <th>Price</th>
          <th>Post Date</th>
          <th>Update Date</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="product" items="${listProducts}" varStatus="status">
          <tr>
            <td>${status.index + 1}</td>
            <td>${product.id}</td>
            <td>${product.nameProduct}</td>
            <td>${product.category.nameCategory}</td>
            <td>
              <img src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" height="100" width="100">
            </td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.postDate}</td>
            <td>${product.updateDate}</td>
            <td>
              <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                 href="edit_product?id=${product.id}">Edit</a> &nbsp;
              <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                      type="button" onclick="delete_product(${product.id})">
                Delete
              </button>

<%--              <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"--%>
<%--                 href="edit_product?id=${product.id}">Edit</a> &nbsp;--%>
<%--&lt;%&ndash;              <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"&ndash;%&gt;--%>
<%--&lt;%&ndash;                      type="button" onclick="delete_product(${product.id})">&ndash;%&gt;--%>
<%--&lt;%&ndash;                Delete&ndash;%&gt;--%>
<%--&lt;%&ndash;              </button>&ndash;%&gt;--%>
<%--              <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"--%>
<%--                 href="delete_product?id=${product.id}">Delete</a> &nbsp;--%>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <!-- ================= New Customers ================ -->


</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function () {
    $('#productTable').DataTable({
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
        [10, 25, 50, -1],
        [10, 25, 50, "All"]
      ]
    });
  });
</script>
<script>
  function delete_product(id) {
    let customerId = id;
    if (confirm('Are you sure you want to delete the product with ID ' + customerId + '?')) {
      window.location = 'delete_product?id=' + customerId;
    }
  }
</script>
<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>