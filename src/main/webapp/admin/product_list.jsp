<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-md-7 align-self-center">
    <a href="new_product"
       class="btn waves-effect waves-light btn btn-info pull-right hidden-sm-down text-white">New
        Product</a>
    <c:if test="${message != null}">
        <div align="center">
            <h3>${message}</h3>
        </div>
    </c:if>
    <div class="row">
        <!-- column -->
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Product List</h4>
                    <div class="table-responsive" id="tableProduct">
                        <table class="table" id="table_id">
                            <thead>
                            <tr>
                                <th style="width: 5%;">Index</th>
                                <th style="width: 5%;">ID</th>
                                <th style="width: 15%;">Title</th>
<%--                                <th style="width: 15%;">Image</th>--%>
                                <th style="width: 10%;">Category</th>
                                <th style="width: 5%;">Size</th>
                                <th style="width: 10%;">Price</th>
                                <th style="width: 10%;">Post Date</th>
                                <th style="width: 25%;">Action</th>
                            </tr>
                            </thead>
                            <tbody class="list" id="myTable">
                            <c:forEach var="product" items="${listProducts}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${product.id}</td>
                                    <td class="title">${product.nameProduct}</td>
<%--                                    <td><img src="data:image/jpg;base64,${product.base64Image}" width="84"--%>
<%--                                             height="110"/></td>--%>

                                    <td class="category">${product.category.name}</td>
                                    <td class="size">$${product.size}</td>
                                    <td class="price">$${product.price}</td>
                                    <td class="lastUpdated">
                                        <fmt:formatDate pattern='MM/dd/yyyy' value='${product.postDate}'/>
                                    </td>
                                    <%--<td class="active">
                                        <c:if test="${product.active == true}">Enable</c:if>
                                        <c:if test="${product.active == false}">Disable</c:if>
                                    </td>--%>
                                    <td>
                                        <a class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                           href="edit_product?id=${product.id}">Edit</a> &nbsp;
                                        <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                                type="button" onclick="delete_product(${product.id})">Delete
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
