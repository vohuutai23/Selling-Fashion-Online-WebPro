
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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
                <h2>List User</h2>
                <a href="user_form.jsp">Create User</a>
            </div>

                <table class="table table-striped table-bordered" style="width:100%" id="userTable">
                    <thead>
                    <tr>
                        <th>Index</th>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="list">
                    <c:forEach var="user" items="${listUsers}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td>
                                <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                   href="edit_user?id=${user.id}">Edit</a> &nbsp;
                                <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                        type="button" onclick="delete_user(${user.id})">Delete
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


<script>
    function delete_user(userId) {
        var confirmation = confirm("Are you sure you want to delete this user?");
        if (confirmation) {
            window.location.href = "delete_user?id=" + userId;
        }
    }

</script>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
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
<%--<script>--%>
<%--  function delete_customer(id) {--%>
<%--    let customerId = id;--%>
<%--    if (confirm('Are you sure you want to delete the customer with ID ' + customerId + '?')) {--%>
<%--      window.location = 'delete_customer?id=' + customerId;--%>
<%--    }--%>
<%--  }--%>
<%--</script>--%>

<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $('#table_id').DataTable();--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    function delete_user(id) {--%>
<%--        let userId = id;--%>
<%--        if (confirm('Are you sure you want to delete the user with ID ' + userId + '?')) {--%>
<%--            window.location = 'delete_user?id=' + userId;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
