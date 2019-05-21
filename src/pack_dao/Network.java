package pack_dao;

import java.sql.Connection;
import java.sql.DriverManager;

// aim of making this class is that we dont have to again and again write the same
// connection establishment code with mysql

public class Network {
	static Connection con = null;

	static public Connection net() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/repetition", "root", "");
			// Statement stmt = con.createStatement();
			// write this where function is called
		}

		catch (Exception e) {
			System.out.println(e);
		}

		return con;
	}

}
