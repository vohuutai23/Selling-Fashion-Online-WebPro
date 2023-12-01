<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:if test="${user != null}">Edit User - Administration</c:if>
        <c:if test="${user == null}">Create User - Administration</c:if>
    </title>
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
        <c:if test="${user == null}">
            <form action="create_user" method="post">
                <div class="cardHeader">
                    <h2>Create User</h2>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Email</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="email" name="email" size="20" value="${user.email}" required="required" maxlength="64">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Full Name</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="text" name="fullName" size="20" value="${user.fullName}" required="required" maxlength="64">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Password</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="password" name="password" size="20" value="${user.password}" required="required" minlength="6" maxlength="32">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Confirm Password:</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="password" name="confirmPassword" size="20" value="${user.password}" required="required" minlength="6" maxlength="32">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                        </button>
                    </div>
                </div>
            </form>

        </c:if>
        <c:if test="${user != null}">
            <form action="save_edit_user" method="post">
                <div class="cardHeader">
                    <h2>Edit User</h2>
                </div>
                <p>NOTE: You can't update the email address.</p>
                <input type="hidden" name="userId" value="${user.id}">
                <div class="form-group">
                    <label class="col-md-12">Email</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="email" name="email" size="20" value="${user.email}" required="required" maxlength="64">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Full Name</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="text" name="fullName" size="20" value="${user.fullName}" required="required" maxlength="64">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Password</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="password" name="checkPassword" size="20" value="${user.password}" required="required" minlength="6" maxlength="32">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Leave blank if you don't want to
                        change it.</label>
                </div>
                <div class="form-group">
                    <label class="col-md-12">New Password</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="password" name="password" size="20" value="${user.password}" maxlength="32">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Confirm New Password</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="password" name="confirmPassword" size="20" value="${user.password}" maxlength="32">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                        </button>
                    </div>
                </div>
            </form>
        </c:if>
        </div>
    </div>
    <!-- ================= New Customers ================ -->


</div>

<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
