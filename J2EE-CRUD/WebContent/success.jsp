<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WELCOME</title>
</head>
<body bgcolor="green" >

<br><br>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //Http 1.1
response.setHeader("Pragma","no-cache"); //Http 1.0
response.setHeader("Expires","0"); //Otherwise
response.setDateHeader("Expires", 0);
if(session.getAttribute("name")!= null){
Connection con=null;
ResultSet rs=null;
Statement stmt=null;
String sql="select * from reg";
try {
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://192.168.2.53:5432/Klarion_training_062017", "postgres","Abcd1234");
	if(con!=null){
		System.out.println("DB Connection Established Successfully..............");
	}
	else{
		System.out.println("DB Connection Failed..............");
	}
	stmt=con.createStatement();
	rs=stmt.executeQuery(sql);
	//System.out.println(session.getAttribute("name"));
	if(session.getAttribute("name")!=null){
	%>
	
	<center><h1>Welcome <%= session.getAttribute("name") %></h1></center>
	<div style="display:inline-block;height:200px;width:100%;overflow:auto;"><center><table border="1" width="90%" bgcolor="cyan"> 
	<tr bgcolor="red"><th>Sid</th><th>Name</th><th>Gender</th><th>Email</th></tr>
	<% 
	while(rs.next()){%>
		<tr><td><%= rs.getString("sid")%></td><td><%=rs.getString("name")%></td><td><%= rs.getString("gender")%></td>  
        		<td><%= rs.getString("email")%></td><td><a href='editform.jsp?sid=<%=rs.getString("sid")%>'>Edit</a></td>  
		<td><a href='deleteuser.jsp?sid=<%= rs.getString("sid")%>'>Delete</a></td></tr>
		<% 
	}%>
	</table></center></div><br><br><%}else{
		response.sendRedirect("loginpage.jsp");
	}
	%>
	
	<%
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
finally{
	if(con!=null && stmt!=null && rs!=null){
		try {
			con.close();
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

}else{
	
	response.sendRedirect(request.getContextPath() + "/loginpage.jsp");
}

%>

<a href='logout.jsp'>Log out</a>

</script>
</body>
</html>