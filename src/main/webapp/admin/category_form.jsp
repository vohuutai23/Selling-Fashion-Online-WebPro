<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>
    <c:if test="${category != null}">Edit Category - Administration</c:if>
    <c:if test="${category == null}">Create Category - Administration</c:if>
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
      <c:if test="${category != null}">
        <form action="update_category" method="post">
          <div class="cardHeader">
            <h2>Edit Category</h2>
          </div>
          <input type="hidden" name="categoryId" value="${category.id}">
          <div class="form-group">
            <label class="col-md-12">Group</label>
            <div class="col-md-12">
              <input class="form-control form-control-line" type="text" name="groupCategory" size="20"
                     value="${category.groupCategory}" required="required" maxlength="64">
            </div>
          </div>
          <%--<div class="form-group">
            <label class="col-md-12">Group</label>
            <div class="col-md-12">
              <select name="groupCategory" class="form-control form-control-line">
                <c:forEach items="${listCategories}" var="groupCategory">
                  <c:if test="${category.id eq category.id}">
                    <option value="${category.id}" selected>
                  </c:if>
                  <c:if test="${category.id ne category.id}">
                    <option value="${category.id}">
                  </c:if>
                  ${category.groupCategory}
                  </option>
                </c:forEach>
              </select>
            </div>
          </div>--%>
          <div class="form-group">
            <label class="col-md-12">Name</label>
            <div class="col-md-12">
              <input class="form-control form-control-line" type="text" name="nameCategory" size="20"
                     value="${category.nameCategory}" required="required" maxlength="64">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-12">
              <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
              <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
              </button>
            </div>
          </div>
        </form>
      </c:if>
      <c:if test="${category == null}">
        <form action="create_category" method="post" id="categoryForm">
          <div class="cardHeader">
            <h2>Create Category</h2>
          </div>
          <input type="hidden" name="categoryId" value="${category.id}">
          <div class="form-group">
            <label class="col-md-12">Group</label>
            <div class="col-md-12">
              <input class="form-control form-control-line" type="text" name="groupCategory" size="20"
                     value="${category.groupCategory}" required="required" maxlength="64">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-12">Name</label>
            <div class="col-md-12">
              <input class="form-control form-control-line" type="text" name="nameCategory" size="20"
                     value="${category.nameCategory}" required="required" maxlength="64">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-12">
              <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
              <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
              </button>
            </div>
          </div>
        </form>
      </c:if>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/admin/styles/assets/js/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>

