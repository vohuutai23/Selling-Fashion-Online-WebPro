<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 18/11/2023
  Time: 9:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit User</h1>
<p>NOTE: You can't update the email address.</p>
<form action="save_edit_user" method="post">
  <input type="hidden" name="userId" value="${user.id}">
  <div class="form-group">
    <label class="col-md-12">Email</label>
    <div class="col-md-12">
      <input class="form-control form-control-line" type="email" name="email" size="20" value="${user.email}" required="required" maxlength="64">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-12">Full Name</label>
    <div class="col-md-12">
      <input class="form-control form-control-line" type="text" name="fullName" size="20" value="${user.fullName}" required="required" maxlength="64">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-12">Password</label>
    <div class="col-md-12">
      <input class="form-control form-control-line" type="password" name="checkPassword" size="20" value="${user.password}" required="required" minlength="6" maxlength="32">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-12">Leave blank if you don't want to
      change it.</label>
  </div>
  <div class="form-group">
    <label class="col-md-12">New Password</label>
    <div class="col-md-12">
      <input class="form-control form-control-line" type="password" name="password" size="20" value="${user.password}" maxlength="32">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-12">Confirm New Password</label>
    <div class="col-md-12">
      <input class="form-control form-control-line" type="password" name="confirmPassword" size="20" value="${user.password}" maxlength="32">
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
</body>
</html>
