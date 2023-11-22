<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        .input-form {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 120px;
        }

        select {
            width: 100px;
            padding: 4px;
        }

        input {
            padding: 4px;
        }

        input[type=submit] {
            width: 100px;
            margin-left: 125px;
            border: 1px solid black;
            background-color: #f0f0f0;
            border-radius: 2px;
        }
    </style>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<form action="calculator-servlet" method="post">
    <div class="input-form">
        <label>First operand</label>
        <input type="number" name="first">
    </div>
    <div class="input-form">
        <label>Operator</label>
        <select name="operator">
            <option> +</option>
            <option> -</option>
            <option> *</option>
            <option> /</option>
        </select>
    </div>
    <div class="input-form">
        <label>Second operand</label>
        <input type="number" name="second">
    </div>
    <input type="submit" value="Calculate">
</form>
</body>
</html>