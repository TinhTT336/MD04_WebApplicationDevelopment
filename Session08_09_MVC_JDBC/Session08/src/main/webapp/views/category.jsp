<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/11/2023
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sach danh muc</h1>
<a href="category?action=create">Them moi danh muc</a>
<br>
<br>
<table border="1" cellspacing="0">
  <tr>
    <td>#</td>
    <td>ID</td>
    <td>Name</td>
    <td>Status</td>
    <td colspan="2">Action</td>
  </tr>
  <c:forEach items='${categoryList}' var="category" varStatus="loop">
    <tr>
      <td>${loop.index+1}</td>
      <td>${category.categoryId}</td>
      <td>${category.categoryName}</td>
      <td>${category.categoryStatus?"Active":"Inactive"}</td>
      <td><a href="category?action=edit&id=${category.categoryId}">Edit</a></td>
      <td><a onclick="return confirm('Ban co chac chan muon xoa khong?')"
             href="category?action=delete&id=${category.categoryId}">Delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
