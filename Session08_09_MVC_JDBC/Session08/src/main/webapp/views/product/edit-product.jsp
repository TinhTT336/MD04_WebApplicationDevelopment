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
<form action="<%=request.getContextPath()%>/product" method="post">
    <input type="hidden" name="action" value="edit">
    <label for="productId">ID:</label>
    <input type="text" id="productId" name="productId" value="${editProduct.productId}" readonly><br>

    <label for="productName">Tên san pham:</label>
    <input type="text" id="productName" name="productName" value="${editProduct.productName}" required><br>
    <label for="description">Mo ta san pham:</label>
    <input type="text" id="description" name="description" value="${editProduct.description}" required><br>

    <label>Trạng thái:</label>
    <input type="radio" value="1" ${editProduct.productStatus?checked:""} name="productStatus" > <span>Active</span>
    <input type="radio" value="0" ${!editProduct.productStatus?checked:""} name="productStatus"><span>Inactive</span>
    <br>
    <br>
    <label for="stock">Ton kho san pham:</label>
    <input type="text" id="stock" name="stock" value="${editProduct.stock}" required><br>
    <br>
    <br>

    <input type="submit" value="Thêm">

</form>

</body>
</html>
