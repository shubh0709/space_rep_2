// Prepared statement , 
// input se aisi koi cheej pass na hone do ki wo program ko band kare ,
// can be written in both jsp and servlet side

package pack_dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpSession;

// include the mysql , servlet connector in Referenced Libraries and include mysql inside WebContent- lib as well
//not including  mysql connector insde lib will result in an error stating driver connection is not happening

public class Data_handle {
	// class ka naam ka first letter capital rakho otherwise you wont get proposals
	// , when
	// you call a certain method of the class
	public static int insert_data(String s1) throws SQLException, IOException {
		// here network class jo hamne banayi hai package me usne net() method se con ko
		// return kiya hai
		// System.out.println(s1);
		Connection con = Network.net();

		Statement stmt = con.createStatement();
		int s = stmt.executeUpdate("INSERT INTO tasks (name)  VALUES ('" + s1 + "')");
		// s tells no. of columns of data changed

		stmt.close();
		con.close();

		return s;
		// we returned s to verify whether data inserted or not
	}

	public static int delete(String s2) throws SQLException {
		Connection con = Network.net();
		Statement stmt = con.createStatement();

		// name->delete specific task_id->matching to the dates ????
		int d = stmt.executeUpdate("DELETE FROM tasks  WHERE  id = " + s2 + "");
		// s tells no. of columns of data changed

		stmt.close();
		con.close();

		return d;

	}
	/*
	 * public static String getdate(int i, String arr[]) { return arr[i];
	 * 
	 * }
	 * 
	 * public static String getname(int i, String arr[]) { return arr[i];
	 * 
	 * }
	 */

	public static int insert_random(String date, String s1) throws SQLException, ParseException {
		// here network class jo hamne banayi hai package me usne net() method se con ko
		// return kiya hai
		Connection con = Network.net();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		int s = 0;  int m=0;
		System.out.println("step1");
		// result set is used for fetching the data
		try {
			rs = stmt.executeQuery("select max(id)+1 as l_id from register");
			rs.last();
			int lid = rs.getInt("l_id");
			s = stmt.executeUpdate("INSERT INTO tasks (name,user_id)  VALUES ('" + s1 + "','" + lid + "')");
			rs = stmt.executeQuery("select max(id) as last_id from tasks");

			// faced the error : exception-before-start-of-result-set
			// reference:
			// https://stackoverflow.com/questions/2120255/resultset-exception-before-start-of-result-set
			// Basically you are positioning the cursor before the first row and then
			// requesting data. You need to move the cursor to the first row.
			// so either do rs.next() or point to last element
			System.out.println("step2");
			rs.last();
			int lastid = rs.getInt("last_id");
			// System.out.println(lastid);

			String arr[] = date.split(",");

			int p = arr.length;


			// LocalDateTime ldt = LocalDateTime.of(2016, 10, 14).plusDays(1);
			// it will display time also while if their was "LocalDate" only then only date
			// would have been displayed
			/*
			 * DateTimeFormatter formmat1 = DateTimeFormatter.ofPattern("yyyy-MM-dd",
			 * Locale.ENGLISH); String formatter[]= new String[p]; for(int i=0;i<p;i++) {
			 * String formatter[i] = formmat1.format(arr[i]); }
			 */
			// String lastCrawlDate = "2014-01-28";

			// because PreparedStatement#setDate(..) expects a java.sql.Date argument
			// java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			  
			/*
			 * for (int i = 0; i < p; i++) { int m =
			 * stmt.executeUpdate("INSERT INTO task_dates (task_id, date) VALUES ('" +
			 * lastid + "' ,  CONVERT('"+date+"','"+getdate(i,arr))+"'  )"); }
			 */
			
			 for (int i = 0; i < p; i++) {  m =
					  stmt.executeUpdate("INSERT INTO task_dates (task_id, date) VALUES ('" +
					  lastid + "' , '"+arr[i]+"'"); }
					 
			
			
			
			
			// l tells no. of columns of data changed
			System.out.println("step3");
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			;
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
			;
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
			;
		}

		System.out.println(s);
		return s;
		// we returned s to verify whether data inserted or not
	}

	public static int insert_sequence(String s1) throws SQLException {

		Connection con = Network.net();
		Statement stmt = con.createStatement();
		ResultSet rs=null;
		int s=0;

		try {
		rs = stmt.executeQuery("select max(id) as l_id from register");
		

		rs.last();
	
		int lid =Integer.parseInt(rs.getString("l_id"));
		
	     s = stmt.executeUpdate("INSERT INTO tasks (name,user_id)  VALUES ('" + s1 + "','" + lid + "')");
	   
		rs = stmt.executeQuery("select max(id) as last_id from tasks");
		
		rs.last();
		int lastid = Integer.parseInt(rs.getString("last_id"));
		// System.out.println(lastid);

		// Adding one Day to the current date

		/*
		 * LocalDate date = LocalDate.now().plusDays(1); LocalDate date2 =
		 * LocalDate.now().plusDays(7); LocalDate date2 = LocalDate.now().plusDays(15);
		 * LocalDate date2 = LocalDate.now().plusDays(30); LocalDate date2 =
		 * LocalDate.now().plusDays(90); LocalDate date2 =
		 * LocalDate.now().plusDays(180);
		 */
		
		int a[] = { 1, 7, 15, 30, 60, 90, 180 };
		for (int i = 0; i < 6; i++) {
			LocalDate date = LocalDate.now().plusDays(a[i]);
			int l = stmt.executeUpdate(
					"INSERT INTO task_dates (task_id, date) VALUES ('" + lastid + "' , '" + date + "' )");
		}
		
		System.out.println("step4**");
	}

	catch (Exception e) {
		e.printStackTrace();
	}

	finally {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		;
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
		;
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
		;
	}

		System.out.println(s);
		return s;

	}

	public static ArrayList<ArrayList<String>> view_by_name(String name) throws SQLException {
		Connection con = Network.net();
		Statement stmt = con.createStatement();
		ResultSet rs;
		/*
		 * query problem coming here You have an error in your SQL syntax; check the
		 * manual that corresponds to your MariaDB server version for the right syntax
		 * to use near 'name' at line 1
		 */

		/*
		 * rs = stmt.executeQuery("select last_insert_id() as l_id from register");
		 * rs.last(); int lid = rs.getInt("l_id");
		 */
		
		rs = stmt.executeQuery(
				"SELECT td.date,td.complete,t.* FROM tasks t join task_dates td on td.task_id=t.id WHERE t.name='"
						+ name + "'");

		ArrayList<ArrayList<String>> nm = new ArrayList<ArrayList<String>>();
		while (rs.next()) {
			System.out.println(rs.getString("name") + rs.getString("date") + rs.getString("complete"));

			ArrayList<String> A1 = new ArrayList<String>();

			A1.add(rs.getString("name"));
			A1.add(rs.getString("date"));
			A1.add(rs.getString("complete"));
			nm.add(A1);
		}
		return nm;

	}

	// method ko public karna is necessary as otherwise wo "web.jsp" se method calll
	// nahi ho pati
	public static ArrayList<ArrayList<String>> view_by_date(String date) throws SQLException {
		Connection con = Network.net();
		Statement stmt = con.createStatement();
//		Date d = new Date();

		ResultSet rs = stmt.executeQuery("select max(id) as l_id from register");
		rs.last();
//		int lid = rs.getInt("l_id");

	//	HttpSession session = null;
	//	int uid=Integer.parseInt((String)session.getAttribute("uid"));
		rs = stmt.executeQuery(
				"SELECT t.date,td.complete,t.* FROM tasks t join task_dates td on td.task_id=t.id WHERE date(t.date) ='"
						+ date + "' and t.user_id=uid");

		
		  System.out.println(
		 "SELECT t.date,td.complete,t.* FROM tasks t join task_dates td on td.task_id=t.id WHERE t.date ='"
		  + date + "'");
		 
		ArrayList<ArrayList<String>> al = new ArrayList<ArrayList<String>>();
		while (rs.next()) {
			System.out.println(rs.getString("name") + rs.getString("date") + rs.getString("complete"));

			ArrayList<String> A1 = new ArrayList<String>();

			A1.add(rs.getString("name"));
			A1.add(rs.getString("date"));
			A1.add(rs.getString("complete"));
			al.add(A1);
		}
		return al;
	}

}