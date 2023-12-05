<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <h1 class="text-center text-dark mt-5 mb-5">PRODUCT LIST</h1>
    <div class="container">
      <a href="add-product">ADD PRODUCT</a>

      <!-- <c:if test="${!empty message}">
        <div class="alert alert-success" role="alert">
            <strong>${message}</strong>
        </div>
    </c:if> -->
     <c:if test="${!empty message}">
         <div class="alert alert-primary alert-dismissible fade show" role="alert">
             <button
                     type="button"
                     class="close"
                     data-dismiss="alert"
                     aria-label="Close"
             >
                 <span aria-hidden="true">&times;</span>
                 <span class="sr-only">Close</span>
             </button>
             <strong>${message}</strong>
         </div>
     </c:if>
        <form action="${pageContext.request.contextPath}/product" method="post">
            <input type="search" name="searchName" value="${searchName}">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      <br />
      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>CATEGORY NAME</th>
            <th colspan="2">ACTION</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${productList}" var="product" varStatus="loop">
            <tr>
              <td scope="row">${loop.index+1}</td>
              <td>${product.productId}</td>
              <td>${product.productName}</td>
              <td>${product.price}</td>
              <td>${product.category.categoryName}</td>
              <td><a href="product/edit/${product.productId}" class="btn btn-primary">EDIT</a></td>
              <td><a onclick="return confirm('Are you sure?')" href="product/delete/${product.productId}" class="btn btn-danger">DELETE</a></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
<%--    <ul class="pagination">--%>
<%--      <c:forEach var="page" begin="1" end="${totalPage}">--%>
<%--        <li><a href="/category/${page}" >${page}</a></li>--%>
<%--&lt;%&ndash;        class="${i == currentPage ? 'active' : ''}"&ndash;%&gt;--%>
<%--      </c:forEach>--%>
<%--    </ul>--%>
    <div class="col col-xs-6 text-right">
        <ul class="pagination pull-right">
            <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <c:forEach var="page" begin="1" end="${totalPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/product/${page}.html"><c:out value="${page}"/></a>
                </li>
            </c:forEach>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
        </ul>
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
