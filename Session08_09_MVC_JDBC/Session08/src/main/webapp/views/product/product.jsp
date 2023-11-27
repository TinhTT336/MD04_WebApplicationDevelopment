<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26/11/2023
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sach san pham</h1>
<a href="product?action=create">Them moi san pham</a>
<br>
<br>
<table border="1" cellspacing="0">
    <tr>
        <td>#</td>
        <td>ID</td>
        <td>Name</td>
        <td>Description</td>
        <td>Status</td>
        <td>Stock</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items='${productList}' var="product" varStatus="loop">
        <tr>
            <td>${loop.index+1}</td>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.description}</td>
            <td>${product.productStatus?"Active":"Inactive"}</td>
            <td>${product.stock}</td>
            <td><a href="product?action=edit&id=${product.productId}">Edit</a></td>
            <td><a onclick="return confirm('Ban co chac chan muon xoa khong?')"
                   href="product?action=delete&id=${product.productId}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
