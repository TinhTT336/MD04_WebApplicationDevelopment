<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/11/2023
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE PRODUCT</title>
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
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Thêm mới san pham</h1>
<form action="<%=request.getContextPath()%>/user" method="post">
    <%--  <label for="userId">ID:</label>--%>
    <%--  <input type="text" id="userId" name="userId" readOnly><br>--%>

    <label for="userName">Tên nguoi dung:</label>
    <input type="text" id="userName" name="userName" required><br>

    <label for="phone">So dien thoai:</label>
    <input type="text" id="phone" name="phone" required><br>

    <label for="address">Dia chi:</label>
    <input type="text" id="address" name="address" required><br>
    <br>

    <input type="submit" value="Thêm">

</form>

</body>
</html>
