<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/assets/css/home_admin2.css">

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



        <!-- ================ Order Details List ================= -->
        <!-- ================ Charts ================= -->
        <div class="container text-center">
            <h1 style="margin-left: 33%">Welcome to Cover You Shop</h1>
        </div>
        <!-- ======================= Cards ================== -->
        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="numbers">${totalUsers}</div>
                    <div class="cardName">Total User</div>
                </div>

                <div class="iconBx">
                    <%--                    <ion-icon name="eye-outline"></ion-icon>--%>
                    <i class="fa fa-users"></i>
                </div>

            </div>
            <div class="card">
                <div>
                    <div class="numbers">${totalCustomers}</div>
                    <div class="cardName">Total Customer</div>
                </div>

                <div class="iconBx">
                    <%--                    <ion-icon name="eye-outline"></ion-icon>--%>
                    <i class="fa fa-shopping-cart"></i>
                </div>

            </div>
        </div>


        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="numbers">${totalProducts}</div>
                    <div class="cardName">Total Product</div>
                </div>

                <div class="iconBx">
                    <%--                    <ion-icon name="eye-outline"></ion-icon>--%>
                    <i class="fa fa-code-fork"></i>
                </div>

            </div>
            <div class="card">
                <div>
                    <div class="numbers">${totalOrders}</div>
                    <div class="cardName">Total Order</div>
                </div>

                <div class="iconBx">
                    <%--                    <ion-icon name="eye-outline"></ion-icon>--%>
                    <i class="fa fa-ticket"></i>
                </div>

            </div>
        </div>
        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="numbers">${totalPrice} VND</div>
                    <div class="cardName">Aggregate income</div>
                </div>

                <div class="iconBx">
                    <%--                    <ion-icon name="eye-outline"></ion-icon>--%>
                    <i class="fa fa-code-fork"></i>
                </div>

            </div>
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