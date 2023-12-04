<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product to Order</title>
</head>
<body>
<div align="center">
    <h2>Add product to Order ID: ${order.orderId}</h2>
    <form action="add_to_order" method="post">
        <table>
            <tr>
                <td>Select a product:</td>
                <td>
                    <select name="productId">
                        <c:forEach items="${listProduct}" var="product" varStatus="status">
                            <option value="${product.productId}">${product.nameProduct}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Number of Copies</td>
                <td>
                    <select name="quantity">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Add"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Cancel" onclick="javascript:self.close();"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
