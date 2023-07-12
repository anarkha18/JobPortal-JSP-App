<%@ page import="com.jobportal.jobportal.dao.UserDao" %>
<%@ page import="com.jobportal.jobportal.model.User" %>
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
  <title>EDIT USER</title>
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
      <% int id = Integer.parseInt(request.getParameter("id"));
       User myUser = UserDao.getUsersById(id);
      %>

      <div class="d-flex justify-content-between align-items-center">
        <h3>EDIT USER</h3>
      </div>
      <div class="col-6" id="editUser">
        <form class="needs-validation" novalidate action="updateUser.jsp" method="post">
          <div class="mb-3">
            <label for="id" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="id" value="<%= myUser.getId()%>"  name="id" minlength="3"  readonly>
            <div class="invalid-feedback">Please enter a valid Name.</div>
          </div>
          <div class="mb-3">
            <label for="userName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="userName" value="<%= myUser.getUserName()%>"  name="userName" minlength="3"  required>
            <div class="invalid-feedback">Please enter a valid Name.</div>
          </div>
          <div class="mb-3">
            <label for="userEmail" class="form-label">Email address</label>
            <input type="email" class="form-control" id="userEmail" value="<%= myUser.getUserEmail()%>" name="userEmail" aria-describedby="emailHelp" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
          </div>
          <div class="mb-3">
            <label for="userPassword" class="form-label">Password</label>
            <input type="text" class="form-control" id="userPassword" value="<%= myUser.getUserPassword()%>" name="userPassword" minlength="3" required>
            <div class="invalid-feedback">Password must be at least 3 characters.</div>
          </div>

          <div class="mb-3">
            <label for="userType" class="form-label">User Type</label>
            <select class="form-select" id="userType" name="userType" required aria-label="select example" aria-readonly="true">
              <option value="" selected>--</option>
              <option value="2" <% if (myUser.getUserType()== 2) {%> selected <% } %>>Job seeker</option>
              <option value="3" <% if (myUser.getUserType()== 3) {%> selected <% } %>>Job provider</option>

            </select>
            <div class="invalid-feedback">Example invalid select feedback</div>
          </div>
          <div class="mb-3">
            <label for="userPhone" class="form-label">Phone number</label>
            <input type="tel" class="form-control" id="userPhone" value="<%= myUser.getUserPhone()%>" name="userPhone" pattern="[0-9]{10}" required>
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
    var editUsersForm = document.querySelector('#editUser .needs-validation');

    // Add event listener for add user form submission
    editUsersForm.addEventListener('submit', function (event) {
      if (!editUsersForm.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      editUsersForm.classList.add('was-validated');
    }, false);
  })();
</script>
</body>
</html>
<% } %>