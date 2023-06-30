package com.job;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostJob")
public class PostJob extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rid = Integer.parseInt(request.getParameter("rid")); 
		String role = request.getParameter("role");
		String compname = request.getParameter("compname");
		String location = request.getParameter("location");
		String visa = request.getParameter("visa");
		String comp = request.getParameter("comp");
		String jd = request.getParameter("jd");
		
		String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "Safi@2002");
			
			PreparedStatement ps = con.prepareStatement("insert into jobs(jobid, role, compname, location, visa, comp, jd) values(?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, rid);
			ps.setString(2, role);
			ps.setString(3, compname);
			ps.setString(4, location);
			ps.setString(5, visa);
			ps.setString(6, comp);
			ps.setString(7, jd);
			
			ps.executeUpdate();
			
			response.sendRedirect("RecViewJobs.jsp");
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
