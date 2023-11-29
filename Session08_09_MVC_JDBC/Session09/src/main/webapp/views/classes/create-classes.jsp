<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27/11/2023
  Time: 16:00
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
<h1>THEM MOI LOP HOC</h1>
<form method="post" action="<%=request.getContextPath()%>/class">
    <%--    <label for="customerId">ID:</label>--%>
    <%--    <input type="text" id="customerId" name="customerId" required><br>--%>

    <label for="className">TEN:</label>
    <input type="text" id="className" name="className" required><br>

    <label for="classStatus">TRANG THAI:</label>
    <input type="radio" id="classStatus" name="classStatus" value="true" checked><span>Dang hoc</span>
    <input type="radio" id="classStatus" name="classStatus" value="false"><span>Da xong</span>

    <br>
    <br>
    <input type="submit" value="THEM">

</form>
</body>
</html>
