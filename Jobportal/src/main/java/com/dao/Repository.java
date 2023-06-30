package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Repository {
	
	String url = "jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC";
	String username = "root";
	String password = "Safi@2002";
	
	public boolean checkUser(String uname, String pass, String userType) {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = con.prepareStatement("select * from ? where username=? and password=?");
			ps.setString(1, userType);
			ps.setString(2, uname);
			ps.setString(3, pass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
