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
<h1>Danh sach nguoi dung</h1>
<a href="user?action=create">Them moi nguoi dung</a>
<br>
<br>
<table border="1" cellspacing="0">
    <tr>
        <td>#</td>
        <td>ID</td>
        <td>Name</td>
        <td>Phone</td>
        <td>Address</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items='${userList}' var="user" varStatus="loop">
        <tr>
            <td>${loop.index+1}</td>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.address}</td>
            <td>${user.phone}</td>
            <td><a href="user?action=edit&id=${user.userId}">Edit</a></td>
            <td><a onclick="return confirm('Ban co chac chan muon xoa khong?')"
                   href="user?action=delete&id=${user.userId}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
