<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 28/11/2023
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            padding: 8px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 12px;
        }

        h1 {
            text-align: center;
            margin-top: 32px;
        }
    </style>
</head>
<body>
<h1>ADD CATEGORY</h1>
<form method="post" action="<%=request.getContextPath()%>/category">
    <input type="hidden" name="action" value="edit">
    <label for="categoryId">ID:</label>
    <input type="text" id="categoryId" name="categoryId" value="${category.categoryId}" readonly><br>

    <label for="categoryName">NAME:</label>
    <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required><br>

    <label>STATUS:</label>
    <input type="radio" name="categoryStatus" value="true" ${category.categoryStatus?"checked":""} ><span>True</span>
    <input type="radio" name="categoryStatus" value="false" ${!category.categoryStatus?"checked":""}><span>False</span>
    <br> <br>

    <label for="quantityProduct">QUANTITY PRODUCT:</label>
    <input type="number" id="quantityProduct" name="quantityProduct" value="${category.quantityProduct}" readonly><br>
    <br>

    <br>
    <input type="submit" value="EDIT">

</form>
</body>
</html>
