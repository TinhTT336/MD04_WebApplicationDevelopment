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

        /*.pagination {*/
        /*    text-align: right;*/
        /*}*/

        /*.pagination li {*/
        /*    display: inline-block;*/
        /*    margin-left: 5px;*/
        /*}*/

        /*.pagination li a {*/
        /*    padding: 5px 10px;*/
        /*    border: 1px solid #ccc;*/
        /*    text-decoration: none;*/
        /*    color: #333;*/
        /*}*/

        /*.pagination li a:active {*/
        /*    background-color: #333;*/
        /*    color: #3498db;*/
        /*}*/

        .pagination li a:hover {
            color: #3498db;
        }

        .pagination {
            text-align: right;
        }

        .pagination li {
            display: inline-block;
            margin-left: 5px;
        }

        .pagination li a {
            padding: 5px 10px;
            border: 1px solid #ccc;
            text-decoration: none;
            color: #333;
        }

        .pagination li a.active {
            background-color: #333;
            color: #fff;
        }

    </style>
</head>
<body>
<h1>PRODUCT LIST</h1>
<a href="product?action=add">ADD PRODUCT</a><br>
<table border="1" cellspacing="0">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>CategoryName</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items="${productList}" var="item">
        <tr>
            <td>${item.productId}</td>
            <td>${item.productName}</td>
            <td>${item.price}</td>
            <td>${item.category.categoryName}</td>
            <td><a href="/product?action=edit&id=${item.productId}">Edit</a></td>
            <td><a href="/product?action=delete&id=${item.productId}"
                   onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
    <c:forEach var="i" begin="1" end="${totalPage}">
        <li><a href="/product?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a></li>
    </c:forEach>
</ul>

</body>
</html>
