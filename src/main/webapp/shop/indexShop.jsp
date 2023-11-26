<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 25/11/2023
  Time: 11:07 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>SHOPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP</h1>
<c:if test="${loggedCustomer != null}">
    <a href="view_profile" class="dropdown-item">Welcome,
            ${loggedCustomer.nameCustomer}</a>

</c:if>
</body>
</html>
