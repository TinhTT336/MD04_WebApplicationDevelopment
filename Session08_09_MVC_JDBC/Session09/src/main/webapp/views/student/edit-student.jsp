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
<h1>CHINH SUA SINH VIEN</h1>
<form method="post" action="<%=request.getContextPath()%>/student">
    <input type="hidden" name="action" value="edit">
    <label for="studentId">MA SV:</label>
    <input type="text" id="studentId" name="studentId" value="${editStudent.studentId}" readonly><br>

    <label for="studentName">TEN:</label>
    <input type="text" id="studentName" name="studentName" value="${editStudent.studentName}" required><br>

    <label for="email">EMAIL:</label>
    <input type="text" id="email" name="email" value="${editStudent.email}" required><br>

    <label for="birthday">NGAY SINH:</label>
    <input type="date" id="birthday" value="${editStudent.birthday}" name="birthday"><br>
    <br>

    <label for="address">DIA CHI:</label>
    <input type="text" id="address" value="${editStudent.address}" name="address"><br>

    <br>
    <input type="submit" value="SUA">

</form>
</body>
</html>
