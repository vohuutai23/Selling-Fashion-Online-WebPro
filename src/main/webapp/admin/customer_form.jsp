
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:if test="${customer != null}">Edit Customer - Administration</c:if>
        <c:if test="${customer == null}">Create Customer - Administration</c:if>
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
            <img src="../shop/images/logo.png" alt="">
        </div>
    </div>

    <div class="list_table">
        <div class="table-responsive">
            <c:if test="${customer != null}">
                <form action="save_edit_customer" method="post">
                    <div class="cardHeader">
                        <h2>Edit Customer</h2>
                    </div>
                    <input type="hidden" name="customerId" value="${customer.id}">
                    <div class="form-group">
                        <label class="col-md-12">Full Name</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="nameCustomer"
                                   size="45" value="${customer.nameCustomer}" required="required"
                                   maxlength="32"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Phone Number</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="phone" size="45"
                                   value="${customer.phone}" required="required" maxlength="16"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Address</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="address"
                                   size="45" value="${customer.address}" required="required"
                                   maxlength="128"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Email</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="email" name="email"
                                   size="45" value="${customer.email}" required="required" maxlength="64"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-12">Password</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="hidden"
                                   name="checkPassword" size="45" value="password"
                                   required="required" maxlength="32"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-12">Country</label>
                        <div class="col-md-12">
                            <select name="country" class="form-control form-control-line">
                                <c:forEach items="${mapCountries}" var="country">
                                    <option value="${country.value}"
                                            <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Active</label>
                        <div class="col-md-12">
                            <select class="form-control form-control-line" name="active">
                                <option value="true"
                                        <c:if test="${customer.active eq true}">selected='selected'</c:if> >
                                    Enable
                                </option>
                                <option value="false"
                                        <c:if test="${customer.active eq false}">selected='selected'</c:if>>
                                    Disable
                                </option>
                            </select>
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
            <c:if test="${customer == null}">
                <form action="create_customer" method="post">
                    <div class="cardHeader">
                        <h2>Create Customer</h2>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Full Name</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="nameCustomer"
                                   size="45" value="${customer.nameCustomer}" required="required"
                                   maxlength="32"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Phone Number</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="phone" size="45"
                                   value="${customer.phone}" required="required" maxlength="16"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Address</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="text" name="address"
                                   size="45" value="${customer.address}" required="required"
                                   maxlength="128"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Email</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="email" name="email"
                                   size="45" value="${customer.email}" required="required" maxlength="64"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-12">Password</label>
                        <div class="col-md-12">
                            <input class="form-control form-control-line" type="password"
                                   name="password" size="45" value="password"
                                   required="required" maxlength="32"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-12">Country</label>
                        <div class="col-md-12">
                            <select name="country" class="form-control form-control-line">
                                <c:forEach items="${mapCountries}" var="country">
                                    <option value="${country.value}"
                                            <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-12">Active</label>
                        <div class="col-md-12">
                            <select class="form-control form-control-line" name="active">
                                <option value="true"
                                        <c:if test="${customer.active eq true}">selected='selected'</c:if> >
                                    Enable
                                </option>
                                <option value="false"
                                        <c:if test="${customer.active eq false}">selected='selected'</c:if>>
                                    Disable
                                </option>
                            </select>
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
