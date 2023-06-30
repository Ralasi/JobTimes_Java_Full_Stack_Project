package com.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/SignUpCandidate")
public class SignUpCandidate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullname = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String mobnum = request.getParameter("phone");
		String auth = "Unauthorized";
		
		String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "Safi@2002");
			
			PreparedStatement ps = con.prepareStatement("insert into candidates(name, email, username, password, phone, authorized) values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, fullname);
			ps.setString(2, email);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, mobnum);
			ps.setString(6, auth);
			
			ps.executeUpdate();
			
			response.sendRedirect("SignUpCandLand.jsp");
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		
	}

}
