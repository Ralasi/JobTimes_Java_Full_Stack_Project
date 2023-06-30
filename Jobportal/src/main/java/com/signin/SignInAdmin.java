package com.signin;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Repository;


@WebServlet("/SignInAdmin")
public class SignInAdmin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String password = request.getParameter("pass"); 
		
		String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "Safi@2002");
			PreparedStatement ps = con.prepareStatement("select * from admin where username=? and pass=?");
			ps.setString(1, uname);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				HttpSession session =request.getSession();
				session.setAttribute("username", uname);
				
				response.sendRedirect("AdminHome.jsp");
			} else {
				String err= "Wrong username or password";
				request.getSession().setAttribute("message", err);
				
				response.sendRedirect("signInAdmin.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
