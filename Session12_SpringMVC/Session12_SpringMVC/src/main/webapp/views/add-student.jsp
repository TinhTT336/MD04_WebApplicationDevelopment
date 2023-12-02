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
    <h1 class="text-center text-dark">Them moi sinh vien</h1>
    <div class="row">
      <div class="col-lg-6">
        <form action="student" method="post">
          <div class="form-group">
            <label for="">Student Code</label>
            <input
              type="studentCode"
              class="form-control"
              name="studentCode"
              id=""
            />
          </div>
          <div class="form-group">
            <label for="">Student Name</label>
            <input
              type="studentName"
              class="form-control"
              name="studentName"
              id=""
            />
          </div>
          <div class="form-group">
            <label for="">Age</label>
            <input type="age" class="form-control" name="age" id="" />
          </div>
          <div class="form-check">
            <label class="form-check-label">
              <input
                type="radio"
                class="form-check-input"
                name="sex"
                id=""
                value="true"
                checked
              />
              Male
            </label>
            <label class="form-check-label">
              <input
                type="radio"
                class="form-check-input"
                name="sex"
                id=""
                value="false"
              />
              Female
            </label>
          </div>
        </form>
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
