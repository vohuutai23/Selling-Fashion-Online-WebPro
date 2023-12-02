<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
    <meta charset="UTF-8">
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
            <c:if test="${product != null}">

                <form action="update_product" method="post" enctype="multipart/form-data">
                    <div class="cardHeader">
                        <h2>Edit Product</h2>
                    </div>
                    <input type="hidden" name="productId" value="${product.id}">
                    <div class="form-group">
                        <label class="col-md-12">Name Product</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" id="title"
                                   name="nameProduct" value="${product.nameProduct}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Group Category</label>
                        <div class="col-md-12">
                            <select id="groupCategory2" name="groupCategory" class="form-control form-control-line">
                                <c:forEach items="${listGroupCategories}" var="groupCategory">
                                    <option value="${groupCategory}" ${groupCategory eq product.category.groupCategory ? 'selected' : ''}>
                                            ${groupCategory}
                                    </option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Name Category</label>
                        <div class="col-md-12">
                            <select name="nameCategory" id="nameCategory2" class="form-control form-control-line">
                                <c:forEach items="${listNameCategories}" var="nameCategory">
                                    <option value="${nameCategory}">${nameCategory}</option>
                                </c:forEach>
                            </select>


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

                    <div class="form-group">
                        <label for="price" class="col-md-12">Price</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" id="priceUpdate"
                                   name="price" size="20" value="${product.price}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Description</label>
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
                        <label class="col-md-12">Group Category</label>
                        <div class="col-md-12">
                            <select id="groupCategory" name="groupCategory" class="form-control form-control-line">
                                <c:forEach items="${listGroupCategories}" var="groupCategory">
                                    <option value="${groupCategory}" ${groupCategory eq product.category.groupCategory ? 'selected' : ''}>
                                            ${groupCategory}
                                    </option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Name Category</label>
                        <div class="col-md-12">
                            <select name="nameCategory" id="nameCategory" class="form-control form-control-line">
                                <c:forEach items="${listNameCategories}" var="nameCategory">
                                    <option value="${nameCategory}">${nameCategory}</option>
                                </c:forEach>
                            </select>


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
                    <div class="form-group">
                        <label class="col-md-12">Price</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" id="price"
                                   name="price" size="20" value="${product.price}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Description</label>
                        <div class="col-md-12">
                            <textarea class="form-control form-control-line" rows="5" cols="50"
                                      name="description">${product.description}</textarea>
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
<script type="text/javascript">
    function htmlDecode(input) {
        var doc = new DOMParser().parseFromString(input, "text/html");
        return doc.documentElement.textContent;
    }
    $(document).ready(function() {
        $('#groupCategory').change(function() {
            var selectedGroup = $(this).val();
            console.log("Group Category changed to: " + selectedGroup);
            $.ajax({
                url: 'get-name-categories', // Bỏ dấu '/' để tránh lỗi tương đối đường dẫn
                type: 'GET',
                data: { groupCategory: selectedGroup },

                /*success: function(response) {
                    console.log("Response:", response); // Kiểm tra dữ liệu trả về
                    var nameCategorySelect = $('#nameCategory');
                    nameCategorySelect.empty();
                    response.forEach(function(categoryName) {
                        console.log("Adding category:", categoryName); // Kiểm tra từng category
                        nameCategorySelect.append(new Option(categoryName, categoryName));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                }
*/
                success: function(response) {
                    console.log("Response:", response);
                    var nameCategorySelect = $('#nameCategory');
                    nameCategorySelect.empty();
                    response.forEach(function(categoryName) {
                        var decodedName = htmlDecode(categoryName); // Giải mã các ký tự HTML
                        console.log("Adding category:", decodedName);
                        nameCategorySelect.append(new Option(decodedName, decodedName));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                }
            });
        });
    });
</script>
<script type="text/javascript">
    function htmlDecode(input) {
        var doc = new DOMParser().parseFromString(input, "text/html");
        return doc.documentElement.textContent;
    }
    $(document).ready(function() {
        $('#groupCategory2').change(function() {
            var selectedGroup = $(this).val();
            console.log("Group Category changed to: " + selectedGroup);
            $.ajax({
                url: 'get-name-categories', // Bỏ dấu '/' để tránh lỗi tương đối đường dẫn
                type: 'GET',
                data: { groupCategory: selectedGroup },

                success: function(response) {
                    console.log("Response:", response);
                    var nameCategorySelect = $('#nameCategory2');
                    nameCategorySelect.empty();
                    response.forEach(function(categoryName) {
                        var decodedName = htmlDecode(categoryName); // Giải mã các ký tự HTML
                        console.log("Adding category:", decodedName);
                        nameCategorySelect.append(new Option(decodedName, decodedName));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                }
            });
        });
    });
</script>
<%--<script>
    $(document).ready(function() {
        $('#groupCategory').change(function() {
            var selectedGroup = $(this).val();
            console.log("Group Category changed to: " + selectedGroup);
            $.ajax({
                url: '/get-name-categories',
                type: 'GET',
                data: { groupCategory: selectedGroup },
                success: function(response) {
                    var nameCategorySelect = $('#nameCategory');
                    nameCategorySelect.empty();
                    $.each(response, function(index, category) {
                        nameCategorySelect.append($('<option>', {
                            value: category.id,
                            text: category.name
                        }));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                }

            });
        });
    });


</script>--%>

</body>

</html>
