<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Product to Order</title>
</head>
<body>
<div align="center">
    <h2>
        The product <i>${product.nameProduct}</i> has been added to the order ID <b>${order.orderId}</b>
    </h2>
    <input type="button" value="Close" onclick="javascript:self.close();"/>
</div>
</body>
<script>
    window.onunload = function () {
        window.opener.location.reload();
    }
</script>
</html>