<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- Created by IntelliJ IDEA. User: admin Date: 02/12/2023 Time: 22:22 To
change this template use File | Settings | File Templates. --%> <%@ page
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
    <h1 class="text-center text-dark">ADD CATEGORY</h1>
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <form:form action="create-category" method="post" modelAttribute="category">
            <div class="form-group mb-4">
              <label>CATEGORY NAME</label>
              <form:input
                type="text"
                class="form-control"
                path="categoryName"
              />
            </div>
            <div class="form-check">
              <label>CATEGORY STATUS</label>
              <label class="form-check-inline">
                <form:radiobutton class="form-check-input" path="categoryStatus" value="true" checked="checked"/>
                Active
              </label>
              <label class="form-check-inline">
                <form:radiobutton class="form-check-input" path="categoryStatus"  value="false"/>
                Inactive
              </label>
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
