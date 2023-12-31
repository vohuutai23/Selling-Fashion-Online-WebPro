<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>

    <%@ include file="/includes/link.jsp" %>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .container {
        width: 550px;
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
        display: flex;
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
<div class="container mt-5 border border-info-subtle">
    <div class="signup-image">
        <a href="view_profile" class="signup-image-link"><i class="fa-solid fa-arrow-left">Quay lại</i></a>
    </div>
    <div class="signup-form">

        <h2 style="font-family: 'Dancing Script', cursive;
        font-style: italic;" class="form-title">Chỉnh sửa hồ sơ</h2>

        <form method="post" action="update_profile" class="register-form" id="customerForm">
            <div class="form-group">
                <label for="nameCustomer"><i class="zmdi zmdi-account material-icons-name"></i>Tên</label>
                <input type="text" name="nameCustomer" id="nameCustomer" placeholder="Tên của bạn"
                       value="${loggedCustomer.nameCustomer}" required="required" maxlength="32"/>
            </div>

            <div class="form-group">
                <label for="email"><i class="zmdi zmdi-email"></i> Địa chỉ email</label>
                <input type="email" name="email" id="email" placeholder="Email của bạn" readonly="readonly"
                       value="${loggedCustomer.email}"/>
                <i>Địa chỉ email không thể thay đổi</i>
            </div>

            <div class="form-group">
                <label for="phone"><i class="zmdi zmdi-lock"></i> Số điện thoại</label>
                <input type="text" name="phone" id="phone" placeholder="Số điện thoại của bạn"
                       value="${loggedCustomer.phone}" required="required" maxlength="16"/>
            </div>

            <div class="form-group">
                <label for="address"><i class="zmdi zmdi-lock"></i> Địa chỉ</label>
                <input type="text" name="address" id="address" placeholder="Địa chỉ của bạn"
                       value="${loggedCustomer.address}" required="required" maxlength="128"/>
            </div>

            <div class="form-group">
                <label for="country"><i class="zmdi zmdi-lock"></i> Quốc gia</label>
                <select name="country" id="country">
                    <c:forEach items="${mapCountries}" var="country">
                        <option value="${country.value}"
                                <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="password"><i class="zmdi zmdi-lock"></i> Mật khẩu</label>
                <input type="password" name="password" id="password" placeholder="Mật khẩu của bạn"/>
            </div>

            <div class="form-group">
                <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i> Xác nhận mật khẩu</label>
                <input type="password" name="confirmPassword" id="confirmPassword"
                       placeholder="Xác nhận mật khẩu"/>
            </div>
            <div class="d-flex justify-content-center">
                <input class="btn btn-outline-primary justify-content-center" type="submit" name="signup" id="signup" value="Cập nhật"/>
            </div>

        </form>
    </div>
</div>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
<%--<footer>--%>
<%--    <%@ include file="/includes/footer.jsp" %>--%>
<%--</footer>--%>
</html>




<%--<div class="container">--%>
<%--    <h1>Edit Profile</h1>--%>
<%--    <hr>--%>
<%--    <div class="row">--%>
<%--        <!-- left column -->--%>
<%--        <div class="col-md-3">--%>
<%--            <div class="text-center">--%>
<%--                <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">--%>
<%--                <h6>Upload a different photo...</h6>--%>

<%--                <input type="file" class="form-control">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- edit form column -->--%>
<%--        <div class="col-md-9 personal-info">--%>
<%--            <div class="alert alert-info alert-dismissable">--%>
<%--                <a class="panel-close close" data-dismiss="alert">×</a>--%>
<%--                <i class="fa fa-coffee"></i>--%>
<%--                This is an <strong>.alert</strong>. Use this to show important messages to the user.--%>
<%--            </div>--%>
<%--            <h3>Personal info</h3>--%>

<%--            <form class="form-horizontal" role="form">--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-lg-3 control-label">First name:</label>--%>
<%--                    <div class="col-lg-8">--%>
<%--                        <input class="form-control" type="text" value="Jane">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-lg-3 control-label">Last name:</label>--%>
<%--                    <div class="col-lg-8">--%>
<%--                        <input class="form-control" type="text" value="Bishop">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-lg-3 control-label">Company:</label>--%>
<%--                    <div class="col-lg-8">--%>
<%--                        <input class="form-control" type="text" value="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-lg-3 control-label">Email:</label>--%>
<%--                    <div class="col-lg-8">--%>
<%--                        <input class="form-control" type="text" value="janesemail@gmail.com">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-lg-3 control-label">Time Zone:</label>--%>
<%--                    <div class="col-lg-8">--%>
<%--                        <div class="ui-select">--%>
<%--                            <select id="user_time_zone" class="form-control">--%>
<%--                                <option value="Hawaii">(GMT-10:00) Hawaii</option>--%>
<%--                                <option value="Alaska">(GMT-09:00) Alaska</option>--%>
<%--                                <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>--%>
<%--                                <option value="Arizona">(GMT-07:00) Arizona</option>--%>
<%--                                <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>--%>
<%--                                <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>--%>
<%--                                <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>--%>
<%--                                <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-md-3 control-label">Username:</label>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <input class="form-control" type="text" value="janeuser">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-md-3 control-label">Password:</label>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <input class="form-control" type="password" value="11111122333">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-md-3 control-label">Confirm password:</label>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <input class="form-control" type="password" value="11111122333">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="col-md-3 control-label"></label>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <input type="button" class="btn btn-primary" value="Save Changes">--%>
<%--                        <span></span>--%>
<%--                        <input type="reset" class="btn btn-default" value="Cancel">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<hr>--%>
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
