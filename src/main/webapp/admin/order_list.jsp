<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Hóa Đơn</title>
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
                <h2>DANH SÁCH HÓA ĐƠN</h2>
            </div>

<%--            <table id="customerTable" class="table table-striped table-bordered" style="width:100%">--%>
            <table id="orderTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Index</th>
                    <th>Order ID</th>
<%--                    <th>Ordered by</th>--%>
<%--                    <th>Product Copies</th>--%>
                    <th>Total</th>
                    <th>Payment method</th>
                    <th>Status</th>
                    <th>Order Date</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="list">
                <c:forEach var="order" items="${listOrder}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.id}</td>
<%--                        <td>${order.customer.getNameCustomer()}</td>--%>
<%--                        <td>${order.productCopies}</td>--%>
                        <td>$${order.totalPrice}</td>
                        <td>${order.paymentMethod}</td>
                        <td>${order.status}</td>
                        <td>${order.dateOrder}</td>
                        <td>
                            <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                               href="view_order?id=${order.id}">View</a> &nbsp;
                            <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                               href="edit_order?id=${order.id}">Edit</a> &nbsp;
                            <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                    type="button" onclick="delete_order(${order.id})">Delete
                            </button>
                        </td>
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
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ]
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#orderTable').DataTable();
    });
</script>
<script>
    function delete_order(id) {
        let orderId = id;
        if (confirm('Are you sure you want to delete the order with ID ' + orderId + '?')) {
            window.location = 'delete_order?id=' + orderId;
        }
    }
</script>

<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
