<%@ page import="com.jobportal.jobportal.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12-07-2023
  Time: 11:55 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int i = UserDao.deleteUser(id);
    if (i >0 ){
        response.sendRedirect("home.jsp?msg=true");
    }
    else{
        response.sendRedirect("editUser.jsp?error=true");
    }
%>
