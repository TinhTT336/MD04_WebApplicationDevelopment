<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.session07_lesson.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>

<h2>Vietnamese Dictionary</h2>
<form action="dictionary.jsp" method="post">
    <input type="text" name="search" placeholder="Enter your word: "/>
    <input type = "submit" id = "submitt" value = "Search"/>
</form>

<%--<% List<Student> studentList=new ArrayList<>();--%>
<%--studentList.add(new Student("Mai Van Hoan","1983-08-20","Ha Noi","anh_hoan"));--%>
<%--studentList.add(new Student("Nguyen Van Nam","1983-08-21","Bac Giang","anh_nam"));--%>
<%--studentList.add(new Student("Nguyen Thai Hoa","1983-08-22","Nam Dinh","anh_hoa"));--%>
<%--studentList.add(new Student("Tran Dang Khoa","1983-08-17","Ha Noi","anh_khoa"));--%>
<%--studentList.add(new Student("Nguyen Dinh Thi","1983-08-19","Ha Noi","anh_thi"));--%>
<%--%>--%>


<table style="border: 1px solid black">
   <thead>
   <tr style="border: 1px solid black">
       <th>STT</th>
       <th>Ten</th>
       <th>Ngay sinh</th>
       <th>Dia chi</th>
       <th>Anh dai dien</th>
   </tr>
   </thead>
       <tbody >
       <c:forEach items="${studentList}" var="item" varStatus="loop">
           <tr>
               <td>${loop.index+1}</td>
               <td>${item.name}</td>
               <td>${item.birthday}</td>
               <td>${item.address}</td>
               <td>${item.image}</td>
           </tr>
       </c:forEach>

       </tbody>
</table>

</body>
</html>