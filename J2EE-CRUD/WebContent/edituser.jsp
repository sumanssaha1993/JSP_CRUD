<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>
<%@ page import="practice_servlet.User_crud,bean.user" %>
<%
user u=new user();
u.getA().add(request.getParameter("name"));
u.getA().add(request.getParameter("gender"));
u.getA().add(request.getParameter("email"));
u.getA().add(request.getParameter("sid"));

int i=User_crud.update(u.getA());  
response.sendRedirect("success.jsp"); 
%>
</body>
</html>