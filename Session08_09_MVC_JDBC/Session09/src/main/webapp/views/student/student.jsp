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
<h1>Danh sach sinh vien</h1>
<a href="student?action=create">Them moi sinh vien</a>
<br>
<br>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>Ma SV</th>
        <th>Ten SV</th>
        <th>Email</th>
        <th>Dia chi</th>
        <th>Ngay sinh</th>
        <th colspan="2">Hanh dong</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.studentId}</td>
            <td>${student.studentName}</td>
            <td>${student.email}</td>
            <td>${student.address}</td>
            <td>${student.birthday}</td>
            <td><a href="student?action=edit&id=${student.studentId}">Sua</a></td>
            <td><a onclick="return confirm('Ban co chac chan muon xoa khong?')" href="student?action=delete&id=${student.studentId}">Xoa</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
