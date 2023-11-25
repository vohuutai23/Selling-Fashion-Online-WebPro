<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 19/11/2023
  Time: 9:27 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>
        <c:if test="${customer != null}">Edit Customer - Administration</c:if>
        <c:if test="${customer == null}">Create Customer - Administration</c:if>
    </title>
</head>
<body>
<%@ include file="slidebar.jsp" %>
<c:if test="${customer != null}">
    <form action="save_edit_customer" method="post">
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
            <div class="col-sm-12">
                <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                </button>
            </div>
        </div>
    </form>
</c:if>
</body>
</html>
