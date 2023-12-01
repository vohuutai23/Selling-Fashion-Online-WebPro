<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Category</title>
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
                    <c:if test="${message != null}">
                        <div align="center">
                            <h3>${message}</h3>
                        </div>
                    </c:if>
                    <h2>List Category</h2>

                    <a href="category_form.jsp" class="btn">Create Category</a>
                </div>

                <table id="categoryTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>Index</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Group</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="list">
                    <c:forEach var="category" items="${listCategories}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${category.id}</td>
                            <td>${category.nameCategory}</td>
                            <td>${category.groupCategory}</td>

                            <td>
                                <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                   href="edit_category?id=${category.id}">Edit</a> &nbsp;
                                <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                        type="button" onclick="delete_category(${category.id})">
                                    Delete
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
            $('#categoryTable').DataTable({
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
        function delete_category(id) {
            let categoryId = id;
            if (confirm('Are you sure you want to delete the category with ID ' + categoryId + '?')) {
                window.location = 'delete_category?id=' + categoryId;
            }
        }
    </script>

    <script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
