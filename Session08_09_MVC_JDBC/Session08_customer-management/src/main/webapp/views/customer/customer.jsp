<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/11/2023
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CUSTOMER LIST</title>
    <style>
        /*table, th, tr, td {*/

        /*    border-collapse: collapse;*/
        /*}*/
        table {
            padding: 8px;
            width: 80%;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
            border: 1px solid #ddd;
            text-align: center; /* Căn giữa theo chiều ngang */
        }

        td {
            vertical-align: middle; /* Căn giữa theo chiều dọc */
        }

        a {
            margin: 5px;
            text-decoration: none;
        }

        .title {
            display: flex;
            justify-content: space-between;
            width: 80%;
        }

        input[type="text"] {
            width: 80%;
            padding: 8px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 20%;
            padding: 8px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            /*margin-top: 12px;*/
        }

        .input-search form {
            display: flex;
            gap: 8px;
        }
    </style>
</head>
<body>
<h1>CUSTOMER LIST</h1>
<div class="title">
    <a href="customer?action=add">ADD NEW CUSTOMER</a>
    <div class="input-search">
        <form action="customer">
            <input type="text" name="inputSearch" value="${searchName}">
<%--            <input class="submit" type="submit" name="action" value="search">--%>
            <button type="submit" name="action" value="search">Search</button>
        </form>
    </div>
</div>
<br>
<br>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>ADDRESS</th>
        <th colspan="2">ACTION</th>
    </tr>
    </thead>
    <tbody>
    <%--@elvariable id="customerList" type="java.util.List"--%>
    <c:forEach items="${customerList}" var="customer" varStatus="loop">
        <tr>
            <td>${loop.index+1}</td>
            <td>${customer.customerId}</td>
            <td>${customer.customerName}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="customer?action=edit&id=${customer.customerId}">EDIT</a></td>
            <td><a onclick="return confirm('Are you sure?')" href="customer?action=delete&id=${customer.customerId}">DELETE</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
