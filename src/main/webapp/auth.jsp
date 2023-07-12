<%@ page import="com.jobportal.jobportal.dao.UserDao" %>
<%@ page import="com.jobportal.jobportal.model.User" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13-07-2023
  Time: 12:19 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String email = request.getParameter("userEmail");
    String pass = request.getParameter("userPassword");
    User authenticatedUser = UserDao.auth(email, pass);

    if (authenticatedUser != null) {
        // Start a session and set user details as session attributes
        HttpSession session1 = request.getSession();
        session1.setAttribute("userId", authenticatedUser.getId());
        session1.setAttribute("userName", authenticatedUser.getUserName());
        session1.setAttribute("userEmail", authenticatedUser.getUserEmail());
        session1.setAttribute("userType", authenticatedUser.getUserType());
        session1.setAttribute("userPhone", authenticatedUser.getUserPhone());
        session1.setAttribute("userPassword", authenticatedUser.getUserPassword());

        // Redirect to the appropriate page based on user type
        int userType = authenticatedUser.getUserType();
        String redirectPage;
        if (userType == 1) {
            redirectPage = "home.jsp";
        } else if (userType == 2) {
            redirectPage = "seekerHome.jsp";
        } else if (userType == 3) {
            redirectPage = "providerHome.jsp";
        } else {
            redirectPage = "login.jsp?error=true";
        }
        response.sendRedirect(redirectPage);
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>

