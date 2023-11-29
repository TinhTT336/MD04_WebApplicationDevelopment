<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27/11/2023
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sach lop hoc</h1>
<a href="class?action=create">Them moi lop hoc</a>
<br>
<br>
<form action="">
    <input type="text" name="searchName" value="${searchName}">
    <button type="submit" name="action" value="search">Tim kiem</button>
</form>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>Ma lop hoc</th>
        <th>Ten lop hoc</th>
        <th>Trang thai lop hoc</th>
        <th colspan="2">Hanh dong</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${classesList}" var="classes">
        <tr>
            <td>${classes.classID}</td>
            <td>${classes.className}</td>
            <td>${classes.classStatus?"Dang hoc":"Da xong"}</td>
            <td><a href="class?action=edit&id=${classes.classID}">Sua</a></td>
            <td><a onclick="return confirm('Ban co chac chan muon xoa khong?')" href="class?action=delete&id=${classes.classID}">Xoa</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
