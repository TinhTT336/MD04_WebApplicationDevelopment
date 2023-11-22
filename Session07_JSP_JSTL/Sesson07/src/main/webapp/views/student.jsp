<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/11/2023
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sinh viên</h1>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>MSV</th>
        <th>Họ và tên</th>
        <th>Tuổi</th>
        <th>Giới tính</th>
        <th>Địa chỉ</th>
        <th>Lớp học</th>
        <th colspan="2">Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.studentCode}</td>
            <td>${student.studentName}</td>
            <td>${student.age}</td>
            <td>${student.gender?"Nam":"Nữ"}</td>
            <td>${student.address}</td>
            <td>${student.classRoom}</td>
            <td><a href="student?action=edit&id=${student.studentCode}">Sửa</a></td>
            <td><a onclick="return confirm('Ban co muon xoa khong?')" href="student?action=delete&id=${student.studentCode}">Xoá</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="student?action=add">Thêm mới sinh viên</a>
</body>
</html>
