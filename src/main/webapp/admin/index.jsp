<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/assets/css/style.css">

    <!-- ======= Styles ====== -->
<%--    <link rel="stylesheet" href="admin/styles/assets/css/style.css">--%>
</head>

<body>

<!-- =============== Navigation ================ -->
<div class="container">
    <%@ include file="slidebar.jsp" %>
    <!-- ========================= Main ==================== -->
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>

<%--            <div class="search">--%>
<%--                <label>--%>
<%--                    <input type="text" placeholder="Search here">--%>
<%--                    <ion-icon name="search-outline"></ion-icon>--%>
<%--                </label>--%>
<%--            </div>--%>

            <div class="user">
                <img src="../shop/images/logo.png" alt="">
            </div>
        </div>

        <!-- ======================= Cards ================== -->
        <div class="cardBox">
<%--            <div class="card">--%>
<%--                <div>--%>
<%--                    <div class="numbers">1,504</div>--%>
<%--                    <div class="cardName">Daily Views</div>--%>
<%--                </div>--%>

<%--                <div class="iconBx">--%>
<%--                    <ion-icon name="eye-outline"></ion-icon>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div>--%>
<%--                    <div class="numbers">80</div>--%>
<%--                    <div class="cardName">Sales</div>--%>
<%--                </div>--%>

<%--                <div class="iconBx">--%>
<%--                    <ion-icon name="cart-outline"></ion-icon>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div>--%>
<%--                    <div class="numbers">284</div>--%>
<%--                    <div class="cardName">Comments</div>--%>
<%--                </div>--%>

<%--                <div class="iconBx">--%>
<%--                    <ion-icon name="chatbubbles-outline"></ion-icon>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div>--%>
<%--                    <div class="numbers">$7,842</div>--%>
<%--                    <div class="cardName">Earning</div>--%>
<%--                </div>--%>

<%--                <div class="iconBx">--%>
<%--                    <ion-icon name="cash-outline"></ion-icon>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>

        <!-- ================ Order Details List ================= -->
        <!-- ================ Charts ================= -->
        <div class="container text-center">
            <h3 class="">Welcome to Group 08!!!</h3>
        </div>
    </div>
</div>

<!-- =========== Scripts =========  -->
<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>

<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>