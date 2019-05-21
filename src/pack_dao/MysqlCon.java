package pack_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlCon {
	public static void get_data() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// in this step we are loading the driver class
			// com.mysql.jdbc.Driver ==> this is the driver class
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/repetition", "root", "");
			// con variable helps us to connect to mysql database
			// here repetition is database name, root is username and password
			Statement stmt = con.createStatement();
			// stmt heps us to execute querries on our table
			ResultSet rs = stmt.executeQuery("select * from table1");
			// rs holds all the results achieved or returned by querry

			while (rs.next()) {
				System.out.println("adding - " + rs.getString("add_task") + " today -  " + rs.getString("todays_task"));
				// data is picked up row wise cursor moves row to row
			}
			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*
	 * code given in video -- reference ==>
	 * https://www.youtube.com/watch?v=BCqW5XwtJxY
	 * 
	 * public static void main(String args[]) { Connection con =
	 * DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo",
	 * "root","root"); // con variable helps us to connect to mysql database // here
	 * sonoo is database name, root is username and password Statement stmt =
	 * con.createStatement(); // stmt heps us to execute querries on our table
	 * ResultSet rs = stmt.executeQuery("select * from emp"); // rs holds all the
	 * results achieved or returned by querry
	 * 
	 * public MysqlCon() { try { Class.forname("com.mysql.jdbc.Driver"); // in this
	 * step we are loading the driver class //com.mysql.jdbc.Driver ==> this is the
	 * driver class
	 * 
	 * con.DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo", "root",
	 * "root"); // first parametes is port no. and name to database (sonoo here) ,
	 * second is username, third is password
	 * 
	 * con.createStatement(); } catch(Exception ex){ System.out.println("error"+ex);
	 * }
	 * 
	 * 
	 * // now we create a method to recieve data from datbase public void getdata()
	 * { try {
	 * 
	 * String query = "select * from database"; rs = st.executQuery(query);
	 * System.out.println("Records from database"); while( rs.next()) { String name
	 * = rs.getString("name"); String age = rs.getString("age");
	 * System.out,println("Name: " + name + "Age" + age );
	 * 
	 * 
	 * 
	 */
}
