<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/11/2023
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form style="max-width: 400px; margin: 0 auto;" action="/student" method="post">
    <input type="hidden" name="action" value="edit" >

    <h1>Thay đổi thông tin sinh viên</h1>
    <div class="input-form">
        <label for="studentCode">Mã SV:</label>
        <input type="text" id="studentCode" name="studentCode" value="${editStudent.studentCode}" readonly style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
    </div>
    <div class="input-form">
        <label for="studentName">Họ và tên:</label>
        <input type="text" id="studentName" name="studentName" value="${editStudent.studentName}" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
    </div>
    <div class="input-form">
        <label for="address">Địa chỉ:</label>
        <input type="text" id="address" name="address" value="${editStudent.address}" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
    </div>
    <div class="input-form">
        <label for="age">Tuổi:</label>
        <input type="number" id="age" name="age" value="${editStudent.age}" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
    </div>
    <div class="input-form">
        <label for="classRoom">Lớp học:</label>
        <input type="text" id="classRoom" name="classRoom" value="${editStudent.classRoom}" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
    </div>
    <div class="input-form">
        <label>Giới tính:</label>
        <input type="radio" id="male" name="gender" value="true" ${editStudent.gender?"checked":""} style="margin-right: 5px;"><label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="false" ${!editStudent.gender?"checked":""} style="margin-left: 10px;"><label for="female">Female</label>
    </div>
    <div class="input-form">
        <button type="submit" style="padding: 8px 18px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;">Add</button>
    </div>
</form>

</body>
</html>
