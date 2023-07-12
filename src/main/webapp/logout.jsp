<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13-07-2023
  Time: 01:22 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalidate the session
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
