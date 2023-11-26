<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/style_admin_login.css">--%>
<%--    <link rel="stylesheet" href="../admin/styles/assets/css/style_admin_login.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/assets/css/style_admin_login.css">--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login_admin.css">

    <title>Modern Login Page | AsmrProg</title>
</head>

<body>

<div class="container" id="container">

    <div class="form-container sign-in">
        <form action="${pageContext.request.contextPath}/admin/login" method="post">

        <c:if test="${message != null}">
                <div align="center">
                    <h4>${message}</h4>
                </div>
            </c:if>
            <h1>ADMIN SIGN IN</h1>

            <input placeholder="Email" type="email" name="email" size="20" required="required" minlength="6"
                   maxlength="30">
            <input placeholder="Password" type="password" name="password" size="20" required="required" minlength="5"
                   maxlength="30">
            <a href="#">Forget Your Password?</a>
            <button type="submit">Sign In</button>
        </form>
    </div>
    <div class="toggle-container">
        <div class="toggle">

            <div class="toggle-panel toggle-right">
                <h1>Hello, Admin!</h1>
                <p>Wellcom back</p>

            </div>
        </div>
    </div>
</div>


</body>

</html>
