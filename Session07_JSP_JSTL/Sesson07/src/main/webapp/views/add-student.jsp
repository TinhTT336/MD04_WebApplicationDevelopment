<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/11/2023
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    .input-form{
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<form style="max-width: 400px; margin: 0 auto;" action="/student" method="post">
  <h1>Thêm mới sinh viên</h1>
  <div class="input-form">
    <label for="studentCode">Mã SV:</label>
    <input type="text" id="studentCode" name="studentCode" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
  </div>
  <div class="input-form">
    <label for="studentName">Họ và tên:</label>
    <input type="text" id="studentName" name="studentName" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
  </div>
  <div class="input-form">
    <label for="address">Địa chỉ:</label>
    <input type="text" id="address" name="address" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
  </div>
  <div class="input-form">
    <label for="age">Tuổi:</label>
    <input type="number" id="age" name="age" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
  </div>
  <div class="input-form">
    <label for="classRoom">Lớp học:</label>
    <input type="text" id="classRoom" name="classRoom" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
  </div>
  <div class="input-form">
    <label>Giới tính:</label>
    <input type="radio" id="male" name="gender" value="true" style="margin-right: 5px;"><label for="male">Male</label>
    <input type="radio" id="female" name="gender" value="false" style="margin-left: 10px;"><label for="female">Female</label>
  </div>
  <div class="input-form">
    <button type="submit" style="padding: 8px 18px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;">Add</button>
  </div>
</form>

</body>
</html>
