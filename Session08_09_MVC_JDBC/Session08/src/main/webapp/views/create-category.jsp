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
    <title>CREATE CATEGORY</title>
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
<h1>Thêm mới danh mục</h1>
<form action="<%=request.getContextPath()%>/category" method="post">
    <%--  <label for="categoryId">ID:</label>--%>
    <%--  <input type="text" id="categoryId" name="categoryId" required><br>--%>

    <label for="categoryName">Tên danh mục:</label>
    <input type="text" id="categoryName" name="categoryName" required><br>

    <label>Trạng thái:</label>
    <input type="radio" value="true" name="categoryStatus" checked> <span>Active</span>
    <input type="radio" value="false" name="categoryStatus"><span>Inactive</span>
    <br>
    <br>

    <input type="submit" value="Thêm">

</form>

</body>
</html>
