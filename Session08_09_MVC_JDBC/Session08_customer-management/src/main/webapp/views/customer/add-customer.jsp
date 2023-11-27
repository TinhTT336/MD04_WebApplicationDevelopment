<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/11/2023
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD NEW CUSTOMER</title>
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
        h1{
            text-align: center;
            margin-top: 32px;
        }
    </style>
</head>
<body>
<h1>ADD NEW CUSTOMER</h1>
<form  method="post">
<%--    <label for="customerId">ID:</label>--%>
<%--    <input type="text" id="customerId" name="customerId" required><br>--%>

    <label for="customerName">NAME:</label>
    <input type="text" id="customerName" name="customerName" required><br>

    <label for="email">EMAIL:</label>
    <input type="text" id="email" name="email" required><br>

    <label for="address">ADDRESS:</label>
    <input type="text" id="address" name="address" ><br>

    <input type="submit" value="ADD">

</form>
</body>
</html>
