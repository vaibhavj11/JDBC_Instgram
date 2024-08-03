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
String email,name,mobile,age,pass,cpass;

email = request.getParameter("email");
name = request.getParameter("name");
mobile = request.getParameter("mobile");
age = request.getParameter("age");
pass = request.getParameter("pass");
cpass = request.getParameter("cpass");


Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

if(email.contains("@")){
	
	if(name.length() >= 2){
		
		if(mobile.length() == 10){
			
			if(age != null){
				
				if(pass.length() >= 5 || pass.contains("@") || pass.contains("#") || pass.contains("$")){
					
					if(pass.equals(cpass)){
						
						PreparedStatement ps =  con.prepareStatement("insert into instagram (email,name,mobile,age,pass,cpass) values ('"+email+"','"+name+"','"+mobile+"','"+age+"','"+pass+"','"+cpass+"');");
						ps.executeUpdate();
						
						out.println("<script>");
						out.println("alert('Registration Successful !')");
						out.println("window.location.href='Login.html'");
						out.println("</script>");
						
					}else{
						out.println("<script>");
						out.println("alert('Password and confirm password doesn't matched !')");
						out.println("window.location.href='Insta_Reg.html'");
						out.println("</script>");
					}
					
				}else{
					out.println("<script>");
					out.println("alert('Password and confirm password doesn't matched !')");
					out.println("window.location.href='Insta_Reg.html'");
					out.println("</script>");
				}
				
			}else{
				out.println("<script>");
				out.println("alert('Password and confirm password doesn't matched !')");
				out.println("window.location.href='Insta_Reg.html'");
				out.println("</script>");
			}
			
		}else{
			out.println("<script>");
			out.println("alert('Password and confirm password doesn't matched !')");
			out.println("window.location.href='Insta_Reg.html'");
			out.println("</script>");
		}
		
	}else{
		out.println("<script>");
		out.println("alert('Password and confirm password doesn't matched !')");
		out.println("window.location.href='Insta_Reg.html'");
		out.println("</script>");
		}
	
}else{
	out.println("<script>");
	out.println("alert('Password and confirm password doesn't matched !')");
	out.println("window.location.href='Insta_Reg.html'");
	out.println("</script>");
}

%>
</body>
</html>