<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 28/11/2023
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form {
            width: 300px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 12px;
        }

        h1 {
            text-align: center;
            margin-top: 32px;
        }
    </style>
</head>
<body>
<h1>EDIT PRODUCT</h1>
<form method="post" action="<%=request.getContextPath()%>/product">
    <input type="hidden" name="action" value="edit">
    <label for="productId">ID:</label>
    <input type="text" id="productId" name="productId" value="${product.productId}" readonly><br>

    <label for="productName">NAME:</label>
    <input type="text" id="productName" name="productName" value="${product.productName}" required><br>

    <label for="price">PRICE:</label>
    <input type="text" id="price" name="price" value="${product.price}" required><br>

    <label>CATEGORY NAME:</label>
    <select name="categoryId" >
        <c:forEach items="${categoryList}" var="category">
            <option value="${category.categoryId}" name="categoryId" ${category.categoryId==product.category.categoryId?"selected":""}>${category.categoryName}</option>
        </c:forEach>
    </select>

    <br>
    <input type="submit" value="EDIT">

</form>
</body>
</html>
