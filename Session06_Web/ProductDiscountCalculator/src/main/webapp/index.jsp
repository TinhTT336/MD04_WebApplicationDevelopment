<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
    <style type="text/css">
        .text-input {
            width: 40%;
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        input {
            padding: 5px;
            border-radius: 4px;
            border: 1px solid black;
            width: 60%;
        }

        input[type=submit] {
            background-color: bisque;
            text-align: center;
            width: 10%;
        }

    </style>
</head>
<body>
<h1><%= "Ứng dụng Product Discount Calculator" %>
</h1>
<br/>
<%--<a href="product-discount-calculator"></a>--%>
<form action="product-discount-calculator" method="post">
    <div class="text-input">
        <label for="product_description">Ten san pham: </label>
        <input type="text" name="product_description" id="product_description">
    </div>
    <div class="text-input">
        <label for="list_price">Gia niem yet san pham: </label>
        <input type="number" name="list_price" id="list_price">
    </div>
    <div class="text-input">
        <label for="discount_percent">Ti le chiet khau san pham: </label>
        <input type="number" name="discount_percent" id="discount_percent">
    </div>
    <input type="submit" value="Calculator Discount">
</form>
</body>
</html>