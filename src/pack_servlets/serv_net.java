package pack_servlets;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pack_dao.*;

//Servlet implementation class serv_net

@WebServlet("/serv_net")
public class serv_net extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// @see HttpServlet#HttpServlet()

	public serv_net() {
		super();
	}// TODO Auto-generated constructor stub

	// @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	// response)

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	// @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	// response)

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// data_handle.insert_data(str);
		String f = req.getParameter("submit");
		try {
			switch (f) {
			case "add&delete":
				String str = req.getParameter("val1");
				Data_handle.view_by_name(str);
				break;

			/*
			 * case "v_b_n": String str2 = req.getParameter("val2");
			 * Data_handle.view_by_name(str2); break;
			 * 
			 * case "v_b_d": String str3 = req.getParameter("dates");
			 * Data_handle.view_by_name(str3); break;
			 */
			default:

			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
