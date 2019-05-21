package pack_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Tommy {
	public static void main(String args[]) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String s = "desk0";

			for (int i = 1; i <= 50; i++) {
				rs = stmt.executeQuery("insert into desk(desk_id, weightage) values(" + s + "i,0) ;");
			}

			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
