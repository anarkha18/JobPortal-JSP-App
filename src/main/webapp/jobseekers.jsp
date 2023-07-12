<%@ page import="com.jobportal.jobportal.dao.UserDao" %>
<%@ page import="java.util.List" %>
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
    <title>home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<main class="col-sm-12 overflow-auto h-100">
    <div class="bg-light border rounded-3 p-3">
        <div class="d-flex justify-content-between align-items-center">
            <h3>JOB SEEKERS</h3>
            <a href="addUser.jsp">
            <button type="button" class="btn btn-outline-primary">
                <i class="bi bi-plus-lg"></i> Add user
            </button>
            </a>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="">
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Phone</th>
                <th scope="col">User Type</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<User> usersList = UserDao.getUsersByType(2);
                for (User user : usersList) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getUserName() %></td>
                <td><%= user.getUserEmail() %></td>
                <td><%= user.getUserPassword() %></td>
                <td><%= user.getUserPhone() %></td>
                <td><%= "Job seeker" %></td>
                <td>
                   <a href="editUser.jsp?id=<%= user.getId() %>">
                       <button type="button" class="btn btn-outline-primary">
                           Edit
                       </button>
                   </a>
                    <a href="deleteUser.jsp?id=<%= user.getId() %>">
                        <button type="button" class="btn btn-outline-primary">
                            Delete
                        </button>
                    </a>
                </td>
            </tr>
            <%
                }
            %>

            </tbody>

        </table>
        <a href="home.jsp">
            <button type="button" class="btn btn-outline-primary">Go Home
            </button>
        </a>
    </div>
</main>
</div>
</body>
</html>
<% } %>