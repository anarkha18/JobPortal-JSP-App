<%@ page import="com.jobportal.jobportal.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12-07-2023
  Time: 11:03 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean class="com.jobportal.jobportal.model.User" id="User"></jsp:useBean>
<jsp:setProperty name="User" property="*"></jsp:setProperty>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int i =UserDao.updateUser(id, User);

    if (i >0 ){
        response.sendRedirect("home.jsp?msg=true");
    }
    else{
        response.sendRedirect("home.jsp?error=true");
    }
%>
