<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 18/11/2023
  Time: 10:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Khách Hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/assets/css/style.css">


</head>
<body>
<%@ include file="slidebar.jsp" %>



<div class="container">

    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>

            <div class="search">
                <label>
                    <input type="text" placeholder="Search here">
                    <ion-icon name="search-outline"></ion-icon>
                </label>
            </div>

            <div class="user">
                <img src="assets/imgs/customer01.jpg" alt="">
            </div>
        </div>


        <h2>Danh Sách Khách Hàng</h2>
        <div >
            <a href="new_customer"
               class="btn waves-effect waves-light btn btn-info pull-right hidden-sm-down text-white">New
                Customer</a>
        </div>
        <table id="customerTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>Index</th>
                <th>ID</th>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Email</th>
                <th>Country</th>
                <th>Register Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${listCustomers}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${customer.id}</td>
                    <td>${customer.nameCustomer}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.address}</td>

                    <td>${customer.email}</td>

                    <td>${customer.country}</td>
                    <td>${customer.registerDate}</td>
                    <td>
                        <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                           href="edit_customer?id=${customer.id}">Edit</a> &nbsp;
                        <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                type="button" onclick="delete_customer(${customer.id})">
                            Delete
                        </button>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>

<script>
    $(document).ready(function() {
        $('#customerTable').DataTable({
            "pagingType": "full_numbers",
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
            "order": [[1, 'asc']], // S?p x?p theo c?t ID m?c ??nh
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
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
