<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Edit My Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-group i {
            font-size: 12px;
            color: #888;
        }

        .signup-image {
            margin-left: 20px;
        }

        .signup-image img {
            max-width: 100%;
            border-radius: 5px;
        }

        .signup-image-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="signup-form">
        <h5 class="form-title">Edit My Profile</h5>

        <form method="post" action="update_profile" class="register-form" id="customerForm">
            <div class="form-group">
                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i> Full Name</label>
                <input type="text" name="name" id="name" placeholder="Your full name"
                       value="${loggedCustomer.nameCustomer}" required="required" maxlength="32"/>
            </div>

            <div class="form-group">
                <label for="email"><i class="zmdi zmdi-email"></i> Email Address</label>
                <input type="email" name="email" id="email" placeholder="Your email" readonly="readonly"
                       value="${loggedCustomer.email}"/>
                <i>Email cannot be changed</i>
            </div>

            <div class="form-group">
                <label for="phone"><i class="zmdi zmdi-lock"></i> Phone Number</label>
                <input type="text" name="phone" id="phone" placeholder="Your phone number"
                       value="${loggedCustomer.phone}" required="required" maxlength="16"/>
            </div>

            <div class="form-group">
                <label for="address"><i class="zmdi zmdi-lock"></i> Address</label>
                <input type="text" name="address" id="address" placeholder="Your address"
                       value="${loggedCustomer.address}" required="required" maxlength="128"/>
            </div>

            <div class="form-group">
                <label for="country"><i class="zmdi zmdi-lock"></i> Country</label>
                <select name="country" id="country" class="form-control">
                    <c:forEach items="${mapCountries}" var="country">
                        <option value="${country.value}"
                                <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="password"><i class="zmdi zmdi-lock"></i> Password</label>
                <input type="password" name="password" id="password" placeholder="Your password"/>
            </div>

            <div class="form-group">
                <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i> Confirm Password</label>
                <input type="password" name="confirmPassword" id="confirmPassword"
                       placeholder="Confirm your password"/>
            </div>

            <div class="form-group form-button">
                <input type="submit" name="signup" id="signup" class="form-submit" value="Confirm"/>
            </div>
        </form>
    </div>

    <div class="signup-image">
        <figure>
            <img src="shop/images/logo-store.jpg" alt="sign up image">
        </figure>
        <a href="view_profile" class="signup-image-link">Go back</a>
    </div>
</div>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

<%--
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
<div class="signup-form">
    <h5 class="form-title">Edit My Profile</h5>

    <form method="post" action="update_profile" class="register-form" id="customerForm">
        <div class="form-group">
            <label><i class="zmdi zmdi-account material-icons-name"></i></label>
            <input type="text" name="Full Name" placeholder="Your first name."
                   value="${loggedCustomer.nameCustomer}" required="required" maxlength="32"/>
        </div>


        <div class="form-group">
            <label><i class="zmdi zmdi-email"></i></label>
            <input type="email" name="email" placeholder="Your email." readonly="readonly"
                   value="${loggedCustomer.email}"/>
            <i>Email cannot be changed</i>
        </div>

        <div class="form-group">
            <label><i class="zmdi zmdi-lock"></i></label>
            <input type="number" name="phone" placeholder="Your phone number."
                   value="${loggedCustomer.phone}" required="required" maxlength="16"/>
        </div>

        <div class="form-group">
            <label><i class="zmdi zmdi-lock"></i></label>
            <input type="text" name="address" placeholder="Your Address Line 1."
                   value="${loggedCustomer.address}" required="required" maxlength="128"/>
        </div>




        <div class="form-group">
            <label><i class="zmdi zmdi-lock"></i></label>
                <select name="country" class="form-control form-control-line">
                    <c:forEach items="${mapCountries}" var="country">
                        <option value="${country.value}"
                                <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                    </c:forEach>
                </select>
            </select>
        </div>

        <div class="form-group">
            <i>Leave blank if you don't want to change it.</i>
        </div>

        <div class="form-group">
            <label for="password"><i class="zmdi zmdi-lock"></i></label>
            <input type="password" name="password" id="password" placeholder="Your password."/>
        </div>

        <div class="form-group">
            <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i></label>
            <input type="password" name="confirmPassword" id="confirmPassword"
                   placeholder="Comfirm your password."/>
        </div>

        <div class="form-group form-button">
            <input type="submit" name="signup" id="signup" class="form-submit" value="Confirm"/>
        </div>

    </form>
</div>

<div class="signup-image">
    <figure>
        <img src="shop/images/logo-store.jpg" alt="sing up image">
    </figure>
    <a href="view_profile" class="signup-image-link">Go back</a>
</div>
</div>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
--%>
