<%--
  Created by IntelliJ IDEA.
  User: VoHuuTai
  Date: 11/19/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div class="row">
        <c:forEach items="${listProducts}" var="product">
            <p>ID Product: ${product.id}</p>
            <p>Name Product: ${product.nameProduct}</p>
            <p>Price: ${product.price}</p>
        </c:forEach>
    </div>
</div>

</body>
</html>
