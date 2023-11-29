<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 28/11/2023
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            color: #207cca;
        }

        p {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e5e5e5;
        }

        td a {
            display: inline-block;
            padding: 5px 10px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
        }

        td a:hover {
            background-color: #207cca;
        }
    </style>
</head>
<body>
<h1>CATEGORY LIST</h1>
<a href="category?action=add">ADD CATEGORY</a><br>
<table border="1" cellspacing="0">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Status</td>
        <td>Quantity_Product</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items="${categoryList}" var="category">
        <tr>
            <td>${category.categoryId}</td>
            <td>${category.categoryName}</td>
            <td>${category.categoryStatus}</td>
            <td>${category.quantityProduct}</td>
            <td><a href="/category?action=edit&id=${category.categoryId}">Edit</a></td>
            <td><a href="/category?action=delete&id=${category.categoryId}"
                   onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
