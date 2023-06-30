package com.signin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Repository;

@WebServlet("/SignInCandidate")
public class SignInCandidate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String password = request.getParameter("pass"); 
		String auth = "Authorized";
		
		String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
		
		PrintWriter out = response.getWriter();
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "Safi@2002");
			
			Statement st = con.createStatement();
			
			String query1 = "select * from candidates where username='"+uname+"' and password='"+password+"' and authorized='"+auth+"'";

			ResultSet rs = st.executeQuery(query1);
			if(rs.next()) {
		
				HttpSession session =request.getSession();
				session.setAttribute("username", uname);
				session.setAttribute("uid", rs.getInt(1));
				session.setAttribute("name", rs.getString(2));
				
				response.sendRedirect("CandidateHome.jsp");
				
			} else {
				
				String err= "Not Authorized yet or Wrong username or password";
				request.getSession().setAttribute("message", err);
				
				response.sendRedirect("SignInCandidate.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
