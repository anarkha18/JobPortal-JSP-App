<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12-07-2023
  Time: 06:46 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
  // Retrieve the userId and userType attributes from the session
  Integer userId = (Integer) session.getAttribute("userId");
  Integer userType = (Integer) session.getAttribute("userType");

  // Check if the userId is null or the userType is not 1
  if (userId == null || userType != 1) {
    // User is not logged in or doesn't have access, redirect to the error page
    response.sendRedirect("error.jsp");
  } else {
    // User is logged in and has access, show the restricted content
%>
<html>
<head>
  <title>ADD USER</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

</head>
<body>
<main class="col-sm-12 overflow-auto h-100">
  <div class="bg-light border rounded-3 p-3">
    <div class="container">
      <%
        String error = request.getParameter("error");
        if (error != null && error.equals("true")) {
      %>
      <div class="alert alert-danger mt-3" role="alert">
        Failed to save the user. Please try again.
      </div>
      <%
        }
      %>

      <div class="d-flex justify-content-between align-items-center">
        <h3>ADD USER</h3>
      </div>
      <div class="col-6" id="addUser">
        <form class="needs-validation" novalidate action="saveUser.jsp" method="post">
          <div class="mb-3">
            <label for="userName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="userName" value=""  name="userName" minlength="3"  required>
            <div class="invalid-feedback">Please enter a valid Name.</div>
          </div>
          <div class="mb-3">
            <label for="userEmail" class="form-label">Email address</label>
            <input type="email" class="form-control" id="userEmail" value="" name="userEmail" aria-describedby="emailHelp" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
          </div>
          <div class="mb-3">
            <label for="userPassword" class="form-label">Password</label>
            <input type="text" class="form-control" id="userPassword" value="" name="userPassword" minlength="3" required>
            <div class="invalid-feedback">Password must be at least 3 characters.</div>
          </div>

          <div class="mb-3">
            <label for="userType" class="form-label">User Type</label>
            <select class="form-select" id="userType" name="userType" required aria-label="select example" aria-readonly="true">
              <option value="" selected>--</option>
              <option value="2">Job seeker</option>
              <option value="3">Job provider</option>

            </select>
            <div class="invalid-feedback">Example invalid select feedback</div>
          </div>
          <div class="mb-3">
            <label for="userPhone" class="form-label">Phone number</label>
            <input type="tel" class="form-control" id="userPhone" value="" name="userPhone" pattern="[0-9]{10}" required>
            <div class="invalid-feedback">Please enter a valid phone number (10 digits only).</div>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
          <a href="home.jsp">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
          </a>
        </form>
      </div>
    </div>
  </div>
</main>
<script>
  (function () {
    'use strict';

    // Fetch the add user form element
    var addUsersForm = document.querySelector('#addUser .needs-validation');

    // Add event listener for add user form submission
    addUsersForm.addEventListener('submit', function (event) {
      if (!addUsersForm.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      addUsersForm.classList.add('was-validated');
    }, false);
  })();
</script>
</body>
</html>
<% } %>