<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String email,pass;

email = request.getParameter("email");
pass = request.getParameter("pass");

Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

PreparedStatement ps = con.prepareStatement("select * from instagram where email='"+email+"' and pass='"+pass+"' ");

ResultSet rs = ps.executeQuery();

if(rs.next()){
	out.println("<script>");
	out.println("alert('Login Successful !')");
	out.println("window.location.href='Dashboard.html'");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('User Not found . Register if u not !')");
	out.println("window.location.href='Insta_Reg.html'");
	out.println("</script>");
}


%>
</body>
</html>