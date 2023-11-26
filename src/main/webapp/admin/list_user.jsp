<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 17/11/2023
  Time: 4:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="slidebar.jsp" %>
<a href="create_user_form.jsp">Create User</a>
<table class="table" id="table_id">
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
<script>
    function delete_user(userId) {
        var confirmation = confirm("Are you sure you want to delete this user?");
        if (confirmation) {
            window.location.href = "delete_user?id=" + userId;
        }
    }

</script>
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
