package com.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpRecruiter")
public class SignUpRecruiter extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullname = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String mobnum = request.getParameter("phone");
		String compname = request.getParameter("compname");
		String compwebsite = request.getParameter("compwebsite");
		String auth = "Unauthorized";
		
		String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "Safi@2002");
			
			PreparedStatement ps = con.prepareStatement("insert into recruiters(name, email, username, password, phone, compname, compwebsite, authorized) values(?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, fullname);
			ps.setString(2, email);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, mobnum);
			ps.setString(6, compname);
			ps.setString(7, compwebsite);
			ps.setString(8, auth);
			
			ps.executeUpdate();
			
			response.sendRedirect("SignUpRecLand.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
