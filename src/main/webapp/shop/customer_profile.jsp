<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;

        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        table td:first-child {
            font-weight: bold;
            width: 120px;
        }

        .edit-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .edit-link a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div class="container">
    <h1>My Profile</h1>

    <table>
        <tr>
            <td><b>Email Address:</b></td>
            <td>${loggedCustomer.email}</td>
        </tr>
        <tr>
            <td><b>Full Name:</b></td>
            <td>${loggedCustomer.nameCustomer}</td>
        </tr>
        <tr>
            <td><b>Phone Number:</b></td>
            <td>${loggedCustomer.phone}</td>
        </tr>
        <tr>
            <td><b>Address:</b></td>
            <td>${loggedCustomer.address}</td>
        </tr>
        <tr>
            <td><b>Country:</b></td>
            <td>${loggedCustomer.country}</td>
        </tr>
    </table>

    <div class="edit-link">
        <a href="edit_profile">Edit My Profile</a>
    </div>
</div>
</body>
</html>


<%--
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h6 class="form-title">Welcome, ${loggedCustomer.nameCustomer}</h6>

<table class="form-group" style="border: 0">
    <tr>
        <td><b>Email Address:</b></td>
        <td>${loggedCustomer.email}</td>
    </tr>
    <tr>
        <td><b>Full Name:</b></td>
        <td>${loggedCustomer.nameCustomer}</td>
    </tr>

    <tr>
        <td><b>Phone Number:</b></td>
        <td>${loggedCustomer.phone}</td>
    </tr>
    <tr>
        <td><b>Address:</b></td>
        <td>${loggedCustomer.address}</td>
    </tr>
    <tr>
        <td><b>Country:</b></td>

        <td>${loggedCustomer.country}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align="center"><a href="edit_profile">Edit My Profile</a></td>
    </tr>
</table>
</body>
</html>
--%>
