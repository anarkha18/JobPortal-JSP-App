<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12-07-2023
  Time: 06:16 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%-- Check if the user is logged in --%>
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
<div class="card">
    <div class="card-header">
       WELCOME ADMIN
    </div>
    <%
        String msg = request.getParameter("msg");
        if (msg != null && msg.equals("true")) {
    %>
    <div class="alert alert-success mt-3" role="alert">
        Successfully Updated!!!
    </div>
    <%
        }
    %>
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("true")) {
    %>
    <div class="alert alert-danger mt-3" role="alert">
        Failed to Update. Please try again.
    </div>
    <%
        }
    %>
    <div class="card-body">
        <h5 class="card-title">Profile Details : </h5>
        <p class="card-text">
        <% String userName = (String) session.getAttribute("userName"); %>
        <p>Hello, <%= userName %></p>
        <% String userEmail = (String) session.getAttribute("userEmail"); %>
        <p>Email : <%= userEmail %></p>
        <% int userPhone = (int) session.getAttribute("userPhone"); %>
        <p>Phone:  <%= userPhone %></p>
        <%-- Example: Get the userId attribute --%>


        </p>
        <a href="jobseekers.jsp" class="btn btn-primary">Job seekers</a>
        <a href="jobproviders.jsp" class="btn btn-primary">Job providers</a>
    </div>
</div>
</body>
</html>
<% } %>
