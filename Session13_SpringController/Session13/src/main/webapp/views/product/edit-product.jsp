<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%--
Created by IntelliJ IDEA. User: admin Date: 02/12/2023 Time: 22:22 To change
this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <h1 class="text-center text-dark">EDIT PRODUCT</h1>
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <form:form
            action="${pageContext.request.contextPath}/update-product"
            method="post"
            modelAttribute="product"
          >
            <div class="form-group mb-4">
              <label>PRODUCT ID</label>
              <form:input type="text" class="form-control" path="productId" readonly="true"/>
            </div>
            <div class="form-group mb-4">
              <label>PRODUCT NAME</label>
              <form:input type="text" class="form-control" path="productName" />
            </div>
            <div class="form-group mb-4">
              <label>PRODUCT PRICE</label>
              <form:input type="number" class="form-control" path="price" />
            </div>
            <div class="form-group mb-4">
              <div class="form-group">
                <label for="">CATEGORY NAME</label>
                <form:select class="form-control" path="category.categoryId" id="">
                 <c:forEach items="${categories}" var="category">
                   <form:option value="${category.categoryId}" selected="${category.categoryId==product.category.categoryId?'selected':''}" >${category.categoryName}</form:option>
                 </c:forEach>
                </form:select>
              </div>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
          </form:form>
        </div>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
