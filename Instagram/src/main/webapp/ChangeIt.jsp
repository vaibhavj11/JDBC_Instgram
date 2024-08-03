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
String email,pass,cpass;

email = request.getParameter("email");
pass = request.getParameter("pass");
cpass = request.getParameter("cpass");

Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

PreparedStatement ps = con.prepareStatement("update instagram set  pass='"+pass+"',cpass='"+cpass+"' where email='"+email+"' ");
ps.executeUpdate();

out.println("<script>");
out.println("alert('Password changed Successfully !')");
out.println("window.location.href='ChangeIt.jsp'");
response.sendRedirect("Login.html");
out.println("</script>");


%>
</body>
</html>