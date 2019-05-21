package pack_dao;

import java.sql.*;  
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class login_check {

	// checks the presence of same username is their in the database
	public static int check(String u, String p) throws SQLException, IOException {
		int l = 0;
		try {
			Connection con = Network.net();
			PreparedStatement stmt=con.prepareStatement("select count(id) as cnt from register where User_name =?");   
			stmt.setString(1,u);  
		     ResultSet r;
			
		     r= stmt.executeQuery();  
			
			
			r.last();
			l = Integer.parseInt(r.getString("cnt"));
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return l;
	}

	// verifies username and password
	public static ResultSet UAP(String u, String p) throws SQLException, IOException {
		int l = 0,m=0;
		
		
		ResultSet r=null;
		try {
			Connection con = Network.net();
			//System.out.println("hello");
			PreparedStatement stmt=con.prepareStatement("select User_name as redon , Password ,id as uid from register where User_name =? and Password =?");
			stmt.setString(1,u); 
			stmt.setString(2,p); 
			System.out.println(stmt.toString());
			
			int size = 0;
		    
		     r= stmt.executeQuery(); 
		     
		    
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return r;
	}

	public static int update(String u, String p, String e) throws SQLException, IOException {
		try {
			Connection con = Network.net();
			ResultSet rs = null;

			if (check(u, p) == 0) {
				try {
					
					PreparedStatement stmt=con.prepareStatement("insert into register( User_name , Password , Email_id ) values(?,?,?)");
					stmt.setString(1,u);  
					stmt.setString(2,p);  
					stmt.setString(3,e);  
					int l = stmt.executeUpdate();


					return 1;
				}

				catch (Exception w) {
					return 0; // catch se return karna zaruri hai return something from it
				}

			} else {
				return 0;
			}
		} catch (Exception r) {
			System.out.println(r);
			return 0;
		}

	}
}
