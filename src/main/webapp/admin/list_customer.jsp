<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Khách Hàng</title>
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







<div class="navigation">
    <ul>
        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="logo-apple"></ion-icon>
                    </span>
                <span class="title">Brand Name</span>
            </a>
        </li>

        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="home-outline"></ion-icon>
                    </span>
                <span class="title">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="list_user">
                    <span class="icon">
                        <ion-icon name="person-outline"></ion-icon>
                    </span>
                <span class="title">User</span>
            </a>
        </li>
        <li>
            <a href="list_customer">
                    <span class="icon">
                        <ion-icon name="people-outline"></ion-icon>
                    </span>
                <span class="title">Customers</span>
            </a>
        </li>
        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="review-outline"></ion-icon>
                    </span>
                <span class="title">Product</span>
            </a>
        </li>
        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                <span class="title">Order</span>
            </a>
        </li>
        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                <span class="title">Review</span>
            </a>
        </li>
        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="chatbubble-outline"></ion-icon>
                    </span>
                <span class="title">Messages</span>
            </a>
        </li>



        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="settings-outline"></ion-icon>
                    </span>
                <span class="title">Statistical</span>
            </a>
        </li>

        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                <span class="title">Password</span>
            </a>
        </li>

        <li>
            <a href="#">
                    <span class="icon">
                        <ion-icon name="log-out-outline"></ion-icon>
                    </span>
                <span class="title">Sign Out</span>
            </a>
        </li>
    </ul>
</div>



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
                <h2>List Customer</h2>
                <a href="#" class="btn">Create Customer</a>
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
    <!-- ================= New Customers ================ -->


</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customerTable').DataTable({
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