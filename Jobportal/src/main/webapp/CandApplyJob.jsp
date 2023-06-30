<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*,java.lang.*, java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*, java.sql.PreparedStatement" %>
    
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<title>Apply</title>
</head>
<body>
		<%
			int jobid = Integer.parseInt(request.getQueryString());
			int uid = (int)session.getAttribute("uid");
			String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
			String username = "root";
			String password = "Safi@2002";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				
				con = DriverManager.getConnection(url, username, password);
				ps = con.prepareStatement("insert into candidatejob values(?, ?)");
 				ps.setInt(1,uid);
				ps.setInt(2,jobid); 
				ps.executeUpdate();
				response.sendRedirect("CandFindJobs.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		%>

</body>
</html>