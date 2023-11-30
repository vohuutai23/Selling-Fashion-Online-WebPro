<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/20/2023
  Time: 9:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>
        <c:if test="${product != null}">Edit Product - Administration</c:if>
        <c:if test="${product == null}">Create Product - Administration</c:if>
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
<%--            <div class="col-lg-8 col-xlg-9 col-md-7">--%>
<%--                <div class="card">--%>
<%--                    <!-- Tab panes -->--%>
<%--                    <div class="card-body">--%>
                        <c:if test="${product != null}">

                            <form action="update_product" method="post" enctype="multipart/form-data">
                                <div class="cardHeader">
                                    <h2>Edit Product</h2>
                                </div>
                                <input type="hidden" name="productId" value="${product.id}">
<%--                                                        <div class="form-group">--%>
<%--                                                            <label class="col-md-12">Category</label>--%>
<%--                                                            <div class="col-md-12">--%>
<%--                                                                <select name="category" class="form-control form-control-line">--%>
<%--                                                                    <c:forEach items="${listCategories}" var="category">--%>
<%--                                                                        <c:if test="${category.categoryId eq product.category.categoryId}">--%>
<%--                                                                            <option value="${category.categoryId}" selected>--%>
<%--                                                                        </c:if>--%>
<%--                                                                        <c:if test="${category.categoryId ne product.category.categoryId}">--%>
<%--                                                                            <option value="${category.categoryId}">--%>
<%--                                                                        </c:if>--%>
<%--                                                                        ${category.name}--%>
<%--                                                                        </option>--%>
<%--                                                                    </c:forEach>--%>
<%--                                                                </select>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
                                <div class="form-group">
                                    <label class="col-md-12">Name Product</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="title"
                                               name="nameProduct" value="${product.nameProduct}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Product Image</label>
                                    <div class="col-md-12">
                                        <c:if test="${product == null}">
                                            <input id="imageProduct" class="form-control form-control-line" type="file"
                                                   name="imageProduct" required="required"/><br/>
                                        </c:if>
                                        <c:if test="${product != null}">
                                            <input id="imageProduct" class="form-control form-control-line" type="file"
                                                   name="imageProduct"/><br/>
                                        </c:if>
                                        <img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
                                             src="data:image/jpg;base64,${product.base64Image}"/>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label class="col-md-12">Product Image</label>
                                    <div class="col-md-12">
                                        <!-- Hiển thị hình ảnh hiện tại -->
                                        <c:if test="${not empty product.imageProduct}">
                                            <img src="data:image/jpeg;base64,${product.base64Image}" alt="Product Image" style="max-width: 200px; max-height: 200px;"/>
                                        </c:if>
                                        <!-- Trường tải lên hình ảnh mới -->
                                        <input type="file" id="thumbnail" name="imageProduct" class="form-control form-control-line" onchange="previewImage(event)"/>
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Price</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="price"
                                               name="price" size="20" value="${product.price}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-md-12">Description</label>
                                    <div class="col-md-12">
                                        <textarea class="form-control form-control-line" rows="5" cols="50"
                                                  name="description">${product.description}</textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel</button>
                                    </div>
                                </div>
                            </form>
                        </c:if>

                        <c:if test="${product == null}">
                            <form action="create_product" method="post" enctype="multipart/form-data">
                                <div class="cardHeader">
                                    <h2>Create Product</h2>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12">Product Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text"
                                               name="nameProduct" value="${product.nameProduct}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description" class="col-md-12">Description</label>
                                    <div class="col-md-12">
                                        <textarea class="form-control form-control-line" rows="5" cols="50"
                                                  name="description" id="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
    <!-- ================= New Customers ================ -->


</div>
<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<link rel="stylesheet" href="../assets/css/richtext.min.css">

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="../assets/js/jquery.richtext.min.js"></script>



<script type="text/javascript">
    $(document).ready(function () {
        $('#description').richText();

        $('#imageProduct').change(function () {
            showImageThumbnail(this);
        });
    });

    function showImageThumbnail(fileInput) {
        let file = fileInput.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            $('#thumbnail').attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    }
</script>
</body>

</html>
