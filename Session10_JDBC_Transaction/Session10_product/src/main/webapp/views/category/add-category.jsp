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

    <label for="categoryName">NAME:</label>
    <input type="text" id="categoryName" name="categoryName" required><br>

    <br>
    <input type="submit" value="ADD">

</form>
</body>
</html>
