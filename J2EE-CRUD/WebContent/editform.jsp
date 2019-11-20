<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body bgcolor="orange">
<%@page import="practice_servlet.User_crud,bean.user"%>
<%  
String sid=request.getParameter("sid");  
user u=User_crud.getRecordById(sid);  
%>

<center><h1>Edit Form</h1>  
<form action="edituser.jsp" method="post">  
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>  
<table>  
<tr><td>Name:</td><td>  
<input type="text" name="name" value="<%= u.getName()%>"/></td></tr>  
<tr><td>Password:</td><td>  
<input type="text" name="gender" value="<%= u.getGender()%>"/></td></tr>  
<tr><td>Email:</td><td>  
<input type="text" name="email" value="<%= u.getEmail()%>"/></td></tr>  
<tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>  
</table>  
</form>  </center>

</body>
</html>