<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
</head>
<body onload="refresh()">
<%
Connection con=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
String sql="select * from reg where sid=? and email=?";
try {
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://192.168.2.53:5432/Klarion_training_062017", "postgres","Abcd1234");
	if(con!=null){
		System.out.println("DB Connection Established Successfully..............");
	}
	else{
		System.out.println("DB Connection Failed..............");
	}
	pstmt=con.prepareStatement(sql);
	
	
	String pass=request.getParameter("pass");
	pstmt.setString(1, request.getParameter("uname"));
	pstmt.setString(2, pass);
	rs=pstmt.executeQuery();
	System.out.println(session.getAttribute("name"));
	if(rs.next()){
		String uname=rs.getString("name");
		session.setAttribute("name", uname);
		response.sendRedirect("success.jsp");
	}
	else{
		out.println("<html><title>Error</title><body bgcolor='red'><center><h1>Sorry !!! Wrong username and password</h1></center>"+
		"</body></html>");
		%>
		<br><a href='loginpage.jsp'>Back</a>
		<% 
		
	}
	
	
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
finally{
	if(con!=null && pstmt!=null && rs!=null){
		try {
			con.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}


%>

</body>
</html>