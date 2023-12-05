<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Hóa Đơn</title>
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
            <form action="update_order" method="post">
                <h2 class="text-themecolor" style="text-align: center;">Order Overview</h2>
                <%--<div class="form-group">
                    <label class="col-md-12">Ordered By:&nbsp;&nbsp;&nbsp;<a
                            class="form-control form-control-line">${order.customer.fullName}</a></label>
                </div>--%>

                <div class="form-group">
                    <label class="col-md-12">Order Date:&nbsp;&nbsp;&nbsp;<a
                            class="form-control form-control-line">${order.dateOrder}</a></label>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Payment Method:</label>
                    <div class="col-md-12">
                        <select class="form-control form-control-line" name="paymentMethod">
                            <option value="Cash On Delivery"
                                    <c:if test="${order.paymentMethod eq 'Cash on Delivery'}">selected="selected"</c:if>>
                                Cash On Delivery
                            </option>
                            <option value="Paypal"
                                    <c:if test="${order.paymentMethod eq 'Paypal'}">selected="selected"</c:if>>
                                Paypal or Credit card
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Order Status:</label>
                    <div class="col-md-12">
                        <select class="form-control form-control-line" name="orderStatus">
                            <option value="Processing"
                                    <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if> >
                                Processing
                            </option>
                            <option value="Shipping"
                                    <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>
                                Shipping
                            </option>
                            <option value="Delivered"
                                    <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>
                                Delivered
                            </option>
                            <option value="Completed"
                                    <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>
                                Completed
                            </option>
                            <option value="Cancelled"
                                    <c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>>
                                Cancelled
                            </option>
                        </select>
                    </div>
                </div>
                <h2 class="text-themecolor" style="text-align: center;">Recipient Information</h2>
                <input type="hidden" name="orderId" value="${order.getId()}">
                <div class="form-group">
                    <label class="col-md-12">Full Name:</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="text" name="recipientFullName"
                               value="${order.fullName}" size="45" required="required"
                               maxlength="32"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-12">Phone:</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="number" name="recipientPhone"
                               value="${order.phone}" size="45" required="required"
                               maxlength="16"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Address:</label>
                    <div class="col-md-12">
                        <input class="form-control form-control-line" type="text"
                               name="recipientAddress" value="${order.shippingAddress}" size="45"
                               required="required" maxlength="128"/>
                    </div>
                </div>

                <h2 class="text-themecolor" style="text-align: center;">Ordered Products</h2>
                <div class="form-group">
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Index</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody class="list">
                                <c:forEach items="${order.orderDetails}" var="orderDetail"
                                           varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><img style="vertical-align: middle;"
                                             src="data:image/jpg;base64,${orderDetail.product.base64Image}"
                                             width="48" height="64"/>
                                            ${orderDetail.product.nameProduct}
                                    </td>
                                    <td>
                                        <input type="hidden" name="price"
                                               value="${orderDetail.product.price}"/>$${orderDetail.product.price}
                                    </td>
                                    <td>
                                        <input type="hidden" name="productId"
                                               value="${orderDetail.product.id}"/>
                                        <input type="number" name="quantity${status.index + 1}"
                                               value="${orderDetail.quantity}" size="5" min="1" step="1"
                                               required="required"/>
                                    </td>

                                    <td>$${orderDetail.totalPrice}</td>
                                    <td><a href="remove_from_order?id=${orderDetail.product.id}&orderId=${order.getId()}">Remove</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="5" align="right">
                                        <p>Shipping fee: <input type="number" size="5" name="shippingFee"
                                                                value="${order.fee}" min="0.0"
                                                                step="0.1"/></p>
                                        <p>TOTAL: $${order.totalPrice}</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <%--<div class="form-group">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Index</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody class="list">
                                <c:forEach items="${order.orderDetails}" var="orderDetail"
                                           varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${orderDetail.product.nameProduct}</td>
                                        <td>
                                            <input type="hidden" name="price"
                                                   value="${orderDetail.product.price}"/>$${orderDetail.product.price}
                                        </td>
                                        <td>
                                            <input type="hidden" name="productId"
                                                   value="${orderDetail.product.id}"/>
                                            <input type="number" name="quantity${status.index + 1}"
                                                   value="${orderDetail.quantity}" size="5" min="1" step="1"
                                                   required="required"/>
                                        </td>

                                        <td>$${orderDetail.totalPrice}</td>
                                        <td><a href="remove_from_order?id=${orderDetail.product.id}">Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="5" align="right">
&lt;%&ndash;                                        <p>Subtotal: $${order.subtotal}</p>&ndash;%&gt;
                                        <p>Shipping fee: <input type="number" size="5" name="shippingFee"
                                                                value="${order.shippingFee}" min="0.0"
                                                                step="0.1"/></p>
                                        <p>TOTAL: $${order.total}</p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>--%>
                <div class="form-group">
                    <div class="col-sm-12">
                        <a class="btn btn-success" href="javascript:showAddProductPopup(${order.getId()})"><b>Add
                            Product</b></a>
<%--                            <button onclick="showAddProductPopup(${order.orderId})">Add Product</button>--%>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-success" type="submit" value="Save"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-success" type="button" value="Cancel"
                               onclick="javascript:window.location.href='list_order';"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- ================= New Customers ================ -->


</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<%--<script>
    $(document).ready(function () {
        $('#orderTable').DataTable({
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
                [2, 25, 50, -1],
                [2, 25, 50, "All"]
            ]
        });
    });
</script>--%>
<script>
    function delete_customer(id) {
        let customerId = id;
        if (confirm('Are you sure you want to delete the customer with ID ' + customerId + '?')) {
            window.location = 'delete_customer?id=' + customerId;
        }
    }
</script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/richtext.min.css">

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="../assets/js/jquery.richtext.min.js"></script>
<script>
    <%--let orderId = ${order.getId()};--%>
    function showAddProductPopup(orderId) {
        let width = 600;
        let height = 250;
        let left = (screen.width - width) / 2;
        let top = (screen.height - height) / 2;

        // Thêm orderId vào URL
        let url = 'add_product_form?orderId=' + orderId;
        window.open(url, '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
    }
</script>
<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>