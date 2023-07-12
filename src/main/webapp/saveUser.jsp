<%@ page import="com.jobportal.jobportal.dao.UserDao" %>
<%@ page import="com.jobportal.jobportal.dao.DbCon" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12-07-2023
  Time: 07:30 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean class="com.jobportal.jobportal.model.User" id="User"></jsp:useBean>
<jsp:setProperty name="User" property="*"></jsp:setProperty>

<%
    int i = UserDao.saveUser(User);
    if(i > 0){
        response.sendRedirect("home.jsp?msg=true");
    }
    else {
        response.sendRedirect("addUser.jsp?error=true");
    }

%>
