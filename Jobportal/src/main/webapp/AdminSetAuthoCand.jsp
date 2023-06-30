<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*,java.lang.*, java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*, java.sql.PreparedStatement" %>
    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Authorization</title>
</head>
<body>
		
		<%
			int a = Integer.parseInt(request.getQueryString());
			String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
			String username = "root";
			String password = "Safi@2002";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = null;
			PreparedStatement ps = null;
			
			String reg = "Authorized";
			
			try {
				
				con = DriverManager.getConnection(url, username, password);
				ps = con.prepareStatement("update candidates set authorized='"+reg+"'  where cid='"+a+"'");
				ps.executeUpdate();
				response.sendRedirect("AdminCandApprove.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		%>
</body>
</html>